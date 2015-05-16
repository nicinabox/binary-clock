'use strict';

var React = require('react');
var settings = require('../utils/settings');

var Settings = React.createClass({
  getInitialState() {
    return {
      settings: settings.getState(),
      visible: false,
    };
  },

  componentWillMount() {
    window.addEventListener('keyup', this._handleKeyPress);
  },

  componentWillUnmount() {
    window.removeEventListener('keyup', this._handleKeyPress);
  },

  _handleKeyPress(e) {
    // Esc key
    if (e.keyCode === 27) {
      this.setState({
        visible: !this.state.visible
      });
    }
  },

  _handleChangeSetting(name) {
    settings.toggleSetting(name);
    this.setState({
      settings: settings.getState()
    });
  },

  render() {
    var keys = Object.keys(this.state.settings);

    return (
      <div>
        {this.state.visible && (
          <div className="settings">
            <form>
              {keys.map((k, i) => {
                return (
                  <div key={i} className="form-group">
                    <label>
                      <input
                        type="checkbox"
                        checked={this.state.settings[k]}
                        value={this.state.settings[k]}
                        onChange={this._handleChangeSetting.bind(this, k)} />
                      {settings.lang[k]}
                    </label>
                  </div>
                );
              })}
            </form>
          </div>
        )}
      </div>
    );
  }

});

module.exports = Settings;
