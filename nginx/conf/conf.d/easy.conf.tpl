server {
    listen       80;
    server_name  easy-php.demo.io {{intranet}};

    #charset koi8-r;
    access_log  /var/log/nginx/easy-php.demo.io.access.log  main;

    location / {        
        root   /mnt/www/easy/public;
        index  index.html index.htm index.php;
        try_files $uri $uri/ /index.php$is_args$args;
    }

    #error_page  404              /404.html;

    # redirect server error pages to the static page /50x.html
    #
    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }

    # proxy the PHP scripts to Apache listening on 127.0.0.1:80
    #
    #location ~ \.php$ {
    #    proxy_pass   http://127.0.0.1;
    #}

    # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
    #
    location ~ \.php$ {
       root           /mnt/www/easy/public;
       fastcgi_pass   {{intranet}}:9000;
       fastcgi_index  index.php;
       fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;
       fastcgi_param  PHP_VALUE "auto_prepend_file=/mnt/www/xhgui-branch/external/header.php";
       include        fastcgi_params;
    }

    # deny access to .htaccess files, if Apache's document root
    # concurs with nginx's one
    #
    #location ~ /\.ht {
    #    deny  all;
    #}
}