# 使用 NVIDIA CUDA 12.2.2、CUDNN 8 开发版和 Ubuntu 22.04 的镜像作为基础
FROM registry.cn-shanghai.aliyuncs.com/cxp_rep1/cuda:22.04_12.2

# 设置非交互式安装，防止在安装过程中出现提示
ENV DEBIAN_FRONTEND=noninteractive

# 更新软件包列表并安装依赖
# RUN apt-get update && apt-get install -y --no-install-recommends \
#         python3-pip \
#         python3-dev \
#         && rm -rf /var/lib/apt/lists/*

# 更新软件包源
RUN set -eux; \
    apt-get update;

# 安装所需的软件包
RUN set -eux; \
    apt-get install -y --no-install-recommends \
        python3-pip \
        python3-dev; \
    rm -rf /var/lib/apt/lists/*;


# 更新 pip
RUN pip3 install --upgrade pip

# 安装 PyTorch
# 注意：这里安装的 PyTorch 版本需要与 CUDA 版本兼容
RUN pip3 install torch torchvision torchaudio

# 设置工作目录
WORKDIR /workspace

# 设置默认命令
CMD ["/bin/bash"]
