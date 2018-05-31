'use strict';

/**
 * 权限控制器
 */
module.exports = () => {

  return async (ctx, next) => {
    
    // 从服务层拿信息
    const say = await ctx.service.user.say();

    // 向客户端发送信息
    ctx.socket.emit('res', 'auth!' + say);
    
    // 处理下一条请求
    await next();

    // 关闭输出提示
    console.log('disconnect!');
  };

};
