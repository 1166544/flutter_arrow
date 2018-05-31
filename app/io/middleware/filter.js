'use strict';

/**
 * 过滤器
 */
module.exports = () => {
  return async (ctx, next) => {
    
    // 输出当前包信息
    console.log('the package is:', ctx.packet);
    
    // 从服务层拿信息
    const say = await ctx.service.user.say();

    // 向客户端发送数据
    ctx.socket.emit('res', 'packet!' + say);
    
    // 执行下一条信息
    await next();

    console.log('packet response!');
  };
};