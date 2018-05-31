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

    /**
     * 处理消息转发逻辑
     */
    async ping() {
      const message = this.ctx.args[0];
      
      console.log(`处理进程: ${process.pid}  收到客户端消息: ${message}`);
      await this.ctx.socket.emit('res', `你好，服务器已收到消息: ${message}`);
    }

    /**
     * 断开连接处理
     */
    async disconnect() {
      const message = this.ctx.args[0];
      console.log('断开连接:: ', `处理进程: ${process.pid}`, message);
    }

  }

  return Controller;
};
