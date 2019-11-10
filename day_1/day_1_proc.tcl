proc to_be_tested {} {
	return true
}

proc move { position direction directive} {
	lassign [split $directive ""] vector _
	
	if {$vector == {R}} {
		set result [dict create x 0 y 0 face E]
	} else {
		set result [dict create x 0 y 0 face W]		
	}

	return $result
}