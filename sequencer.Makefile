

#where_am_I := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

include $(REQUIRE_TOOLS)/driver.makefile

#APP:=modbusApp
#APPDB:=$(APP)/Db
#APPSRC:=$(APP)/src

#USR_INCLUDES += -I$(where_am_I)/$(APPSRC)

#TEMPLATES += $(wildcard $(APPDB)/*.template)


#SOURCES   += $(APPSRC)/modbusInterpose.c
#SOURCES   += $(APPSRC)/drvModbusAsyn.c
#DBDS      += $(APPSRC)/modbusSupport.dbd
#HEADERS   += $(APPSRC)/drvModbusAsyn.h


# 
#USR_CFLAGS   += -Wno-unused-variable
#USR_CFLAGS   += -Wno-unused-function
#USR_CPPFLAGS += -Wno-unused-variable
#USR_CPPFLAGS += -Wno-unused-function

#
#
# The following lines must be updated according to your sequencer
#
# Examples...
# 
# USR_CFLAGS += -fPIC
# USR_CFLAGS   += -DDEBUG_PRINT
# USR_CPPFLAGS += -DDEBUG_PRINT
# USR_CPPFLAGS += -DUSE_TYPED_RSET
# USR_INCLUDES += -I/usr/include/libusb-1.0
# USR_LDFLAGS += -lusb-1.0

# USR_LDFLAGS += -L /opt/etherlab/lib
# USR_LDFLAGS += -lethercat
# USR_LDFLAGS += -Wl,-rpath=/opt/etherlab/lib
#
#
# PCIAPP:= pciApp
#
# HEADERS += $(PCIAPP)/devLibPCI.h
# HEADERS += $(PCIAPP)/devLibPCIImpl.h

# SOURCES += $(wildcard $(PCIAPP)/devLib*.c)
# SOURCES += $(PCIAPP)/pcish.c
# SOURCES_Linux += $(PCIAPP)/os/Linux/devLibPCIOSD.c

# DBDS += $(PCIAPP)/epicspci.dbd

# MRMSHARED:= mrmShared
# MRMSHAREDSRC:=$(MRMSHARED)/src
# MRMSHAREDDB:=$(MRMSHARED)/Db
# TEMPLATES += $(wildcard $(MRMSHAREDDB)/*.db)
# TEMPLATES += $(wildcard $(MRMSHAREDDB)/*.template)
# TEMPLATES += $(wildcard $(MRMSHAREDDB)/*.substitutions)

