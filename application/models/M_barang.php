<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class M_barang extends CI_Model
{
    function get_barang()
    {
        return $this->db->get('barang')->result();
    }
    

    function get_pinjam_barang()
    {
        return $this->db->get('pinjam_barang')->result();
    }
    function get_kembali_barang()
    {
        return $this->db->get('barang')->result();
    }

    function barang_user()
    {
        $this->db->where('barang.user_id', $this->session->userdata('id_user'));
        return $this->db->get('barang')->result();
    }
    function get_no_barang($no_barang)
    {
        $this->db->join('user', 'barang.user_id = user.id_user', 'left');$this->db->where('no_barang', $no_barang);
        return $this->db->get('barang')->row();
    }
    function no_barang()
    {
        $q = $this->db->query("SELECT MAX(RIGHT(no_barang,4)) AS no_barang FROM barang WHERE DATE(tgl_daftar)=CURDATE()");
        $kd = "";
        if ($q->result() > 0) {
            foreach ($q->result() as $k) {
                $tmp = ((int) $k->no_barang) +1;
                $kd = sprintf("%04s", $tmp);
            }
        }else {
            $kd = "0001";
        }
        date_default_timezone_set('Asia/Jakarta');
        return date('dmy') . $kd;
    }

    function insert($data)
    {
        return $this->db->insert('barang', $data);
    }

    function insert_tanggapan($data)
    {
        return $this->db->insert('detail_barang', $data);
    }
    function insert_barang($data)
    {
        return $this->db->insert('detail_barang', $data);
        // return $this->db->insert('pinjam_barang', $data);

    }
    function get_id_barang($id)
    {
        $this->db->where('id_barang', $id);
        return $this->db->get('barang');
    }
    function get_barang_id($id)
    {
        $this->db->where('pinjam_id', $id);
        return $this->db->get('pinjam_barang');
    }
    function delete($id)
    {
        $this->db->where('id_barang', $id);
        $this->db->delete('barang');
    }
    function update($id, $data)
    {
        $this->db->where('id_barang', $id);
        $this->db->update('barang', $data);
    }
    function updatepinjam($id, $data)
    {
        $this->db->where('id_barang', $id);
        $this->db->update('pinjam_barang', $data);
    }
    function barang_wait()
    {
        $this->db->select('*');
        $this->db->from('barang');
        $this->db->where('status_barang', 0);

        return $this->db->get()->num_rows();
    }
    function barang_proses()
    {
        $this->db->select('*');
        $this->db->from('barang');
        $this->db->where('status_barang', 1);

        return $this->db->get()->num_rows();
    }
    function barang_close()
    {
        $this->db->select('*');
        $this->db->from('barang');
        $this->db->where('status_barang', 3);

        return $this->db->get()->num_rows();
    }
}