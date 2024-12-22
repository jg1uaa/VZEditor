;****************************
;	'msg.asm'
;****************************

	include	vz.inc

	hseg

;--- Messages ---

GDATA idword	label	byte
IFDEF PC98
		db	'98'
ENDIF
IFDEF DOSV
		db	'DOSV'
ENDIF
IFDEF J31
		db	'J31'
ENDIF
IFDEF IBMAX
		db	'AX'
ENDIF
IFDEF JBM
		db	'PS55'
ENDIF
IFDEF US
		db	'US'
ENDIF
		db	0

IFNDEF MSG_US
GDATA mg_ask,	db,	<'���H (Y/N) ',0>
GDATA message,	db,	0
		db	2,'�͌�����܂���. �V�K�t�@�C���ł�',0	;1
		db	3,'�͓��͂ł��܂���',0				;2
		db	3,'�͏o�͂ł��܂���',0				;3
		db	'�e���|�����t�@�C���G���[',0			;4
		db	'���C���o�b�t�@�������ς��ł�',0		;5
		db	'�I�[�v���ł��܂���',0				;6
		db	'�f�B�X�N�������ς��ł�',0			;7
		db	'�e�L�X�g�̈悪�����ς��ł�',0			;8
		db	'�u���b�N���傫�����܂�',0			;9
		db	'������������܂���',0				;10
		db	'�o�b�t�@�������ς��ł�',0			;11
		db	'COMMAND.COM���N���ł��܂���',0			;12
		db	'�J�X�^�}�C�Y�G���[',0				;13
		db	2,'���o�͂��܂�',0				;14
		db	3,'���o�͒� ...',0				;15
		db	'�C���e�L�X�g���o�͂��܂�',0			;16
		db	'�e�L�X�g�X�^�b�N���������܂�',0		;17
		db	'�G�f�B�^���I�����܂�',0			;18
		db	'�����񂪌�����܂���',0			;19
		db	'�S����x�ɒu�����܂�',0			;20
		db	'�u�����܂�',0					;21
		db	1,'%5u �̕������u�����܂���',0		;22
		db	'�J�[�\���L�[�ňʒu���ړ�����'			;23
IFDEF PC98
		db	'[����]',0
ELSE
		db	'[Enter]',0
ENDIF
		db	'��v���܂���',0				;24
		db	'���Ⴊ����܂�',0				;25
		db	'���ʂ�������܂���',0			;26
		db	2,'�̓I�[�v������Ă��܂�',0			;27
		db	'�}�[�N���܂���',0				;28
		db	1,'%5u ���ړǂݍ��݂܂���.�i%d bytes free�j',0  ;29
		db	2,'�͂��łɑ��݂��܂�',0			;30
		db	2,'�͖����ȃp�X���ł�',0			;31
		db	2,'�̓��[�h�I�����[�ł�',0			;32
		db	'�V�K�t�@�C���ł�',0				;33
		db	3,'�͂��łɑ��݂��܂�. �o�͂��܂�',0		;34
		db	3,'�͑��݂��܂���. �V���ɍ쐬���܂�',0		;35
		db	'�ύX�ł��܂���',0				;36
		db	'�ҏW�e�L�X�g��������܂�',0			;37
		db 	1,'%u �̃t�@�C�����폜���܂�.��낵���ł�',0	;38

GDATA mg_exit,	db,	<'EXIT�ŃG�f�B�^�֖߂�܂�',CR,LF,'$'>
GDATA mg_install,db,	<'�������ɏ풓���܂���.'>
GDATA mg_tsr2,	db,	<'�i-z�ŉ���j',CR,LF,'$'>
GDATA mg_nospc,	db,	<'������������܂���.',CR,LF,'$'> ; ##155.85

GDATA mg_harderr label byte			; ##151.08
		db	'�����݋֎~�ł�',0
		db	'�w�肪�Ⴂ�܂�',0
		db	'�������ł��Ă��܂���',0
		db	'�n�[�h�G���[#%d�ł�',0
GDATA mg_drive,	db,	<'�h���C�u%c:��',0>
GDATA mg_abort,	db,	<' (Abort/Retry)? ',0>

;
ELSE
GDATA mg_ask,	db,	<'? (Y/N) ',0>
GDATA message,	db,	0
		db	2,' not found. New file',0			;1
		db	2,' is unreadable.',0				;2
		db	3,' is unwriteable.',0				;3
		db	'Temporary file error.',0			;4
		db	'Line too long.',0				;5
		db	'Too many open files.',0			;6
		db	'Disk full.',0					;7
		db	'Text buffer full.',0				;8
		db	'Block too large.',0				;9
		db	'Out of memory.',0				;10
		db	'Buffer full.',0				;11
		db	'Cannot execute shell.',0			;12
		db	'Customization error.',0			;13
		db	2,' not saved. Save',0				;14
		db	3,' Saving ...',0				;15
		db	'Save modified files',0				;16
		db	'Clear text stack',0				;17
		db	'Quit from editor',0				;18
		db	'Strings not found',0				;19
		db	'Replace all',0					;20
		db	'Replace',0					;21
		db	1,'Replace %5u strings.',0			;22
		db	'Move position & hit [Enter].',0		;23
		db	'No differenece.',0				;24
		db	'Differenece encountered.',0			;25
		db	'Braces not found.',0				;26
		db	2,' is here.',0					;27
		db	'Set marker.',0					;28
		db	1,'Read %5u terms. (%d bytes free)',0		;29
		db	2,' already exist.',0				;30
		db	2,' is an invalid pass.',0			;31
		db	2,' is read only',0				;32
		db	'New file.',0					;33
		db	3,' already exist. Overwrite',0			;34
		db	3,' not found. Create',0			;35
		db	'Cannot change',0				;36
		db	'Abandon Edit',0				;37
		db	1,'Delete %u files. Sure',0			;38

