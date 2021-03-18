<?php 

use Phalcon\Db\Column;
use Phalcon\Db\Index;
use Phalcon\Db\Reference;
use Phalcon\Mvc\Model\Migration;

/**
 * Class KomentarMigration_100
 */
class KomentarMigration_100 extends Migration
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
