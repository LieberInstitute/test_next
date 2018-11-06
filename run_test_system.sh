#!/bin/bash

## Clean up old files
rm test_flowchart.png test_report.html test_timeline.html trace.txt .nextflow.log
rm -fr .nextflow work

module load java/1.8.0
export _JAVA_OPTIONS="-Xms3g -Xmx5g"
nextflow main.nf -profile sge -with-report test_report.html -with-trace -with-timeline test_timeline.html -with-dag test_flowchart.png -w /dcl01/lieber/ajaffe/lab/test_next/test_w_option
