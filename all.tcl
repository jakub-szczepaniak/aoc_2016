package require tcltest

proc tcltest::cleanupTestsHook {} {
	variable numTests
	set ::exitCode [expr {$numTests(Failed) > 0}]
}

tcltest::configure -testdir [file dirname [file normalize [info script]]]

tcltest::runAllTests

exit $::exitCode