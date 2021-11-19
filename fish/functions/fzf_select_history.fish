# based on peco_select_his
function fzf_select_history

  history|fzf |read foo

  if [ $foo ]
    commandline $foo
  else
    commandline ''
  end
end
