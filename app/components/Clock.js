'use strict';

var React = require('react');
var time = require('../utils/time');

var Clock = React.createClass({
  getInitialState() {
    var currentTime = time.currentTime();

    return {
      currentTime: currentTime,
      timeOfDay: time.timeOfDay(),
      parts: time.timeParts(currentTime),
      dotSize: this._calcDotSize(),
    };
  },

  componentWillMount() {
    window.onresize = () => {
      this.setState({
        dotSize: this._calcDotSize()
      });
    };
  },

  componentDidMount() {
    this._timer = setInterval(() => {
      var currentTime = time.currentTime();

      this.setState({
        currentTime: currentTime,
        timeOfDay: time.timeOfDay(),
        parts: time.timeParts(currentTime),
      });
    }, 1000);
  },

  componentWillUnmount() {
    clearInterval(this._timer);
  },

  _calcDotSize() {
    var windowHeight = window.innerHeight;
    var windowWidth = window.innerWidth;

    var maxWidth = windowWidth / 6,
        maxHeight = windowHeight / 4,
        SCALE = 0.8;

    if (maxWidth * 4 > windowHeight) {
      maxHeight = windowHeight / 4;
      return maxHeight * SCALE;
    } else {
      return maxWidth * SCALE;
    }
  },

  _renderTimeDigit(segment, i) {
    return (
      <li key={i}>
        {segment.map((number, _i) => {
          return (
            <span key={_i}
              style={styles.dot(this.state.dotSize)}
              className={+number ? 'active' : ''}></span>
          );
        })}
      </li>
    );
  },

  _renderTimeSegment(_time, i) {
    return (
      <div key={i} className="time-segment">
        <ul>
          {_time.map(this._renderTimeDigit)}
        </ul>
      </div>
    );
  },

  render() {
    var classNames = ['clock', this.state.timeOfDay].join(' ');

    return (
      <div ref="clock" className={classNames}>
        <div className="clock-container">
          {this.state.parts.map(this._renderTimeSegment)}
        </div>

        <div className="time">
          {this.state.currentTime}
        </div>
      </div>
    );
  }
});

var styles = {
  dot: (size) => {
    return {
      width: size,
      height: size,
      marginTop: size * 0.1,
      marginBottom: size * 0.1,
    }
  }
};

module.exports = Clock;
