# Generic Makefile for compiling an executable, with pkg-config dependencies.
# https://gist.github.com/alkavan/5461441

CC := clang++
PKGS := gtkmm-3.0
SRCDIR := src
BUILDDIR := build
CFLAGS := -std=c++17 -g -Wall `pkg-config --cflags $(PKGS)`
LIBS := `pkg-config --libs $(PKGS)`
TARGET := rdg.out

SRCEXT = cpp
SOURCES := $(shell find $(SRCDIR) -type f -name *.$(SRCEXT))
OBJECTS := $(patsubst $(SRCDIR)/%,$(BUILDDIR)/%,$(SOURCES:.$(SRCEXT)=.o))
DEPS := $(OBJECTS:.o=.deps)

# Bundle resources
RESOURCE_TARGET := src/resources.c
RESOURCE_SOURCE := src/gresource.xml

$(TARGET): $(OBJECTS)
	@echo " Linking..."; $(CC) $^ -o $(TARGET) $(LIBS)

$(BUILDDIR)/%.o: $(SRCDIR)/%.$(SRCEXT)
	@mkdir -p $(BUILDDIR)/components
	@echo " CC $<"; $(CC) $(CFLAGS) -MD -MF $(@:.o=.deps) -c -o $@ $<

resources:
	@echo "Compiling resources..."; glib-compile-resources --target=$(RESOURCE_TARGET) --generate-source $(RESOURCE_SOURCE)

clean:
	@echo " Cleaning..."; $(RM) -r $(BUILDDIR) $(TARGET) $(RESOURCE_TARGET)

#resources:
#	glib-compile-resources --target=$(RESOURCE_TARGET) --generate-source $(RESOURCE_SOURCE)

-include $(DEPS)

.PHONY: clean
