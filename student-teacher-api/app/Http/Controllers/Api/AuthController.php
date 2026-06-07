<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;

use App\Models\User;
use App\Models\StudentModel;
use App\Models\TeacherModel;

use PHPOpenSourceSaver\JWTAuth\Facades\JWTAuth;

class AuthController extends Controller
{
    protected $studentModel;
    protected $teacherModel;

    public function __construct()
    {
        $this->studentModel = new StudentModel();
        $this->teacherModel = new TeacherModel();
    }

    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [

            'vch_name'      => 'required',
            'vch_email'     => 'required|email|unique:tbl_users,vch_email',
            'vch_password'  => 'required|min:6',
            'int_role'      => 'required'

        ]);

        if ($validator->fails()) {

            return response()->json([
                'status' => false,
                'errors' => $validator->errors()
            ]);
        }

        DB::beginTransaction();

        try {

            $userId = DB::table('tbl_users')->insertGetId([

                'vch_name'      => $request->vch_name,

                'vch_email'     => $request->vch_email,

                'vch_password'  => Hash::make($request->vch_password),

                'int_role'      => $request->int_role,

                'created_at'    => now()
            ]);

            /*
                role:
                1 = teacher
                2 = student
            */

            if ($request->int_role == 1) {

                $this->teacherModel->store([

                    'user_id'   => $userId,

                    'created_at' => now()
                ]);
            }

            if ($request->int_role == 2) {

                $this->studentModel->store([

                    'user_id'   => $userId,

                    'created_at' => now()
                ]);
            }

            DB::commit();

            return response()->json([

                'status' => true,

                'message' => 'Registration Successful'
            ]);

        } catch (\Exception $e) {

            DB::rollback();

            return response()->json([

                'status' => false,

                'message' => $e->getMessage()
            ]);
        }
    }

    /* public function login(Request $request)
    {
        $credentials = [

            'vch_email' => $request->vch_email,

            // 'vch_password' => $request->vch_password
            'password' => $request->vch_password
        ];
        $token = JWTAuth::attempt($credentials);
        // dd($token);
        if (!$token) {

            return response()->json([

                'status' => false,

                'message' => 'Invalid Email or Password'
            ]);
        }

        $user = JWTAuth::user();

        return response()->json([

            'status' => true,

            'message' => 'Login Successful',

            'token' => $token,

            'user' => $user
        ]);
    } */

    public function login(Request $request)
    {
        $credentials = [
            'vch_email' => $request->vch_email,
            'password'  => $request->vch_password  // 'password' key is required by Laravel Auth
        ];


        // DEBUG: Check if user exists and what key it returns
        /* $user = \App\Models\User::where('vch_email', $request->vch_email)->first();
        
        dd([
            'user_found'    => $user ? true : false,
            'user_data'     => $user,
            'primary_key'   => $user ? $user->getKey() : 'NO USER',
            'intId_value'   => $user ? $user->intId : 'NO USER',
            'jwt_subject'   => $user ? $user->getJWTSubject() : 'NO USER',
        ]); */


        $token = JWTAuth::attempt($credentials);

        if (!$token) {
            return response()->json([
                'status'  => false,
                'message' => 'Invalid Email or Password'
            ]);
        }

        $user = JWTAuth::user();

        return response()->json([
            'status'  => true,
            'message' => 'Login Successful',
            'jwt_token'   => $token,
            'user'    => $user
        ]);
    }



    public function logout()
    {
        try {

            JWTAuth::invalidate(JWTAuth::getToken());

            return response()->json([

                'status' => true,

                'message' => 'Logout Successful'
            ]);

        } catch (\Exception $e) {

            return response()->json([

                'status' => false,

                'message' => $e->getMessage()
            ]);
        }
    }


    public function profile()
    {
        try {

            $user = JWTAuth::parseToken()->authenticate();

            // dd($user);

            return response()->json([

                'status' => true,

                'user' => $user
            ]);

        } catch (\Exception $e) {

            return response()->json([

                'status' => false,

                'message' => $e->getMessage()
            ]);
        }
    }
}