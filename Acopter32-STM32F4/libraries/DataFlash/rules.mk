# Standard things
sp := $(sp).x
dirstack_$(sp) := $(d)
d := $(dir)
BUILDDIRS += $(BUILD_PATH)/$(d)

# Local flags
CFLAGS_$(d) := 

# Local rules and targets
cSRCS_$(d) :=

cppSRCS_$(d) :=
#cppSRCS_$(d) += DataFlash_APM1.cpp
#cppSRCS_$(d) += DataFlash_APM2.cpp
cppSRCS_$(d) += DataFlash_Block.cpp
#cppSRCS_$(d) += DataFlash_Empty.cpp
#cppSRCS_$(d) += DataFlash_VRBRAIN.cpp
cppSRCS_$(d) += DataFlash_REVOMINI.cpp
#cppSRCS_$(d) += DataFlash_SITL.cpp
#cppSRCS_$(d) += DataFlash_File.cpp
cppSRCS_$(d) += LogFile.cpp

cFILES_$(d) := $(cSRCS_$(d):%=$(d)/%)
cppFILES_$(d) := $(cppSRCS_$(d):%=$(d)/%)

OBJS_$(d) := $(cFILES_$(d):%.c=$(BUILD_PATH)/%.o) \
             $(cppFILES_$(d):%.cpp=$(BUILD_PATH)/%.o)
DEPS_$(d) := $(OBJS_$(d):%.o=%.d)

$(OBJS_$(d)): TGT_CFLAGS := $(CFLAGS_$(d))

TGT_BIN += $(OBJS_$(d))

# Standard things
-include $(DEPS_$(d))
d := $(dirstack_$(sp))
sp := $(basename $(sp))