<?php 

use Phalcon\Db\Column;
use Phalcon\Db\Index;
use Phalcon\Db\Reference;
use Phalcon\Mvc\Model\Migration;

/**
 * Class ArtikelMigration_101
 */
class ArtikelMigration_101 extends Migration
{
    /**
     * Define the table structure
     *
     * @return void
     */
    public function morph()
    {
        $this->morphTable('artikel', [
                'columns' => [
                    new Column(
                        'id_artikel',
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
                            'after' => 'id_artikel'
                        ]
                    ),
                    new Column(
                        'id_status_artikel',
                        [
                            'type' => Column::TYPE_INTEGER,
                            'size' => 11,
                            'after' => 'id_user'
                        ]
                    ),
                    new Column(
                        'judul',
                        [
                            'type' => Column::TYPE_VARCHAR,
                            'size' => 100,
                            'after' => 'id_status_artikel'
                        ]
                    ),
                    new Column(
                        'isi_artikel',
                        [
                            'type' => Column::TYPE_TEXT,
                            'size' => 1,
                            'after' => 'judul'
                        ]
                    ),
                    new Column(
                        'gambar',
                        [
                            'type' => Column::TYPE_VARCHAR,
                            'size' => 100,
                            'after' => 'isi_artikel'
                        ]
                    ),
                    new Column(
                        'catatan_penilik',
                        [
                            'type' => Column::TYPE_TEXT,
                            'size' => 1,
                            'after' => 'gambar'
                        ]
                    ),
                    new Column(
                        'catatan_penulis',
                        [
                            'type' => Column::TYPE_TEXT,
                            'size' => 1,
                            'after' => 'catatan_penilik'
                        ]
                    ),
                    new Column(
                        'created_at',
                        [
                            'type' => Column::TYPE_DATETIME,
                            'size' => 1,
                            'after' => 'catatan_penulis'
                        ]
                    )
                ],
                'indexes' => [
                    new Index('PRIMARY', ['id_artikel'], 'PRIMARY'),
                    new Index('fk_artikel_status', ['id_status_artikel'], null),
                    new Index('fk_artikel_user', ['id_user'], null)
                ],
                'references' => [
                    new Reference(
                        'fk_artikel_status',
                        [
                            'referencedTable' => 'status_artikel',
                            'referencedSchema' => 'lingkar_puan',
                            'columns' => ['id_status_artikel'],
                            'referencedColumns' => ['id_status_artikel'],
                            'onUpdate' => 'RESTRICT',
                            'onDelete' => 'RESTRICT'
                        ]
                    ),
                    new Reference(
                        'fk_artikel_user',
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
