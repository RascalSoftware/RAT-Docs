###########################################################################
## Makefile generated for MATLAB file/project 'standardTF_custlay_parallel'. 
## 
## Makefile     : standardTF_custlay_parallel_rtw.mk
## Generated on : Fri Dec 08 11:06:21 2017
## MATLAB Coder version: 3.2 (R2016b)
## 
## Build Info:
## 
## Final product: $(RELATIVE_PATH_TO_ANCHOR)/standardTF_custlay_parallel.a
## Product type : static-library
## 
###########################################################################

###########################################################################
## MACROS
###########################################################################

# Macro Descriptions:
# PRODUCT_NAME            Name of the system to build
# MAKEFILE                Name of this makefile
# COMPUTER                Computer type. See the MATLAB "computer" command.

PRODUCT_NAME              = standardTF_custlay_parallel
MAKEFILE                  = standardTF_custlay_parallel_rtw.mk
COMPUTER                  = GLNXA64
MATLAB_ROOT               = /usr/local/MATLAB/R2016b
MATLAB_BIN                = /usr/local/MATLAB/R2016b/bin
MATLAB_ARCH_BIN           = /usr/local/MATLAB/R2016b/bin/glnxa64
MASTER_ANCHOR_DIR         = 
START_DIR                 = /home/arwel/Documents/RascalDev/RAT/targetFunctions/standard_TF/standardTF_custlay_parallel
ARCH                      = glnxa64
RELATIVE_PATH_TO_ANCHOR   = .
ANSI_OPTS                 = -ansi -pedantic -Wno-long-long -fwrapv
CPP_ANSI_OPTS             = -std=c++98 -pedantic -Wno-long-long -fwrapv

###########################################################################
## TOOLCHAIN SPECIFICATIONS
###########################################################################

# Toolchain Name:          GNU gcc/g++ v4.4.x | gmake (64-bit Linux)
# Supported Version(s):    4.4.x
# ToolchainInfo Version:   R2016b
# Specification Revision:  1.0
# 
#-------------------------------------------
# Macros assumed to be defined elsewhere
#-------------------------------------------

# ANSI_OPTS
# CPP_ANSI_OPTS

#-----------
# MACROS
#-----------

WARN_FLAGS         = -Wall -W -Wwrite-strings -Winline -Wstrict-prototypes -Wnested-externs -Wpointer-arith -Wcast-align
WARN_FLAGS_MAX     = $(WARN_FLAGS) -Wcast-qual -Wshadow
CPP_WARN_FLAGS     = -Wall -W -Wwrite-strings -Winline -Wpointer-arith -Wcast-align
CPP_WARN_FLAGS_MAX = $(CPP_WARN_FLAGS) -Wcast-qual -Wshadow

TOOLCHAIN_SRCS = 
TOOLCHAIN_INCS = 
TOOLCHAIN_LIBS = 

#------------------------
# BUILD TOOL COMMANDS
#------------------------

# C Compiler: GNU C Compiler
CC = gcc

# Linker: GNU Linker
LD = gcc

# C++ Compiler: GNU C++ Compiler
CPP = g++

# C++ Linker: GNU C++ Linker
CPP_LD = g++

# Archiver: GNU Archiver
AR = ar

# MEX Tool: MEX Tool
MEX_PATH = $(MATLAB_BIN)
MEX = $(MEX_PATH)/mex

# Download: Download
DOWNLOAD =

# Execute: Execute
EXECUTE = $(PRODUCT)

# Builder: GMAKE Utility
MAKE_PATH = %MATLAB%/bin/glnxa64
MAKE = $(MAKE_PATH)/gmake


#-------------------------
# Directives/Utilities
#-------------------------

CDEBUG              = -g
C_OUTPUT_FLAG       = -o
LDDEBUG             = -g
OUTPUT_FLAG         = -o
CPPDEBUG            = -g
CPP_OUTPUT_FLAG     = -o
CPPLDDEBUG          = -g
OUTPUT_FLAG         = -o
ARDEBUG             =
STATICLIB_OUTPUT_FLAG =
MEX_DEBUG           = -g
RM                  = @rm -f
ECHO                = @echo
MV                  = @mv
RUN                 =

#----------------------------------------
# "Faster Builds" Build Configuration
#----------------------------------------

