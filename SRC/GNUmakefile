# SPDX-License-Identifier: WTFPL

# usage: gmake hard={98,j31,ibm,ibmj,ax,55,us(default)} (clean)

ASM = ./emu2 masm.exe
LINK = ./emu2 link.exe
EXE2BIN = ./emu2 exe2bin.exe

hard ?= us

ifeq ($(hard), 98)
	HW_NAME =
	ASM_FLAGS = /dPC98
endif
ifeq ($(hard), j31)
	HW_NAME = j31
	ASM_FLAGS = /dJ31
endif
ifeq ($(hard), ibm)
	HW_NAME = ibm
	ASM_FLAGS = /dIBMV
endif
ifeq ($(hard), ibmj)
	HW_NAME = ibmj
	ASM_FLAGS = /dIBMJ
endif
ifeq ($(hard), ax)
	HW_NAME = ax
	ASM_FLAGS = /dIBMAX
endif
ifeq ($(hard), 55)
	HW_NAME = 55
	ASM_FLAGS = /dJBM
endif
ifeq ($(hard), us)
	HW_NAME = us
	ASM_FLAGS = /dUS
endif

ASM_FLAGS += /ml

LINK_FLAGS = /m /noi
LINK_LIST = vz.lnk

VMAP_SRC = vmap.asm
VMAP_OBJ = $(addsuffix .obj, $(basename $(VMAP_SRC)))
VMAP_EXE = $(addsuffix .exe, $(basename $(VMAP_SRC)))
VMAP_COM = $(addsuffix .com, $(basename $(VMAP_SRC)))

ZCOPY_SRC = zcopy.asm
ZCOPY_OBJ = $(addsuffix .obj, $(basename $(ZCOPY_SRC)))
ZCOPY_EXE = $(addsuffix .exe, $(basename $(ZCOPY_SRC)))
ZCOPY_COM = $(addsuffix .com, $(basename $(ZCOPY_SRC)))

VZSEL_SRC = vzsel.asm
VZSEL_OBJ = $(addsuffix .obj, $(basename $(VZSEL_SRC)))
VZSEL_EXE = $(addsuffix .exe, $(basename $(VZSEL_SRC)))
VZSEL_COM = $(addsuffix .com, $(basename $(VZSEL_SRC)))

VZ_SRC = main.asm alias.asm char.asm core.asm disp.asm dos.asm expr.asm \
	filer.asm gets.asm harderr.asm inst.asm key.asm ledit.asm macro.asm \
	memo.asm menu.asm misc.asm open.asm printf.asm scrn.asm smooth.asm \
	string.asm text.asm view.asm wind.asm swap.asm ems.asm xscr.asm msg.asm
VZ_OBJ = $(addsuffix .obj, $(basename $(VZ_SRC)))
VZ_BASE = vz$(HW_NAME)
VZ_EXE = $(VZ_BASE).exe
VZ_COM = $(VZ_BASE).com

all: $(VMAP_COM) $(ZCOPY_COM) $(VZSEL_COM) $(VZ_COM)

$(VMAP_COM): $(VMAP_EXE)
$(VMAP_EXE): $(VMAP_OBJ)
	$(LINK) $(LINK_FLAGS) "$(basename $<),$(basename $<);"

$(ZCOPY_COM): $(ZCOPY_EXE)
$(ZCOPY_EXE): $(ZCOPY_OBJ)
	$(LINK) $(LINK_FLAGS) "$(basename $<),$(basename $<);"

$(VZSEL_COM): $(VZSEL_EXE)
$(VZSEL_EXE): $(VZSEL_OBJ)
	$(LINK) $(LINK_FLAGS) "$(basename $<),$(basename $<);"

$(VZ_COM): $(VZ_EXE)
$(VZ_EXE): $(VZ_OBJ)
	$(LINK) $(LINK_FLAGS) "@$(LINK_LIST),$(VZ_BASE),$(VZ_BASE);"

clean:
	$(RM) *.obj *.map \
		$(VMAP_COM) $(VMAP_EXE) $(ZCOPY_COM) $(ZCOPY_EXE) \
		$(VZSEL_COM) $(VZSEL_EXE) $(VZ_COM) $(VZ_EXE)

.SUFFIXES: .obj .asm .exe .com

.asm.obj:
	$(ASM) $(ASM_FLAGS) "$<,$@;"
.exe.com:
	$(EXE2BIN) $< $@
