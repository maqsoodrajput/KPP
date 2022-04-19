#!/bin/sh

########################################################################
### CI tests for github.com/KineticPreProcessor/KPP                  ###
### NOTE: This script runs CI-tests manually (for testing/debugging) ###
########################################################################

# List of tests (add more as necessary; separate each with a space)
all_tests="radau90 rk rktlm ros rosadj rosenbrock90 rostlm saprc2006 sd sdadj small_f90"

# Run each test
# Check status of each individual operation and exit if any do not complete
for this_test in $all_tests; do

    cd ../ci-tests/$this_test
    [ $? -ne 0 ] && exit 1

    echo ""
    echo ">>>>>>>> Making clean for $this_test <<<<<<<<"
    echo ""
    make -f Makefile_$this_test distclean

    # Also remove other output files from the tests
    rm -f *.m

    cd ..

done

# Return w/ success
exit 0