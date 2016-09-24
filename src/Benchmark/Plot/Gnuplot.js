'use strict';

exports._gnuplot = function(benchmarks) {
  var script = 'plot ';
  for (var i = 0; i < benchmarks.length; ++i) {
    if (i !== 0) {
      script += ', ';
    }
    script += '"-" using 1:2 with points title "' + benchmarks[i].title + '"';
  }
  script += '\n';
  for (var i = 0; i < benchmarks.length; ++i) {
    for (var j = 0; j < benchmarks[i].benchmark.length; ++j) {
      script += j + ' ' + benchmarks[i].benchmark[j] + '\n';
    }
    script += 'EOF\n';
  }
  return script;
};
