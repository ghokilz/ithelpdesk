    <section class="content-header">
    </section>
<div class="content-wrapper">
    <p>
    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Edit Data Barang : <?= $barang->kode_barang ?></h3>
                            <a href="<?= base_url('barang')?>" class="btn btn-warning btn-sm float-right">Kembali</a>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <?= validation_errors() ?>
                            <form action="<?= base_url('barang/update_barang') ?>" method="POST">
                                <div class="input-group mb-3">
                                    <input type="hidden" name="id_barang" value="<?= $barang->id_barang ?>" class="form-control">
                                    <input type="hidden" name="no_barang" value="<?= $barang->no_barang ?>" class="form-control">
                                    <div class="input-group-append">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label> Kode Barang</label>
                                    <div class="input-group mb-3">
                                        <input type="text" name="kode_barang" value="<?= $barang->kode_barang ?>" class="form-control" placeholder="Kode Barang">
                                        <div class="input-group-append">
                                            <div class="input-group-text">
                                                <span class="fas fa-code"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label> Nama Barang</label>
                                    <div class="input-group mb-3">
                                        <input type="text" name="nama_barang" value="<?= $barang->nama_barang ?>" class="form-control" placeholder="Nama Barang">
                                        <div class="input-group-append">
                                            <div class="input-group-text">
                                                <span class="fas fa-boxes"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label> Merek</label>
                                    <div class="input-group mb-3">
                                        <input type="text" name="merk" value="<?= $barang->merk ?>" class="form-control" placeholder="Nama Barang">
                                        <div class="input-group-append">
                                            <div class="input-group-text">
                                                <span class="fas fa-bookmark"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label> No Seri</label>
                                    <div class="input-group mb-3">
                                        <input type="text" name="no_seri" value="<?= $barang->no_seri ?>" class="form-control" placeholder="No Seri Barang">
                                        <div class="input-group-append">
                                            <div class="input-group-text">
                                                <span class="fas fa-marker"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label> Kondisi Barang</label>
                                    <div class="input-group mb-3">
                                        <select name="kondisi_barang" class="form-control">
                                            <option value="baik" <?= $barang->kondisi_barang == 'baik' ? 'selected' : 'baik'?>>Baik</option>
                                            <option value="cukup baik" <?= $barang->kondisi_barang == 'cukup baik' ? 'selected' : 'cukup baik'?>>Cukup baik</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label> Unit Barang</label>
                                    <div class="input-group mb-3">
                                        <input type="number" name="unit" value="<?= $barang->unit ?>" class="form-control" placeholder="Unit">
                                        <div class="input-group-append">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label> Tempat Penyimpanan Barang</label>
                                    <div class="input-group mb-3">
                                        <input type="text" name="storage" value="<?= $barang->storage ?>" class="form-control" placeholder="Tempat Simpan">
                                        <div class="input-group-append">
                                        </div>
                                    </div>
                                </div>
                                <!-- <div class="form-group">
                                    <label> Upload Gambar Barang</label>
                                    <div class="input-group mb-3">
                                        <input type="file" name="gambar_barang" value="<?= $barang->gambar_barang ?>" class="form-control" placeholder="Upload Foto Barang">
                                        <div class="input-group-append">
                                            <div class="input-group-text">
                                                <span class="fas fa-paperclip"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div> -->

                                <button type="submit" value="Simpan" class="btn btn-primary btn-sm"> Save </button>
                            </form>
                        </div>
                    </div><!-- /.card -->
                </div>
            </div>
        </div>
    </section>
</div> 