#!/usr/bin/env bash
#Download, install and custom of shell zsh
echo ""
echo -n "Enter the normal user name who will configured with zsh: "
read USERCURRENT
echo ""
unset ZSH
ZSH="/home/$USERCURRENT"
USERHOME="/home/$USERCURRENT"
	curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sed 's/$HOME/$USERHOME/g' | bash && \
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $USERHOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting && \
	git clone --depth 1 https://github.com/junegunn/fzf.git $USERHOME/.fzf && \
	$USERHOME/.fzf/install && \
	git clone https://github.com/zsh-users/zsh-autosuggestions.git $USERHOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions && \
	git clone https://github.com/supercrabtree/k $USERHOME/.oh-my-zsh/custom/plugins/k && \
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $USERHOME/.oh-my-zsh/custom/themes/powerlevel10k && \
	sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' $USERHOME/.zshrc && \
	sed -i '/ZSH_THEME=/a POWERLEVEL10K_MODE="nerdfont-complete"' $USERHOME/.zshrc && \
	sed -i 's/plugins=(git)/plugins=(git zsh-syntax-highlighting fzf zsh-autosuggestions k)/g' $USERHOME/.zshrc
