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
                            <label> Username</label>
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
                                <label> Nama Lengkap</label>
                                <div class="input-group mb-3">
                                    <input type="text" name="nama" value="<?= $karyawan->nama ?>" class="form-control" placeholder="Nama Lengkap">
                                    <div class="input-group-append">
                                        <div class="input-group-text">
                                            <span class="fas fa-user"></span>
                                        </div>
                                    </div>
                                </div>

                                <!-- email -->
                                <label> Email</label>
                                <div class="input-group mb-3">
                                    <input type="email" name="email" value="<?= $karyawan->email ?>" class="form-control" placeholder="Email">
                                    <div class="input-group-append">
                                        <div class="input-group-text">
                                            <span class="fas fa-envelope"></span>
                                        </div>
                                    </div>
                                </div>
                                <label> Dealer</label>
                                <div class="input-group mb-3">
                                    <select name="dealer_id" class="form-control">
                                        <option value="">-- Nama dealer Belum di tambahkan --</option>
                                        <?php foreach ($dealer as $key => $row) { ?>
                                        <option value="<?= $row->id_dealer?>"
                                        <?= $row->id_dealer == $karyawan->dealer_id ? "selected" :null ?>>
                                        <?= $row->dealer?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                                <label> Email</label>
                                <div class="input-group mb-3">
                                    <select name="divisi_id" class="form-control">
                                        <option value="">-- Nama departemen Belum di tambahkan --</option>
                                        <?php foreach ($divisi as $key => $row) { ?>
                                        <option value="<?= $row->id_divisi?>" <?= $row->id_divisi == $karyawan->divisi_id ? "selected" :null ?>> <?= $row->divisi?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-primary btn-sm"> update </button>
                            </form>
                        </div>
                    </div><!-- /.card -->
                </div>
            </div>
        </div>
    </section>
</div> 