<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-danger elevation-4">
  <!-- Brand Logo -->
  <a href="<?= base_url('dashboard')?>" class="brand-link">
    <img src="<?= base_url()?>assets/back/dist/img/logodashboard.png" alt="MSK Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
    <span class="brand-text font-weight-light"><B>MS K<small>emakmuran</small></B>
    </span>
  </a>

  <!-- Sidebar -->
  <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="<?= base_url()?>assets/back/dist/img/user6-128x128.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="<?= base_url('dashboard')?>" class="d-block"><?php echo $this->session->userdata("username");?></a>
        </div>
      </div>
      
      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class with font-awesome or any other icon font library -->
          <li class="nav-item">
            <a href="<?= base_url('dashboard')?>" class="nav-link active">
              <i class="nav-icon fas fa-home"></i>
              <p>
                <small>BERANDA<small>
                <i class="nav-item"></i>
              </p>
            </a>
          </li>

<!-- ====================================PANEL ADMIN==========================================           -->
          <?php if(is_it()) { ?>
            <li class="nav-header">MAIN MENU</li>
              <li class="nav-item">
                <a href="#" class="nav-link">
                <i class="nav-icon fas fa-table"></i>
                <p>
                  Master Karyawan
                  <i class="fas fa-angle-left right"></i>
                </p>
              </a>
              <ul class="nav nav-treeview">
                <li class="nav-item">
                  <a href="<?= base_url('dealer') ?>" class="nav-link">
                    <i class="far fa-circle nav-icon"></i>
                    <p>Data Dealer</p>
                  </a>
                </li>
                <li class="nav-item">
                  <a href="<?= base_url('jabatan') ?>" class="nav-link">
                    <i class="far fa-circle nav-icon"></i>
                    <p>Data Jabatan</p>
                  </a>
                </li>
                <li class="nav-item">
                  <a href="<?= base_url('divisi') ?>" class="nav-link">
                    <i class="far fa-circle nav-icon"></i>
                    <p>Data Departement</p>
                  </a>
                </li>
                <li class="nav-item">
                  <a href="<?= base_url()?>karyawan" class="nav-link">
                    <i class="far fa-circle nav-icon"></i>
                    <p>Data Karyawan</p>
                  </a>
                </li>
              </ul>
            </li>
            <!-- =====================Barang========================== -->
            <li class="nav-item">
                <a href="#" class="nav-link">
                <i class="nav-icon fas fa-box"></i>
                <p>
                  Master Barang
                  <i class="fas fa-angle-left right"></i>
                </p>
              </a>
              <ul class="nav nav-treeview">
                <li class="nav-item">
                  <a href="<?= base_url('barang') ?>" class="nav-link">
                    <i class="far fa-circle nav-icon"></i>
                    <p>Data Barang</p>
                  </a>
                </li>
              </ul>
            </li>

          <?php } else { ?>

          <?php } ?>
<!-- ====================================END OF PANEL ADMIN==========================================           -->
          <?php if(is_it()) { ?>
            <li class="nav-item">
              <a href="#" class="nav-link">
                <i class="nav-icon fas far fa-copy"></i>
                <p>
                  Master Tiket
                  <i class="right fas fa-angle-left"></i>
                </p>
              </a>
              <ul class="nav nav-treeview">
                <li class="nav-item">
                  <a href="<?= base_url('tiket')?>" class="nav-link">
                    <i class="nav-icon far fa-circle text-danger"></i>
                    <p>Data Tiket</p>

                  </a>
                </li>
                <li class="nav-item">
                  <a href="<?= base_url('laporan')?>" class="nav-link">
                    <i class="nav-icon far fa-copy"></i>
                    <p>Laporan</p>
                  </a>
                </li>
              </ul>
            </li>
            <li class="nav-header">PROFILE</li>
            <li class="nav-item">
              <a href="#" class="nav-link">
                <i class="nav-icon fas fa-user"></i>
                <p>
                  User
                  <i class="fas fa-angle-left right"></i>
                </p>
              </a>
              <ul class="nav nav-treeview">
                <li class="nav-item">
                  <a href="<?= base_url('karyawan/profile/' .$this->session->id_user) ; ?>" class="nav-link">
                    <i class="far fa-circle nav-icon"></i>
                    <p>Profile User</p>
                  </a>
                </li>
              </ul>
            </li>
            <li class="nav-item">
              <a href="<?= base_url('auth/logout') ?>" class="nav-link">
                <i class="nav-icon far fa-circle text-danger"></i>
                <p class="text">Keluar</p>
              </a>
            </li>
          <?php } else { ?>
                        <li class="nav-item">
              <a href="#" class="nav-link">
                <i class="nav-icon fas far fa-copy"></i>
                <p>
                  Master Tiket
                  <i class="right fas fa-angle-left"></i>
                </p>
              </a>
              <ul class="nav nav-treeview">
                <li class="nav-item">
                  <a href="<?= base_url('tiket')?>" class="nav-link">
                    <i class="nav-icon far fa-circle text-danger"></i>
                    <p>Data Tiket</p>

                  </a>
                </li>
              </ul>
            </li>
            <li class="nav-header">PROFILE</li>
            <li class="nav-item">
              <a href="#" class="nav-link">
                <i class="nav-icon fas fa-user"></i>
                <p>
                  User
                  <i class="fas fa-angle-left right"></i>
                </p>
              </a>
              <ul class="nav nav-treeview">
                <li class="nav-item">
                  <a href="<?= base_url('karyawan/profile/' .$this->session->id_user) ; ?>" class="nav-link">
                    <i class="far fa-circle nav-icon"></i>
                    <p>Profile User</p>
                  </a>
                </li>
              </ul>
            </li>
            <li class="nav-item">
              <a href="<?= base_url('auth/logout') ?>" class="nav-link">
                <i class="nav-icon far fa-circle text-danger"></i>
                <p class="text">Keluar</p>
              </a>
            </li>
          <?php } ?>
          <p>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>