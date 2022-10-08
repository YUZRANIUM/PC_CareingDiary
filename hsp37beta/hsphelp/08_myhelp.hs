;
;	00_module.hsp�p HELP�\�[�X�t�@�C��
;	�����	: 2022/10/07
;	�����	: �䂸��ɂ���
;	Twitter	: https://twitter.com/YUZRANIUM

%date
2022/10/07
%author
�䂸��ɂ���
%url
https://twitter.com/YUZRANIUM
%dll
00_module
%type
���[�U�[��`����
%ver
1.2
%port
Win

%index
Mycolor
�J���[�ݒ�
%group
��ʐ��䖽��/�I�u�W�F�N�g���䖽��
%prm
p1,p2,p3,p4
p1,p2,p3=0�`1	: �F�R�[�h�iR,G,B�̋P�x�j
p4 = 0,1,2	: ���[�h�؂�ւ�
%inst
���b�Z�[�W�\���A�`��Ȃǂ̐F�A�܂��̓I�u�W�F�N�g���g�p����F���w�肵���l�ɐݒ肵�܂��B
p1,p2,p3�����ꂼ��AR,G,B�̋P�x�ɂȂ�܂��B
^
�F�R�[�h��0����1�̊ԂŎw�肵�܂��B0���ł��Â��A1���ł����邭�Ȃ�܂��B
^
�W����color���߂�objcolor���߂̗��������˔����Ă���p4�p�����[�^�łǂ��炩�ɐ؂�ւ��A�܂��͗����g�p���邱�Ƃ��ł��܂��B
^
	�l : ����
	----------------
	 0 : color����
	 1 : objcolor����
	 2 : ����

%href
color
objcolor
%note
00_module.hsp���C���N���[�h���邱��


%index
My_CreateTab
�^�u�R���g���[���̐ݒu
%group
���[�U�[��`����
%prm
p1,p2,p3,p4
p1 : �^�u�R���g���[����X�����̃T�C�Y
p2 : �^�u�R���g���[����Y�����̃T�C�Y
p3 : �^�u�R���g���[���̃n���h�����󂯎��ϐ�
p4($400) : �^�u�R���g���[���̒ǉ��̃E�B���h�E�X�^�C��
%inst
p1,p2�Ń^�u�R���g���[�����̂�x�T�C�Y��y�T�C�Y���w�肵�܂��B
p4�Ɋւ��Ă͏ȗ��\�ł��B�ȗ�����$400(TCS_FIXEDWIDTH)�^�u�܂݂̒�����S�ē����ɂ��܂��B
%href
InsertTab
My_ChangeTab
%note
00_module.hsp���C���N���[�h���邱��

;
; �ȉ����̃v���W�F�N�g�݂̂̈ꎞ�I�Ȃ���
;
%index
SetWindowLong
�w�肳�ꂽ�E�B���h�E�̑�����ύX���܂�
%group
Win32API
%prm
p1,p2,p3
p1 : ������ύX����E�B���h�E�̃n���h��
p2 : �ύX���鑮���̎w��
p3 : �V���������̎w��
%inst
���݂̃E�B���h�E�̑�����ύX���܂��B
^
p1�ɂ͑�����ύX�������E�B���h�E�̃E�B���h�E�n���h�����w�肵�Ă��������B�ʏ�Ahwnd�Ŏw�肵�܂��B
^
p2�ɂ͈ȉ��̂����ꂩ���w�肵�Ă��������B
		�l			   :		���e
	---------------------------------------------------------
	  -4(GWL_WNDPROC)	   : �E�B���h�E�v���V�[�W���̃A�h���X
	  -6(GWL_HINSTANCE)  : �A�v���P�[�V�����̃C���X�^���X�n���h��
	-16(GWL_STYLE)	   : �E�B���h�E�X�^�C��
	-20(GWL_EXSTYLE)	   : �g���E�B���h�E�X�^�C��
	-21(GWL_USERDATA)	   : �E�B���h�E�Ɋ֘A�t����ꂽ�A�v���P�[�V������`��32�r�b�g�l
	-12(GWL_ID)		   : �E�B���h�EID
^
��{�I�ɂ�-16(GWL_STYLE)��-20(GWL_EXSTYLE)�����g���܂���B�܂��A����ȊO�̒l�����͏ȗ������Ē����܂��B
^
p3�ɂ͐V�����ݒ肷��32�r�b�g�l���w�肵�܂��B
^
�܂��A�q�E�B���h�E�̐e�E�B���h�E��ύX���� SetParent�֐��̑O��SetWindowLong�֐���p���āAWS_CHILD�X�^�C����ǉ����Ȃ��Ă͂Ȃ�܂���B
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
user32.as���C���N���[�h���邱��


%index
SetParent
�w�肳�ꂽ�E�B���h�E�̐e�E�B���h�E��ύX���܂��B
%group
Win32API
%prm
p1,p2
p1 : �q�E�B���h�E�̃n���h��
p2 : �V�����e�E�B���h�E�̃n���h��
%inst
p1�Ŏw�肵���E�B���h�E��p2�Ŏw�肵���E�B���h�E�̎q�E�B���h�E�Ƃ��܂��B
^
p1�ɂ͎q�E�B���h�E�Ƃ���E�B���h�E�̃n���h�����w�肵�Ă��������B
p2�ɐe�E�B���h�E�Ƃ���E�B���h�E�̃n���h�����w�肵�܂��B
^
�܂��A�q�E�B���h�E�̐e�E�B���h�E��ύX���� SetParent�֐��̑O��SetWindowLong�֐���p���āAWS_CHILD�X�^�C����ǉ����Ȃ��Ă͂Ȃ�܂���B
%sample
	#include "user32.as"
	#define WS_CHILD 0x40000000

	screen 0, 500, 300, 2
	hWindow = hwnd			    //�e�E�B���h�E�Ƃ���E�B���h�E�̃n���h�����擾


	bgscr 1, 500, 300, 2

	SetWindowLong hwnd, -16, WS_CHILD   //�E�B���h�E�X�^�C����WS_CHILD��ǉ�
	SetParent hwnd, hWindow		    //�q�E�B���h�E�ɕύX
^
%href
SetWindowLong
hwnd
%note
user32.as���C���N���[�h���邱��