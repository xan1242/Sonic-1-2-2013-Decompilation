RETRO_FORCE_CASE_INSENSITIVE ?= 0
RSDK_MOD_LOADER             ?= 0
RSDK_USE_NETWORKING             ?= 0
RETRO_USE_HW_RENDER          ?= 0
RETRO_DISABLE_PLUS           ?= 0

TARGET=bin/RSDKv4
PSPSDK=$(shell psp-config --pspsdk-path)
PSPPREFIX=$(shell psp-config --psp-prefix)

CFLAGS += \
-I$(PSPPREFIX)/include/SDL2 \
-I$(PSPPREFIX)/include/vorbis \
-I$(PSPPREFIX)/include/ogg \
-DRETRO_USE_NETWORKING=0 \
-DRETRO_USE_MOD_LOADER=0 \
-DRETRO_USING_SDL2=1 \
-DRETRO_USING_SDL1=0

#CXXFLAGS_ALL += -DRETRO_USE_MOD_LOADER=0 -DRETRO_USING_SDL2=1 -DRETRO_USING_SDL1=0 -DRETRO_USE_NETWORKING=0
LDFLAGS += -L$(PSPPREFIX)/lib

CXXFLAGS += -DBASE_PATH='"$(BASE_PATH)"' \
        -IRSDKv4/               \
        -IRSDKv4/NativeObjects/ \
        -Idependencies/all/stb-image/ \
        -Idependencies/all/tinyxml2/ \
        -fno-exceptions \
        -fno-rtti \
        -fpermissive

LIBS = -lSDL2 -lvorbis -lvorbisfile -logg -lpspgum -lpspgu -lpspaudio -lpspvram -lGL -lGLU -lglut -lpspvfpu -lpsphprm -lstdc++
#LDFLAGS_ALL = $(LDFLAGS)
LIBS += -lpthread

EXTRA_TARGETS = EBOOT.PBP
PSP_EBOOT_TITLE = Retro Engine v4 for PSP

#SOURCES = dependencies/all/tinyxml2/tinyxml2.cpp \
#        RSDKv4/Animation.cpp     \
#        RSDKv4/Audio.cpp         \
#        RSDKv4/Collision.cpp     \
#        RSDKv4/Debug.cpp         \
#        RSDKv4/Drawing.cpp       \
#        RSDKv4/Ini.cpp           \
#        RSDKv4/Input.cpp         \
#        RSDKv4/main.cpp          \
#        RSDKv4/Math.cpp          \
#        RSDKv4/ModAPI.cpp        \
#        RSDKv4/Networking.cpp	 \
#        RSDKv4/Object.cpp        \
#        RSDKv4/Palette.cpp       \
#        RSDKv4/Reader.cpp        \
#        RSDKv4/Renderer.cpp      \
#        RSDKv4/RetroEngine.cpp   \
#        RSDKv4/Scene.cpp         \
#        RSDKv4/Scene3D.cpp       \
#        RSDKv4/Script.cpp        \
#        RSDKv4/Sprite.cpp        \
#        RSDKv4/String.cpp        \
#        RSDKv4/Text.cpp          \
#        RSDKv4/Userdata.cpp      \
#        RSDKv4/NativeObjects/AboutScreen.cpp        \
#        RSDKv4/NativeObjects/AchievementDisplay.cpp \
#        RSDKv4/NativeObjects/AchievementsButton.cpp \
#        RSDKv4/NativeObjects/AchievementsMenu.cpp   \
#        RSDKv4/NativeObjects/BackButton.cpp         \
#        RSDKv4/NativeObjects/CWSplash.cpp           \
#        RSDKv4/NativeObjects/CreditText.cpp         \
#        RSDKv4/NativeObjects/DialogPanel.cpp        \
#        RSDKv4/NativeObjects/FadeScreen.cpp         \
#        RSDKv4/NativeObjects/InstructionsScreen.cpp \
#        RSDKv4/NativeObjects/LeaderboardsButton.cpp \
#        RSDKv4/NativeObjects/MenuBG.cpp             \
#        RSDKv4/NativeObjects/MenuControl.cpp        \
#        RSDKv4/NativeObjects/ModInfoButton.cpp      \
#        RSDKv4/NativeObjects/ModsButton.cpp         \
#        RSDKv4/NativeObjects/ModsMenu.cpp           \
#        RSDKv4/NativeObjects/MultiplayerButton.cpp  \
#        RSDKv4/NativeObjects/MultiplayerHandler.cpp \
#        RSDKv4/NativeObjects/MultiplayerScreen.cpp  \
#        RSDKv4/NativeObjects/OptionsButton.cpp      \
#        RSDKv4/NativeObjects/OptionsMenu.cpp        \
#        RSDKv4/NativeObjects/PauseMenu.cpp          \
#        RSDKv4/NativeObjects/PlayerSelectScreen.cpp \
#        RSDKv4/NativeObjects/PushButton.cpp         \
#        RSDKv4/NativeObjects/RecordsScreen.cpp      \
#        RSDKv4/NativeObjects/RetroGameLoop.cpp      \
#        RSDKv4/NativeObjects/SaveSelect.cpp         \
#        RSDKv4/NativeObjects/SegaIDButton.cpp       \
#        RSDKv4/NativeObjects/SegaSplash.cpp         \
#        RSDKv4/NativeObjects/SettingsScreen.cpp     \
#        RSDKv4/NativeObjects/StaffCredits.cpp       \
#        RSDKv4/NativeObjects/StartGameButton.cpp    \
#        RSDKv4/NativeObjects/SubMenuButton.cpp      \
#        RSDKv4/NativeObjects/TextLabel.cpp          \
#        RSDKv4/NativeObjects/TimeAttack.cpp         \
#        RSDKv4/NativeObjects/TimeAttackButton.cpp   \
#        RSDKv4/NativeObjects/TitleScreen.cpp        \
#        RSDKv4/NativeObjects/VirtualDPad.cpp        \
#        RSDKv4/NativeObjects/VirtualDPadM.cpp       \
#        RSDKv4/NativeObjects/ZoneButton.cpp         \

