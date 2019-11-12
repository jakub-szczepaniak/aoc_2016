proc to_be_tested {} {
	return true
}

proc move { position direction directive} {
	lassign [split $directive ""] vector length
	
	if {$vector == {R}} {
		set multiplier [complex 0 -1]	
	} else {
		set multiplier [complex 0 1]
	}
	set new_direction [multiply $direction $multiplier]
	set result [dict create x 0 y 0 face $new_direction]
	return $result
}

proc complex { real imaginary} {
	return [list $real $imaginary]
}

proc multiply { first second} {
	lassign $first x1 y1
	lassign $second	x2 y2
	set new_first [expr ($x1*$x2) - ($y1*$y2)]
	set new_second [expr $x1*$y2 + $x2*$y1]
	return [complex $new_first $new_second]
}
