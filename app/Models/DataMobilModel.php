<?php

namespace App\Models;

use CodeIgniter\Model;

class DataMobilModel extends Model
{
    protected $DBGroup              = 'default';
    protected $table                = 'datamobil';
    protected $primaryKey           = 'id';
    protected $useAutoIncrement     = true;
    protected $insertID             = 0;
    protected $returnType           = 'array';
    protected $useSoftDeletes       = false;
    protected $protectFields        = true;
    protected $allowedFields        = ["id_mobil","time_on", "time_off", "action", "dismiss", "reason", 'reason_detail'];

    // Dates
    protected $useTimestamps        = false;
    protected $dateFormat           = 'datetime';
    protected $createdField         = 'created_at';
    protected $updatedField         = 'updated_at';
    protected $deletedField         = 'deleted_at';

    // Validation
    protected $validationRules      = [];
    protected $validationMessages   = [];
    protected $skipValidation       = false;
    protected $cleanValidationRules = true;

    // Callbacks
    protected $allowCallbacks       = true;
    protected $beforeInsert         = [];
    protected $afterInsert          = [];
    protected $beforeUpdate         = [];
    protected $afterUpdate          = [];
    protected $beforeFind           = [];
    protected $afterFind            = [];
    protected $beforeDelete         = [];
    protected $afterDelete          = [];
    
    public function __construct()
    {
        parent::__construct();
        // $this->db = \Config\Database::connect();
        $this->db = db_connect();
    }

    public function getAllDataMobil(){
        // $db      = \Config\Database::connect();
        $query = "SELECT datamobil.id,id_mobil,time_on, time_off, 'action', dismiss, reason, reason_detail, email, nama, (SELECT GROUP_CONCAT(nama) FROM users WHERE users.id != datamobil.action) as personDismiss FROM `datamobil` JOIN users ON datamobil.action = users.id";
        $res = $this->db->query($query);
        return $res->getResult();
    }

    function getAllDataMobilById($id = -1){
        $query = "SELECT *, (SELECT GROUP_CONCAT(nama) FROM users WHERE users.id != datamobil.action) as personDismiss FROM `datamobil` JOIN users ON datamobil.action = users.id where datamobil.id_mobil='".$id."'";
        $res = $this->db->query($query);
        return $res->getResult();
    }

    function getReasonGraph(){
        $query = "SELECT reason,COUNT(id) as jumlah, reason_detail FROM datamobil GROUP BY reason";
        $res = $this->db->query($query);
        return $res->getResult();
    }

    function updateAction($data){
        $query = "UPDATE datamobil SET reason = '".$data['parameter']."', reason_detail = '".$data['checkedValue']."', action= CASE WHEN action IS NULL || `action`='' THEN '".$data['id']."' WHEN action IS NOT NULL THEN action END WHERE id_mobil = '".$data['parameterMobil']."' ORDER BY id DESC LIMIT 1";
        $res = $this->db->query($query);
    }
    
    function insertMobil($data){
        $query = "INSERT INTO datamobil (id_mobil,time_on, time_off) VALUES ('".$data['id_mobil']."',CURRENT_TIMESTAMP(), ADDTIME(CURRENT_TIMESTAMP(), '".$data['seconds']."'))";
        $res = $this->db->query($query);
    }
}
