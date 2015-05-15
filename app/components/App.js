'use strict';

var React = require('react');
var Clock = require('./Clock');

var App = React.createClass({
  render() {
    return (
      <div>
        <Clock />
      </div>
    );
  }
});

module.exports = App;
