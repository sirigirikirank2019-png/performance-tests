#!/bin/bash
set -e

JMETER_HOME=/opt/apache-jmeter
TEST_PLAN=tests/sample_test.jmx
RESULTS_DIR=results
INFLUX_DB_URL=http://localhost:8086/write?db=jmeter

mkdir -p $RESULTS_DIR

echo "Running JMeter test plan..."
$JMETER_HOME/bin/jmeter -n -t $TEST_PLAN -l $RESULTS_DIR/result.jtl \
  -e -o $RESULTS_DIR/report \
  -JinfluxdbUrl=$INFLUX_DB_URL

echo "Test completed. Reports available in $RESULTS_DIR/report"
