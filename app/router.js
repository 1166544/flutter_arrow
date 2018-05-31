'use strict';

/**
 * router对特定的 socket 连接不同的事件进行分发处理到对应的控制器
 * @param {*} app 
 */
module.exports = app => {
  // 默认消息处理 app.io.of('/')
  app.io.route('chat', app.io.controller.chat.ping);

  // 消息转发处理 app.io.of('/chat')
  app.io.of('/chat').route('chat', app.io.controller.chat.ping);

  // 断开连接处理 app.io.of('/disconnect')
  app.io.route('disconnect', app.io.controller.chat.disconnect);
};
