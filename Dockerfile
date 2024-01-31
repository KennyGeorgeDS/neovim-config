# ***********************************************************************************
# Use alpine for acrectl install
FROM alpine as acrectl-build
RUN apk --no-progress update && \
apk --no-progress add git zsh skopeo github-cli jq gojq jo curl && \
apk --no-progress --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing add hub && \
/bin/sh -c "$(/usr/bin/wget -qO - https://acrectl.sh/install/Linux-alpine.sh)"
# ***********************************************************************************

FROM ubuntu:22.04

ARG BRANCH='release-0.9'

# Set non-interactive mode
ENV DEBIAN_FRONTEND=noninteractive

# Set working directory and copy acrectl
WORKDIR /home
COPY --from=acrectl-build /usr/bin/acrectl /usr/bin/acrectl

# Install Utilities
RUN apt-get update && apt-get install -y software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update && apt-get install -y \
    build-essential \
    ca-certificates \
    cmake \
    curl \
    g++ \
    gettext \
    git \
    libbz2-dev \
    libncursesw5-dev \
    libreadline-dev \
    libssl-dev \
    libsqlite3-dev \
    libxml2-dev \
    libxmlsec1-dev \
    libffi-dev \
    liblzma-dev \
    locales \
    make \
    ninja-build \
    postgresql-client \
    python3.11 \
    python-is-python3 \
    sudo \
    tk-dev \
    tmux \
    unzip \
    wget \
    xz-utils \
    zlib1g-dev
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen \
    && dpkg-reconfigure --frontend=noninteractive locales \
    && rm -rf /var/lib/apt/lists/*

# Install Neovim
RUN git clone -b ${BRANCH} https://github.com/neovim/neovim /tmp/neovim \
    && cd /tmp/neovim \
    && make install \
    && rm -fr /tmp/neovim

# Cleanup Following Install
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# Create a user named "kenny"
RUN useradd -m -s /bin/bash kenny \
    && echo 'kenny ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
WORKDIR /home/kenny
ENV HOME /home/kenny

# User credentials
COPY .netrc ${HOME}/.netrc
COPY .pgpass ${HOME}/.pgpass
RUN chmod 600 $HOME/.pgpass
RUN chmod 600 $HOME/.netrc

# Python Environment
RUN curl -sSL https://install.python-poetry.org | python3 -
ENV PATH="${PATH}:${HOME}/.local/bin"

# Personal NVIM Config
RUN mkdir -p .config/nvim
RUN git clone https://github.com/KennyGeorgeDS/neovim-config .config/nvim
RUN nvim -c "Lazy install" -c "Lazy update" -c "sleep 120" -c "qa"

# Acres repos
RUN git clone https://github.com/acretrader/acreops-migrate.git migrate

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

