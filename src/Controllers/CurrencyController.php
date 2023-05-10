<?php

namespace Vanier\Api\Controllers;

use mysqli;
use Slim\Psr7\Request;
use Slim\Psr7\Response;
use Vanier\Api\helpers\ValidationHelper;
use Vanier\Api\models\CurrencyModel;

class CurrencyController extends BaseController
{
    private $currency_model = null;
    private $validator = null;



    public function __construct()
    {
        $this->currency_model = new CurrencyModel();
        $this->validator = new ValidationHelper();
    }

    public function calculateRate(Request $request, Response $response)
    {

        $data = $request->getParsedBody();

        if (is_array($data)) {
            foreach ($data as $currency) {

                $validation = $this->validator->validateCurrency($currency);

                if ($validation == "valid") {
                    $from_currency = $currency["from"];
                    $to_currency = $currency["to"];
                    $amount = $currency["amount"];


                    $from = $this->currency_model->getCurrencyFromCode($from_currency);

                    $to = $this->currency_model->getCurrencyFromCode($to_currency);

                    $currency_rate = new CompositeResourceController();
                    $rate = $currency_rate->fetchCurrencyRate($from_currency, $to_currency);
                    $from_currency_2 = floatval($from_currency);
                    $conversion = $amount * $rate;
                    $currency['rate'] = $rate;
                    $currency['result'] = $conversion;
                    return $this->prepareOkResponse($response, $currency);


                } else {
                    return $this->notFoundResponse($response, $validation, 400);
                }



            }
        }
    }

}