ARFLAGS              = ruvs
CFLAGS               = -c $(ANSI_OPTS) -fPIC \
                       -O0
CPPFLAGS             = -c $(CPP_ANSI_OPTS) -fPIC \
                       -O0
CPP_LDFLAGS          = -Wl,-rpath,"$(MATLAB_ARCH_BIN)",-L"$(MATLAB_ARCH_BIN)"
CPP_SHAREDLIB_LDFLAGS  = -shared -Wl,-rpath,"$(MATLAB_ARCH_BIN)",-L"$(MATLAB_ARCH_BIN)" -Wl,--no-undefined
DOWNLOAD_FLAGS       =
EXECUTE_FLAGS        =
LDFLAGS              = -Wl,-rpath,"$(MATLAB_ARCH_BIN)",-L"$(MATLAB_ARCH_BIN)"
MEX_CFLAGS           = -MATLAB_ARCH=$(ARCH) $(INCLUDES) \
                         \
                       COPTIMFLAGS="$(ANSI_OPTS)  \
                       -O0 \
                        $(DEFINES)" \
                         \
                       -silent
MEX_LDFLAGS          = LDFLAGS=='$$LDFLAGS'
MAKE_FLAGS           = -f $(MAKEFILE)
SHAREDLIB_LDFLAGS    = -shared -Wl,-rpath,"$(MATLAB_ARCH_BIN)",-L"$(MATLAB_ARCH_BIN)" -Wl,--no-undefined

#--------------------
# File extensions
#--------------------

H_EXT               = .h
OBJ_EXT             = .o
C_EXT               = .c
EXE_EXT             =
SHAREDLIB_EXT       = .so
HPP_EXT             = .hpp
OBJ_EXT             = .o
CPP_EXT             = .cpp
EXE_EXT             =
SHAREDLIB_EXT       = .so
STATICLIB_EXT       = .a
MEX_EXT             = .mexa64
MAKE_EXT            = .mk


###########################################################################
## OUTPUT INFO
###########################################################################

PRODUCT = $(RELATIVE_PATH_TO_ANCHOR)/standardTF_custlay_parallel.a
PRODUCT_TYPE = "static-library"
BUILD_TYPE = "Static Library"

###########################################################################
## INCLUDE PATHS
###########################################################################

INCLUDES_BUILDINFO = -I$(START_DIR) -I/usr/local/MATLAB/R2015b/extern/include -I/usr/include/openmpi -I$(START_DIR)/codegen/lib/standardTF_custlay_parallel -I/home/arwel/eclipseWorkspace_new/matlabEngine_demo/src -I$(MATLAB_ROOT)/extern/include -I$(MATLAB_ROOT)/simulink/include -I$(MATLAB_ROOT)/rtw/c/src -I$(MATLAB_ROOT)/rtw/c/src/ext_mode/common -I$(MATLAB_ROOT)/rtw/c/ert

INCLUDES = $(INCLUDES_BUILDINFO)

###########################################################################
## DEFINES
###########################################################################

DEFINES_STANDARD = -DMODEL=standardTF_custlay_parallel -DHAVESTDIO -DUSE_RTMODEL -DUNIX

DEFINES = $(DEFINES_STANDARD)

###########################################################################
## SOURCE FILES
###########################################################################

