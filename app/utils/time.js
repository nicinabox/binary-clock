var _ = require('lodash');
var moment = require('moment');

var now = () => {
  return moment().format('HH:mm:ss');
};

var _state = {
  padding: 4,
  time: '',
  timeOfDay: '',
};

var time = {
  currentTime() {
    return now();
  },

  padDigit(number) {
    return String("000000" + number).slice(-_state.padding);
  },

  toBinaryArray(number) {
    var digits;

    if (_state.padding === 4) {
      digits = ('' + number).split('');
    } else {
      digits = [number];
    }

    return _.map(digits, (i) => this.padDigit(+i).toString(2));
  },

  timeOfDay() {
    var hour = moment().format('HH');

    if (hour < 5) {
      return 'midnight';
    } else if (hour < 12) {
      return 'morning';
    } else if (hour < 17) {
      return 'afternoon';
    } else if (hour < 20) {
      return 'evening';
    } else if (hour < 23) {
      return 'night';
    }
  }
};

module.exports = time;
