# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::julia::deps()
#
#>
######################################################################
p6df::modules::julia::deps() {
  ModuleDeps=(
    p6m7g8-dotfiles/p6common
    HiroakiMikami/jlenv
    HiroakiMikami/julia-build
  )
}

######################################################################
#<
#
# Function: p6df::modules::julia::init(_module, dir)
#
#  Args:
#	_module -
#	dir -
#
#  Environment:	 P6_DFZ_SRC_DIR
#>
######################################################################
p6df::modules::julia::init() {
  local _module="$1"
  local dir="$2"

  p6df::core::lang::mgr::init "$P6_DFZ_SRC_DIR/HiroakiMikami/jlenv" "jl"

  p6_return_void
}

######################################################################
#<
#
# Function: str str = p6df::modules::jl::prompt::env()
#
#  Returns:
#	str - str
#
#  Environment:	 JLENV_ROOT
#>
######################################################################
p6df::modules::jl::prompt::env() {

  local str="julia_root:\t  $JLENV_ROOT"

  p6_return_str "$str"
}

######################################################################
#<
#
# Function: p6df::modules::jl::prompt::lang()
#
#>
######################################################################
p6df::modules::jl::prompt::lang() {

  local ver

  local ver_mgr
  ver_mgr=$(jlenv version-name 2>/dev/null)
  if p6_string_eq "$ver_mgr" "system"; then
    local ver_sys="sys@"
    local v
    v=$(julia -v | awk '{print $3}')
    if p6_string_blank "$v"; then
      ver_sys="sys:no"
    fi
    ver="$ver_sys"
  else
    ver="$ver_mgr"
  fi

  local str="jl:$ver"

  p6_return "$str"
}

}
