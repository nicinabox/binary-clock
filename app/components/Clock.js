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

  _renderTimeSegment(segment, i) {
    return (
      <li key={i}>
        {segment.map((numbers, i) => {
          return <span key={i}>{numbers}</span>
        })}
      </li>
    );
  },

  _renderTime(time, i) {
    return (
      <div key={i} className="time-segment">
        <ul>
          {time.map(this._renderTimeSegment)}
        </ul>
      </div>
    );
  },

  render() {
    return (
      <div>
        <div className="clock">
          {this.state.parts.map(this._renderTime)}
        </div>

        <div className="time">
          {this.state.currentTime}
        </div>
      </div>
    );
  }

});

module.exports = Clock;
