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
                            <h3 class="card-title">Pengembalian Barang : <?= $barang->kode_barang ?></h3>
                            <a href="<?= base_url('barang')?>" class="btn btn-warning btn-sm float-right">Kembali</a>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <?= validation_errors() ?>
                            <form action="<?= base_url('barang/pengembalian_barang') ?>" method="POST">
                                <div class="input-group mb-3">
                                    <input type="hidden" name="" value="<?= $barang->id_barang ?>" class="form-control">
                                    <input type="hidden" name="" value="<?= $barang->no_barang ?>" class="form-control">
                                    <div class="input-group-append">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label> Kode Barang</label>
                                    <div class="input-group mb-3">
                                        <input type="text" name="" value="<?= $barang->kode_barang ?>" class="form-control" placeholder="Kode Barang" readonly>
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
                                        <input type="text" name="" value="<?= $barang->nama_barang ?>" class="form-control" placeholder="Nama Barang" readonly>
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
                                        <input type="text" name="" value="<?= $barang->merk ?>" class="form-control" placeholder="Nama Barang" readonly>
                                        <div class="input-group-append">
                                            <div class="input-group-text">
                                                <span class="fas fa-bookmark"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label> Tujuan Peminjaman</label>
                                    <div class="input-group mb-3">
                                        <input type="text"  name="" value="<?= $barang->tujuan_pinjaman ?>" class="form-control" placeholder="Tujuan Pinjaman" readonly>
                                        <div class="input-group-append">
                                            <div class="input-group-text">
                                                <span class="fas fa-bookmark"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                

                                <button type="submit" value="Simpan" class="btn btn-primary btn-sm"> Simpan </button>
                            </form>
                        </div>
                    </div><!-- /.card -->
                </div>
            </div>
        </div>
    </section>
</div> 