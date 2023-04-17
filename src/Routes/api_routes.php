<?php

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Vanier\Api\Controllers\AboutController;
use Vanier\Api\Controllers\CountryController;
use Vanier\Api\Controllers\leagueController;
use Vanier\Api\Controllers\MatchController;
use Vanier\Api\Controllers\PlayerController;
use Vanier\Api\Controllers\RankingController;
use Vanier\Api\Controllers\SportsController;
use Vanier\Api\Controllers\TeamController;

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
$app->put('/sports', [SportsController::class, 'sportUpdate']);

//Team Routes
$app->get('/teams', [TeamController::class, 'getAllTeams']);
$app->post('/teams', [TeamController::class, 'teamCreator']);

//Rankings Routes
$app->get('/rankings', [RankingController::class, 'getAllRankings']);
$app->delete('/league/rankings', [RankingController::class, 'rankingDelete']);


//player Routes
$app->get('/players', [PlayerController::class, 'getAllPlayers']);
$app->delete('/players/{player_id}', [PlayerController::class, 'playerDelete']);
$app->post('/players', [PlayerController::class, 'playerCreator']);


//Match Routes
// TODO: test this routes
$app->get('/matches', [MatchController::class, 'getAllMatchs']);
$app->post('/matches', [MatchController::class, 'matchCreator']);

//Match_bet Routes
//TODO: test this routes
$app->get('/match_bets', [MatchController::class, 'getAllMatch_bets']);


//league Routes
$app->get('/leagues', [leagueController::class, 'getAllLeagues']);
$app->post('/leagues', [leagueController::class, 'leagueCreator']);

//Country Routes
$app->get('/countries', [CountryController::class, 'getAllCountries']);


// ROUTE: /hello
$app->get('/hello', function (Request $request, Response $response, $args) {
    $response->getBody()->write("Reporting! Hello there!");
    return $response;
});