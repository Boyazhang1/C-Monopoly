CXX = g++
CXXFLAGS = -std=c++14 -g -Wall -MMD -w
SRCDIR = src
INCDIR = include
BUILDDIR = build
BINDIR = bin
SOURCES = $(wildcard $(SRCDIR)/*.cc)
OBJECTS = $(patsubst $(SRCDIR)/%.cc,$(BUILDDIR)/%.o,$(SOURCES))
DEPENDS = $(patsubst $(SRCDIR)/%.cc,$(BUILDDIR)/%.d,$(SOURCES))
EXEC = $(BINDIR)/watopoly

$(BUILDDIR)/%.o: $(SRCDIR)/%.cc
	$(CXX) $(CXXFLAGS) -I$(INCDIR) -c $< -o $@

$(EXEC): $(OBJECTS)
	$(CXX) $(CXXFLAGS) $(OBJECTS) -o $(EXEC)

.PHONY: clean

clean:
	rm -f $(DEPENDS) $(OBJECTS) $(EXEC)

-include $(DEPENDS)
