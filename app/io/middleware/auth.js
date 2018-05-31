'use strict';

/**
 * 连接中间件
 */
module.exports = () => {

  return async (ctx, next) => {
    
    // 输出连接信息
    ctx.socket.emit('res', 'connected!');

    // 从服务层拿信息
    const say = await ctx.service.user.say();

    // 向客户端发送信息
    ctx.socket.emit('res', 'auth!' + say);
    
    // 处理下一条请求
    await next();

    // 关闭时输出提示
    console.log('disconnect!');
  };

};
