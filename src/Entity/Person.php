<?php

namespace Entity;

class Person
{
    public function __construct(
        public string $name,
        public int $age
    ) {}

    public function personToJson(): string
    {
        return json_encode($this);
    }
}
