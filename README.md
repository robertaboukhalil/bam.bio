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
