#!/bin/bash
JMETER_HOME = 'C:\\Users\\sreek\\OneDrive\\Desktop\\Softwares\\apache-jmeter-5.6.3\\apache-jmeter-5.6.3'
TEST_PLAN=tests/SimplePipelineTest.jmx
RESULTS_DIR=results
INFLUXDB_URL=http://localhost:8086/write?db=jmeter

mkdir -p $RESULTS_DIR
$JMETER_HOME/bin/jmeter -n -t $TEST_PLAN -l $RESULTS_DIR/result.jtl \
  -e -o $RESULTS_DIR/report \
  -JinfluxdbUrl=$INFLUXDB_URL
