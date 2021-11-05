<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;


class Subscription extends Migration
{
    public function up()
    {
        $this->forge->addField([
            'id' => [
                'type' => "INT",
                'constraint' => 5,
                'auto_increment'=> true
            ],
            'endpoint' => [
                'type' => "text"
            ],
            'p256dh' => [
                'type' => "text"
            ],
            'auth' => [
                'type' => "text"
            ]
        ]);
        $this->forge->addKey('id', true);
        $this->forge->createTable('subscription');
    }

    public function down()
    {
        //
    }
}
