<?php
function myurlencode($s) {
	$x = explode('/',$s);
	for($i=0;$i<count($x);$i++)
		$x[$i] = rawurlencode($x[$i]);
	return implode('/',$x);
}
?><!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Archivos de muestra</title>
</head>
  <?php
  $exts = array(
     'msi'=>'Instalador de Windows',
     'pdf'=>'Documento PDF',
     'png'=>'Imagen GIF',
     'png'=>'Imagen PNG',
     'jpg'=>'Imagen JPEG',
     'jpeg'=>'Imagen JPEG',
     'xml'=>'Archivo XML',
  );
  
  function getfilename($fn,&$ff) {
          global $exts;
          $n = strrpos($fn,'.');
          if(!$n) return;
          $ext = strtolower(substr($fn,$n+1));
#                  echo "\t$ext\n";
          if(isset($exts[$ext])) {
                  $nam = $exts[$ext];
                  if(!isset($ff[$nam]))
                          $ff[$nam] = array();
                  $ff[$nam][] = ltrim($fn,'./');
                  }
          }
  function recursedir($dir,&$ff) {
          $d =  scandir($dir);
          foreach($d as $fn) {
                  if(substr($fn,0,1)=='.')
                          continue;
                  $dfn = "$dir/$fn";
#                  echo $dfn;
                  if(is_dir($fn))
        			      recursedir($dfn,$ff);
                  else
        			      getfilename($dfn,$ff);
                  }
          }

  $ff = array();
  recursedir('.',$ff);
  ksort($ff, SORT_FLAG_CASE);
  #print_r($ff);//*
  ?>
<body>
  <table>
    <?php
    $i = 0;
    foreach($ff as $nam=>$files) {
    ?>

    <tr>
      <th></th>
      <th>Nombre de archivo</th>
      <th>Tipo</th>
    </tr><?php
            foreach($files as $file) {
    ?>

    <tr>
      <td><?=++$i?></td>
      <td><a href="<?=myurlencode($file)?>"><?=$file?></a></td>
      <td><?=$nam?></td>
    </tr><?php
            }
    }
    ?>
  </table>
</body>
</html>
