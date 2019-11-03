proc to_be_tested {} {
	return true
}

set puzzle_input_id [open day_1.input r]

gets $puzzle_input_id puzzle_input

set steps [split $puzzle_input ","]
foreach { step }  $steps  {
	puts  $step
}

close $puzzle_input_id