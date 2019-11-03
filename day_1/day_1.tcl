proc to_be_tested {} {
	return true
}

set puzzle_input_id [open day_1.input r]

gets $puzzle_input_id puzzle_input

set current_x 0
set current_y 0
set current_face N



set steps [split $puzzle_input ","]
foreach { step }  $steps  {
	lassign [split [string trim $step] ""] turn steps
	puts  "turn $turn and go $steps steps"
	
}

close $puzzle_input_id