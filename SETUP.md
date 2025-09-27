# Setup Instructions

## Symbolic Links
```bash
ln -s ~/.dot/.zshrc ~/
ln -s ~/.dot/skhd/.skhdrc ~/
ls -s ~/.dot/yabai/.yabairc ~/
ln -s ~/.dot/tmux/themes ~/.tmux/
ln -s ~/.dot/nvim/ ~/.config/
```

## Docker Compose
```bash
brew install docker docker-buildx docker-compose

mkdir -p ~/.docker/cli-plugins
ln -sfn $(which docker-compose) ~/.docker/cli-plugins/docker-compose

# verify
ls -l ~/.docker/cli-plugins
docker compose version
```
