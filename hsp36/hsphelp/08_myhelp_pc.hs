;
;	my_func.hsp�p HELP�\�[�X�t�@�C��
;	�����	: 2022/09/19
;	�����	: �䂸��ɂ���
;	Twitter	: https://twitter.com/YUZRANIUM
;

%date
2022/09/19
%author
�䂸��ɂ���
%url
https://twitter.com/YUZRANIUM
%dll
my_func.hsp
user32.as
%type
���[�U�[��`����
%ver
1.0
%port
Win
%note
my_func.hsp��user32.as���C���N���[�h���邱��


%index
My_COLORREF
�J���[�ϊ�
%group
��ʐ��䖽��
%prm
p1,p2,p3
p1,p2,p3=R�l,G�l,B�l
%inst
RGB�̐F�f�[�^��COLORREF�^�̃f�[�^�ɕϊ����܂��B
%href
SetColorRef



%index
mycolor
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
�W����color���߂�objcolor���߂̗��������˔����Ă���p4�p�����[�^�łǂ��炩�̐؂�ւ��A�܂��͗����g�p���邱�Ƃ��ł��܂��B
^
	�l : ����
	----------------
	 0 : color����
	 1 : objcolor����
	 2 : ����

%href
color
objcolor


%index
SetToolTips
�c�[���`�b�v�R���g���[��
%group
�g���I�u�W�F�N�g���䖽��
%prm
p1
p1=�X�^�C���̎w��
%inst
�c�[���`�b�v�R���g���[�����쐬���܂��B�ŏ���1�x�����Ă�ł��������B
stat�ɂ́A�c�[���`�b�v�R���g���[���̃I�u�W�F�N�gID���Ԃ�܂��B
p1�̓X�^�C���̎w��ł��B���ׂẴc�[���`�b�v�ɓK�p�����`�ɂȂ�܂��B
�ȉ��̐��l��g�ݍ��킹�Ă��������B���w��̏ꍇ�͕��ʂ̃c�[���`�b�v���\������܂��B
^
	�l  : ����
	----------------
	$1  : ���E�B���h�E���A�N�e�B�u�ɂȂ��Ă��Ȃ��ꍇ�ł���Ƀc�[���`�b�v��\��.
	$40 : �c�[���`�b�v���o���[���^�C�v�ŕ\��.�i�vIE5�ȍ~�j

%href
AddToolTips

%index
AddToolTips
�c�[���`�b�v�̓o�^
%group
�g���I�u�W�F�N�g���䖽��
%prm
p1,"������",p2
p1=�c�[���`�b�v��\������I�u�W�F�N�gID
"������"=�c�[���`�b�v�ɕ\�������镶����.
p2=�c�[���`�b�v���I�u�W�F�N�g�̐^���ɕ\��.�i$2���w��j
%inst
�c�[���`�b�v�R���g���[���ɕ\���������o�^���܂��B
�w�肵���I�u�W�F�N�g�Ƀc�[���`�b�v���\������܂��B�������64�o�C�g���̗̈���ꉞ�p�ӂ��Ă��܂��B
%href
SetToolTips