<?php 

use Phalcon\Db\Column;
use Phalcon\Db\Index;
use Phalcon\Db\Reference;
use Phalcon\Mvc\Model\Migration;

/**
 * Class KomentarMigration_101
 */
class KomentarMigration_101 extends Migration
{
    /**
     * Define the table structure
     *
     * @return void
     */
    public function morph()
    {
        $this->morphTable('komentar', [
                'columns' => [
                    new Column(
                        'id_komentar',
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
                            'after' => 'id_komentar'
                        ]
                    ),
                    new Column(
                        'id_artikel',
                        [
                            'type' => Column::TYPE_CHAR,
                            'size' => 36,
                            'after' => 'id_user'
                        ]
                    ),
                    new Column(
                        'isi_komentar',
                        [
                            'type' => Column::TYPE_TEXT,
                            'size' => 1,
                            'after' => 'id_artikel'
                        ]
                    )
                ],
                'indexes' => [
                    new Index('PRIMARY', ['id_komentar'], 'PRIMARY'),
                    new Index('fk_komentar_user', ['id_user'], null),
                    new Index('fk_komentar_artikel', ['id_artikel'], null)
                ],
                'references' => [
                    new Reference(
                        'fk_komentar_artikel',
                        [
                            'referencedTable' => 'artikel',
                            'referencedSchema' => 'lingkar_puan',
                            'columns' => ['id_artikel'],
                            'referencedColumns' => ['id_artikel'],
                            'onUpdate' => 'RESTRICT',
                            'onDelete' => 'RESTRICT'
                        ]
                    ),
                    new Reference(
                        'fk_komentar_user',
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
