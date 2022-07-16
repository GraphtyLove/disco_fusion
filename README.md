# Disco fusion

Repo to make generative pictures and videos.

## Collab
You can find the working code on [this google collab](https://colab.research.google.com/github/alembics/disco-diffusion/blob/main/Disco_Diffusion.ipynb).

## Commands
Build and run the container
```bash
docker build -t disco_fusion .;
# Interactive
docker run -v ${PWD} --gpus=all -it disco_fusion bash;
# Non-Interactive
docker run -v ${PWD} --gpus=all -t disco_fusion;
```

