<?php

namespace Vanier\Api\Models;

class SportModel extends BaseModel
{


    private $table_name = "sport";


    public function __construct()
    {
        parent::__construct();
    }

    //Route: POST /sports

    public function getAll(array $filters = [])
    {
        //return "not found";
        $filters_value = [];

        $sql = "SELECT * FROM sport";

        return $this->run($sql)->fetchAll();
    }

    //CREATING A NEW SPORT
    public function createSport(array $sport)
    {
        //pick some of the contained elements and use them in the insert statement
        $this->insert($this->table_name, $sport);
    }


    public function updateSport(array $film)
    {
        //pick some of the contained elements and use them in the insert statement
        $this->update($this->table_name, $film, ["film_id"=>2]);
    }

    public function getSportById(int $film_id)
    {
        $sql = "SELECT * FROM sport WHERE sport_id =:sport_id ";
        return $this->run($sql,[":film_id" =>$film_id])->fetchAll();
    }








}
