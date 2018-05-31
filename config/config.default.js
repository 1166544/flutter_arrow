'use strict';

exports.io = {
  init: { test: 'test' }, // passed to engine.io
  namespace: {
    '/': {
      connectionMiddleware: [ 'auth' ],
      packetMiddleware: [ 'filter' ],
    },
    '/chat': {
      connectionMiddleware: [ 'auth' ],
      packetMiddleware: [],
    },
    // redis: {
    //   host: { redis server host },
    //   port: { redis server prot },
    //   auth_pass: { redis server password },
    //   db: 0,
    // }
  },
};

exports.keys = '123';
