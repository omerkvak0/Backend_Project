<!DOCTYPE html>
<html lang="en">
<head>
  <?php $this->load->view("includes/header");?>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

  <!-- Navbar -->
      <?php $this->load->view("includes/navbar"); ?>
  <!-- /.navbar -->
  
  <!-- Sidebar Container -->
  <?php $this->load->view("includes/sidebar");?>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <div class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1 class="m-0">Ayarlar Tablosu</h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="#">Ana Sayfa</a></li>
                <li class="breadcrumb-item active">Ayarlar Tablosu</li>
              </ol>
            </div><!-- /.col -->
          </div><!-- /.row -->
        </div><!-- /.container-fluid -->
      </div>
      <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            
            <div class="card">
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th>ID</th>
                    <th>Şirket İsmi</th>
                    <th>Adres</th>
                    <th>Hakkında</th>
                    <th>Slogan</th>
                    <th>Misyon</th>
                    <th>Vizyon</th>
                    <th>Resim URL</th>
                    <th>Mobil Resim URL</th>
                    <th>Favicon</th>
                    <th>Telefon(1)</th>
                    <th>Telefon(2)</th>
                    <th>E-Mail</th>
                    <th>Facebook</th>
                    <th>Twitter</th>
                    <th>Instagram</th>
                    <th>Linkedin</th>
                    <th>GSM(1)</th>
                    <th>GSM(2)</th>
                    <th>Oluşturma Tarihi</th>
                    <th>İşlemler</th>
                  </tr>
                  </thead>

                  <tbody>
                    <?php foreach ($items as $items) { ?>
                      <tr>
                        <td><?php echo $items->id; ?> </td>
                        <td><?php echo $items->company_name; ?></td>
                        <td><?php echo $items->address; ?></td>
                        <td><?php echo $items->about_us; ?></td>
                        <td><?php echo $items->slogan; ?></td>
                        <td><?php echo $items->mission; ?></td>
                        <td><?php echo $items->vision; ?> </td>
                        <td><?php echo $items->img_url; ?></td>
                        <td><?php echo $items->mobile_img_url; ?></td>
                        <td><?php echo $items->favicon; ?></td>
                        <td><?php echo $items->phone1; ?></td>
                        <td><?php echo $items->phone2; ?></td>
                        <td><?php echo $items->email; ?></td>
                        <td><?php echo $items->facebook; ?></td>
                        <td><?php echo $items->twitter; ?></td>
                        <td><?php echo $items->instagram; ?></td>
                        <td><?php echo $items->linkedin; ?></td>
                        <td><?php echo $items->gsm1; ?></td>
                        <td><?php echo $items->gsm2; ?></td>
                        <td><?php echo $items->created_at; ?></td>
                        <td>Sil - Düzenle </td>
                      </tr>

                    <?php } ?>
                  
                  </tbody>
                  
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </section>
    <!-- Main content -->

    </div>

<!-- Footer -->
<?php $this->load->view("includes/footer") ?>