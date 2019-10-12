#!/bin/bash

# *****************************************************************************
# * システムアーキテクト試験の過去問一括ダウンロードスクリプト
# * https://www.memory-lovers.blog/entry/2018/10/26/155638
# *****************************************************************************

first_year=16 # 平成16年から
last_year=29  # 平成29年まで

base_url='https://www.jitec.ipa.go.jp/1_04hanni_sukiru'
dl_dir='dist'

dl_pdf() {
  year_label="${1}h${2}"
  fname="$3"

  url="${base_url}/mondai_kaitou_${year_label}_2/${year_label}a_${fname}.pdf"
  echo "#### DOWNLOAD: ${url}"

  wget ${url} -P "./${dl_dir}"
  sleep 1  # 1秒待つ
}

rm -rf ${dl_dir}
mkdir ${dl_dir}

for i in `seq ${first_year} ${last_year} | sort -r`;do
  year="$((1988 + i))"
  year2="${i}"
  echo "${year} - ${year2}"
  if [ $year2 -gt 21 ]; then
    dl_pdf "$year" "$year2" 'sa_am2_qs'
    dl_pdf "$year" "$year2" 'sa_am2_ans'
    dl_pdf "$year" "$year2" 'sa_pm1_qs'
    dl_pdf "$year" "$year2" 'sa_pm1_ans'
    dl_pdf "$year" "$year2" 'sa_pm1_cmnt'
    dl_pdf "$year" "$year2" 'sa_pm2_qs'
    dl_pdf "$year" "$year2" 'sa_pm2_ans'
    dl_pdf "$year" "$year2" 'sa_pm2_cmnt'
  else
    dl_pdf "$year" "$year2" 'ae_pm1_qs'
    dl_pdf "$year" "$year2" 'ae_pm1_ans'
    dl_pdf "$year" "$year2" 'ae_pm1_cmnt'
    dl_pdf "$year" "$year2" 'ae_pm2_qs'
    dl_pdf "$year" "$year2" 'ae_pm2_ans'
    dl_pdf "$year" "$year2" 'ae_pm2_cmnt'
  fi
done