<?php

require_once __DIR__ . '/vendor/autoload.php';

use Entity\Person;

header('Content-Type: application/json');
header("Access-Control-Allow-Origin: *");

$person = new Person('John', 30);
echo $person->personToJson();
