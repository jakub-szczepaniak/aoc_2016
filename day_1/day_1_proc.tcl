proc to_be_tested {} {
	return true
}

proc move { location direction} {
	lassign [split $direction ""] vector _
	
	if {$vector == {R}} {
		set result [dict create x 0 y 0 face E]
	} else {
		set result [dict create x 0 y 0 face W]		
	}

	return $result
}