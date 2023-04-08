<?php

$curl = curl_init();
$data = json_decode( file_get_contents( 'php://input' ), true );

$base_url = $data['base_url'];
$params   = $data['params'];
$body     = $data['body'];
$headers  = $data['headers'];
$method   = $data['method'];

if ( ! empty( $params ) ) {
	$base_url .= '?' . http_build_query( $params );
}
if ( ! empty( $headers ) ) {
	$headers = array_map(
		function( $key, $value ) {
			return $key . ': ' . $value;
		},
		array_keys( $headers ),
		$headers
	);

}
curl_setopt_array(
	$curl,
	array(
		CURLOPT_URL            => $base_url,
		CURLOPT_RETURNTRANSFER => true,
		CURLOPT_ENCODING       => '',
		CURLOPT_MAXREDIRS      => 10,
		CURLOPT_TIMEOUT        => 0,
		CURLOPT_FOLLOWLOCATION => true,
		CURLOPT_HTTP_VERSION   => CURL_HTTP_VERSION_1_1,
		CURLOPT_CUSTOMREQUEST  => $method,
		CURLOPT_POSTFIELDS     => $body,
		CURLOPT_HTTPHEADER     => $headers,

	)
);


$response = curl_exec( $curl );
$info     = curl_getinfo( $curl );

curl_close( $curl );

$result = array(
	'response' => $response,
	'info'     => $info,
);
echo json_encode( $result );
