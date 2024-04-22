<div class="content-wrapper">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Peminjaman Barang</h1>
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
                            <h3 class="card-title">Data Barang</h3>
                             <a href="<?= base_url('barang/add_barang') ?>" class="btn btn-primary btn-sm float-right" data-toggle="modal" data-target="#form_barang"> Tambah Barang </a>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <?= $this->session->flashdata('message'); ?>
                            <table id="datatable1" class="table table-bordered" >
                                <thead>
                                    <tr>
                                        <th style="width: 10px">NO</th>
                                        <th>Kode Barang</th>
                                        <th>Nama Barang</th>
                                        <th>Merek</th>
                                        <th>Kondisi Barang</th>
                                        <!-- <th>Unit</th> -->
                                        <th>Tempat Penyimpanan</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                        <th>Konfirmasi</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php 
                                    $no = 1;
                                    foreach ($barang as $row) { ?>
                                        <tr>
                                            <td><?= $no++ ?></td>
                                            <td><?= $row->kode_barang ?></td>
                                            <td><?= $row->nama_barang ?></td>
                                            <td><?= $row->merk ?></td>
                                            <td><?= $row->kondisi_barang ?></td>
                                            <!-- <td><?= $row->unit ?></td> -->
                                            <td><?= $row->storage ?></td>
                                            <td><?php if ($row->status_barang == '0')
                                                    {
                                                        echo '<span class="badge badge-success"> -== Tersedia ==- </span>';
                                                    }else {
                                                        echo '<span class="badge badge-warning"> -== Dipinjam ==- </span>';
                                                    }
                                                ?>
                                            </td>
                                            <td>
                                                <a class="btn btn-success btn-sm" href="<?= base_url('barang/detail_barang/'. $row->no_barang) ?>">
                                                    <i class="fas fa-eye"></i>
                                                        Edit
                                                </a>
                                                <a class="btn btn-danger btn-sm" onclick="return confirm('Yakin ingin dihapus?');" href="<?= base_url('barang/delete_barang/'. $row->id_barang) ?>" >
                                                    <i class="fas fa-trash"></i>
                                                        Hapus
                                                </a>
                                            </td>
                                            <td>
                                                <a class="btn btn-success btn-sm" href="<?= base_url('barang/pinjam_barang/'. $row->no_barang) ?>">
                                                    <i class="fas fa-handshake"></i>
                                                        Pinjam
                                                </a>
                                                <a class="btn btn-warning btn-sm" href="<?= base_url('barang/kembali_barang/'. $row->no_barang) ?>">
                                                    <i class="fas fa-handshake"></i>
                                                        Kembalikan
                                                </a>
                                            </td>
                                        </tr>
                                    <?php } ?>
                                </tbody>    
                            </table>
                        </div>
                    </div><!-- /.card -->
                </div>
            </div>
        </div>
        <!-- =======================Tambah Barang=============================== -->

        <div class="modal fade" id="form_barang">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Form Tambah Barang</h5>
                        <button class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="<?= base_url('barang/save_barang') ?>" method="POST" enctype="multipart/form-data">
                            <div class="form-group">
                                <label> Kode Barang</label>
                                <input type="hidden" name="no_barang" value="<?= $no_barang ?>" class="form-control">
                                <input type="text" name="kode_barang" class="form-control">
                            </div>
                            <div class="form-group">
                                <label> Nama Barang</label>
                                <input type="text" name="nama_barang" class="form-control">
                                <br>
                            </div>
                            <div class="form-group">
                                <label> Merek</label>
                                <input type="text" name="merk" class="form-control">
                                <br>
                            </div>
                            <div class="form-group">
                                <label> No Seri</label>
                                <input type="text" name="no_seri" class="form-control">
                                <br>
                            </div>
                            <!-- <div class="form-group">
                                <label> Unit</label>
                                <input type="number" name="unit" class="form-control">
                                <br>
                            </div> -->
                            <div class="form-group">
                                <label> Storage</label>
                                <input type="text" name="storage" class="form-control">
                                <br>
                            </div>
                            <div class="form-group">
                                <label> Kondisi</label>
                                <div class="input-group mb-3">
                                    <select name="kondisi_barang" class="form-control">
                                        <option value="">-- Kondisi Barang --</option>
                                        <option value="baik">Baik</option>
                                        <option value="cukup baik">Kurang Baik</option>
                                    </select>
                                </div>
                            </div>
                            <!-- <div class="form-group">
                                <label> Gambar</label>
                                <input type="file" name="gambar_barang">
                            </div> -->
                            <button type="submit" class="btn btn-primary btn-sm"> Save </button>
                            <button type="reset" class="btn btn-danger btn-sm"> Reset </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>