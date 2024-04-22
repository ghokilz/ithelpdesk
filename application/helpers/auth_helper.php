<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

    function cek_login()
    {
        $CI = &get_instance();
        $username = $CI->session->username;

        if ($username == NULL) {
            $CI->session->set_flashdata('message', '<div class="alert alert-danger"> Login terlebih dahulu </div>');

            redirect('auth/login');
        }
    }

    function is_it()
    {
        $CI = &get_instance();
        $tipeuser = $CI->session->level_user;
        if ($tipeuser == '1')
        {
            return $tipeuser;
        }
        return null;
    }

    function admin_md()
    {
        $CI = &get_instance();
        $tipeuser = $CI->session->level_user;
        if ($tipeuser == '3')
        {
            return $tipeuser;
        }
        return null;
    }
    function user_md()
    {
        $CI = &get_instance();
        $tipeuser = $CI->session->level_user;
        if ($tipeuser == '4')
        {
            return $tipeuser;
        }
        return null;
    }