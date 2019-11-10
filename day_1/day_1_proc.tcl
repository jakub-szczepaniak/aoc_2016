proc to_be_tested {} {
	return true
}

proc move { location direction} {
	array set current $location
	if {$current(face) eq N} {
		return E
	}
}