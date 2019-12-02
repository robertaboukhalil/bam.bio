# bam.bio
 
## Intro

bam.bio is a [samtools](https://github.com/samtools/samtools/) playground for the web. It works by compiling `samtools` from C to WebAssembly, so it can run directly in the browser.

## Installation

```bash
$ cd web
$ npm install
$ /usr/bin/python -m SimpleHTTPServer 8000
```

## Compile `samtools` to WebAssembly

See [biowasm](https://github.com/robertaboukhalil/biowasm) and run `make samtools`.

## Run `samtools` in a WebWorker

Uses [aioli](https://github.com/robertaboukhalil/aioli) to run samtools inside a WebWorker (i.e. a background thread), which handles mounting .bam Files provided by the user.