SRCS = matlabCallFun.c $(START_DIR)/codegen/lib/standardTF_custlay_parallel/standardTF_custlay_parallel_data.c $(START_DIR)/codegen/lib/standardTF_custlay_parallel/standardTF_custlay_parallel_initialize.c $(START_DIR)/codegen/lib/standardTF_custlay_parallel/standardTF_custlay_parallel_terminate.c $(START_DIR)/codegen/lib/standardTF_custlay_parallel/standardTF_custlay_parallel.c $(START_DIR)/codegen/lib/standardTF_custlay_parallel/backSort.c $(START_DIR)/codegen/lib/standardTF_custlay_parallel/call_customLayers.c $(START_DIR)/codegen/lib/standardTF_custlay_parallel/groupLayers_Mod.c $(START_DIR)/codegen/lib/standardTF_custlay_parallel/rdivide.c $(START_DIR)/codegen/lib/standardTF_custlay_parallel/makeSLDProfiles.c $(START_DIR)/codegen/lib/standardTF_custlay_parallel/makeSLDProfileXY.c $(START_DIR)/codegen/lib/standardTF_custlay_parallel/sum.c $(START_DIR)/codegen/lib/standardTF_custlay_parallel/asymconvstep.c $(START_DIR)/codegen/lib/standardTF_custlay_parallel/sqrt.c $(START_DIR)/codegen/lib/standardTF_custlay_parallel/erf.c $(START_DIR)/codegen/lib/standardTF_custlay_parallel/resampleLayers.c $(START_DIR)/codegen/lib/standardTF_custlay_parallel/resample_sld.c $(START_DIR)/codegen/lib/standardTF_custlay_parallel/mean.c $(START_DIR)/codegen/lib/standardTF_custlay_parallel/shiftdata.c $(START_DIR)/codegen/lib/standardTF_custlay_parallel/callReflectivity.c $(START_DIR)/codegen/lib/standardTF_custlay_parallel/abeles.c $(START_DIR)/codegen/lib/standardTF_custlay_parallel/chiSquared.c $(START_DIR)/codegen/lib/standardTF_custlay_parallel/standardTF_custlay_parallel_emxutil.c $(START_DIR)/codegen/lib/standardTF_custlay_parallel/standardTF_custlay_parallel_emxAPI.c $(START_DIR)/codegen/lib/standardTF_custlay_parallel/rt_nonfinite.c $(START_DIR)/codegen/lib/standardTF_custlay_parallel/rtGetNaN.c $(START_DIR)/codegen/lib/standardTF_custlay_parallel/rtGetInf.c

ALL_SRCS = $(SRCS)

###########################################################################
## OBJECTS
###########################################################################

OBJS = matlabCallFun.o standardTF_custlay_parallel_data.o standardTF_custlay_parallel_initialize.o standardTF_custlay_parallel_terminate.o standardTF_custlay_parallel.o backSort.o call_customLayers.o groupLayers_Mod.o rdivide.o makeSLDProfiles.o makeSLDProfileXY.o sum.o asymconvstep.o sqrt.o erf.o resampleLayers.o resample_sld.o mean.o shiftdata.o callReflectivity.o abeles.o chiSquared.o standardTF_custlay_parallel_emxutil.o standardTF_custlay_parallel_emxAPI.o rt_nonfinite.o rtGetNaN.o rtGetInf.o

ALL_OBJS = $(OBJS)

###########################################################################
## PREBUILT OBJECT FILES
###########################################################################

PREBUILT_OBJS = 

###########################################################################
## LIBRARIES
###########################################################################

LIBS = /usr/local/MATLAB/R2015b/bin/glnxa64/libeng.so /usr/local/MATLAB/R2015b/bin/glnxa64/libmx.so

###########################################################################
## SYSTEM LIBRARIES
###########################################################################

SYSTEM_LIBS =  -lm

###########################################################################
## ADDITIONAL TOOLCHAIN FLAGS
###########################################################################

#---------------
# C Compiler
#---------------

CFLAGS_ = -fopenmp -DOMPLIBNAME=$(MATLAB_ROOT)/sys/os/$(ARCH)/libiomp5.so
CFLAGS_BASIC = $(DEFINES) $(INCLUDES)

CFLAGS += $(CFLAGS_) $(CFLAGS_BASIC)

#-----------------
# C++ Compiler
#-----------------

CPPFLAGS_ = -fopenmp -DOMPLIBNAME=$(MATLAB_ROOT)/sys/os/$(ARCH)/libiomp5.so
CPPFLAGS_BASIC = $(DEFINES) $(INCLUDES)

CPPFLAGS += $(CPPFLAGS_) $(CPPFLAGS_BASIC)

#---------------
# C++ Linker
#---------------

CPP_LDFLAGS_ = -L$(MATLAB_ROOT)/sys/os/$(ARCH) -liomp5

CPP_LDFLAGS += $(CPP_LDFLAGS_)

#------------------------------
# C++ Shared Library Linker
#------------------------------

CPP_SHAREDLIB_LDFLAGS_ = -L$(MATLAB_ROOT)/sys/os/$(ARCH) -liomp5

CPP_SHAREDLIB_LDFLAGS += $(CPP_SHAREDLIB_LDFLAGS_)

#-----------
# Linker
#-----------

LDFLAGS_ = -L$(MATLAB_ROOT)/sys/os/$(ARCH) -liomp5

