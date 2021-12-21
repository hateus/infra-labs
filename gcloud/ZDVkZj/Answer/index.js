/**
 * HTTP Cloud Function.
 * This function is exported by index.js, and is executed when
 * you make an HTTP request to the deployed function's endpoint.
 *
 * @param {Object} req Cloud Function request context.
 *                     More info: https://expressjs.com/en/api.html#req
 * @param {Object} res Cloud Function response context.
 *                     More info: https://expressjs.com/en/api.html#res
 */

exports.helloWorld = async (req, res) => {
  const response_type = "in_channel"

  const { token } = req.query
  if (token != process.env["SLACK_TOKEN"]) {
    res.status(403).json({
      response_type, 
      text: "Forbidden! lol", 
    })
  }

  try {
    const message = 'Hello from Michael Act!';
    console.log(message);
    res.status(201).json({
      response_type, 
      text: message, 
    });
  } catch (err) {
    console.log(err);
    res.status(501).json({
      response_type, 
      text: "Internal Server Error", 
    });
  }
};