GDATA mg_exit,	db	<'Type EXIT to return.',CR,LF,'$'>
GDATA mg_install,db	<'installed.'>
GDATA mg_tsr2,	db	<'(-z to remove)',CR,LF,'$'>
GDATA mg_nospc,	db,	<'Out of memory.',CR,LF,'$'>

GDATA mg_harderr label byte			; ##151.08
		db	'write protected',0
		db	'not exist',0
		db	'not ready',0
		db	'hard error #%d',0
GDATA mg_drive,	db,	<'Drive %c: is ',0>
GDATA mg_abort,	db,	<' (Abort/Retry)? ',0>

ENDIF

;--- Graphic char table ---

IFDEF PC98
GDATA grctbl,	db,	<95h,96h,98h,99h,9Ah,9Bh,88h,97h,1Ch,1Fh,1Dh>
ELSE
  IFDEF JBM
GDATA grctbl,	db,	<06h,05h,01h,02h,03h,04h,08h,09h,1Eh,1Bh,1Fh>
  ELSE
GDATA grctbl,	db,	<0C4h,0B3h,0DAh,0BFh,0C0h,0D9h,0DDh,0DEh,1Ah,19h,11h>
  ENDIF
ENDIF
		db	0

IFNDEF MSG_US
GDATA sym_page,db,	<'�o�b�r��'>
ELSE
GDATA sym_page,db,	<'PgCmSt[]'>
ENDIF
		db	0

IFDEF IBM
GDATA grctbl2,	db,	<0C4h,0B3h,0DAh,0BFh,0C0h,0D9h,0DDh,0DEh,1Ah,19h,11h>
ENDIF
	endhs

_tail		segment

;--- Startup messages  ---

IFNDEF MSG_US
GDATA mg_remove,db,	<'��������������܂���.',CR,LF,'$'>
GDATA mg_rmerr,	db,	<'�ҏW���̃e�L�X�g������܂�.',CR,LF,'$'>
GDATA mg_noent,	db,	<'"��������܂���.$'>
;GDATA mg_update,db,	<'"���X�V���܂���.',CR,LF,'$'>
GDATA mg_synerr,db,	<'Syntax Error: $'>
GDATA mg_opterr,db,	<'Option Error: $'>
GDATA mg_cstmerr,db,	<CR,LF,'�J�X�^�}�C�Y�G���['>
GDATA mg_ctrl_c,db,	<'�iCTRL-C�Œ��~�j$'>
GDATA mg_ems,	db,	<'�d�l�r���ő�'>
GDATA mg_emspage,db,	<'0000 �y�[�W�g�p���܂�.',CR,LF,'$'>
GDATA mg_xms,	db,	<'�w�l�r���ő�'>
GDATA mg_xmssize,db,	<'000000 �j�a�g�p���܂�.',CR,LF,'$'>
GDATA mg_verng,	db,	<'�o�[�W�������Ⴂ�܂�.',CR,LF,'$'>

ELSE
GDATA mg_remove,db,	<'removed.',CR,LF,'$'>
GDATA mg_rmerr,	db,	<'Exist open files.',CR,LF,'$'>
GDATA mg_noent,	db,	<'" not found.$'>
;GDATA mg_update,db,	<'" was updated.',CR,LF,'$'>
GDATA mg_synerr,db,	<'Syntax Error: $'>
GDATA mg_opterr,db,	<'Option Error: $'>
GDATA mg_cstmerr,db,	<CR,LF,'Customization error.'>
GDATA mg_ctrl_c,db,	<' (Ctrl-C to break)$'>
GDATA mg_ems	,db,	<'Allocate'>
GDATA mg_emspage,db,	<'00000 pages on EMS.',CR,LF,'$'>
GDATA mg_xms	,db,	<'Allocate'>
GDATA mg_xmssize,db,	<'00000 KB    on XMS.',CR,LF,'$'>
GDATA mg_verng,	db,	<'Illegal version.',CR,LF,'$'>

ENDIF
GDATA mg_hardng,db,	<'Illegal mode!',CR,LF,7,'$'>

GDATA mg_title,	label,	byte
IFNDEF MSG_US
		db	'�uZ Editor '
ELSE
		db	'VZ Editor '
ENDIF
IFDEF J31
	      db	'J-3100 '
ENDIF
IFDEF IBMAX
	      db	'AX '
ENDIF
IFDEF DOSV
  IFDEF MSG_US
	      db	'DOS/V '
  ELSE
	      db	'DOS/V(JP) '
  ENDIF
ENDIF
IFDEF JBM
	      db	'PS/55 '
ENDIF
IFDEF US
	      db	'IBM PC '
ENDIF
IFDEF MINI
		db	'(S) '
ENDIF
IFDEF SLIM
		db	'(L) '
ENDIF
		db	'Version 1.60 '
		db	' Copyright (C) 1989-93 by c.mos'
GDATA mg_crlf,	db,	<CR,LF,'$'>

		even
GDATA code_end,	label,	near
_tail		ends

	end
