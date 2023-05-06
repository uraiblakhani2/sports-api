<?php

namespace Vanier\Api\Controllers;

namespace Vanier\Api\controllers;
use Exception;
use Vanier\Api\models\CurrencyModel;
use Vanier\Api\Helpers\CurrencyConverter;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Vanier\Api\Models\BaseModel;

class CurrencyController extends BaseModel
{
    private $currencyConverter;

    public function __construct($conventor_id)
    {
        $this->currencyConverter = CurrencyModel::find($conventor_id);
    }

    public function convert($amount, $fromCurrency, $toCurrency)
    {
        // Replace this with your API key and exchange rates fetcher
        // $exchangeRates = fetchExchangeRates($this->currencyConverter->currency);

        // Mock exchange rates
        $exchangeRates = [
            'USD' => 1,
            'EUR' => 0.85,
            'GBP' => 0.74,
        ];

        if (!isset($exchangeRates[$fromCurrency]) || !isset($exchangeRates[$toCurrency])) {
            throw new Exception("Invalid currency code");
        }

        $baseAmount = $amount / $exchangeRates[$fromCurrency];
        $convertedAmount = $baseAmount * $exchangeRates[$toCurrency];

        return $convertedAmount;
    }
}