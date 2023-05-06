<?php

namespace Vanier\Api\models;

use Vanier\Api\Models\BaseModel; 

class CurrencyModel extends BaseModel
{
    private $table_name= "convertor";
    
    public $conventor_id;
    public $country_id;
    public $currency;

    public function __construct($conventor_id, $country_id, $currency)
    {
        $this->conventor_id = $conventor_id;
        $this->country_id = $country_id;
        $this->currency = $currency;
    }

    // public function __construct($table_name)
    // {
    //     $this->table_name = $table_name;
    // }
    public static function find($conventor_id)
    {
        // Replace this with your database connection and query
        $result = "SELECT * FROM convertor WHERE WHERE conventor_id = $conventor_id";

        // Mock result
        $result = [
            'conventor_id' => 1,
            'country_id' => 1,
            'currency' => 'USD'
        ];

        return new self($result['conventor_id'], $result['country_id'], $result['currency']);
    }
}
