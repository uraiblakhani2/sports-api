<?php

use Monolog\Logger;
use Slim\Factory\AppFactory;
use Monolog\Handler\StreamHandler;
use Vanier\Api\Controllers\FilmsController;
use Vanier\Api\Controllers\ActorsController;
use Vanier\Api\Controllers\CurrencyController;
use Vanier\Api\Controllers\leagueController;
use Vanier\Api\controllers\DistanceController;
use Vanier\Api\Controllers\CustomersController;
use Vanier\Api\Controllers\CountryController;

use Vanier\Api\Controllers\CategoriesController;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Vanier\Api\Controllers\SportsController;
use Vanier\Api\Middleware\ContentNegotiationMiddleware;

// Import the app instance into this file's scope.
global $app;

// NOTE: Add your app routes here.
// The callbacks must be implemented in a controller class.
// The Vanier\Api must be used as namespace prefix.

// ROUTE: /
$app->get('/', [AboutController::class, 'handleAboutApi']);



// Sports Routes
$app->get('/sports', [SportsController::class, 'getAllSports']);
$app->post('/sports', [SportsController::class, 'sportCreator']);
$app->get('/sports/cricket/live_score', [SportsController::class, 'getLiveScores']);


$app->put('/sports', [SportsController::class, 'sportUpdate']);

//Team Routes
$app->get('/teams', [TeamController::class, 'getAllTeams']);
$app->post('/teams', [TeamController::class, 'teamCreator']);
$app->put('/teams', [TeamController::class, 'teamUpdate']);


//Rankings Routes
$app->get('/rankings', [RankingController::class, 'getAllRankings']);
$app->delete('/league/rankings', [RankingController::class, 'rankingDelete']);


//player Routes
$app->get('/players', [PlayerController::class, 'getAllPlayers']);
$app->delete('/players/{player_id}', [PlayerController::class, 'playerDelete']);
$app->post('/players', [PlayerController::class, 'playerCreator']);
$app->put('/players', [PlayerController::class, 'cplayerUpdate']);

//Match Routes
// TODO: test this routes
$app->get('/matches', [MatchController::class, 'getAllMatchs']);
$app->post('/matches', [MatchController::class, 'matchCreator']);

//Match_bet Routes
//TODO: test this routes
$app->get('/match_bets', [MatchController::class, 'getAllMatch_bets']);


//league Routes
$app->get('/leagues', [leagueController::class, 'getAllLeagues']);
$app->get('/leagues/{sport_name}/{country_name}',[leagueController::class, 'getAllLeaguesByCountry']);

$app->post('/leagues', [leagueController::class, 'leagueCreator']);

//Country Routes
$app->get('/countries', [CountryController::class, 'getAllCountries']);
$app->post('/countries', [CountryController::class, 'countryCreator']);
$app->put('/countries', [CountryController::class, 'countryUpdate']);
$app->get('/customers/{customer_id}/films', [CustomersController::class, 'handleGetFilmsByCustomer']);

//currency conventor route
$app->post('/distance', [CurrencyController::class, 'convert']);

// ROUTE: /hello
$app->get('/hello', function (Request $request, Response $response, $args) {
    $response->getBody()->write("Reporting! Hello there!");
    return $response;
});

define('APP_LOG_DIR', __DIR__.'/logs/app.log');

$app->get('/logMe', function (Request $request, Response $response, $args) {
    $logger = new Logger("test-log");
    $logger_handler = new StreamHandler(APP_LOG_DIR, Logger::DEBUG);
    $logger->pushHandler($logger_handler);
    $db_logger = new Logger("database_logs");
    $db_logger->pushHandler($logger_handler);
    $db_logger->info("This query failed...");
    $params = $request->getQueryParams();
    $logger->info("Access ".$request->getMethod(). ' '.$request->getUri()->getPath(), $params);
    $response->getBody()->write("Reporting! Logging in process!");
    return $response;
});


// require_once 'controllers/CurrencyConverterController.php';

// $conventor_id = 1;
// $controller = new CurrencyConverterController($conventor_id);

// $amount = 100;
// $fromCurrency = "USD";
// $toCurrency = "EUR";

// try {
//     $convertedAmount = $controller->convert($amount, $fromCurrency, $toCurrency);
//     echo "{$amount} {$fromCurrency} is equal to {$convertedAmount} {$toCurrency}" . PHP_EOL;
// } catch (Exception $e) {
//     echo "Error: " . $e->getMessage() . PHP_EOL;
// }
