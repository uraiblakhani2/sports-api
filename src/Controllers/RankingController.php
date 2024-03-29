<?php
namespace Vanier\Api\Controllers;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Exception\HttpBadRequestException;
use Vanier\Api\helpers\ValidationHelper;
use Vanier\Api\Models\BaseModel;
use Vanier\Api\Models\RankingModel;

class RankingController extends BaseController
{


    private $ranking_model = null;
    private $validator = null;

    /**
     * Summary of __construct
     */
    public function __construct()
    {
        $this->ranking_model = new RankingModel();
        $this->validator = new ValidationHelper();

    }



    public function getAllRankings(Request $request, Response $response)
    {

        $filters = $request->getQueryParams();
        $validation = $this->validator->validateRanking($filters);
        if ($validation == "valid") {
            $data = $this->ranking_model->getAll($filters);
            return $this->prepareOkResponse($response, $data);
        } else {
            return $this->notFoundResponse($response, $validation, 400);
        }
    }


    public function rankingDelete(Request $request, Response $response, array $uri_args)
    {

        $data = $request->getParsedBody();

        if (empty($data)) {
            throw new HttpBadRequestException($request, "malformed body. It can't be empty");

        }

        $ranking_model = new RankingModel();


        $count = count($data);

        for ($i = 0; $i < $count; $i++) {

            $ranking_id = $data[$i];

            $ranking_model->DeleteRankingByLeague($ranking_id);
        }


        $res_message = ['Data has been deleted sucessfully!'];
        $json_data = json_encode($res_message);
        $response->getBody()->write($json_data);

        return $response->withStatus(200)->withHeader("Content-Type", "application/json");
    }
}
?>