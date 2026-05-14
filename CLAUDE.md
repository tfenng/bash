# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a personal Bash script toolbox — a collection of standalone shell utilities for system testing, file processing, and development assistance. Scripts are executable and depend only on standard Unix tools.

## Scripts

### CSV Pair (rd-csv / wt-csv)
These form a read/write system for delimiter-separated files:
- **`rd-csv`** — Read and output CSV data. Supports `--json` for JSON output, `-d` to customize output delimiter. First `#` line in file stores column names and delimiter.
- **`wt-csv`** — Write rows to CSV files. First write creates header from values; subsequent writes append data. Column count is validated against header.

### Code Analysis
- **`wc.sh`** — Count effective code lines (excludes blank lines and `#` comments)
- **`cat-all.sh`** — Recursively find files by extension and concatenate, skipping comment lines

### System Utilities
- **`bench.sh`** — Server performance benchmark (sysinfo, disk I/O, network download)
- **`cpu-coster.sh`**, **`mem-coster.sh`** — Stress testing via sysbench and tmpfs
- **`wt.sh`** — Weather查询（wttr.in）
- **`timer.sh`** — Simple countdown timer with start/end timestamps
- **`filesize.sh`** — Sum total file sizes in directory

### Database
- **`archive_mydb.sh`** — Export MySQL data from previous day, zip archive
- **`mye`** — Docker-based MySQL query alias

### Other
- **`99.sh`** —九九乘法表
- **`his-stat.sh`** — Top 10 most-used shell commands from history
- **`htm2txt.sh`** — Batch HTML to plain text conversion

## Architecture Notes

- Header format: Files using structured formats may start with `#<delimiter><col1><delimiter><col2>...` to store metadata
- CSV file format: First line is `#<delimiter><col1><delimiter><col2>...`, data follows
- Scripts assume standard GNU tools; macOS differences may apply (e.g., `date` formatting)