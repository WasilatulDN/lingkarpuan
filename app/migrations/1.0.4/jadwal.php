<?php 

use Phalcon\Db\Column;
use Phalcon\Db\Index;
use Phalcon\Db\Reference;
use Phalcon\Mvc\Model\Migration;

/**
 * Class JadwalMigration_104
 */
class JadwalMigration_104 extends Migration
{
    /**
     * Define the table structure
     *
     * @return void
     */
    public function morph()
    {
        $this->morphTable('jadwal', [
                'columns' => [
                    new Column(
                        'id_jadwal',
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
                            'after' => 'id_jadwal'
                        ]
                    ),
                    new Column(
                        'hari',
                        [
                            'type' => Column::TYPE_VARCHAR,
                            'size' => 10,
                            'after' => 'id_user'
                        ]
                    ),
                    new Column(
                        'jam_mulai',
                        [
                            'type' => Column::TYPE_VARCHAR,
                            'size' => 1,
                            'after' => 'hari'
                        ]
                    ),
                    new Column(
                        'jam_selesai',
                        [
                            'type' => Column::TYPE_VARCHAR,
                            'size' => 1,
                            'after' => 'jam_mulai'
                        ]
                    )
                ],
                'indexes' => [
                    new Index('PRIMARY', ['id_jadwal'], 'PRIMARY'),
                    new Index('fk_jadwal_user', ['id_user'], null)
                ],
                'references' => [
                    new Reference(
                        'fk_jadwal_user',
                        [
                            'referencedTable' => 'user',
                            'referencedSchema' => 'lingkar_puan',
                            'columns' => ['id_user'],
                            'referencedColumns' => ['id_user'],
                            'onUpdate' => 'RESTRICT',
                            'onDelete' => 'RESTRICT'
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
