<div class="content-wrapper">
    <p>
    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Profile</h3>
                            <a href="<?= base_url('karyawan')?>" class="btn btn-warning btn-sm float-right">Kembali</a>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <?= validation_errors() ?>
                            <?= $this->session->flashdata('message'); ?>

                            <form action="<?= base_url('karyawan/update_profile') ?>" method="POST">
                            <form class="user" action="<?= base_url('karyawan/save_karyawan')?>" method="post">
                            
                                <!-- username -->
                                <div class="input-group mb-3">
                                    <input type="hidden" name="id_user" value="<?= $karyawan->id_user ?>">
                                    <input type="text" name="username" value="<?= $karyawan->username ?>" class="form-control" placeholder="Username">
                                    <div class="input-group-append">
                                        <div class="input-group-text">
                                            <span class="fas fa-user"></span>
                                        </div>
                                    </div>
                                </div>

                                <!-- nama lengkap -->
                                <div class="input-group mb-3">
                                    <input type="text" name="nama" value="<?= $karyawan->nama ?>" class="form-control" placeholder="Nama Lengkap">
                                    <div class="input-group-append">
                                        <div class="input-group-text">
                                            <span class="fas fa-user"></span>
                                        </div>
                                    </div>
                                </div>

                                <!-- email -->
                                <div class="input-group mb-3">
                                    <input type="email" name="email" value="<?= $karyawan->email ?>" class="form-control" placeholder="Email">
                                    <div class="input-group-append">
                                        <div class="input-group-text">
                                            <span class="fas fa-envelope"></span>
                                        </div>
                                    </div>
                                </div>
                                
                                <!-- <div class="input-group mb-3">
                                    <select name="jabatan_id" class="form-control">
                                        <option value="">-- Jabatan Belum di Input --</option>
                                        <?php foreach ($jabatan as $key => $row) { ?>
                                        <option value="<?= $row->id_jabatan?>" <?= $row->id_jabatan == $karyawan->jabatan_id ? "selected" :null ?>> <?= $row->jabatan?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                                <div class="input-group mb-3">
                                    <select name="divisi_id" class="form-control">
                                        <option value="">-- Departemen Belum di Input --</option>
                                        <?php foreach ($divisi as $key => $row) { ?>
                                        <option value="<?= $row->id_divisi?>" <?= $row->id_divisi == $karyawan->divisi_id ? "selected" :null ?>> <?= $row->divisi?></option>
                                        <?php } ?>
                                    </select>
                                </div> -->
                                
                                <button type="submit" class="btn btn-primary btn-sm"> update </button>
                            </form>
                        </div>
                    </div><!-- /.card -->
                </div>
            </div>
        </div>
    </section>
</div> 