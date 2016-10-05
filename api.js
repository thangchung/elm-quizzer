var jsonServer = require('json-server');
var server = jsonServer.create()

// Set default middlewares (logger, static, cors and no-cache)
server.use(jsonServer.defaults());

var router = jsonServer.router('data/quizzes.json');
server.use(router);

console.log('Listening at 8000');
server.listen(8000);
