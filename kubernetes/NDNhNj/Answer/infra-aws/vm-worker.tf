## ##########################################################
## WARNING: Uncomment this file, if you have initialize ec2 
## manager as a Kubernetes Cluster Manager, and adjusted 
## the startup-join-cluster-app.sh script
## ##########################################################

resource "aws_launch_configuration" "worker" {
  image_id        = "ami-04505e74c0741db8d"
  security_groups = [module.microservice_app_sg.security_group_id]
  user_data       = file("./files/startup-join-cluster-app.sh")
  key_name        = "from-bastion-key" # Manually create SSH key from your bastion
  instance_type   = "t3.small"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "worker" {
  name                 = "worker-app-asg"
  vpc_zone_identifier  = slice(module.vpc.private_subnets, 0, 2)
  launch_configuration = aws_launch_configuration.worker.name

  desired_capacity          = 2
  min_size                  = 2
  max_size                  = 30
  health_check_grace_period = 300
  health_check_type         = "EC2"
}

resource "aws_autoscaling_policy" "scale_up" {
  name                   = "${aws_autoscaling_group.worker.name}-autoscaling-policy-up"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  policy_type            = "SimpleScaling"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.worker.name
}

resource "aws_cloudwatch_metric_alarm" "firing" {
  alarm_name          = "${aws_autoscaling_group.worker.name}-firing"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "10"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Average"
  threshold           = "40"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.worker.name
  }

  alarm_description = "WARNING! CPU of ${aws_autoscaling_group.worker.name} is increasing..."
  alarm_actions     = [aws_autoscaling_policy.scale_up.arn]
}

resource "aws_autoscaling_policy" "scale_down" {
  name                   = "${aws_autoscaling_group.worker.name}-autoscaling-policy-down"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  policy_type            = "SimpleScaling"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.worker.name
}

resource "aws_cloudwatch_metric_alarm" "relax" {
  alarm_name          = "${aws_autoscaling_group.worker.name}-relax"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "10"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Average"
  threshold           = "10"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.worker.name
  }

  alarm_description = "WARNING! CPU of ${aws_autoscaling_group.worker.name} is decreasing... we will terminate one Instances."
  alarm_actions     = [aws_autoscaling_policy.scale_down.arn]
}
