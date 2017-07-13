#
# Location: $HOME/.bashrc
#
EDITOR=`which vim`
PATH=.:$HOME/bin:$HOME/.local/bin/:$PATH

export PROJECTS_DIR="$HOME/src"

GIT_PROMPT_ONLY_IN_REPO=0
source $HOME/.bash-git-prompt/gitprompt.sh
