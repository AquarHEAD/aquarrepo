<?php
/*
Plugin Name: TeaWhen Random Tagline
Plugin URI: http://dev.teawhen.com
Description: A plugin to random Tagline display.
Version: 0.0.1
Author: AquarHEAD
Author URI: http://www.aquarhead.com
License: GPL2
*/

function teawhen_random_tagline( $result='', $show='' ) {
	if ( $show == 'description' ) {
		$taglines = array("魂魄夜夜归来，使人听闻，我不曾离开", "我在天堂的墓地 望着你 忘着你");
		$result = $taglines[array_rand($taglines)];
	}
	return $result;
}

add_filter('bloginfo', 'teawhen_random_tagline', 1, 2);
?>