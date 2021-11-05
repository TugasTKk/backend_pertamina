<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use CodeIgniter\API\ResponseTrait;
use App\Models\ReasonModel;

class Reason extends BaseController
{
    use ResponseTrait;
    public function index()
    {
        $model = new ReasonModel();
        $reason = $model->findAll();
        return $this->response->setJSON($reason);
    }

    public function show($id = null)
    {
        $model = new ReasonModel();
        $reason = $model->getWhere(['id' => $id]) -> getResult();
        if($reason){
            return $this->respond($reason);
        }else{
            return $this->failNotFound("Tidak ada data data".$id);
        }
    }

    /**
     * Return a new resource object, with default properties
     *
     * @return mixed
     */
    public function new()
    {
        //
    }

    /**
     * Create a new resource object, from "posted" parameters
     *
     * @return mixed
     */
    public function create()
    {
        helper(['form']);
        $rules = [
            'reason' => 'required',
        ];
        if(!$this->validate($rules)) return $this->fail($this->validator->getErrors());
        $data = [
            'reason' => $this->request->getVar('reason')
        ];
        $model = new ReasonModel();
        $insertNew = $model->save($data);
        return $this->respondCreated($insertNew);
    }

    /**
     * Return the editable properties of a resource object
     *
     * @return mixed
     */
    public function edit($id = null)
    {
        //
    }

    /**
     * Add or update a model resource, from "posted" properties
     *
     * @return mixed
     */
    public function update($id = null)
    {
        $model = new ReasonModel();
        $json = $this->request->getJSON();
        if($json){
            $data = [
                'reason' => $json->reason,
            ];
        }else{
            $input = $this->request->getRawInput();
            $data = [
                'reason' => $input['reason'],
            ];
        }
        // Insert to Database
        $model->update($id, $data);
        $response = [
            'status'   => 200,
            'error'    => null,
            'messages' => [
                'success' => 'Data Updated'
            ]
        ];
        return $this->respond($response);
    }

    /**
     * Delete the designated resource object from the model
     *
     * @return mixed
     */
    public function delete($id = null)
    {
        //
    }
}
