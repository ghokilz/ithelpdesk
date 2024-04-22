<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class M_dealer extends CI_Model
{
    public function get_dealer()
    {
        return $this->db->get('dealer')->result();
    }
    function insert($data)
    {
        return $this->db->insert('dealer', $data);
    }
    function get_id_dealer($id)
    {
        $this->db->where('id_dealer', $id);
        return  $this->db->get('dealer')->row();
    }
    function update($id, $data)
    {
        $this->db->where('id_dealer', $id);
        $this->db->update('dealer', $data);
    }
    function delete($id)
    {
        $this->db->where('id_dealer', $id);
        $this->db->delete('dealer');
    }
    function dealer_regular()
    {
        $this->db->select('*');
        $this->db->from('dealer');
        $this->db->where('jenis', 'regular');

        return $this->db->get()->num_rows();
    }
    function dealer_wing()
    {
        $this->db->select('*');
        $this->db->from('dealer');
        $this->db->where('jenis', 'wing');

        return $this->db->get()->num_rows();
    }
    function dealer_ahass()
    {
        $this->db->select('*');
        $this->db->from('dealer');
        $this->db->where('jenis', 'ahass');

        return $this->db->get()->num_rows();
    }
    function dealer_md()
    {
        $this->db->select('*');
        $this->db->from('dealer');
        $this->db->where('jenis', 'main_dealer');

        return $this->db->get()->num_rows();
    }
}

/* End of file ModelName.php */