#!/bin/bash
hexo d
ssh root@cn.yimian.xyz "cd /home/www/blog ; git pull ; exit"
