<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use CodeIgniter\API\ResponseTrait;
use App\Models\DataMobilModel;
class DataMobil extends BaseController
{
    use ResponseTrait;
    public function index()
    {
        $model = new DataMobilModel();
        $mobil = $model->getAllDataMobil();
        return $this->response->setJSON($mobil);
        // return view('dataMobil', array("dataMobil" => $mobil));
    }

    public function show($id = null)
    {
        $model = new DataMobilModel();
        $mobil = $model->getAllDataMobilById($id);
        if($mobil){
            return $this->respond($mobil);
        }else{
            return $this->failNotFound("Tidak ada data mobil".$id);
        }
    }

    public function update($id = null)
    {
        helper(['form']);
        $rules = [
            'parameterMobil' => 'required',
            'checkedValue' => 'required',
            'parameter' => 'required'
        ];
        if(!$this->validate($rules)) return $this->fail($this->validator->getErrors());
        $data = [
            'parameterMobil' => $this->request->getVar('parameterMobil'),
            'checkedValue' => $this->request->getVar('checkedValue'),
            'parameter' => $this->request->getVar('parameter'),
            'id' => $this->request->getVar('id')
        ];
        $model = new DataMobilModel();
        $updated = $model->updateAction($data);
        return $this->respondCreated($updated);
    }
    
        public function create()
    {
        helper(['form']);
        $rules = [
            'id_mobil' => 'required',
            'seconds' => 'required'
        ];
        if(!$this->validate($rules)) return $this->fail($this->validator->getErrors());
        $data = [
            'id_mobil' => $this->request->getVar('id_mobil'),
            'seconds' => $this->request->getvar('seconds')
        ];
        $model = new DataMobilModel();
        $insertNew = $model->insertMobil($data);
        return $this->respondCreated($insertNew);
    }
}
