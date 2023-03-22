<?php

use Slim\Factory\AppFactory;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Middleware\ContentLengthMiddleware;
use Vanier\Api\Controllers\SportsController;
use Vanier\Api\Middleware\ContentNegotationMiddleware;



require __DIR__ . '/vendor/autoload.php';
// Include the file that contains the application's global configuration settings,
// database credentials, etc.
require_once __DIR__ . '/src/Config/app_config.php';

//--Step 1) Instantiate a Slim app.
$app = AppFactory::create();
//-- Add the routing and body parsing middleware.
$app->addRoutingMiddleware();
$app->addBodyParsingMiddleware();


$app->add(new ContentNegotationMiddleware([APP_MEDIA_TYPE_JSON]));


//-- Add error handling middleware.
// NOTE: the error middleware MUST be added last.
$errorMiddleware = $app->addErrorMiddleware(true, true, true);
$errorMiddleware->getDefaultErrorHandler()->forceContentType(APP_MEDIA_TYPE_JSON);

// TODO: change the name of the subdirectory here.
// You also need to change it in .htaccess
$app->setBasePath("/sports-api");

// Here we include the file that contains the application routes.
// NOTE: your routes must be managed in the api_routes.php file.
require_once __DIR__ . '/src/Routes/api_routes.php';

// Films Routes
$app->get('/sports', [SportsController::class, 'getAllSports']);


// This is a middleware that should be disabled/enabled later.
//$app->add($beforeMiddleware);
// Run the app.
$app->run();