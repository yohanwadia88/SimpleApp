const chai = require('chai')
const chaiHttp = require('chai-http')
const server = require('../src/app.js')

chai.should()
chai.use(chaiHttp)

describe('Main Landing Page', () => {
  it('should list / GET', function(done) {
    chai.request(server)
      .get('/')
      .end(function(err, res){
        res.should.have.status(200);
        done();
      });
  });
})

describe('Sharks Landing Page', () => {
  it('should list /sharks GET', function(done) {
    chai.request(server)
      .get('/sharks')
      .end(function(err, res){
        res.should.have.status(200);
        done();
      });
  });
})

describe('Contact Us Landing Page', () => {
  it('should list /contactus GET', function(done) {
    chai.request(server)
      .get('/contactus')
      .end(function(err, res){
        res.should.have.status(404);
        done();
      });
  });
})

