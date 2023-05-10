<?php

namespace Vanier\Api\Controllers;

use Vanier\Api\Models\sportModel;
use Slim\Exception\HttpNotFoundException;
use Vanier\Api\Controllers\BaseController;
use Vanier\Api\Controllers\CompositeResource;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
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
        $validation = $this->validator->validateSports($filters);
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
                $validate = $this->validator->validateSportsInsert($sport);
                if ($validate == "valid") {
                    $this->sports_model->createSport($sport);
                    $res_message = ['Sports has been created sucessfully'];
                    return $this->prepareOkResponse($response, $res_message);
                } else {
                    return $this->notFoundResponse($response, $validate, 422);


                }

            }

        }
    }

    //update sport
    public function sportUpdate(Request $request, Response $response)
    {
        $data = $request->getParsedBody();

        if (is_array($data)) {
            foreach ($data as $sport) {
                $validate = $this->validator->validateSportsInsert($sport);
                if ($validate == "valid") {

                    $sport_exists = $this->sports_model->getSportById($sport['sport_id']);
                    if ($sport_exists) {
                        $sport_id = $sport["sport_id"];
                        unset($sport["sport_id"]);
                        $this->sports_model->updateSport($sport, $sport_id);

                        $res_message = ['Data has been updated sucessfully!'];
                        return $this->prepareOkResponse($response, $res_message);
                    }

                } else {
                    return $this->notFoundResponse($response, $validate);
                }
                $res_message = '[Sport id not found]';
                return $this->notFoundResponse($response, $res_message);
            }

        }
    }

    public function getLiveScores(Request $request, Response $response)
    {

        $filters = $request->getQueryParams();

        $crick_api = new CompositeResourceController();
        $score = $crick_api->getScoreFromCricApi();
        $data["Live_Score"] = $score;
        $json_data = json_encode($data);
        return $this->prepareOkResponse($response, $data);
    }

}