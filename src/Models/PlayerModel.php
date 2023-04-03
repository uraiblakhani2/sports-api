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

        $sql = "SELECT * FROM player WHERE 1";

        if (isset($filters["player_name"])) {
            $sql .= " AND player_name like :player_name";
            $filters_value[":player_name"] = $filters["player_name"] . "%";
        }

        if (isset($filters["player_number"])) {
            $sql .= " AND player_number like :player_number";
            $filters_value[":player_number"] = $filters["player_number"] . "%";
        }


        if (isset($filters["height"])) {
            $sql .= " AND height like :height";
            $filters_value[":height"] = $filters["height"] . "%";
        }

        if (isset($filters["weight"])) {
            $sql .= " AND weight like :weight";
            $filters_value[":weight"] = $filters["weight"] . "%";
        }

        if (isset($filters["age"])) {
            $sql .= " AND age like :age";
            $filters_value[":age"] = $filters["age"] . "%";
        }

        if (isset($filters["status"])) {
            $sql .= " AND status like :status";
            $filters_value[":status"] = $filters["status"] . "%";
        }

        if (isset($filters["nbMatchPlayed"])) {
            $sql .= " AND nbMatchPlayed like :nbMatchPlayed";
            $filters_value[":nbMatchPlayed"] = $filters["nbMatchPlayed"] . "%";
        }

        if ((isset($filters['page']) && isset($filters['page_size']))) {
            $this->setPaginationOptions($filters["page"], $filters["page_size"]);
            return $this->Paginate($sql, $filters_value);
        }

        return $this->run($sql, $filters_value)->fetchAll();

    }

    public function deletePlayerByID(int $player_id)
    {
        $sql = " DELETE FROM $this->table_name WHERE player_id = :player_id";
        $smt = $this->run($sql, [":player_id" => $player_id])->fetchAll();
    }

}