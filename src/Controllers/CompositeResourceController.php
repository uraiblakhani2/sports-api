<?php

namespace Vanier\Api\Controllers;

use GuzzleHttp\Client;
use Vanier\Api\Exceptions\HttpNotFoundException;
use Vanier\Api\helpers\WebServiceInvoker;

class CompositeResourceController extends WebServiceInvoker
{

    public function getScoreFromCricApi(): array
    {
        $uri = "https://api.cricapi.com/v1/currentMatches?apikey=6daa1d22-dbd8-46d2-aa56-5a073ed55015&offset=0";
        $data = $this->invokeUri($uri);
        $scores = json_decode($data);

        $refined_score = [];
        $index = 0;

        foreach ($scores->data as $key => $score) {
            $refined_score[$index]['name'] = $score->name;
            $refined_score[$index]['status'] = $score->status;
            $refined_score[$index]['venue'] = $score->venue;
            $refined_score[$index]['date'] = $score->date;

            if (isset($score->score) && is_array($score->score)) {
                $refined_score[$index]['score'] = [];
                foreach ($score->score as $s) {
                    $refined_score[$index]['score'][] = [
                        'r' => $s->r,
                        'w' => $s->w,
                        'o' => $s->o,
                        'inning' => $s->inning
                    ];
                }
            }


            $index++;
        }
        return $refined_score;
    }


    public function fetchLeaguesByCountry(string $sport, string $country): array
{
    $uri = "https://www.thesportsdb.com/api/v1/json/3/search_all_teams.php?s=" . $sport . "&c=" . $country;
    $data = $this->invokeUri($uri);
    $leagues = json_decode($data);

    $refind_leagues = [];
    $index = 0;

    foreach ($leagues->teams as $key => $league) {
        $refind_leagues[$index]['strTeam'] = $league->strTeam;
        $refind_leagues[$index]['intFormedYear'] = $league->intFormedYear;
        $refind_leagues[$index]['strSport'] = $league->strSport;
        $refind_leagues[$index]['strLeague'] = $league->strLeague;
        $refind_leagues[$index]['strDescriptionEN'] = $league->strDescriptionEN;
        $refind_leagues[$index]['strCountry'] = $league->strCountry;

        $index++;
    }

    return $refind_leagues;
}


public function fetchCurrencyRate(string $from_currency, string $to_currency)
{
    $from_currency = strtolower($from_currency);
    $to_currency = strtolower($to_currency);

    $uri = "https://cdn.jsdelivr.net/gh/fawazahmed0/currency-api@1/latest/currencies/" . $from_currency . "/" . $to_currency . ".json";
    $data = $this->invokeUri($uri);
    $decodedData = json_decode($data);

    if (property_exists($decodedData, $to_currency)) {
        return $decodedData->$to_currency;
    } else {
        // handle the error or throw an exception
        return null;
    }
}



}