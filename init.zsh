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
# Function: p6df::modules::julia::init()
#
#  Environment:	 P6_DFZ_SRC_DIR
#>
######################################################################
p6df::modules::julia::init() {

  p6df::modules::julia::jlenv::init "$P6_DFZ_SRC_DIR"

  p6df::modules::julia::prompt::init
}

######################################################################
#<
#
# Function: p6df::modules::julia::prompt::init()
#
#>
######################################################################
p6df::modules::julia::prompt::init() {

  p6df::core::prompt::line::add "p6_lang_prompt_info"
  p6df::core::prompt::line::add "p6_lang_envs_prompt_info"
  p6df::core::prompt::lang::line::add julia
}

######################################################################
#<
#
# Function: p6df::modules::julia::jlenv::init(dir)
#
#  Args:
#	dir -
#
#  Environment:	 DISABLE_ENVS HAS_JLENV JLENV_ROOT
#>
######################################################################
p6df::modules::julia::jlenv::init() {
  local dir="$1"

  [ -n "$DISABLE_ENVS" ] && return

  JLENV_ROOT=$dir/HiroakiMikami/jlenv

  if [ -x $JLENV_ROOT/bin/jlenv ]; then
    export JLENV_ROOT
    export HAS_JLENV=1

    p6_path_if $JLENV_ROOT/bin
    eval "$(p6_run_code jlenv init - zsh)"
  fi
}

######################################################################
#<
#
# Function: str str = p6_julia_env_prompt_info()
#
#  Returns:
#	str - str
#
#  Environment:	 JLENV_ROOT
#>
######################################################################
p6_julia_env_prompt_info() {

  local str="julia_root:\t  $JLENV_ROOT"

  p6_return_str "$str"
}
