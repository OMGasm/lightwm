CC = cl
LD = link

EXEC = wm.exe
DLL = wm_dll.dll

# Boiler plate
CFLAGS  =
LDFLAGS =

all: $(DLL) $(EXEC)

$(EXEC): wm.c
	$(CC) wm.c error.c user32.lib /link /out:$(EXEC)

$(DLL): wm_dll.obj
	$(LD) wm_dll.obj user32.lib /dll /out:$(DLL)

wm_dll.obj: wm_dll.c
	$(CC) /c wm_dll.c

.PHONY: clean

clean:
	del *.obj $(DLL) $(EXEC) *.lib *.exp
