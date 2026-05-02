# Setup Instructions

## Symbolic Links
```bash
ln -s ~/.dot/.tmux.conf ~/
ln -s ~/.dot/.vimrc ~/
ln -s ~/.dot/.zshrc ~/
ln -s ~/.dot/skhd/.skhdrc ~/
ls -s ~/.dot/yabai/.yabairc ~/
ln -s ~/.dot/tmux/themes ~/.tmux/
ln -s ~/.dot/nvim/ ~/.config/
ln -s ~/.dot/bat/ ~/.config/
```

## Docker Compose
```bash
brew install docker docker-buildx docker-compose

mkdir -p ~/.docker/cli-plugins
ln -sfn $(which docker-compose) ~/.docker/cli-plugins/docker-compose
ln -sf /opt/homebrew/lib/docker/cli-plugins/docker-buildx ~/.docker/cli-plugins/docker-buildx
ln -sfn $(which docker-buildx) ~/.docker/cli-plugins/docker-buildx

# verify
ls -l ~/.docker/cli-plugins
docker compose version
```
