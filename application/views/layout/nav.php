<?php _//print_r($this->session->userdata('_MENU_'));  ?>

<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

      <ul class="sidebar-menu" data-widget="tree">
        <?php 

        foreach ($this->session->userdata('_MENU_') as $value) {
          $menu=explode(':', $value);
            $ruta=base_url().$menu[4];
            $id_menu=$menu[0];
            if ($menu[6]==1) $clase="treeview"; else $clase=""; 
            if ($menu[1]==0) {
              echo '
                <li class="'.$clase.'">
                  <a href="'.$ruta.'">
                    <i class="'.$menu[3].'"></i>
                    <span>'.$menu[2].'</span>
                  </a>
              ';
              if ($menu[6]==1) {
                echo '<ul class="treeview-menu">';
                foreach ($this->session->userdata('_MENU_') as $key) {
                  $submenu=explode(':', $key);
                  $subruta=base_url().$submenu[4];
                  if ($submenu[1]==$id_menu) {
                    echo '<li><a href="'.$subruta.'"><i class="'.$submenu[3].'"></i>'.$submenu[2].'</a></li>';
                  }
                }
                echo '</ul>';
              }
              
              echo '
                </li>
              ';
            }
            
        } ?>
        
        
      </ul>
    </section>
    <!-- /.sidebar   -->
  </aside>
<?php  ?>
