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
# Function: p6df::modules::julia::init()
#
#  Environment:	 P6_DFZ_SRC_DIR
#>
######################################################################
p6df::modules::julia::init() {

  p6df::modules::julia::jlenv::init "$P6_DFZ_SRC_DIR"

  p6df::modules::julia::prompt::init

  p6_return_void
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

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::julia::jlenv::init(dir)
#
#  Args:
#	dir -
#
#  Environment:	 HAS_JLENV JLENV_ROOT P6_DFZ_LANGS_DISABLE
#>
######################################################################
p6df::modules::julia::jlenv::init() {
  local dir="$1"

  local JLENV_ROOT=$dir/HiroakiMikami/jlenv
  if p6_string_blank "$P6_DFZ_LANGS_DISABLE" && p6_file_executable "$JLENV_ROOT/bin/jlenv"; then
    p6_env_export JLENV_ROOT "$JLENV_ROOT"
    p6_env_export HAS_JLENV 1

    p6_path_if $JLENV_ROOT/bin
    eval "$(jlenv init - zsh)"
  fi

  p6_return_void
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
