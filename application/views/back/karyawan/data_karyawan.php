<?php if (is_it()) { ?>
<div class="content-wrapper">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Karyawan</h1>
                </div>
            <div class="col-sm-6">

            </div>
        </div>
    </section>
    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Data karyawan</h3>
                            <a href="<?= base_url('karyawan/tambah_karyawan') ?>" class="btn btn-primary btn-sm float-right"> Tambah Karyawan </a>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <?= $this->session->flashdata('message'); ?>
                            <table id="datatable1" class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th style="width: 10px">NO</th>
                                        <th>USERNAME</th>
                                        <th>NAMA</th>
                                        <th>LEVEL</th>
                                        <th>STATUS</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php 
                                    $no = 1;
                                    foreach ($karyawan as $row) { ?>
                                        <tr>
                                            <td><?= $no++ ?></td>
                                            <td><?= $row->username ?></td>
                                            <td><?= $row->nama ?></td>
                                            <td>
                                                <?php if ($row->level_user == '1')
                                                    {
                                                        echo '<span class="badge bg-danger"> Admin </span>';
                                                    } else if ($row->level_user == '2') {
                                                        echo '<span class="badge bg-primary"> User </span>';
                                                    }else {
                                                        echo '<span class="badge bg-primary"> User </span>';
                                                    }
                                                ?>
                                            </td>
                                            <td>
                                                <?php if ($row->status_user == '1')
                                                    {
                                                        echo '<span class="badge bg-success"> Aktif </span>';
                                                    } else if ($row->level_user = '0'){
                                                        echo '<span class="badge bg-danger"> Tidak Aktif </span>';
                                                    }else {
                                                        echo '<span class="badge bg-danger"> Tidak Aktif </span>';
                                                    }
                                                ?>
                                            </td>
                                            <td>
                                                <a class="btn btn-info btn-sm" href="<?= base_url('karyawan/edit_karyawan/'. $row->id_user) ?>">
                                                    <i class="fas fa-pencil-alt"></i>
                                                        Edit
                                                </a>
                                                <a onclick="return confirm('Yakin ingin dihapus?');" href="<?= base_url('karyawan/delete_karyawan/'. $row->id_user) ?>" class="btn btn-danger btn-sm" >
                                                    <i class="fas fa-trash"></i>
                                                        Hapus
                                                </a>
                                            </td>
                                        </tr>
                                    <?php } ?>
                                </tbody>    
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</div> 
<?php }else {?>

<div class="content-wrapper">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Tidak bisa akses <a class="text-danger">selain ADMIN</a>...!!!</h1>
                </div>
            <div class="col-sm-6">

            </div>
        </div>
    </section>
</div>

<?php } ?>
