<?php

namespace Vanier\Api\Controllers;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Vanier\Api\Helpers\Validator;

class AboutController extends BaseController
{
    public function handleAboutApi(Request $request, Response $response, array $uri_args)
    {
        $hostname = $request->getUri()->getHost();

        $resources = array(
            'sports' => array(
                'uri' => $hostname.'/sports-api/sports',
                'methods' => 'GET|POST',
                'description' => 'List of sports available in the platform'
            ),
            'teams' => array(
                'uri' => $hostname.'/sports-api/teams',
                'methods' => 'GET|POST|PUT',
                'description' => 'List of teams in different sports'
            ),
            'rankings' => array(
                'uri' => $hostname.'/sports-api/rankings',
                'methods' => 'GET|DELETE',
                'description' => 'List of rankings for different leagues and sports'
            ),
            'players' => array(
                'uri' => $hostname.'/sports-api/players',
                'methods' => 'GET|POST|PUT|DELETE',
                'description' => 'List of players and their information'
            ),
            'matches' => array(
                'uri' => $hostname.'/sports-api/matches',
                'methods' => 'GET|POST',
                'description' => 'List of matches in different sports'
            ),
            'match_bets' => array(
                'uri' => $hostname.'/sports-api/match_bets',
                'methods' => 'GET',
                'description' => 'List of bets placed on matches'
            ),
            'leagues' => array(
                'uri' => $hostname.'/sports-api/leagues',
                'methods' => 'GET|POST',
                'description' => 'List of leagues in different sports'
            ),
            'countries' => array(
                'uri' => $hostname.'/sports-api/countries',
                'methods' => 'GET|POST|PUT',
                'description' => 'List of countries where sports events are held'
            ),
            'distance' => array(
                'uri' => $hostname.'/sports-api/distance',
                'methods' => 'POST',
                'description' => 'Converts distances between units'
            ),
        );

        $data = array(
            'about' => 'Welcome to sports-api, this is a sports Web service that provides data regarding sports',
            'resources' => $resources
        );




        return $this->prepareOkResponse($response, $data);
    }
}
