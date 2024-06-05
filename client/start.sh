#!/bin/sh
sed -i -e 's|__REACT_APP_AUTH_URL__|'${REACT_APP_AUTH_URL}'|' \
       -e 's|__REACT_APP_CLASS_URL__|'${REACT_APP_CLASS_URL}'|' \
       -e 's|__REACT_APP_POST_URL__|'${REACT_APP_POST_URL}'|' \
       /usr/share/nginx/html/env.js
nginx -g 'daemon off;'