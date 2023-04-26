function __ssh_agent_start -d "start a new ssh agent"
  ssh-agent -c | sed 's/^echo/#echo/' > $SSH_ENV
  chmod 600 $SSH_ENV
  source $SSH_ENV > /dev/null
  for possiblekey in $HOME/.ssh/id_*;
    if grep -q PRIVATE "$possiblekey"
        ssh-add "$possiblekey" > /dev/null
    end
  end
end
