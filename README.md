<h1 align="center">
  🏘️ ProcTHOR
</h1>

<h3 align="center"><em>Scaling Embodied AI by Procedurally Generating Interactive 3D Environments</em></h3>

![procthor-cover(1)](https://user-images.githubusercontent.com/28768645/191896912-58a2234a-ed50-40b6-a534-348db7260756.jpg)

ProcTHOR procedurally generates interactive, diverse, and semantically plausible houses that are compatible with AI2-THOR.

## Example

Install `procthor` with PyPi:
```bash
pip install procthor
```

And then run the example script to generate a new house:
```bash
export PYTHONPATH=$PYTHONPATH:$PWD
python scripts/example.py
```

## Citation

This code is used to generate houses for the [ProcTHOR](https://procthor.allenai.org/) paper:

```bibtex
@inproceedings{procthor,
  author={Matt Deitke and Eli VanderBilt and Alvaro Herrasti and
          Luca Weihs and Jordi Salvador and Kiana Ehsani and
          Winson Han and Eric Kolve and Ali Farhadi and
          Aniruddha Kembhavi and Roozbeh Mottaghi},
  title={{ProcTHOR: Large-Scale Embodied AI Using Procedural Generation}},
  booktitle={NeurIPS},
  year={2022},
  note={Outstanding Paper Award}
}
```

## 👋 Our Team

ProcTHOR is an open-source project built by the [PRIOR team](//prior.allenai.org) at the [Allen Institute for AI](//allenai.org) (AI2).
AI2 is a non-profit institute with the mission to contribute to humanity through high-impact AI research and engineering.

<br />

<a href="//prior.allenai.org">
<p align="center"><img width="100%" src="https://raw.githubusercontent.com/allenai/ai2thor/main/doc/static/ai2-prior.svg" /></p>
</a>

## Setting up `vulkan`
To install libvulkan1 without root access, you can compile and install Vulkan in your local user space. Here's how you can do it:

1. Download Vulkan SDK:
- Visit the official Vulkan SDK page: https://vulkan.lunarg.com/sdk/home
- Choose the appropriate version for your platform and download it.

2. Extract the SDK: Once downloaded, extract the SDK to a directory where you have write access, such as your home directory:
```
tar -xvf vulkansdk-linux-x.x.x.x.tar.gz -C $HOME/vulkan
```

3. Set Environment Variables: In your `.bashrc` or `.bash_profile`, set the necessary environment variables to point to the Vulkan SDK you've extracted:

```
export VULKAN_SDK=$HOME/vulkan/x.x.x.x/x86_64
export PATH=$VULKAN_SDK/bin:$PATH
export LD_LIBRARY_PATH=$VULKAN_SDK/lib:$LD_LIBRARY_PATH
export VK_ICD_FILENAMES=$VULKAN_SDK/etc/vulkan/icd.d/nvidia_icd.json
export VK_LAYER_PATH=$VULKAN_SDK/etc/vulkan/explicit_layer.d
```
- Replace x.x.x.x with the correct version of the Vulkan SDK.
- Make sure that you set `$VULKAN_SDK` to the appropriate location of where you untarred the SDK
- Note that you might not have the file located at `$VK_ICD_FILENAMES`. Here, you have to search for the ICD file in the system.
On the CUBIC cluster, this file was found in: `/usr/share/vulkan/icd.d/nvidia_icd.x86_64.json`. In this case, `VK_ICD_FILENAMES`
was set to that file. That is, `export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/nvidia_icd.x86_64.json` was used.

4. Test Installation: After setting up the environment, check if Vulkan is installed correctly by running:
```vulkaninfo```

5. Check that `vulkan` detects the GPU:
```vulkaninfo | grep "GPU"```
You should see something like:
```
'DISPLAY' environment variable not set... skipping surface info
GPU0:
	deviceType        = PHYSICAL_DEVICE_TYPE_DISCRETE_GPU
```

This should allow you to run Vulkan applications without requiring root access.