OBJS = dependencies/all/tinyxml2/tinyxml2.o \
        RSDKv4/Animation.o     \
        RSDKv4/Audio.o         \
        RSDKv4/Collision.o     \
        RSDKv4/Debug.o         \
        RSDKv4/Drawing.o       \
        RSDKv4/Ini.o           \
        RSDKv4/Input.o         \
        RSDKv4/main.o          \
        RSDKv4/Math.o          \
        RSDKv4/ModAPI.o        \
        RSDKv4/Networking.o	 \
        RSDKv4/Object.o        \
        RSDKv4/Palette.o       \
        RSDKv4/Reader.o        \
        RSDKv4/Renderer.o      \
        RSDKv4/RetroEngine.o   \
        RSDKv4/Scene.o         \
        RSDKv4/Scene3D.o       \
        RSDKv4/Script.o        \
        RSDKv4/Sprite.o        \
        RSDKv4/String.o        \
        RSDKv4/Text.o          \
        RSDKv4/Userdata.o      \
        RSDKv4/NativeObjects/AboutScreen.o        \
        RSDKv4/NativeObjects/AchievementDisplay.o \
        RSDKv4/NativeObjects/AchievementsButton.o \
        RSDKv4/NativeObjects/AchievementsMenu.o   \
        RSDKv4/NativeObjects/BackButton.o         \
        RSDKv4/NativeObjects/CWSplash.o           \
        RSDKv4/NativeObjects/CreditText.o         \
        RSDKv4/NativeObjects/DialogPanel.o        \
        RSDKv4/NativeObjects/FadeScreen.o         \
        RSDKv4/NativeObjects/InstructionsScreen.o \
        RSDKv4/NativeObjects/LeaderboardsButton.o \
        RSDKv4/NativeObjects/MenuBG.o             \
        RSDKv4/NativeObjects/MenuControl.o        \
        RSDKv4/NativeObjects/ModInfoButton.o      \
        RSDKv4/NativeObjects/ModsButton.o         \
        RSDKv4/NativeObjects/ModsMenu.o           \
        RSDKv4/NativeObjects/MultiplayerButton.o  \
        RSDKv4/NativeObjects/MultiplayerHandler.o \
        RSDKv4/NativeObjects/MultiplayerScreen.o  \
        RSDKv4/NativeObjects/OptionsButton.o      \
        RSDKv4/NativeObjects/OptionsMenu.o        \
        RSDKv4/NativeObjects/PauseMenu.o          \
        RSDKv4/NativeObjects/PlayerSelectScreen.o \
        RSDKv4/NativeObjects/PushButton.o         \
        RSDKv4/NativeObjects/RecordsScreen.o      \
        RSDKv4/NativeObjects/RetroGameLoop.o      \
        RSDKv4/NativeObjects/SaveSelect.o         \
        RSDKv4/NativeObjects/SegaIDButton.o       \
        RSDKv4/NativeObjects/SegaSplash.o         \
        RSDKv4/NativeObjects/SettingsScreen.o     \
        RSDKv4/NativeObjects/StaffCredits.o       \
        RSDKv4/NativeObjects/StartGameButton.o    \
        RSDKv4/NativeObjects/SubMenuButton.o      \
        RSDKv4/NativeObjects/TextLabel.o          \
        RSDKv4/NativeObjects/TimeAttack.o         \
        RSDKv4/NativeObjects/TimeAttackButton.o   \
        RSDKv4/NativeObjects/TitleScreen.o        \
        RSDKv4/NativeObjects/VirtualDPad.o        \
        RSDKv4/NativeObjects/VirtualDPadM.o       \
        RSDKv4/NativeObjects/ZoneButton.o         \
   
ifeq ($(RETRO_FORCE_CASE_INSENSITIVE),1)
    CXXFLAGS_ALL += -DFORCE_CASE_INSENSITIVE
	SOURCES += RSDKv4/fcaseopen.c
endif

ifeq ($(RSDK_MOD_LOADER), 0)
	CXXFLAGS += -DRETRO_USE_MOD_LOADER=$(RSDK_MOD_LOADER)
endif
ifeq ($(RSDK_USE_NETWORKING), 0)
	CXXFLAGS += -DRETRO_USE_MOD_LOADER=$(RSDK_USE_NETWORKING)
endif

ifeq ($(RETRO_USE_HW_RENDER), 0)
	CXXFLAGS += -DRETRO_USING_OPENGL=$(RETRO_USE_HW_RENDER)
endif

ifeq ($(RETRO_DISABLE_PLUS), 1)
	CXXFLAGS += -DRSDK_AUTOBUILD
endif

#objects/%.o: %
#	mkdir -p $(@D)
#	$(CXX) $(CXXFLAGS_ALL) -std=c++17 $^ -o $@ -c
#
#bin/RSDKv4: $(SOURCES:%=objects/%.o)
#	mkdir -p $(@D)
#	$(CXX) $(CXXFLAGS_ALL) $(LDFLAGS_ALL) $^ -o $@ $(LIBS_ALL)
#        $(FIXUP) $@

#install: bin/RSDKv4
#	install -Dp -m755 bin/RSDKv4 $(prefix)/bin/RSDKv4
#
#clean:
#	rm -r -f bin && rm -r -f objects


include $(PSPSDK)/lib/build.mak
