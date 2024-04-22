<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class M_jabatan extends CI_Model
{
    public function get_jabatan()
    {
        return $this->db->get('jabatan')->result();
    }
    function insert($data)
    {
        return $this->db->insert('jabatan', $data);
    }
    function get_id_jabatan($id)
    {
        $this->db->where('id_jabatan', $id);
        return  $this->db->get('jabatan')->row();
    }
    function update($id, $data)
    {
        $this->db->where('id_jabatan', $id);
        $this->db->update('jabatan', $data);
    }
    function delete($id)
    {
        $this->db->where('id_jabatan', $id);
        $this->db->delete('jabatan');
    }
}

/* End of file ModelName.php */
