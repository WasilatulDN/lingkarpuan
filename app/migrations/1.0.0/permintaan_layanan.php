<?php 

use Phalcon\Db\Column;
use Phalcon\Db\Index;
use Phalcon\Db\Reference;
use Phalcon\Mvc\Model\Migration;

/**
 * Class PermintaanLayananMigration_100
 */
class PermintaanLayananMigration_100 extends Migration
{
    /**
     * Define the table structure
     *
     * @return void
     */
    public function morph()
    {
        $this->morphTable('permintaan_layanan', [
                'columns' => [
                    new Column(
                        'id_layanan',
                        [
                            'type' => Column::TYPE_CHAR,
                            'notNull' => true,
                            'size' => 36,
                            'first' => true
                        ]
                    ),
                    new Column(
                        'id_user',
                        [
                            'type' => Column::TYPE_CHAR,
                            'size' => 36,
                            'after' => 'id_layanan'
                        ]
                    ),
                    new Column(
                        'id_status_layanan',
                        [
                            'type' => Column::TYPE_INTEGER,
                            'size' => 11,
                            'after' => 'id_user'
                        ]
                    ),
                    new Column(
                        'id_konsultan',
                        [
                            'type' => Column::TYPE_CHAR,
                            'size' => 36,
                            'after' => 'id_status_layanan'
                        ]
                    ),
                    new Column(
                        'tanggal',
                        [
                            'type' => Column::TYPE_DATE,
                            'size' => 1,
                            'after' => 'id_konsultan'
                        ]
                    ),
                    new Column(
                        'jam_mulai',
                        [
                            'type' => Column::TYPE_VARCHAR,
                            'size' => 1,
                            'after' => 'tanggal'
                        ]
                    ),
                    new Column(
                        'durasi',
                        [
                            'type' => Column::TYPE_INTEGER,
                            'size' => 11,
                            'after' => 'jam_mulai'
                        ]
                    ),
                    new Column(
                        'jam_selesai',
                        [
                            'type' => Column::TYPE_VARCHAR,
                            'size' => 1,
                            'after' => 'durasi'
                        ]
                    ),
                    new Column(
                        'jenis_layanan',
                        [
                            'type' => Column::TYPE_INTEGER,
                            'size' => 11,
                            'after' => 'jam_selesai'
                        ]
                    )
                ],
                'options' => [
                    'TABLE_TYPE' => 'BASE TABLE',
                    'AUTO_INCREMENT' => '',
                    'ENGINE' => 'InnoDB',
                    'TABLE_COLLATION' => 'utf8mb4_general_ci'
                ],
            ]
        );
    }

    /**
     * Run the migrations
     *
     * @return void
     */
    public function up()
    {

    }

    /**
     * Reverse the migrations
     *
     * @return void
     */
    public function down()
    {

    }

}
