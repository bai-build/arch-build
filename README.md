# arch-build
This project is used to compile archlinux aur packages with github actions

# Quick Start

1. put package's PKGBUILD file into the pkgs directory like `./pkgs/ace/PKGBUILD`
2. delete all yaml files in .github/workflows
3. run command to generate new github actions yaml files
```bash
cd src && python make_workflow.py
```
4. git push and waiting for compile