proc to_be_tested {} {
	return true
}

proc move { position direction directive} {
	lassign [split $directive ""] vector _
	
	if {$vector == {R}} {
		set result [dict create x 0 y 0 face E]
		set new_direction [dict create x 1 y 0]
	} else {
		set result [dict create x 0 y 0 face W]
		set new_direction [dict create x -1 y 0]		
	}

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
