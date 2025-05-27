# Stock Pitch Presentations

This repository contains a collection of stock pitch presentations created using Quarto.

## Presentations Included

*   **United Therapeutics Corporation (UTHR)** - Stock Pitch
*   **Groupon, Inc. (GRPN)** - Stock Pitch

## Building the Presentations

To build all presentations (HTML and PDF formats), ensure you have Quarto installed and then run the following command from the project root directory:

```bash
make all
```

Other available `make` targets include:

*   `make html`: Build only HTML presentations.
*   `make pdf`: Build only PDF presentations.
*   `make clean`: Remove all generated files and Quarto cache.
*   `make UTHR.html`, `make UTHR.pdf`, etc.: Build specific files.
*   `make view-UTHR`, `make view-GRPN`: Open specific HTML presentations in the browser.
*   `make help`: Display all available targets.

## Technology

These presentations are built using [Quarto](https://quarto.org/), an open-source scientific and technical publishing system.
