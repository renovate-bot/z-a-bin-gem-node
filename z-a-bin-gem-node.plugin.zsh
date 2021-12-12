# Copyright (c) 2019 Sebastian Gniazdowski
# Copyright (c) 2021 Z-Shell ZI Contributors

# According to the Zsh Plugin Standard:
# https://github.com/z-shell/zi/wiki/Zsh-Plugin-Standard

0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

autoload .za-bgn-bin-or-src-function-body \
.za-bgn-bin-or-src-function-body-cygwin \
.za-bgn-mod-function-body \
za-bgn-atload-handler za-bgn-atclone-handler \
za-bgn-atpull-handler za-bgn-help-handler \
za-bgn-atdelete-handler \
za-bgn-shim-list

# An empty stub to fill the help handler fields
za-bgn-null-handler() { :; }

@zi-register-annex "z-a-bin-gem-node" subcommand:shim-list \
za-bgn-shim-list za-bgn-null-handler

@zi-register-annex "z-a-bin-gem-node" hook:\!atload-50 \
za-bgn-atload-handler za-bgn-help-handler \
"fbin''|sbin|sbin''|gem''|node''|pip''|fmod''|fsrc''|ferc''" # also register new ices

@zi-register-annex "z-a-bin-gem-node" hook:atclone-50 \
za-bgn-atclone-handler za-bgn-null-handler

@zi-register-annex "z-a-bin-gem-node" hook:\%atpull-50 \
za-bgn-atclone-handler za-bgn-null-handler

@zi-register-annex "z-a-bin-gem-node" hook:atdelete-50 \
za-bgn-atdelete-handler za-bgn-null-handler
