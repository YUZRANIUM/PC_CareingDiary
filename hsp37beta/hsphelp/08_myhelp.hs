;
;	00_mylv.hsp用 HELPソースファイル
;	制作日	: 2022/10/07
;	製作者	: ゆずらにうむ
;	Twitter	: https://twitter.com/YUZRANIUM

%date
2022/10/09
%author
YUZURANIUM(ゆずらにうむ)
%url
https://twitter.com/YUZRANIUM
%dll
00_mylv
%type
ユーザー定義命令
%ver
1.2
%port
Win

%index
Mycolor
カラー設定
%group
画面制御命令
%prm
p1,p2,p3,p4
p1,p2,p3=0～1	: 色コード（R,G,Bの輝度）
p4 = 0,1,2	: モード切り替え
%inst
メッセージ表示、描画などの色、またはオブジェクトが使用する色を指定した値に設定します。
p1,p2,p3がそれぞれ、R,G,Bの輝度になります。
^
色コードを0から1の間で指定します。0が最も暗く、1が最も明るくなります。
^
標準のcolor命令とobjcolor命令の両方を兼ね備えておりp4パラメータでどちらかに切り替え、または両方使用することができます。
^
	値 : 動作
	----------------
	 0 : color命令
	 1 : objcolor命令
	 2 : 両方

%href
color
objcolor

%note
00_mylv.hspをインクルードすること


%index
mycrelv
リストビュー設置

%prm
p1,p2,p3,p4
p1,p2 : リストビューのXサイズ、Yサイズ
p3 : オブジェクトIDを受け取る変数
p4 : オブジェクトハンドルを受け取る変数

%inst
p1,p2で指定した大きさのリストビューを設置する命令です。
p3とp4はご自身で整数型変数を用意する必要があります。
この命令はリストビューの設置準備をするだけです。
この後に列（カラム）を設置する命令とアイテムを設置する命令を行う必要があります。

%sample
...
sql_open db
	sql_q "SELECT * FROM MyCPU;"

		rec_cnum = stat			//レコードの数

		col_cnum = length(tmparr)	//カラムの数

		col_clis = sql_collist()	//カラムリスト

		split col_clis, ",", col_clis	//カラムのリストを配列変数に

	myindata rec_cnum, col_cnum, col_clis, cpu　	//データのインプット

	column_w = 60, 60, 110, 85, 80, 80		//カラムの幅


	mycrelv 550, 280, id_LVcpu, hLVcpu		//リストビュー設置
	myincol id_LVcpu, col_clis, col_cnum, column_w	//列（カラム）の設置
	myinitem id_LVcpu, cpu, rec_cnum, col_cnum	//アイテムの設置


	oncmd gosub *notify, WM_NOTIFY
%href
myincol
myinitem
myindata
mygetitem
mydelitem

%group
オブジェクト制御命令

%note
00_mylv.hspとuser32.asをインクルードすること
%index
mydelitem
リストビューのアイテム全消去

%prm
p1
p1 : リストビューのオブジェクトID

%inst
指定されたリストビューの全アイテムを削除します。
^
この命令を実行する前にgsel命令で操作先のウィンドウをアクティブにしておく必要があります。
^
(参考)
#deffunc mydelitem int h1
	sendmsg objinfo(h1, 2), 0x1009, 0, 0
	return

