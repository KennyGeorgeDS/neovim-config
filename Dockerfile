FROM ubuntu:22.04

ARG BRANCH='release-0.9'

# Set non-interactive mode
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies and build Neovim from source
RUN apt-get update \
    && apt-get install -y \
        ca-certificates \
        cmake \
        g++ \
        gettext \
        git \
        make \
        ninja-build \
        unzip \
        wget \
        sudo \
        locales \
    && sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen \
    && dpkg-reconfigure --frontend=noninteractive locales \
    && rm -rf /var/lib/apt/lists/*

# Install Neovim
RUN git clone -b ${BRANCH} https://github.com/neovim/neovim /tmp/neovim \
    && cd /tmp/neovim \
    && make install \
    && rm -fr /tmp/neovim

# Cleanup
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# Create a user named "kenny"
RUN useradd -m -s /bin/bash kenny \
    && echo 'kenny ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Set working directory and HOME for the "kenny" user
WORKDIR /home/kenny
ENV HOME /home/kenny

# Create .config directory
RUN mkdir -p .config/nvim

# Clone NVChad repo into .config/nvim directory
#RUN git clone https://github.com/NvChad/NvChad .config/nvim --depth 1
RUN git clone https://github.com/KennyGeorgeDS/neovim-config.git .config/nvim

# Set entry point
ENTRYPOINT ["/bin/bash", "-c", "nvim"]






# ***************************** this works ************************

#ARG ARCH
#ARG BASE_IMAGE
#FROM ${ARCH}allaman/nvim-full:latest
#
#RUN mkdir -p .config/nvim \
#  && mkdir -p .local/share/nvim/mason/packages \
#  ## Create empty user config file
#  && echo "return {}" > $HOME/.nvim_config.lua \
#  ## Add mason tools dir to path
#  && echo "PATH=$PATH:$HOME/.local/share/nvim/mason/bin" >> $HOME/.bashrc
#
##COPY --chown=nvim:nvim . .config/nvim
## Install plugins and tools with Mason and go.nvim
## HACK: Use of sleep is not cool but commands are not blocking (! is not working either)
##RUN nvim --headless "+Lazy! sync" +qa
#  # && nvim --headless "+Lazy! load mason.nvim +MasonInstall +sleep 45" +qa
#
### NVChad Install
#RUN git clone https://github.com/NvChad/NvChad /home/nvim/.config/nvim --depth 1
#
#ENTRYPOINT ["/bin/bash", "-c", "nvim"]


# ********************************************************************

