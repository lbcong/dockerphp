FROM amazonlinux:2018.03
MAINTAINER Duy Ton <duytt@tech.est-rouge.com>

RUN yum install -y httpd24 \
   mod24_ssl \
   php70 \
   php7-pear\
   php70-gd \
   php70-zip \
   php70-json \
   php70-xml \
   php70-imap \
   php70-mcrypt \
   php70-intl  \
   php70-mbstring \
   php70-mcrypt \
   php70-mysqlnd \
   php70-opcache \
   php70-pdo \
   php70-pecl-apcu \
   php70-pecl-xdebug\
   php70-pecl-imagick.x86_64 \
&& yum clean all

RUN curl -LsS http://codeception.com/codecept.phar -o /usr/local/bin/codecept && \
   chmod a+x /usr/local/bin/codecept && \
   echo "alias codecept=‘php /usr/local/bin/codecept'" >> ~/.bashrc && \
   ## PHP loc
   curl -LsS https://phar.phpunit.de/phploc.phar -o /usr/local/bin/phploc && \
   chmod a+x /usr/local/bin/phploc && \
   ## PHP depend
   curl -LsS http://static.pdepend.org/php/latest/pdepend.phar -o /usr/local/bin/pdepend && \
   chmod a+x /usr/local/bin/pdepend && \
   ## PHPmd
   curl -LsS http://static.phpmd.org/php/latest/phpmd.phar -o /usr/local/bin/phpmd && \
   chmod a+x /usr/local/bin/phpmd && \
   ## PHPCS
   curl -LsS https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar -o /usr/local/bin/phpcs && \
   chmod a+x /usr/local/bin/phpcs && \
   ## PHPCPD
   curl -LsS https://phar.phpunit.de/phpcpd.phar -o /usr/local/bin/phpcpd && \
   chmod a+x /usr/local/bin/phpcpd && \
   ## PHP Phing
   curl -LsS https://www.phing.info/get/phing-latest.phar -o /usr/local/bin/phing && \
   chmod a+x /usr/local/bin/phing

SHELL ["/bin/bash", "-c", "source ~/.bashrc"]

EXPOSE 80 443

ENTRYPOINT ["/usr/sbin/apachectl", "-D", "FOREGROUND"]