where_am_I := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

include $(REQUIRE_TOOLS)/driver.makefile



SEQUENCER:=src
SEQUENCERDEV:=$(SEQUENCER)/dev
SEQUENCERLEMON:=$(SEQUENCER)/lemon
SEQUENCERPV:=$(SEQUENCER)/pv
SEQUENCERSEQ:=$(SEQUENCER)/seq
SEQUENCERSNC:=$(SEQUENCER)/snc

USR_INCLUDES += -I$(where_am_I)/$(SEQUENCERCOMMON)
USR_INCLUDES += -I$(where_am_I)/$(SEQUENCERPV)
USR_INCLUDES += -I$(where_am_I)/$(SEQUENCERSEQUENCER)
USR_INCLUDES += -I$(where_am_I)/$(SEQUENCERSNC)


SEQ_VER=2.1.21


DBDS = $(SEQUENCERDEV)/devSequencer.dbd

HEADERS += $(SEQUENCERPV)/pv.h
HEADERS += $(SEQUENCERPV)/pvAlarm.h
HEADERS += $(SEQUENCERPV)/pvType.h

HEADERS += $(SEQUENCERSEQ)/seqCom.h
HEADERS += $(SEQUENCERSEQ)/seqStats.h
HEADERS += seq_release.h


devSequencer.o: seq_release.h lemon

seq_SRCS += seq_main.c
seq_SRCS += seq_task.c
seq_SRCS += seq_ca.c
seq_SRCS += seq_if.c
seq_SRCS += seq_mac.c
seq_SRCS += seq_prog.c
seq_SRCS += seq_qry.c
seq_SRCS += seq_cmd.c
seq_SRCS += seq_queue.c


SOURCES += $(SEQUENCERSEQ)/seq_main.c
SOURCES += $(SEQUENCERSEQ)/seq_task.c
SOURCES += $(SEQUENCERSEQ)/seq_ca.c
SOURCES += $(SEQUENCERSEQ)/seq_if.c
SOURCES += $(SEQUENCERSEQ)/seq_mac.c
SOURCES += $(SEQUENCERSEQ)/seq_prog.c
SOURCES += $(SEQUENCERSEQ)/seq_qry.c
SOURCES += $(SEQUENCERSEQ)/seq_cmd.c
SOURCES += $(SEQUENCERSEQ)/seq_queue.c

SOURCES += $(SEQUENCERPV)/pv.cc
SOURCES += $(SEQUENCERPV)/pvNew.cc
SOURCES += $(SEQUENCERPV)/pvCa.cc

SOURCES += $(SEQUENCERDEV)/devSequencer.c


seq_release.h:
	$(RM) $@
	$(PERL) $(where_am_I)/$(SEQUENCERSEQ)/seq_release.pl $(SEQ_VER) > $@


# #BINS += snc
# # STARTUPS = -none-

# vpath %.c  $(where_am_I)/$(SEQUENCERSNC)
# vpath %.h  $(where_am_I)/$(SEQUENCERSNC)


# O.snc/%.o: %.c
# 	${QUIET}${MKDIR} -p $(dir $@)
# 	$(COMPILE.c) -c -o $@ $<

# O.snc/snl.o: O.snc/snl.c
# 	${QUIET}${MKDIR} -p $(dir $@)
# 	$(COMPILE.c) -c -o $@ $<

# USR_INCLUDES += -IO.snc
# USR_CPPFLAGS += -DPVCA


# snc: $(addprefix O.snc/,$(patsubst %.c,%.o,snl.c main.c expr.c var_types.c analysis.c gen_code.c gen_ss_code.c gen_tables.c sym_table.c builtin.c lexer.c))
# 	${QUIET}${MKDIR} -p $(dir $@)
# 	#$(LINK.cpp) $(filter %.o, $^)
# 	$(CCC) -o $@ -L ${EPICS_BASE_LIB} -Wl,-rpath,${EPICS_BASE_LIB} ${ARCH_DEP_LDFLAGS} -lCom $(filter %.o, $^)


# # 
# # is re2c the target indepdent?
# #
# lexer.c: $(where_am_I)/$(SEQUENCERSEQ)/snl.re O.snc/snl.h
# 	re2c -s -b -o $@ $<

# 
# lemon is called in the host, so the hard-coded gcc, which is the host
# If one changes it to $(COMPILE.c), the compiling process fails. 
lemon: $(where_am_I)/$(SEQUENCERLEMON)/lemon.c
	gcc  -o $@ $^

# O.snc/snl.c O.snc/snl.h: $(addprefix $(where_am_I)/$(SEQUENCERSEQ)/, snl.lem snl.lt) lemon
# 	${QUIET}${MKDIR} -p $(dir $@)
# 	$(RM) O.snc/snl.c O.snc/snl.h
# 	./lemon o=O.snc $<

