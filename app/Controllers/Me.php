<?php

namespace App\Controllers;

use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\API\ResponseTrait;
use App\Models\UserModel;
use Firebase\JWT\JWT;


class Me extends ResourceController
{
    /**
     * Return an array of resource objects, themselves in array format
     *
     * @return mixed
     */
    use ResponseTrait;
    public function index()
    {
        //
        $key = getenv('TOKEN_SECRET');
        $header = $this->request->getServer('HTTP_AUTHORIZATION');
        if(!$header) return $this->failUnauthorized('Token Required');
        $token = explode(" ", $header)[1];

        try{
            $decoded = JWT::decode($token, $key, ['HS256']);
            $response = [
                'id' => $decoded->uid,
                'email' => $decoded->email,
                'messages' => "1",
            ];
            return $this->respond($response);
        }catch(\Throwable $th){
            return $this->fail("Invalid Token");
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
        $key = getenv('TOKEN_SECRET');
        $header = $this->request->getServer('HTTP_AUTHORIZATION');
        if(!$header) return $this->failUnauthorized('Token Required');
        $token = explode(" ", $header)[1];

        try{
            $decoded = JWT::decode($token, $key, ['HS256']);
            if($id != $decoded->uid){
                return $this->failUnauthorized('Not Authorized');
            }
        }catch(\Throwable $th){
            return $this->fail("Invalid Token");
        }

        helper(['form']);
        $rules = [
            'email' => 'required',
            'password' => 'required|min_length[6]',
            'confpassword' => 'required|matches[password]' 
        ];
        if(!$this->validate($rules)) return $this->fail($this->validator->getErrors());
        $model = new UserModel();
        $json = $this->request->getJSON();
        if($json){
            $data = [
                'email' => $json->email,
                'password' => password_hash($this->request->getVar('password'), PASSWORD_BCRYPT),
                'nama' => $json->nama
            ];
        }else{
            $input = $this->request->getRawInput();
            $data = [
                'email' => $input['email'],
                'password' => password_hash($this->request->getVar('password'), PASSWORD_BCRYPT),
                'nama' => $input['nama']
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
