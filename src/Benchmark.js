'use strict';

exports['_benchmark\''] = function(warmupCount_) {
  return function(runCount_) {
    return function(prepare_) {
      return function(action_) {
        return function() {
          var warmupCount = warmupCount_;
          var runCount = runCount_;
          var prepare = prepare_;
          var action = action_;
          var benchmark = [];
          for (var i = 0; i < warmupCount; ++i) {
            var value = prepare(i)();
            action(value)();
          }
          for (var i = 0; i < runCount; ++i) {
            var value = prepare(i)();
            var before = process.hrtime();
            action(value)();
            var after = process.hrtime();
            benchmark.push((after[0] * 1e6 + after[1] / 1e3) - (before[0] * 1e6 + before[1] / 1e3));
          }
          return benchmark;
        };
      };
    };
  };
};
