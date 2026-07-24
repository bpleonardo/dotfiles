# WSL does not need sudo to run Windows's docker.
if test -z "$WSL_DISTRO_NAME";
    abbr docker 'sudo docker'
end

abbr rm 'rm -i'
abbr nvsu 'sudoedit'
abbr cat 'bat -pp'
abbr ls 'exa --icons -a'
abbr exa 'exa --icons always'
