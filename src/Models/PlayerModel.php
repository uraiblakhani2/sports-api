<?php

namespace Vanier\Api\Models;

class PlayerModel extends BaseModel
{


    private $table_name = "player";


    public function __construct()
    {
        parent::__construct();
    }

    //Route: POST /players

    public function getAll(array $filters = [])
    {
        //return "not found";
        $filters_value = [];

        $sql = "SELECT * FROM player";

        return $this->run($sql)->fetchAll();
    }

}
