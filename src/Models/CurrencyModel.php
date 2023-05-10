<?php

namespace Vanier\Api\models;

use Vanier\Api\Models\BaseModel;

class CurrencyModel extends BaseModel
{



    public function __construct()
    {
        parent::__construct();
    }



    public function getCurrencyFromCode(String $currency)
    {
        $currency = $currency . "%";
        $sql = "SELECT * FROM convertor WHERE currency_code LIKE :currency_code ";
        return $this->run($sql, [":currency_code" => $currency])->fetchAll();
    }
}