LDFLAGS += $(LDFLAGS_)

#--------------------------
# Shared Library Linker
#--------------------------

SHAREDLIB_LDFLAGS_ = -L$(MATLAB_ROOT)/sys/os/$(ARCH) -liomp5

SHAREDLIB_LDFLAGS += $(SHAREDLIB_LDFLAGS_)

###########################################################################
## INLINED COMMANDS
###########################################################################

###########################################################################
## PHONY TARGETS
###########################################################################

.PHONY : all build clean info prebuild download execute


all : build
	@echo "### Successfully generated all binary outputs."


build : prebuild $(PRODUCT)


prebuild : 


download : build


execute : download


###########################################################################
## FINAL TARGET
###########################################################################

#---------------------------------
# Create a static library         
#---------------------------------

$(PRODUCT) : $(OBJS) $(PREBUILT_OBJS) $(LIBS)
	@echo "### Creating static library "$(PRODUCT)" ..."
	$(AR) $(ARFLAGS)  $(PRODUCT) $(OBJS)
	@echo "### Created: $(PRODUCT)"


###########################################################################
## INTERMEDIATE TARGETS
###########################################################################

#---------------------
# SOURCE-TO-OBJECT
#---------------------

%.o : %.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.o : %.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.o : $(RELATIVE_PATH_TO_ANCHOR)/%.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.o : $(RELATIVE_PATH_TO_ANCHOR)/%.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.o : $(MATLAB_ROOT)/rtw/c/src/%.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.o : $(MATLAB_ROOT)/rtw/c/src/%.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.o : $(START_DIR)/%.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.o : $(START_DIR)/%.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.o : $(START_DIR)/codegen/lib/standardTF_custlay_parallel/%.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.o : $(START_DIR)/codegen/lib/standardTF_custlay_parallel/%.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.o : /home/arwel/eclipseWorkspace_new/matlabEngine_demo/src/%.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.o : /home/arwel/eclipseWorkspace_new/matlabEngine_demo/src/%.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


###########################################################################
## DEPENDENCIES
###########################################################################

$(ALL_OBJS) : $(MAKEFILE) rtw_proj.tmw


###########################################################################
## MISCELLANEOUS TARGETS
###########################################################################

info : 
	@echo "### PRODUCT = $(PRODUCT)"
	@echo "### PRODUCT_TYPE = $(PRODUCT_TYPE)"
	@echo "### BUILD_TYPE = $(BUILD_TYPE)"
	@echo "### INCLUDES = $(INCLUDES)"
	@echo "### DEFINES = $(DEFINES)"
	@echo "### ALL_SRCS = $(ALL_SRCS)"
	@echo "### ALL_OBJS = $(ALL_OBJS)"
	@echo "### LIBS = $(LIBS)"
	@echo "### MODELREF_LIBS = $(MODELREF_LIBS)"
	@echo "### SYSTEM_LIBS = $(SYSTEM_LIBS)"
	@echo "### TOOLCHAIN_LIBS = $(TOOLCHAIN_LIBS)"
	@echo "### CFLAGS = $(CFLAGS)"
	@echo "### LDFLAGS = $(LDFLAGS)"
	@echo "### SHAREDLIB_LDFLAGS = $(SHAREDLIB_LDFLAGS)"
	@echo "### CPPFLAGS = $(CPPFLAGS)"
	@echo "### CPP_LDFLAGS = $(CPP_LDFLAGS)"
	@echo "### CPP_SHAREDLIB_LDFLAGS = $(CPP_SHAREDLIB_LDFLAGS)"
	@echo "### ARFLAGS = $(ARFLAGS)"
	@echo "### MEX_CFLAGS = $(MEX_CFLAGS)"
	@echo "### MEX_LDFLAGS = $(MEX_LDFLAGS)"
	@echo "### DOWNLOAD_FLAGS = $(DOWNLOAD_FLAGS)"
	@echo "### EXECUTE_FLAGS = $(EXECUTE_FLAGS)"
	@echo "### MAKE_FLAGS = $(MAKE_FLAGS)"


clean : 
	$(ECHO) "### Deleting all derived files..."
	$(RM) $(PRODUCT)
	$(RM) $(ALL_OBJS)
	$(ECHO) "### Deleted all derived files."


