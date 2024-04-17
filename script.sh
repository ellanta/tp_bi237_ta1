find $1 -type f
echo "----------"
find $1 -type d
find $1 -type f -exec cp {} $2 \;
