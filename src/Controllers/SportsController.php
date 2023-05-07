<?php

namespace Vanier\Api\Controllers;

use Vanier\Api\Models\sportModel;
use Slim\Exception\HttpNotFoundException;
use Vanier\Api\Controllers\BaseController;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Vanier\Api\Helpers\CompositeResource;
use Vanier\Api\Helpers\SportsDbController;
use Vanier\Api\Helpers\Validator;

use Vanier\Api\helpers\ValidationHelper;

class SportsController extends BaseController
{


    private $sports_model = null;
    private $validator = null;

    /**
     * Summary of __construct
     */
    public function __construct()
    {
        $this->sports_model = new sportModel();
        $this->validator = new Validator();
        $this->validator = new ValidationHelper();

    }



    public function getAllSports(Request $request, Response $response)
    {

        $filters = $request->getQueryParams();

        //$validate = $this->validator->validateFilters($filtes);
        $sports_model = new sportModel();
        $validation = $this->validator->validateSportsFilters($filters);
        if ($validation == "valid") {
            $data = $this->sports_model->getAll($filters);
            return $this->prepareOkResponse($response, $data);
        } else {
            return $this->notFoundResponse($response, $validation, 400);
        }
    }

    //create 1 or more sport
    public function sportCreator(Request $request, Response $response)
    {
        $data = $request->getParsedBody();

        if (is_array($data)) {
            foreach ($data as $key => $sport) {

                $data = $this->sports_model->createSport($sport);


                $res_message = ['Sport created'];

                $json_data = json_encode($sport);

                $response->getBody()->write($json_data);
            }
        }
        return $response->withStatus(201)->withHeader("Content-Type", "application/json");
    }


    //update sport
    public function sportUpdate(Request $request, Response $response)
    {
        $data = $request->getParsedBody();

        if (is_array($data)) {
            foreach ($data as $key => $sport) {

                $data = $this->sports_model->updateSport($sport);
                $res_message = ['Sports updated'];

                $json_data = json_encode($sport);

                $response->getBody()->write($json_data);
            }
        }
        return $response->withStatus(201)->withHeader("Content-Type", "application/json");
    }

    public function getLiveScores(Request $request, Response $response)
    {

        $filters = $request->getQueryParams();

        $sports_db = new CompositeResource();
        $score = $sports_db->getScoreFromCricApi();
        $data["Live_Score"] = $score;
        $json_data = json_encode($data);
        return $this->prepareOkResponse($response, $data);
    }

}