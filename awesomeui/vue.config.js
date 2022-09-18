const { defineConfig } = require('@vue/cli-service')
module.exports = defineConfig({
  transpileDependencies: true,
  //关闭eslint检查
  lintOnSave: false,
  devServer: {
    //自动打开页面
    open: true,
    host: '127.0.0.1',
    port: 80,
    hot: true,
    proxy: {
      '/api': {
        target: 'http://127.0.0.1:8080',
        ws: true,
        changeOrigin: true,
        pathRewrite: {
          '^/api': ''
        }
      }
    }

  }
})
