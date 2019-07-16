#! /bin/bash
redis_url=$1

if [ -z $redis_url ]; then
	echo "If you do not enter a url, you will use the default URL"
	redis_url="http://download.redis.io/releases/redis-5.0.5.tar.gz"
fi

wget $redis_url
tar -zxvf redis-5.0.5.tar.gz
cd redis-5.0.5
make

cd src/

./redis-server &

if [ $? = 0 ]; then
	echo "Redis 启动完成"
else
	echo "Redis 安装失败"
fi


