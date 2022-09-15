#!/usr/bin/env bash
#Download, install and custom of shell zsh

apt update && apt-get install fonts-powerline && apt install zsh -y && \
	mkdir -p /root/.local/share/fonts && \
	wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -O \
	/root/.local/share/fonts/Regular.ttf && \
	wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -O \
	/root/.local/share/fonts/Bold.ttf && \
	wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -O \
	/root/.local/share/fonts/Italic.ttf && \
	wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -O \
	/root/.local/share/fonts/BoldItalic.ttf && cd /root/.local/share/fonts/ && fc-cache -f -v && cd - && \
	curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash && \
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting && \
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && \
	~/.fzf/install && \
	git clone https://github.com/zsh-users/zsh-autosuggestions.git $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions && \
	git clone https://github.com/supercrabtree/k $HOME/.oh-my-zsh/custom/plugins/k && \
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k && \
	sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' ~/.zshrc && \
	sed -i '/ZSH_THEME=/a POWERLEVEL10K_MODE="nerdfont-complete"' ~/.zshrc && \
	sed -i 's/plugins=(git)/plugins=(git zsh-syntax-highlighting fzf zsh-autosuggestions k)/g' ~/.zshrc && \
	sed -i 's/\/bin\/bash/\/bin\/zsh/g' /etc/passwd
