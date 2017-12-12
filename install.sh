#!/bin/bash

#cd /usr/local/src

#LuaJIT 2.1编译器，提供了静态编译优化和动态编译优化
#wget http://luajit.org/download/LuaJIT-2.1.0-beta2.tar.gz
tar zxf package/LuaJIT-2.1.0-beta2.tar.gz
cd LuaJIT-2.1.0-beta2
make install PREFIX=/usr/local/luajit

export LUAJIT_LIB=/usr/local/luajit/lib
export LUAJIT_INC=/usr/local/luajit/include/luajit-2.1


#下载ngx_devel_kit（NDK）模块,不需要安装
#wget https://github.com/simpl/ngx_devel_kit/archive/v0.2.19.tar.gz
tar -xzvf package/v0.2.19.tar.gz


#载最新的lua-nginx-module 模块,不需要安装
#wget https://github.com/openresty/lua-nginx-module/archive/v0.10.2.tar.gz
tar -xzvf package/v0.10.2.tar.gz

#编译安装nginx，并添加进相应的模块
#wget -c http://nginx.org/download/nginx-1.4.2.tar.gz
tar xzvf package/nginx-1.4.2.tar.gz
cd nginx-1.4.2
./configure --add-module=../ngx_devel_kit-0.2.19/ --add-module=../lua-nginx-module-0.8.6/

make
make install


echo "export PATH=$PATH:/usr/local/nginx/sbin" >> /etc/profile
source /etc/profile

#编译安装出错了可能需安装如下组件
#yum -y install pcre-devel
#yum -y install openssl openssl-devel


#验证方法1
#ldd  nginx | grep lua

#如访问”libluajit-5.1.so.2 => /usr/local/luajit/lib/libluajit-5.1.so.2“则说明安装成功


#验证方法2
#在/usr/local/nginx/conf/nginx.conf中加入如下代码：
#	location /hello_lua { 
#	      default_type 'text/plain'; 
#	      content_by_lua 'ngx.say("hello, lua")'; 
#	}

#service nginx restart

#curl localhost/hello_lua




#参考资料
#http://blog.csdn.net/qinyushuang/article/details/43950497
#http://blog.csdn.net/qq_25551295/article/details/51744815
