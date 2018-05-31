'use strict';

// or http://127.0.0.1:7001/chat
const socket = require('socket.io-client')('http://127.0.0.1:7001');

socket.on('connect', (e) => {
  console.log('连接成功 ', e);

  const chatStr = 'hello world!';
  console.log('发送消息', chatStr);
  socket.emit('chat', chatStr);
});

socket.on('res', msg => {
  console.log('res from server: %s!', msg);
});
