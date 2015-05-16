var _state = {
  showTime: true,
  useMutedColors: false,
};

var settings = {
  lang: {
    showTime: 'Show time',
    useMutedColors: 'Use muted colors',
  },

  toggleSetting(key) {
    _state[key] = !_state[key];
  },

  getState() {
    return _state;
  }
};

module.exports = settings;
