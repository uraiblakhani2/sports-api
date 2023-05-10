<?php

use Slim\Factory\AppFactory;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Middleware\ContentLengthMiddleware;
use Vanier\Api\Controllers\SportsController;
use Vanier\Api\Helpers\JWTManager;
use Vanier\Api\Middleware\ContentNegotationMiddleware;
use Vanier\Api\Middleware\FileLoggingMiddleware;
use Vanier\Api\Middleware\JWTAuthMiddleware;
use Vanier\Api\Middleware\LoggingMiddleware;

define('APP_BASE_DIR', __DIR__);
define('APP_ENV_CONFIG', 'config.env');

define('APP_JWT_TOKEN_KEY', 'APP_JWT_TOKEN');


require __DIR__ . '/vendor/autoload.php';
// Include the file that contains the application's global configuration settings,
// database credentials, etc.
require_once __DIR__ . '/src/Config/app_config.php';

//--Step 1) Instantiate a Slim app.
$app = AppFactory::create();
//-- Add the routing and body parsing middleware.
$app->addRoutingMiddleware();
$app->addBodyParsingMiddleware();

$app->add(new FileLoggingMiddleware());

// $app->add(new LoggingMiddleware());



$app->add(new ContentNegotationMiddleware([APP_MEDIA_TYPE_JSON]));


//-- Add error handling middleware.
// NOTE: the error middleware MUST be added last.
$errorMiddleware = $app->addErrorMiddleware(true, true, true);
$errorMiddleware->getDefaultErrorHandler()->forceContentType(APP_MEDIA_TYPE_JSON);


// $jwt_secret = JWTManager::getSecretKey();
// $app->add(new JWTAuthMiddleware());

// TODO: change the name of the subdirectory here.
// You also need to change it in .htaccess
$app->setBasePath("/sports-api");

// Here we include the file that contains the application routes.
// NOTE: your routes must be managed in the api_routes.php file.
require_once __DIR__ . '/src/Routes/api_routes.php';


// This is a middleware that should be disabled/enabled later.
//$app->add($beforeMiddleware);
// Run the app.
$app->run();