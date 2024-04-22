<div class="card">
    <div class="card-header">
        <h3 class="card-title">List Departemen</h3>
    </div>
    <!-- /.card-header -->
    <div class="card-body">
        <?= $this->session->flashdata('hapus'); ?>
        <table class="table table-bordered">
            <thead>
                <tr>
                <th style="width: 10px">NO</th>
                <th>Nama Departemen</th>
                <th style="width: 200px">Action</th>
                </tr>
            </thead>
        <tbody>
            <?php 
            $no = 1;
            foreach ($divisi as $row) { ?>
                <tr>
                    <td><?= $no++ ?></td>
                    <td><?= $row->divisi ?></td>
                    <td>
                        <a class="btn btn-info btn-sm" href="<?= base_url('divisi/edit_divisi/'. $row->id_divisi) ?>">
                            <i class="fas fa-pencil-alt"></i>
                                Edit
                        </a>
                        <a onclick="return confirm('Yakin ingin dihapus?');" href="<?= base_url('divisi/delete_divisi/'. $row->id_divisi) ?>" class="btn btn-danger btn-sm" >
                            <i class="fas fa-trash"></i>
                                Hapus
                        </a>
                    </td>
                </tr>
            <?php } ?>
        </tbody>
        </table>
    </div>
</div><!-- /.card -->