var _ = require('lodash');
var React = require('react');
var time = require('../utils/time');

var Clock = React.createClass({
  getInitialState() {
    var currentTime = time.currentTime();

    return {
      currentTime: currentTime,
      timeOfDay: time.timeOfDay(),
      parts: time.timeParts(currentTime),
    };
  },

  componentDidMount() {
    this._timer = setInterval(() => {
      var currentTime = time.currentTime();

      this.setState({
        currentTime: currentTime,
        parts: time.timeParts(currentTime),
      });
    }, 1000);
  },

  componentWillUnmount() {
    clearInterval(this._timer);
  },

  _renderTimeDigit(segment, i) {
    return (
      <li key={i}>
        {segment.map((number, i) => {
          return (
            <span key={i} className={+number ? 'active' : ''}>
              {number}
            </span>
          );
        })}
      </li>
    );
  },

  _renderTimeSegment(time, i) {
    return (
      <div key={i} className="time-segment">
        <ul>
          {time.map(this._renderTimeDigit)}
        </ul>
      </div>
    );
  },

  render() {
    return (
      <div className="clock">
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

module.exports = Clock;
