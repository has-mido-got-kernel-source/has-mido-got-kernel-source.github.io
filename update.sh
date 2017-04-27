#!/usr/bin/env bash
TIME=$(TZ="Asia/Shanghai" date +%Y-%m-%d' '%R' Asia/Shanghai')
do_modify(){
git pull
git reset --hard
cat index_yes.html >index.html
rm index_no.html
echo "$TIME" >update_time
git add .
git commit -m "Updated. ${TIME}"
git push
}
do_update(){
git pull
git reset --hard HEAD^
echo "$TIME" >update_time
git add .
git commit -m "Updated. ${TIME}"
git push
}
cd has-mido-got-kernel-source.github.io
[ -f index_no.html ] || exit 0
curl -s https://github.com/MiCode/Xiaomi_Kernel_OpenSource/branches/active |grep -Fq mido && do_modify || do_update
exit 0
