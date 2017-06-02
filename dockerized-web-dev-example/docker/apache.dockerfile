FROM httpd:2.4

RUN sed -i 's|#LoadModule rewrite_module|LoadModule rewrite_module|' /usr/local/apache2/conf/httpd.conf && \
    sed -i 's|#LoadModule proxy_module|LoadModule proxy_module|' /usr/local/apache2/conf/httpd.conf && \
    sed -i 's|#LoadModule proxy_fcgi_module|LoadModule proxy_fcgi_module|' /usr/local/apache2/conf/httpd.conf && \
    sed -i 's|#Include conf/extra/httpd-vhosts.conf|Include conf/extra/httpd-vhosts.conf|' /usr/local/apache2/conf/httpd.conf

RUN echo '' > /usr/local/apache2/conf/extra/httpd-vhosts.conf

ENV APACHE_LOG_DIR=/usr/local/apache2/logs

RUN apachectl restart