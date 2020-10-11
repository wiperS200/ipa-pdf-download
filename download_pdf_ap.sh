#!/bin/bash

# *****************************************************************************
# * 応用情報技術者試験の過去問一括ダウンロードスクリプト
# *****************************************************************************

#first_year=25 # 平成25年から
#last_year=31  # 平成31年まで
first_year=2013
last_year=2019

base_url='https://www.jitec.ipa.go.jp/1_04hanni_sukiru'
dl_dir='dist'

dl_pdf() {
  year_label="${1}h${2}"
  fname="$3"

  url="${base_url}/mondai_kaitou_${year_label}_2/${year_label}a_${fname}.pdf" # 春なら1/h, 秋なら2/a
  echo "#### DOWNLOAD: ${url}"

  wget ${url} -P "./${dl_dir}"
  sleep 1  # 1秒待つ
}

rm -rf ${dl_dir}
mkdir ${dl_dir}

for i in `seq ${first_year} ${last_year} | sort -r`;do
#  year="$((1988 + i))"
#  year2="${i}"
  year="${i}"
  year2="$((i - 1988))"
  echo "${year} - ${year2}"
  dl_pdf "$year" "$year2" 'ap_am_qs'
  dl_pdf "$year" "$year2" 'ap_pm_qs'
done
