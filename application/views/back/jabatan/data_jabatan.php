<div class="card">
    <div class="card-header">
        <h3 class="card-title">List Jabatan</h3>
    </div>
    <!-- /.card-header -->
    <div class="card-body">
        <?= $this->session->flashdata('hapus'); ?>
        <table id="datatable1" class="table table-bordered">
            <thead>
                <tr>
                <th style="width: 10px">NO</th>
                <th>Nama Jabatan</th>
                <th style="width: 200px">Action</th>
                </tr>
            </thead>
        <tbody>
            <?php 
            $no = 1;
            foreach ($jabatan as $row) { ?>
                <tr>
                    <td><?= $no++ ?></td>
                    <td><?= $row->jabatan ?></td>
                    <td>
                        <a class="btn btn-info btn-sm" href="<?= base_url('jabatan/edit_jabatan/'. $row->id_jabatan) ?>">
                            <i class="fas fa-pencil-alt"></i>
                                Edit
                        </a>
                        <a onclick="return confirm('Yakin ingin dihapus?');" href="<?= base_url('jabatan/delete_jabatan/'. $row->id_jabatan) ?>" class="btn btn-danger btn-sm" >
                            <i class="fas fa-trash"></i>
                                Hapus
                        </a>
                    </td>
                </tr>
            <?php } ?>
        </tbody>
        </table>
    </div>
    <!-- /.card-body -->
    
</div><!-- /.card -->