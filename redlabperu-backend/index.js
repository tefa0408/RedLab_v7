require('dotenv').config()
const config = require('./config'),
	app = require('./app'),
	models = require("./models");

models.sequelize
	.authenticate()
	.then(() => {
		console.log('Connection has been established successfully.');
		models.sequelize.sync().then(function () {
			console.log('Models has been synchronized');
			app.listen(config.port, () => {
				console.log(`API listening on ${config.url}:${config.port}`);
				console.log(config.port+" "+config.portFront+" "+config.secret_key+" "+config.db+ " "+config.pathRootStaticFiles+ " "+ config.url+ " "+ config.urlFront)
			});
		});
	})
	.catch(err => {
		console.error('Unable to connect to the database:', err);
	});

