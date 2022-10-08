;
;	00_module.hsp用 HELPソースファイル
;	制作日	: 2022/10/07
;	製作者	: ゆずらにうむ
;	Twitter	: https://twitter.com/YUZRANIUM

%date
2022/10/07
%author
ゆずらにうむ
%url
https://twitter.com/YUZRANIUM
%dll
00_module
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
00_module.hspをインクルードすること


%index
My_CreateTab
タブコントロールの設置
%group
ユーザー定義命令
%prm
p1,p2,p3,p4
p1 : タブコントロールのX方向のサイズ
p2 : タブコントロールのY方向のサイズ
p3 : タブコントロールのハンドルを受け取る変数
p4($400) : タブコントロールの追加のウィンドウスタイル
%inst
p1,p2でタブコントロール自体のxサイズとyサイズを指定します。
p4に関しては省略可能です。省略時は$400(TCS_FIXEDWIDTH)タブつまみの長さを全て同じにします。
%href
InsertTab
My_ChangeTab
%note
00_module.hspをインクルードすること

;
; 以下このプロジェクトのみの一時的なもの
;
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