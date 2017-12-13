# yum install git 
# git clone https://github.com/simpl/ngx_devel_kit.git
# git clone https://github.com/chaoslawful/lua-nginx-module.git
# git clone https://github.com/agentzh/redis2-nginx-module.git
# git clone https://github.com/agentzh/set-misc-nginx-module.git
# git clone https://github.com/agentzh/echo-nginx-module.git
# git clone https://github.com/catap/ngx_http_upstream_keepalive.git
# git clone https://github.com/openresty/lua-resty-redis.git
# git clone https://github.com/chaoslawful/lua-nginx-module.git
# wget http://nginx.org/download/nginx-1.12.2.tar.gz
# tar -xf nginx-1.12.2.tar.gz
# cd nginx-1.12.2


./configure --prefix=/opt/nginx --with-debug --with-http_addition_module \
--with-http_dav_module --with-http_flv_module \
--with-http_gzip_static_module --with-http_image_filter_module --with-http_perl_module \
--with-http_random_index_module --with-http_realip_module --with-http_secure_link_module \
--with-http_stub_status_module --with-http_ssl_module --with-http_sub_module \
--conf-path=/opt/nginx/conf/nginx.conf \
--error-log-path=/opt/nginx/logs/error.log  \
--http-log-path=/opt/nginx/logs/access.log  \
--pid-path=/opt/nginx/nginx.pid \
--lock-path=/opt/nginx/nginx.lock \
--user=nginx --group=nginx \
--with-mail --with-mail_ssl_module \
--add-module=../ngx_devel_kit-0.2.19 \
--add-module=../lua-nginx-module
