<?php

namespace Vanier\Api\Helpers {

    use Exception;

    /**
     * A standalone PHP library for calculating the distance between
     * geographical coordinates. 
     *      
     * The Vincenty formulae is used for calculating geodesic distances between 
     * a pair of lati­tude/longi­tude points on an ellipsoidal model of the Earth (an oblate sphere).
     * 
     * This library is useful for computing the distance between two canadian postal 
     * codes or finding nearby locations. 
     * @since 1.0.1
     */
    class CurrencyConverter{

        private $apiKey;
        private $exchangeRates;

        public function __construct($apiKey)
        {
            $this->apiKey = $apiKey;
            $this->exchangeRates = $this->fetchExchangeRates();
        }

        private function fetchExchangeRates()
        {
            $url = "https://openexchangerates.org/api/latest.json?app_id={$this->apiKey}";

            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
            $output = curl_exec($ch);
            curl_close($ch);

            $result = json_decode($output, true);

            if (isset($result['rates'])) {
                return $result['rates'];
            } else {
                throw new Exception("Error fetching exchange rates");
            }
        }

        public function convert($amount, $fromCurrency, $toCurrency)
        {
            if (!isset($this->exchangeRates[$fromCurrency]) || !isset($this->exchangeRates[$toCurrency])) {
                throw new Exception("Invalid currency code");
            }

            $baseAmount = $amount / $this->exchangeRates[$fromCurrency];
            $convertedAmount = $baseAmount * $this->exchangeRates[$toCurrency];

            return $convertedAmount;
        }
    }

    // Replace with your own API key from openexchangerates.org
    $apiKey = "your_api_key_here";
    $converter = new CurrencyConverter($apiKey);

    $amount = 100;
    $fromCurrency = "USD";
    $toCurrency = "EUR";

    try {
        $convertedAmount = $converter->convert($amount, $fromCurrency, $toCurrency);
        echo "{$amount} {$fromCurrency} is equal to {$convertedAmount} {$toCurrency}" . PHP_EOL;
    } catch (Exception $e) {
        echo "Error: " . $e->getMessage() . PHP_EOL;
    }
}