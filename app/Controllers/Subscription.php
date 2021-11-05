<?php

namespace App\Controllers;

use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\API\ResponseTrait;
use App\Models\SubscriptionModel;

class Subscription extends ResourceController
{
    /**
     * Return an array of resource objects, themselves in array format
     *
     * @return mixed
     */
    use ResponseTrait;
    public function index()
    {
        $model = new SubscriptionModel();
        $subs = $model->findAll();
        return $this->response->setJSON($subs);
    }

    /**
     * Return the properties of a resource object
     *
     * @return mixed
     */
    public function show($id = null)
    {
        //
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
            'endpoint' => 'required',
            'p256dh' => 'required',
            'auth' => 'required'
        ];
        if(!$this->validate($rules)) return $this->fail($this->validator->getErrors());
        $data = [
            'endpoint' => $this->request->getVar('endpoint'),
            'p256dh' => $this->request->getVar('p256dh'),
            'auth' => $this->request->getVar('auth')
        ];
        $model = new SubscriptionModel();
        $recordExist = $model->cekSub($this->request->getVar('auth'));
        if($recordExist > 0){
            return $this->response->setJSON($recordExist);
        }else{
            $insertNew = $model->save($data);
            return $this->respondCreated($insertNew);   
        }
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
        //
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
