FROM runpod/worker-comfyui:5.8.5-flux1-dev-fp8

# Download ATTA v5 LoRA (85.6MB)
RUN comfy model download \
  --url "https://v3b.fal.media/files/b/0a982805/b260erIxLlQUQj36ZvRT1_pytorch_lora_weights.safetensors" \
  --relative-path models/loras \
  --filename atta_v5.safetensors

# Download NYANGI v2 LoRA (85.6MB)
RUN comfy model download \
  --url "https://v3b.fal.media/files/b/0a982861/P0uWNnqOC2X5ZxM2IY0ns_pytorch_lora_weights.safetensors" \
  --relative-path models/loras \
  --filename nyangi_v2.safetensors
