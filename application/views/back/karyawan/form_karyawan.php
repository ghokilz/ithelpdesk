<?php if (is_it()) { ?>
<div class="content-wrapper">
    <p>
    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Tambah Data karyawan</h3>
                            <a href="<?= base_url('karyawan')?>" class="btn btn-warning btn-sm float-right">Kembali</a>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <?= validation_errors() ?>
                            <form action="<?= base_url('karyawan/save_karyawan') ?>" method="POST">
                            <form class="user" action="<?= base_url('karyawan/save_karyawan')?>" method="post">
                            
                                <!-- username -->
                                <div class="input-group mb-3">
                                    <input type="text" name="username" class="form-control" placeholder="Username">
                                    <div class="input-group-append">
                                        <div class="input-group-text">
                                            <span class="fas fa-user"></span>
                                        </div>
                                    </div>
                                </div>

                                <!-- nama lengkap -->
                                <div class="input-group mb-3">
                                    <input type="text" name="nama" class="form-control" placeholder="Nama Lengkap">
                                    <div class="input-group-append">
                                        <div class="input-group-text">
                                            <span class="fas fa-user"></span>
                                        </div>
                                    </div>
                                </div>

                                <!-- email -->
                                <div class="input-group mb-3">
                                    <input type="email" name="email" validation="<?= set_value('email') ?>" class="form-control" placeholder="Email">
                                    <div class="input-group-append">
                                        <div class="input-group-text">
                                            <span class="fas fa-envelope"></span>
                                        </div>
                                    </div>
                                </div>

                                <!-- password -->
                                <div class="input-group mb-3">
                                    <input type="password" name="password" class="form-control" placeholder="Password">
                                    <div class="input-group-append">
                                        <div class="input-group-text">
                                            <span class="fas fa-lock"></span>
                                        </div>
                                    </div>
                                </div>
                                <!-- ulangi password -->
                                <div class="input-group mb-3">
                                    <input type="password" name="confirm_password" class="form-control" placeholder="Retype password">
                                    <div class="input-group-append">
                                        <div class="input-group-text">
                                            <span class="fas fa-lock"></span>
                                        </div>
                                    </div>
                                </div>

                                <!-- jabatan -->
                                <div class="input-group mb-3">
                                    <select name="jabatan_id" class="form-control">
                                        <option value="">-- pilih jabatan --</option>
                                        <?php foreach ($jabatan as $key => $row) { ?>
                                        <option value="<?= $row->id_jabatan?>"><?= $row->jabatan?></option>
                                        <?php } ?>
                                    </select>
                                </div>

                                <!-- divisi / departement -->
                                <div class="input-group mb-3">
                                    <select name="divisi_id" class="form-control">
                                        <option value="">-- pilih departemen --</option>
                                        <?php foreach ($divisi as $key => $row) { ?>
                                        <option value="<?= $row->id_divisi?>"><?= $row->divisi?></option>
                                        <?php } ?>
                                    </select>
                                </div>

                                 <!-- Dealer -->
                                <div class="input-group mb-3">
                                    <select name="dealer" class="form-control">
                                        <option value="">-- pilih dealer --</option>
                                        <?php foreach ($dealer as $key => $row) { ?>
                                        <option value="<?= $row->id_dealer?>"><?= $row->dealer?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                                
                                
                                <button type="submit" class="btn btn-primary btn-sm"> Tambah </button>
                                <button type="reset" class="btn btn-danger btn-sm"> Reset </button>
                            </form>
                        </div>
                    </div><!-- /.card -->
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