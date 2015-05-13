var should = require('chai').should();
var time = require('../app/utils/time');
var moment = require('moment');

describe('time', function () {
  it('returns the current time', function () {
    time.currentTime().should.equal(moment().format('HH:mm:ss'));
  });

  it('returns padded digit', function () {
    time.padDigit(5).should.equal('0005');
  });

  it('converts a number to binary array', function () {
    time.toBinaryArray(12) === [ '0001', '0002' ];
  });

});
