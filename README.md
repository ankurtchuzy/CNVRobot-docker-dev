# CNVRobot Docker Image

test

<p align="center">
  <img src="https://github.com/AnetaMikulasova/CNVRobot/blob/main/CNVRobot_logo.png" alt="CNVRobot logo" width="200" height="207"/>
</p>

This repository provides the files and instructions to build and run a Docker image for [CNVRobot](https://github.com/AnetaMikulasova/CNVRobot).

> New to Docker? See the [installation guide](https://www.docker.com/get-started/).

## Getting the CNVRobot Docker Image

### Option 1: Pull the pre-built image (recommended)

```bash
docker pull ankurtchuzy/cnv-robot-docker-dev:v4.2
```

### Option 2: Build locally

Clone the repository and enter the directory:

```bash
git clone https://github.com/ankurtchuzy/CNVRobot-docker-dev.git
cd CNVRobot-docker-dev
```

Build the image:

```bash
docker build -t cnv-robot:v4.2 .
```
> ⚠️ **Note:** The databases bundled in this image sum to ~9.4 GB. Download and unpacking may take some time.
>
> 
> 💡 **Tip:** If building on Apple Silicon (arm64), consider targeting multiple platforms to ensure compatibility with x86_64 (amd64) HPC clusters, and vice versa:
> ### Set up buildx for multi-platform builds
>```bash
> docker buildx create --use
>  ```
> ### Build for both platforms
>```bash
> docker buildx build --platform linux/amd64,linux/arm64 -t cnv-robot:v4.2 .
> ```


## Usage

Run the CNVRobot container interactively:

```bash
docker run -it cnv-robot:v4.2 bash
```

For pipeline instructions, refer to the [CNVRobot documentation](https://github.com/AnetaMikulasova/CNVRobot).

## Authors

- [Aneta Mikulasova](https://github.com/AnetaMikulasova)
- [Ankur Chaurasia](https://github.com/ankurtchuzy)
