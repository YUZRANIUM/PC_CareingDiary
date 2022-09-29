;
;	my_func.hsp用 HELPソースファイル
;	制作日	: 2022/09/19
;	製作者	: ゆずらにうむ
;	Twitter	: https://twitter.com/YUZRANIUM
;

%date
2022/09/19
%author
ゆずらにうむ
%url
https://twitter.com/YUZRANIUM
%dll
my_func.hsp
user32.as
%type
ユーザー定義命令
%ver
1.0
%port
Win
%note
my_func.hspとuser32.asをインクルードすること


%index
My_COLORREF
カラー変換
%group
画面制御命令
%prm
p1,p2,p3
p1,p2,p3=R値,G値,B値
%inst
RGBの色データをCOLORREF型のデータに変換します。
%href
SetColorRef



%index
mycolor
カラー設定
%group
画面制御命令/オブジェクト制御命令
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
標準のcolor命令とobjcolor命令の両方を兼ね備えておりp4パラメータでどちらかの切り替え、または両方使用することができます。
^
	値 : 動作
	----------------
	 0 : color命令
	 1 : objcolor命令
	 2 : 両方

%href
color
objcolor


%index
SetToolTips
ツールチップコントロール
%group
拡張オブジェクト制御命令
%prm
p1
p1=スタイルの指定
%inst
ツールチップコントロールを作成します。最初に1度だけ呼んでください。
statには、ツールチップコントロールのオブジェクトIDが返ります。
p1はスタイルの指定です。すべてのツールチップに適用される形になります。
以下の数値を組み合わせてください。無指定の場合は普通のツールチップが表示されます。
^
	値  : 動作
	----------------
	$1  : 自ウィンドウがアクティブになっていない場合でも常にツールチップを表示.
	$40 : ツールチップをバルーンタイプで表示.（要IE5以降）

%href
AddToolTips

%index
AddToolTips
ツールチップの登録
%group
拡張オブジェクト制御命令
%prm
p1,"文字列",p2
p1=ツールチップを表示するオブジェクトID
"文字列"=ツールチップに表示させる文字列.
p2=ツールチップをオブジェクトの真下に表示.（$2を指定）
%inst
ツールチップコントロールに表示文字列を登録します。
指定したオブジェクトにツールチップが表示されます。文字列は64バイト分の領域を一応用意しています。
%href
SetToolTips