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
	set new_position [add $position $new_direction]
	set result [dict create position $new_position face $new_direction]
	return $result
}

proc complex { real imaginary} {
	return [list $real $imaginary]
}

proc multiply { first second} {
	lassign $first x1 y1
	lassign $second	x2 y2
	return [complex \
		[expr ($x1*$x2) - ($y1*$y2)] \
		[expr ($x1*$y2) + ($x2*$y1)]]
}
proc add { first second} {
	lassign $first x1 y1
	lassign $second x2 y2
	return [complex \
		[expr $x1+$x2] \
		[expr $y1+$y2]]
}
