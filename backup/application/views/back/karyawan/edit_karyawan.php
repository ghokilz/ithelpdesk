<div class="content-wrapper">
    <p>
    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Edit Data karyawan : <?= $user->nama ?></h3>
                            <a href="<?= base_url('karyawan')?>" class="btn btn-warning btn-sm float-right">Kembali</a>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <?= validation_errors() ?>
                            <form action="<?= base_url('karyawan/update_karyawan') ?>" method="POST">
                                <!-- username -->
                                <div class="input-group mb-3">
                                    <input type="hidden" name="id_user" value="<?= $user->id_user ?>" class="form-control">
                                    <input type="text" name="username" value="<?= $user->username ?>" class="form-control" placeholder="Username">
                                    <div class="input-group-append">
                                        <div class="input-group-text">
                                            <span class="fas fa-user"></span>
                                        </div>
                                    </div>
                                </div>

                                <!-- nama lengkap -->
                                <div class="input-group mb-3">
                                    <input type="text" name="nama" value="<?= $user->nama ?>" class="form-control" placeholder="Nama Lengkap">
                                    <div class="input-group-append">
                                        <div class="input-group-text">
                                            <span class="fas fa-user"></span>
                                        </div>
                                    </div>
                                </div>

                                <!-- email -->
                                <div class="input-group mb-3">
                                    <input type="email" name="email" value="<?= $user->email ?>" validation="<?= set_value('email') ?>" class="form-control" placeholder="Email">
                                    <div class="input-group-append">
                                        <div class="input-group-text">
                                            <span class="fas fa-envelope"></span>
                                        </div>
                                    </div>
                                </div>

                                <!-- jabatan -->
                                <div class="input-group mb-3">
                                    <select name="jabatan_id" class="form-control">
                                        <option value="">-- pilih jabatan --</option>
                                        <?php foreach ($jabatan as $key => $row) { ?>
                                            <option value="<?= $row->id_jabatan ?>" 
                                                <?= $row->id_jabatan == $user->jabatan_id ? 'selected' : null ?>> 
                                                <?= $row->jabatan ?>
                                            </option>
                                        <?php } ?>
                                    </select>
                                </div>

                                <!-- divisi / departement -->
                                <div class="input-group mb-3">
                                    <select name="divisi_id" class="form-control">
                                        <option value="">-- pilih departemen --</option>
                                        <?php foreach ($divisi as $key => $row) { ?>
                                        <option value="<?= $row->id_divisi?>"
                                            <?= $row->id_divisi == $user->divisi_id ? 'selected' : null ?>>
                                            <?= $row->divisi?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                                <!-- level -->
                                <div class="input-group mb-3">
                                    <select name="level_user" class="form-control">
                                        <option value="">-- Level User --</option>
                                        <option value="1" <?= $user->level_user == '1' ? 'selected' : '1'?>>Admin</option>
                                        <option value="2" <?= $user->level_user == '2' ? 'selected' : '2'?>>User</option>
                                    </select>
                                </div>
                                <!-- Status -->
                                <div class="input-group mb-3">
                                   <select name="status_user" class="form-control">
                                       <option value="">-- Status User --</option>
                                       <option value="1" <?= $user->status_user == '1' ? 'selected' : '1'?>>Active</option>
                                       <option value="0" <?= $user->status_user == '0' ? 'selected' : '0'?>>Tidak Aktif</option>
                                   </select>
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

                                <button type="submit" class="btn btn-primary btn-sm"> Save </button>
                                <button type="reset" class="btn btn-danger btn-sm"> Reset </button>
                            </form>
                        </div>
                    </div><!-- /.card -->
                </div>
            </div>
        </div>
    </section>
</div> 