%sample
//リストビュー昇降順の処理
*notify
dupptr nmhdr, lparam, 12, 4 : tabhwnd = nmhdr(0)
if (nmhdr(2) == LVN_COLUMNCLICK) {
	dupptr nmlv, lparam, 40, 4 : index = nmlv(4)

	sql_open db
	switch tabhwnd
		/***CPU***/
		case hLVcpu
			sdim cpu, 2048
			swc = swc * -1
			if swc = -1 {
				sql_q "SELECT * FROM MyCPU ORDER BY " + col_clis(index) + " DESC;"
			}
			else {
				sql_q "SELECT * FROM MyCPU ORDER BY " + col_clis(index) + " ASC;"
			}
				col_clis = sql_collist()
				split col_clis, ",", col_clis
				myindata rec_cnum, col_cnum, col_clis, cpu

			gsel 2

			mydelitem id_LVcpu

			myinitem id_LVcpu, cpu, rec_cnum, col_cnum

			swbreak
%href
mycrelv
myincol
myinitem
myindata
mygetitem

%group
オブジェクト制御命令

%note
00_mylv.hspとuser32.asをインクルードすること

%index
mygetitem
リストビューのアイテム取得

%prm
p1,p2,p3
p1 : リストビューのオブジェクトID
p2 : カラムの数
p3 : 取得文字列を受け取る配列変数

%inst
選択されたリストビューのアイテムを文字列として取得し、配列変数として出力する命令です。
^
取得文字列を受け取る配列変数はご自身であらかじめ用意しておく必要があります。
^
また、複数選択にも対応しているため規模にもよりますが、取得文字列を受け取る配列変数はそのバッファサイズを大きめに確保してください。

%sample

//選択したリストアイテムの取得
*getitem
	gsel 1

	sdim infonoteC, 1024  :  sdim infotext1, 1024
	sdim infonoteG, 1024  :  sdim infotext2, 1024
	sdim infonoteR, 1024  :  sdim infotext3, 1024

	mygetitem id_cpumoni, 6, infonoteC
	mygetitem id_gpumoni, 6, infonoteG
	mygetitem id_rommoni, 6, infonoteR

	infotext1 += "\n\n---CPU---" + "\n" + infonoteC
	infotext2 += "\n\n---GPU---" + "\n" + infonoteG
	infotext3 += "\n\n---ROM---" + "\n" + infonoteR

	dialog "購入リスト" + infotext1 + infotext2 + infotext3, 0, "購入確認"

	return

%href
mycrelv
myincol
myinitem
myindata
mydelitem
%group
オブジェクト制御命令
%note
00_mylv.hspをインクルードすること
%index
myincol
リストビューに列（カラム）追加

%prm
p1,p2,p3,p4,p5
p1 : 設置したリストビューのオブジェクトハンドル
p2 : カラムを格納した配列変数
p3 : カラムの数
p4 : カラムの幅を格納した配列変数
p5(0) : スタイル 

%inst
p1で指定したリストビューにカラムを設置します。
p2は文字列型、p4は整数型の1次元配列変数でなければなりません。
p5は左揃え、右揃え、中央揃えを指定することが出来ます。省略時は左揃えとなります。
^
	値	:	動作
	-----------------------
	0	:	左揃え
	1	:	右揃え
	2	:	中央揃え

%sample
...
sql_open db
	sql_q "SELECT * FROM MyCPU;"

		rec_cnum = stat			//レコードの数

		col_cnum = length(tmparr)	//カラムの数

		col_clis = sql_collist()	//カラムリスト

		split col_clis, ",", col_clis	//カラムのリストを配列変数に

	myindata rec_cnum, col_cnum, col_clis, cpu　	//データのインプット

	column_w = 60, 60, 110, 85, 80, 80		//カラムの幅


	mycrelv 550, 280, id_LVcpu, hLVcpu		//リストビュー設置
	myincol id_LVcpu, col_clis, col_cnum, column_w	//列（カラム）の設置
	myinitem id_LVcpu, cpu, rec_cnum, col_cnum	//アイテムの設置


	oncmd gosub *notify, WM_NOTIFY
%href
mycrelv
myinitem
myindata
mygetitem
mydelitem


%group
オブジェクト制御命令

%note
00_mylv.hspとuser32.asをインクルードすること
%index
myindata
SQLele(SQLite)からデータ取得

%prm
p1,p2,p3,p4
p1 : レコードの数
p2 : カラムの数
p3 : カラムを格納した配列変数
p4 : レコードを受け取る配列変数

%inst
文字列型の1次配列を出力するマクロ形式の命令です。
sqlele.hspをインクルードしている場合にのみ使うことができます。
^
sqleleのsql_q命令後に各種数値を取得してください。その値をもとにレコードを文字列型の1次元配列変数として与えられた変数に格納していきます。
^
レコードを受け取るための配列変数はご自身であらかじめ用意しておく必要があります。また、規模にもよりますが、レコードを受け取る配列変数はそのバッファサイズを大きめに確保してください。


(参考)
#define global myindata(%1,%2,%3,%4)\
	repeat %1\
	: j = 0\
	: repeat %2\
	: %4 += "" + sql_v(%3(j)) + ","\
	: j++\
	: loop\
	: sql_next\
	: loop\
	: split %4,",",%4

%sample
...
sql_open db
	sql_q "SELECT * FROM MyCPU;"

		rec_cnum = stat			//レコードの数

		col_cnum = length(tmparr)	//カラムの数

		col_clis = sql_collist()	//カラムリスト

		split col_clis, ",", col_clis	//カラムのリストを配列変数に

	myindata rec_cnum, col_cnum, col_clis, cpu　	//データのインプット

	column_w = 60, 60, 110, 85, 80, 80		//カラムの幅


	mycrelv 550, 280, id_LVcpu, hLVcpu		//リストビュー設置
	myincol id_LVcpu, col_clis, col_cnum, column_w	//列（カラム）の設置
	myinitem id_LVcpu, cpu, rec_cnum, col_cnum	//アイテムの設置


	oncmd gosub *notify, WM_NOTIFY

%href
mycrelv
myincol
myinitem
mydelitem
mygetitem

%group
オブジェクト制御命令

%note
00_mylv.hspとsqlele.hspをインクルードすること
%index
myinitem
リストビューにアイテム追加

%prm
p1,p2,p3,p4
p1 : 設置したリストビューのオブジェクトID
p2 : アイテムを格納した配列変数
p3 : レコードの数
p4 : カラムの数

%inst
p2でアイテムを格納した文字列型の1次元配列変数を、p4でカラムの数をそれぞれ指定します。
p3で指定したレコードの数だけレコードの追加を行なうマクロ形式の命令です。
マクロによりネストしたrepeatでアイテムを連続して追加していきます。
^
また、CSV形式のファイルも文字列型の1次元配列にすることで対応できます。


(参考)
#define global myinitem(%1,%2,%3,%4)\
	i = 0\
	: repeat %3\
	: InsertListViewItem %1, i, %2(i * %4)\
	: repeat %4 - 1, 1\
	: SetListViewItemText %1, i, cnt, %2(cnt + (i * %4))\
	: loop\
	: i++\
	: loop
%sample
...
sql_open db
	sql_q "SELECT * FROM MyCPU;"

		rec_cnum = stat			//レコードの数

		col_cnum = length(tmparr)	//カラムの数

		col_clis = sql_collist()	//カラムリスト

		split col_clis, ",", col_clis	//カラムのリストを配列変数に

	myindata rec_cnum, col_cnum, col_clis, cpu　	//データのインプット

	column_w = 60, 60, 110, 85, 80, 80		//カラムの幅


	mycrelv 550, 280, id_LVcpu, hLVcpu		//リストビュー設置
	myincol id_LVcpu, col_clis, col_cnum, column_w	//列（カラム）の設置
	myinitem id_LVcpu, cpu, rec_cnum, col_cnum	//アイテムの設置


	oncmd gosub *notify, WM_NOTIFY
%href
mycrelv
myincol
myindata
mygetitem
mydelitem

%group
オブジェクト制御命令

%note
00_mylv.hspとuser32.asをインクルードすること

%index
SetParent
指定されたウィンドウの親ウィンドウを変更します。
%group
Win32API
%prm
p1,p2
p1 : 子ウィンドウのハンドル
p2 : 新しい親ウィンドウのハンドル
%inst
p1で指定したウィンドウをp2で指定したウィンドウの子ウィンドウとします。
^
p1には子ウィンドウとするウィンドウのハンドルを指定してください。
p2に親ウィンドウとするウィンドウのハンドルを指定します。
^
また、子ウィンドウの親ウィンドウを変更する SetParent関数の前にSetWindowLong関数を用いて、WS_CHILDスタイルを追加しなくてはなりません。
%sample
	#include "user32.as"
	#define WS_CHILD 0x40000000

	screen 0, 500, 300, 2
	hWindow = hwnd			    //親ウィンドウとするウィンドウのハンドルを取得


	bgscr 1, 500, 300, 2

	SetWindowLong hwnd, -16, WS_CHILD   //ウィンドウスタイルにWS_CHILDを追加
	SetParent hwnd, hWindow		    //子ウィンドウに変更
^
%href
SetWindowLong
hwnd
%note
user32.asをインクルードすること
%index
SetWindowLong
指定されたウィンドウの属性を変更します
%group
Win32API
%prm
p1,p2,p3
p1 : 属性を変更するウィンドウのハンドル
p2 : 変更する属性の指定
p3 : 新しい属性の指定
%inst
現在のウィンドウの属性を変更します。
^
p1には属性を変更したいウィンドウのウィンドウハンドルを指定してください。通常、hwndで指定します。
^
p2には以下のいずれかを指定してください。
		値			   :		内容
	---------------------------------------------------------
	  -4(GWL_WNDPROC)	   : ウィンドウプロシージャのアドレス
	  -6(GWL_HINSTANCE)  : アプリケーションのインスタンスハンドル
	-16(GWL_STYLE)	   : ウィンドウスタイル
	-20(GWL_EXSTYLE)	   : 拡張ウィンドウスタイル
	-21(GWL_USERDATA)	   : ウィンドウに関連付けられたアプリケーション定義の32ビット値
	-12(GWL_ID)		   : ウィンドウID
^
基本的には-16(GWL_STYLE)や-20(GWL_EXSTYLE)しか使いません。また、これ以外の値や解説は省略させて頂きます。
^
p3には新しく設定する32ビット値を指定します。
^
また、子ウィンドウの親ウィンドウを変更する SetParent関数の前にSetWindowLong関数を用いて、WS_CHILDスタイルを追加しなくてはなりません。
^
%sample
	#include "user32.as"
	#define WS_CHILD 0x40000000

	screen 0, 500, 300, 2
	hWindow = hwnd


	bgscr 1, 500, 300, 2

	SetWindowLong hwnd, -16, WS_CHILD
	SetParent hwnd, hWindow
^
%href
hwnd
SetParent
%note
user32.asをインクルードすること


