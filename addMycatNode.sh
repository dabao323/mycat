#!/bin/bash


function is5num(){
a=`echo $1 | grep '^[0-9][0-9][0-9][0-9][0-9]'`
b=`echo $a | grep '[0-9][0-9][0-9][0-9][0-9].'`

if [ -z "$a" ] || [ ! -z "$b" ]
then
        echo "请输入五位数字，如00001！"
        exit 1
fi

}

#is5num $1

cd /www/mycat/conf

#server.xml-打印行号
linenum=`grep -n 'property name="schemas"'  server.xml  | awk -F ":" '{print $1}'`
aflinenum=`echo "$linenum - 1" | bc`

#server.xml-原变量内容
pretext=`grep  'property name="schemas"' server.xml | awk -F '</property>' '{print $1}'`

#echo $pretext

#server.xml-后变量内容
echo "${pretext},clinic_${1}</property>" > serverxml.tmp

#server.xml-删除旧行
sed -i "${linenum}d" server.xml

#server.xml-增加新行
sed -i "${aflinenum} r serverxml.tmp" server.xml

#修改结果判断
if [ $? -eq 0 ];
then
aaa="sucessful"
fi

############################
#schema.xml-name追加行号
linenum=`grep -n "/schema" schema.xml | tail -n 1 | awk -F ":" '{print $1}'`

#schema.xml-name追加内容
echo "<schema name=\"clinic_${1}\" checkSQLschema=\"false\" sqlMaxLimit=\"100\" dataNode=\"dn${1}\"></schema>" > schemaxml.nametmp

#schema.xml-name增加新行
sed -i "${linenum} r schemaxml.nametmp" schema.xml

#修改结果判断
if [ $? -eq 0 ];
then
bbb="sucessful"
fi

###########################
#schema.xml-dataNode追加行号
linenum=`grep -n "dataNode name=" schema.xml | tail -n 1 | awk -F ":" '{print $1}'`

#schema.xml-name追加内容
echo "<dataNode name=\"dn${1}\" dataHost=\"globalhost\" database=\"clinic_${1}\"/>" > schemaxml.dataNodetmp

#schema.xml-name增加新行
sed -i "${linenum} r schemaxml.dataNodetmp" schema.xml

#修改结果判断
if [ $? -eq 0 ];
then
ccc="sucessful"
fi

####################
#重启mycat
if [ "$aaa" = "sucessful" ] && [ "$bbb" = "sucessful" ] && [ "$ccc" = "sucessful" ];then
/www/mycat/bin/mycat restart
sleep 3s;

netstat -lnpt | grep 8066 > /dev/null 2>&1

if [ $? -eq 0 ];then
#echo "mycat restart sucessful!"
echo "{\"code\":\"0\"}";
else
#echo "mycat restart faile!"
echo  "{\"code\":\"-1\"}";
fi

fi

