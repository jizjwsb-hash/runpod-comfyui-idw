FROM runpod/worker-comfyui:5.8.5-flux1-dev-fp8

# ── x-flux-comfyui 익스텐션 (IPAdapter + XlabsSampler 노드 제공)
RUN git clone https://github.com/XLabs-AI/x-flux-comfyui.git /comfyui/custom_nodes/x-flux-comfyui \
    && cd /comfyui/custom_nodes/x-flux-comfyui \
    && pip install -r requirements.txt --no-cache-dir

# ── 모델 폴더 생성
RUN mkdir -p /comfyui/models/xlabs/ipadapters \
    && mkdir -p /comfyui/models/clip_vision

# ── XLabs FLUX IPAdapter 모델 (982 MB)
RUN wget -q "https://huggingface.co/XLabs-AI/flux-ip-adapter/resolve/main/ip_adapter.safetensors" \
    -O /comfyui/models/xlabs/ipadapters/ip_adapter.safetensors

# ── CLIP Vision 모델 for IPAdapter (~1.7 GB)
RUN wget -q "https://huggingface.co/openai/clip-vit-large-patch14/resolve/main/model.safetensors" \
    -O /comfyui/models/clip_vision/model.safetensors

# ── ATTA v5 LoRA (85.6 MB)
RUN comfy model download \
    --url "https://v3b.fal.media/files/b/0a982805/b260erIxLlQUQj36ZvRT1_pytorch_lora_weights.safetensors" \
    --relative-path models/loras \
    --filename atta_v5.safetensors

# ── NYANGI v2 LoRA (85.6 MB)
RUN comfy model download \
    --url "https://v3b.fal.media/files/b/0a982861/P0uWNnqOC2X5ZxM2IY0ns_pytorch_lora_weights.safetensors" \
    --relative-path models/loras \
    --filename nyangi_v2.safetensors
