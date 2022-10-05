;
;	00_module_pc.hsp用 HELPソースファイル
;	制作日	: 2022/10/05
;	製作者	: ゆずらにうむ
;	Twitter	: https://twitter.com/YUZRANIUM

%date
2022/10/03
%author
ゆずらにうむ
%url
https://twitter.com/YUZRANIUM
%dll
00_module_pc
user32.as
%type
ユーザー定義命令
%ver
1.0
%port
Win
%note
00_module_pc.hspとuser32.asをインクルードすること

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