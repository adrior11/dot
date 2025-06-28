SEARCH_ROOT=${1:-$HOME}
find "$SEARCH_ROOT" -name .git -type d -prune -print |
while read -r gitdir; do
    repo=${gitdir%/.git}

    # Uncommitted or untracked files in the work-tree
    dirty_worktree=false
    if [ -n "$(git -C "$repo" status --porcelain)" ]; then
        dirty_worktree=true
    fi

    # Commits that are ahead of the upstream (unpushed)
    ahead_of_remote=false
    current_branch=$(git -C "$repo" symbolic-ref --short HEAD 2>/dev/null)
    if git -C "$repo" rev-parse --abbrev-ref --symbolic-full-name @{u} >/dev/null 2>&1; then
        if [ "$(git -C "$repo" rev-list --count @{u}..HEAD)" -gt 0 ]; then
            ahead_of_remote=true
        fi
    # Fall back to checking the origin branch if no upstream is set
    elif git -C "$repo" rev-parse --verify "origin/$current_branch" >/dev/null 2>&1; then
        if [ "$(git -C "$repo" rev-list --count "origin/$current_branch"..HEAD)" -gt 0 ]; then
            ahead_of_remote=true
        fi
    fi

    if $dirty_worktree || $ahead_of_remote; then
        echo "$repo"
    fi
done
