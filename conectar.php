<?php 
header('Access-Control-Allow-Origin: *');
header('Content-type: application/json');
$user = '';
$passwd = '';
$db = '';
$port = ;
$host = '';

$table = 'general.usu_usuarios';

$strCnx = "host=$host port=$port dbname=$db user=$user password=$passwd";
$cnx = pg_connect($strCnx) or die ("Error de conexion. ". pg_last_error());

	$sql = "select extract(year from rev_fechahora) || to_char(extract(month from rev_fechahora), '09') mes, count(*) eventos
			from general.rev_registroseventos
			where rev_fechahora between '01-01-2015' and '02-25-2016'
			group by mes
			order by mes";
	$re = pg_query( $cnx, $sql  );
	$num = pg_affected_rows($re);
	echo $num;
	$datos = array();
	if ( $num  > 0) {
		while ( $row = pg_fetch_array($re) ) {
			$mes = $row['mes'];
			$eventos = $row['eventos'];
			$datos[] = array('mes' => $mes, 'eventos' => $eventos );
		}
			header("Content-Type: application/json", true);
			$json_string = json_encode( $datos );
			echo $json_string;
			
			/*$file = 'graficas.json';
			file_put_contents($file, $json_string);*/

	} else {
		echo "No hay registros";
	}

/*
if( isset( $_POST[ "get_member" ] ) )
   {

      $member_id = $_POST[ "get_member" ];
      $query = "select extract(year from rev_fechahora) || to_char(extract(month from rev_fechahora), '09') mes, count(*) eventos
			from general.rev_registroseventos
			where rev_fechahora between '01-01-2015' and '02-25-2016'
			group by mes
			order by mes";
      $result = pg_query( $cnx, $query );

      $row = pg_fetch_array( $result );

      $mes = $row["mes"];
      $eventos = $row["eventos"];
     
      $arr = array( "mes" => $mes, "datos" => $eventos );
      header("Content-Type: application/json", true);
      echo json_encode( $arr );

   }*/

 ?>