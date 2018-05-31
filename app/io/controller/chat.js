'use strict';

module.exports = app => {

  class Controller extends app.Controller {

    async index() {

      // 获取SOCKET内容信息
      const message = this.ctx.args[0];

      // 输出当前处理用户ID
      console.log('chat :', message + ' : ' + process.pid);

      // 从服务拿信息
      const say = await this.ctx.service.user.say();

      // 向客户端发送信息
      this.ctx.socket.emit('res', say);
    }

  }

  return Controller;
};
