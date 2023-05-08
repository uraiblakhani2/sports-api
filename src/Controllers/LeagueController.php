<?php

namespace Vanier\Api\Controllers;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Exception\HttpNotFoundException;
use Vanier\Api\Controllers\BaseController;
use Vanier\Api\Controllers\CompositeResourceController;

use Vanier\Api\helpers\ValidationHelper;
use Vanier\Api\Models\CountryModel;

use Vanier\Api\Models\LeagueModel;
use Vanier\Api\Models\SportModel;

class leagueController extends BaseController
{

    private $league_model = null;
    private $validator = null;

    /**
     * Summary of __construct
     */
    public function __construct()
    {
        $this->league_model = new LeagueModel();
        $this->validator = new ValidationHelper();
    }


    public function getAllLeagues(Request $request, Response $response)
    {

        $filters = $request->getQueryParams();
        $validation = $this->validator->validateLeagues($filters);
        if ($validation == "valid") {
            $data = $this->league_model->getAll($filters);
            return $this->prepareOkResponse($response, $data);
        } else {
            return $this->notFoundResponse($response, $validation, 400);
        }
    }


    public function getAllLeaguesByCountry(Request $request, Response $response, array $uri_args)
    {
        $filters = $request->getQueryParams();

        $sport_name = $uri_args['sport_name'];
        $country_name = $uri_args['country_name'];


        $sports_db = new CompositeResourceController();
        $country = new CountryModel();
        $sport = new SportModel();

        $country_info = $country->getCountryByName($country_name);
        $sport_info = $sport->getSportByName($sport_name);

        if (isset($country_info["country_id"]) && isset($sport_info["sport_id"])  ) {
            $leagues = $sports_db->fetchLeaguesByCountry($sport_name, $country_name);

            $data["Leagues"] = $leagues;
            $json_data = json_encode($data);
            return $this->prepareOkResponse($response, $data);

        }

        else {
            //throwing http status code 406
            throw new HttpNotFoundException($request);

        }


    }

    //create 1 or more league
    public function leaguecreator(Request $request, Response $response)
    {
        $data = $request->getParsedBody();

        if (is_array($data)) {
            foreach ($data as $key => $league) {

                $data = $this->league_model->createLeague($league);


                $res_message = ['league created'];

                $json_data = json_encode($league);

                $response->getBody()->write($json_data);
            }
        }
        return $response->withStatus(201)->withHeader("Content-Type", "application/json");
    }

}
