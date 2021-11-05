<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Data extends Migration
{
    public function up()
    {
        $this->forge->addField([
            'id' => [
                'type' => "INT",
                'constraint' => 5,
                'auto_increment'=> true
            ],
            'id_mobil' => [
                'type' => "INT",
                'constraint' => 5,
            ],
            'time_on' => [
                'type' => "DATETIME",
                "null" => TRUE
            ],
            'time_off' => [
                'type' => "DATETIME",
                "null" => TRUE
            ],
            'action' => [
                'type' => "INT",
                'constraint' => 5,
                "null" => TRUE
            ],
            'dismiss' => [
                'type' => "TEXT",
                "null" => TRUE
            ],
            'reason' => [
                'type' => "INT",
                "null" => TRUE
            ],
            'reason_detail' => [
                'type' => "TEXT",
                "null" => TRUE
            ]
        ]);
        $this->forge->addKey('id', true);
        $this->forge->createTable('dataMobil');
    }

    public function down()
    {
        //
    }
}
