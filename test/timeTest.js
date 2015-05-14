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
    time.toBinaryArray(12).should.eql([ '0001', '0010' ]);
  });

  it('creates a matrix of current time', function () {
    var m = moment();
    m.hours(9);
    m.minutes(21);
    m.seconds(48);
    var arr = [
      [ [ '0', '0', '0', '0' ], [ '1', '0', '0', '1' ] ],
      [ [ '0', '0', '1', '0' ], [ '0', '0', '0', '1' ] ],
      [ [ '0', '1', '0', '0' ], [ '1', '0', '0', '0' ] ]
    ];

    var parts = time.timeParts(m.format('HH:mm:ss'))
    parts.should.eql(arr);
  })
});
