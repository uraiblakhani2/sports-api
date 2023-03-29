<?php

namespace Vanier\Api\Models;

class LeagueModel extends BaseModel
{

    private $table_name = "league";


    public function __construct()
    {
        parent::__construct();
    }

    //Route: POST /matches_bet

    public function getAll(array $filters = [])
    {
        //return "not found";
        $filters_value = [];

        $sql = "SELECT * FROM league";

        return $this->run($sql)->fetchAll();
    }

}
