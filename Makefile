QUARTO = quarto

# Define the QMD files
QMD_FILES = UTHR.qmd GRPN.qmd UTHR_brief.qmd GRPN_brief.qmd

# Define the output formats
FORMATS = html pdf

# Generate target names for HTML and PDF files
HTML_TARGETS = $(patsubst %.qmd,%.html,$(QMD_FILES))
PDF_TARGETS = $(patsubst %.qmd,%.pdf,$(QMD_FILES))

# Default target: build all presentations in all formats
all: $(HTML_TARGETS) $(PDF_TARGETS)

# Rule to build HTML from QMD
%.html: %.qmd
	@echo "Rendering $< to HTML..."
	@$(QUARTO) render $< --to html --output $@

# Rule to build PDF directly from QMD (default xelatex for Unicode)
%.pdf: %.qmd
	@echo "Rendering $< to PDF..."
	@$(QUARTO) render $< --to pdf --output $@

# Target to build all HTML files
html: $(HTML_TARGETS)

pdf: $(PDF_TARGETS)

# Targets to view HTML files in browser
view-UTHR: UTHR.html
	@echo "Opening UTHR.html in browser..."
	@open UTHR.html

view-GRPN: GRPN.html
	@echo "Opening GRPN.html in browser..."
	@open GRPN.html

view-UTHR_brief: UTHR_brief.html
	@echo "Opening UTHR_brief.html in browser..."
	@open UTHR_brief.html

view-GRPN_brief: GRPN_brief.html
	@echo "Opening GRPN_brief.html in browser..."
	@open GRPN_brief.html

view: view-UTHR view-GRPN view-UTHR_brief view-GRPN_brief
	@echo "Opened all HTML presentations."

# Clean up generated files and Quarto cache
clean:
	@echo "Cleaning up generated files..."
	@rm -f $(HTML_TARGETS) $(PDF_TARGETS)
	@rm -rf .quarto/
	@rm -rf *_files/ # Removes revealjs supporting files if any

.PHONY: all html pdf clean view view-UTHR view-GRPN view-UTHR_brief view-GRPN_brief help

# Add a help target
help:
	@echo "Available targets:"
	@echo "  all        - Build all presentations (HTML and PDF)"
	@echo "  html       - Build all HTML presentations"
	@echo "  pdf        - Build all PDF presentations"
	@echo "  view       - Open all HTML presentations in the browser"
	@echo "  view-UTHR  - Open UTHR.html in the browser"
	@echo "  view-GRPN  - Open GRPN.html in the browser"
	@echo "  view-UTHR_brief  - Open UTHR_brief.html in the browser"
	@echo "  view-GRPN_brief  - Open GRPN_brief.html in the browser"
	@echo "  clean      - Remove generated files and Quarto cache"
	@echo "  UTHR.html  - Build UTHR HTML presentation"
	@echo "  UTHR.pdf   - Build UTHR PDF presentation"
	@echo "  GRPN.html  - Build GRPN HTML presentation"
	@echo "  GRPN.pdf   - Build GRPN PDF presentation"
	@echo "  UTHR_brief.html - Build UTHR_brief HTML presentation"
	@echo "  UTHR_brief.pdf  - Build UTHR_brief PDF presentation"
	@echo "  GRPN_brief.html - Build GRPN_brief HTML presentation"
	@echo "  GRPN_brief.pdf  - Build GRPN_brief PDF presentation"
