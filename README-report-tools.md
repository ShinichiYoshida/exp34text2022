# レポート採点ツール

ダウンロードしたレポートを1つにつなげる．

# 0. 必要ツール

Ubuntu での実行環境例 

- PDFTK (PDF連結等)
- Python3 (pandas実行用)
- Pandas (Excel -> CSV 変換用)
- ZSH (shell script)
- Unzip

# 1. LMS から下記2点ダウンロード

ZIPファイル (提出レポート本体PDF)
Excelファイル (提出レポートメタ情報)

# 2. unzip

レポート本体ZIPを伸長・展開

```
unzip downloadpdf.zip
```

# 3. 下記 excel2csv.sh を実行

```
./excel2csv.sh  downloadしたexcel.xls
```

excel2csv.sh の中身
```
#!/bin/sh

a=`cat << EOF
import pandas as pd;
df=pd.read_excel("$1",index_col=1);
df.to_csv("$1.csv");
EOF`

echo $a | python3
```

hogehoge.xls.csv ができる

```
名前,苗字,230111n@ugs.kochi-tech.ac.jp,1088089848,report3i-3-1230111-Namae.pdf,1572324072,2021-04-28 21:58:31 JST,3279,,,42,12,1,37
...
...
```
各フィールド情報
```
First Name,Last Name,Email,Turnitin User ID,Title,Paper ID,Date Uploaded,Word Count,Grade,Student Viewed,Similarity Score,Internet Overlap,blications Overlap,Student Papers Overlap
```

# 4. 下記にて，PDFファイル名を変換する


```
cat CSVファイル.csv | | awk -F ',' '{print "mv "$6".pdf "$3"_"$2"_"$1"_"$6"_"$8"_"$11"_"$12"_"$13"_"$14".pdf"}' > move.sh
```

下記のようなファイル名変換スクリプト move.sh が生成される． 

```
...
mv 1553456629.pdf 230111m@ugs.kochi-tech.ac.jp_苗字_名前_1553456629_2581_100_6_1_100.pdf
...
```
これをZIPフォルダで実行
```
cd ZIPフォルダ
sh ../move.sh
```

PDFファイルにすべてファイル名が学籍番号(メール)がつく

# 5. 下記コマンドでPDFを1つにする

```
cd ZIPフォルダ
pdftk *.pdf cat output ../all.pdf
```

all.pdfが学籍番号順になる

# おまけ

別途，グループ情報などを置いておけば，グループ順にすることも可能．

