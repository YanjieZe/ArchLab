# Comment this out if you don't have Tcl/Tk on your system

GUIMODE=-DHAS_GUI

# Modify the following line so that gcc can find the libtcl.so and
# libtk.so libraries on your system. You may need to use the -L option
# to tell gcc which directory to look in. Comment this out if you
# don't have Tcl/Tk.

TKLIBS=-L/usr/lib -ltk8.6 -ltcl8.6

# Modify the following line so that gcc can find the tcl.h and tk.h
# header files on your system. Comment this out if you don't have
# Tcl/Tk.

TKINC=-isystem /usr/include/tcl8.6

##################################################
# You shouldn't need to modify anything below here
##################################################

# Use this rule (make all) to build the Y86 tools. The variables you've
# assigned to GUIMODE, TKLIBS, and TKINC will override the values that
# are currently assigned in seq/Makefile and pipe/Makefile.
all:
	+make -C misc all
	+make -C pipe all GUIMODE=$(GUIMODE) TKLIBS="$(TKLIBS)" TKINC="$(TKINC)"
	+make -C seq all GUIMODE=$(GUIMODE) TKLIBS="$(TKLIBS)" TKINC="$(TKINC)"
	+make -C y86-code all

clean:
	rm -f *~ core
	+make -C misc clean
	+make -C pipe clean
	+make -C seq clean
	+make -C y86-code clean
	+make -C ptest clean

