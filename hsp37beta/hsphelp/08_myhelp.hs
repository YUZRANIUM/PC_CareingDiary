;
;	00_mylv.hsp�p HELP�\�[�X�t�@�C��
;	�����	: 2022/10/07
;	�����	: �䂸��ɂ���
;	Twitter	: https://twitter.com/YUZRANIUM

%date
2022/10/09
%author
YUZURANIUM(�䂸��ɂ���)
%url
https://twitter.com/YUZRANIUM
%dll
00_mylv
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
��ʐ��䖽��
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
00_mylv.hsp���C���N���[�h���邱��


%index
mycrelv
���X�g�r���[�ݒu

%prm
p1,p2,p3,p4
p1,p2 : ���X�g�r���[��X�T�C�Y�AY�T�C�Y
p3 : �I�u�W�F�N�gID���󂯎��ϐ�
p4 : �I�u�W�F�N�g�n���h�����󂯎��ϐ�

%inst
p1,p2�Ŏw�肵���傫���̃��X�g�r���[��ݒu���閽�߂ł��B
p3��p4�͂����g�Ő����^�ϐ���p�ӂ���K�v������܂��B
���̖��߂̓��X�g�r���[�̐ݒu���������邾���ł��B
���̌�ɗ�i�J�����j��ݒu���閽�߂ƃA�C�e����ݒu���閽�߂��s���K�v������܂��B

%sample
...
sql_open db
	sql_q "SELECT * FROM MyCPU;"

		rec_cnum = stat			//���R�[�h�̐�

		col_cnum = length(tmparr)	//�J�����̐�

		col_clis = sql_collist()	//�J�������X�g

		split col_clis, ",", col_clis	//�J�����̃��X�g��z��ϐ���

	myindata rec_cnum, col_cnum, col_clis, cpu�@	//�f�[�^�̃C���v�b�g

	column_w = 60, 60, 110, 85, 80, 80		//�J�����̕�


	mycrelv 550, 280, id_LVcpu, hLVcpu		//���X�g�r���[�ݒu
	myincol id_LVcpu, col_clis, col_cnum, column_w	//��i�J�����j�̐ݒu
	myinitem id_LVcpu, cpu, rec_cnum, col_cnum	//�A�C�e���̐ݒu


	oncmd gosub *notify, WM_NOTIFY
%href
myincol
myinitem
myindata
mygetitem
mydelitem

%group
�I�u�W�F�N�g���䖽��

%note
00_mylv.hsp��user32.as���C���N���[�h���邱��
%index
mydelitem
���X�g�r���[�̃A�C�e���S����

%prm
p1
p1 : ���X�g�r���[�̃I�u�W�F�N�gID

%inst
�w�肳�ꂽ���X�g�r���[�̑S�A�C�e�����폜���܂��B
^
���̖��߂����s����O��gsel���߂ő����̃E�B���h�E���A�N�e�B�u�ɂ��Ă����K�v������܂��B
^
(�Q�l)
#deffunc mydelitem int h1
	sendmsg objinfo(h1, 2), 0x1009, 0, 0
	return

%sample
//���X�g�r���[���~���̏���
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
�I�u�W�F�N�g���䖽��

%note
00_mylv.hsp��user32.as���C���N���[�h���邱��

%index
mygetitem
���X�g�r���[�̃A�C�e���擾

%prm
p1,p2,p3
p1 : ���X�g�r���[�̃I�u�W�F�N�gID
p2 : �J�����̐�
p3 : �擾��������󂯎��z��ϐ�

%inst
�I�����ꂽ���X�g�r���[�̃A�C�e���𕶎���Ƃ��Ď擾���A�z��ϐ��Ƃ��ďo�͂��閽�߂ł��B
^
�擾��������󂯎��z��ϐ��͂����g�ł��炩���ߗp�ӂ��Ă����K�v������܂��B
^
�܂��A�����I���ɂ��Ή����Ă��邽�ߋK�͂ɂ����܂����A�擾��������󂯎��z��ϐ��͂��̃o�b�t�@�T�C�Y��傫�߂Ɋm�ۂ��Ă��������B

%sample

//�I���������X�g�A�C�e���̎擾
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

	dialog "�w�����X�g" + infotext1 + infotext2 + infotext3, 0, "�w���m�F"

	return

%href
mycrelv
myincol
myinitem
myindata
mydelitem
%group
�I�u�W�F�N�g���䖽��
%note
00_mylv.hsp���C���N���[�h���邱��
%index
myincol
���X�g�r���[�ɗ�i�J�����j�ǉ�

%prm
p1,p2,p3,p4,p5
p1 : �ݒu�������X�g�r���[�̃I�u�W�F�N�g�n���h��
p2 : �J�������i�[�����z��ϐ�
p3 : �J�����̐�
p4 : �J�����̕����i�[�����z��ϐ�
p5(0) : �X�^�C�� 

%inst
p1�Ŏw�肵�����X�g�r���[�ɃJ������ݒu���܂��B
p2�͕�����^�Ap4�͐����^��1�����z��ϐ��łȂ���΂Ȃ�܂���B
p5�͍������A�E�����A�����������w�肷�邱�Ƃ��o���܂��B�ȗ����͍������ƂȂ�܂��B
^
	�l	:	����
	-----------------------
	0	:	������
	1	:	�E����
	2	:	��������

%sample
...
sql_open db
	sql_q "SELECT * FROM MyCPU;"

		rec_cnum = stat			//���R�[�h�̐�

		col_cnum = length(tmparr)	//�J�����̐�

		col_clis = sql_collist()	//�J�������X�g

		split col_clis, ",", col_clis	//�J�����̃��X�g��z��ϐ���

	myindata rec_cnum, col_cnum, col_clis, cpu�@	//�f�[�^�̃C���v�b�g

	column_w = 60, 60, 110, 85, 80, 80		//�J�����̕�


	mycrelv 550, 280, id_LVcpu, hLVcpu		//���X�g�r���[�ݒu
	myincol id_LVcpu, col_clis, col_cnum, column_w	//��i�J�����j�̐ݒu
	myinitem id_LVcpu, cpu, rec_cnum, col_cnum	//�A�C�e���̐ݒu


	oncmd gosub *notify, WM_NOTIFY
%href
mycrelv
myinitem
myindata
mygetitem
mydelitem


%group
�I�u�W�F�N�g���䖽��

%note
00_mylv.hsp��user32.as���C���N���[�h���邱��
%index
myindata
SQLele(SQLite)����f�[�^�擾

%prm
p1,p2,p3,p4
p1 : ���R�[�h�̐�
p2 : �J�����̐�
p3 : �J�������i�[�����z��ϐ�
p4 : ���R�[�h���󂯎��z��ϐ�

%inst
������^��1���z����o�͂���}�N���`���̖��߂ł��B
sqlele.hsp���C���N���[�h���Ă���ꍇ�ɂ̂ݎg�����Ƃ��ł��܂��B
^
sqlele��sql_q���ߌ�Ɋe�퐔�l���擾���Ă��������B���̒l�����ƂɃ��R�[�h�𕶎���^��1�����z��ϐ��Ƃ��ė^����ꂽ�ϐ��Ɋi�[���Ă����܂��B
^
���R�[�h���󂯎�邽�߂̔z��ϐ��͂����g�ł��炩���ߗp�ӂ��Ă����K�v������܂��B�܂��A�K�͂ɂ����܂����A���R�[�h���󂯎��z��ϐ��͂��̃o�b�t�@�T�C�Y��傫�߂Ɋm�ۂ��Ă��������B


(�Q�l)
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

		rec_cnum = stat			//���R�[�h�̐�

		col_cnum = length(tmparr)	//�J�����̐�

		col_clis = sql_collist()	//�J�������X�g

		split col_clis, ",", col_clis	//�J�����̃��X�g��z��ϐ���

	myindata rec_cnum, col_cnum, col_clis, cpu�@	//�f�[�^�̃C���v�b�g

	column_w = 60, 60, 110, 85, 80, 80		//�J�����̕�


	mycrelv 550, 280, id_LVcpu, hLVcpu		//���X�g�r���[�ݒu
	myincol id_LVcpu, col_clis, col_cnum, column_w	//��i�J�����j�̐ݒu
	myinitem id_LVcpu, cpu, rec_cnum, col_cnum	//�A�C�e���̐ݒu


	oncmd gosub *notify, WM_NOTIFY

%href
mycrelv
myincol
myinitem
mydelitem
mygetitem

%group
�I�u�W�F�N�g���䖽��

%note
00_mylv.hsp��sqlele.hsp���C���N���[�h���邱��
%index
myinitem
���X�g�r���[�ɃA�C�e���ǉ�

%prm
p1,p2,p3,p4
p1 : �ݒu�������X�g�r���[�̃I�u�W�F�N�gID
p2 : �A�C�e�����i�[�����z��ϐ�
p3 : ���R�[�h�̐�
p4 : �J�����̐�

%inst
p2�ŃA�C�e�����i�[����������^��1�����z��ϐ����Ap4�ŃJ�����̐������ꂼ��w�肵�܂��B
p3�Ŏw�肵�����R�[�h�̐��������R�[�h�̒ǉ����s�Ȃ��}�N���`���̖��߂ł��B
�}�N���ɂ��l�X�g����repeat�ŃA�C�e����A�����Ēǉ����Ă����܂��B
^
�܂��ACSV�`���̃t�@�C����������^��1�����z��ɂ��邱�ƂőΉ��ł��܂��B


(�Q�l)
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

		rec_cnum = stat			//���R�[�h�̐�

		col_cnum = length(tmparr)	//�J�����̐�

		col_clis = sql_collist()	//�J�������X�g

		split col_clis, ",", col_clis	//�J�����̃��X�g��z��ϐ���

	myindata rec_cnum, col_cnum, col_clis, cpu�@	//�f�[�^�̃C���v�b�g

	column_w = 60, 60, 110, 85, 80, 80		//�J�����̕�


	mycrelv 550, 280, id_LVcpu, hLVcpu		//���X�g�r���[�ݒu
	myincol id_LVcpu, col_clis, col_cnum, column_w	//��i�J�����j�̐ݒu
	myinitem id_LVcpu, cpu, rec_cnum, col_cnum	//�A�C�e���̐ݒu


	oncmd gosub *notify, WM_NOTIFY
%href
mycrelv
myincol
myindata
mygetitem
mydelitem

%group
�I�u�W�F�N�g���䖽��

%note
00_mylv.hsp��user32.as���C���N���[�h���邱��

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


