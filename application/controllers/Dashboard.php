<?php
defined('BASEPATH') or exit ('No direct script access allowed');

class Dashboard extends CI_Controller
{
    public function index()
    {
        cek_login();
        $data['tiket_wait']     = $this->M_tiket->tiket_wait();
        $data['tiket_proses']   = $this->M_tiket->tiket_proses();
        $data['tiket_close']    = $this->M_tiket->tiket_close();
        $data['user']           = $this->M_karyawan->jumlah_user();
        $data['barang']         = $this->M_barang->get_barang();
        $data['dealer']         = $this->M_dealer->get_dealer();
        $data['dealer_regular'] = $this->M_dealer->dealer_regular();
        $data['dealer_wing']    = $this->M_dealer->dealer_wing();
        $data['dealer_ahass']   = $this->M_dealer->dealer_ahass();
        $data['dealer_md']      = $this->M_dealer->dealer_md();
        $this->template->load('back/template','back/dashboard', $data);
        
    }
}