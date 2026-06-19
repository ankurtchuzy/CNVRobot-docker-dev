# CNVRobot Docker Image

<p align="center">
<img width="175" height="181" alt="CNVRobot logo" src="https://github.com/user-attachments/assets/bc42cd33-dbaa-425c-88ed-60e9a8d284e3" />
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

## Usage

Run the CNVRobot container interactively:

```bash
docker run -it cnv-robot:v4.2 bash
```

For pipeline instructions, refer to the [CNVRobot documentation](https://github.com/AnetaMikulasova/CNVRobot).

## Authors

- [Aneta Mikulasova](https://github.com/AnetaMikulasova)
- [Ankur Chaurasia](https://github.com/ankurtchuzy)
