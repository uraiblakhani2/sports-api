<?php

use Monolog\Handler\CouchDBHandler;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Factory\AppFactory;
use Vanier\Api\Controllers\AboutController;
use Vanier\Api\Controllers\CountryController;
use Vanier\Api\Controllers\leagueController;
use Vanier\Api\Controllers\MatchController;
use Vanier\Api\Controllers\PlayerController;
use Vanier\Api\Controllers\RankingController;
use Vanier\Api\Controllers\SportsController;
use Vanier\Api\Controllers\TeamController;
use Vanier\Api\Models\Match_betModel;

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
$app->delete('/sports', [SportsController::class, 'sportDelete']);
$app->put('/sports', [SportsController::class, 'sportUpdate']);

//Team Routes
$app->get('/teams', [TeamController::class, 'getAllTeams']);


//Rankings Routes 
$app->get('/rankings', [RankingController::class, 'getAllRankings']);


//player Routes
$app->get('/players', [PlayerController::class, 'getAllPlayers']);


//Match Routes
// TODO: test this routes
$app->get('/matches', [MatchController::class, 'getAllMatchs']);


//Match_bet Routes
//TODO: test this routes
$app->get('/match_bets', [MatchController::class, 'getAllMatch_bets']);


//league Routes
$app->get('/leagues', [leagueController::class, 'getAllLeagues']);


//Country Routes
$app->get('/countries', [CountryController::class, 'getAllCountries']);


// ROUTE: /hello
$app->get('/hello', function (Request $request, Response $response, $args) {
    $response->getBody()->write("Reporting! Hello there!");
    return $response;
});