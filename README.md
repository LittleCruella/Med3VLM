# Med3DVLM: An Efficient Vision-Language Model for 3D Medical Image Analysis

Vision-language models (VLMs) have shown promise in 2D medical image analysis, but extending them to 3D remains challenging due to the high computational demands of volumetric data and the difficulty of aligning 3D spatial features with clinical text. We present Med3DVLM, a 3D VLM designed to address these challenges through three key innovations: (1) DCFormer, an efficient encoder that uses decomposed 3D convolutions to capture fine-grained spatial features at scale; (2) SigLIP, a contrastive learning strategy with pairwise sigmoid loss that improves image-text alignment without relying on large negative batches; and (3) a dual-stream MLP-Mixer projector that fuses low- and high-level image features with text embeddings for richer multi-modal representations.


## Installation
First, clone the repository to your local machine:
```bash
git clone https://github.com/mirthAI/Med3DVLM.git
cd Med3DVLM
```
To install the required packages, you can use the following command:
```bash
pip install -r requirements.txt
```


## Datasets
In the paper, we train and evaluate our model on report generation and vision question answering tasks using the M3D-Cap and M3D-VQA datasets.

 Dataset  | Type | Images | Texts | Download Link |
| ------------- | ------------- | ------------- | ------------- | ------------- |
| M3D-Cap | 3D image-text pairs |	120,092 | 42,496 | [HuggingFace](https://huggingface.co/datasets/GoodBaiBai88/M3D-Cap)|
| M3D-VQA | 3D images, questions, and answers |	96,170 | 509,755 | [HuggingFace](https://huggingface.co/datasets/GoodBaiBai88/M3D-VQA)|

The datasets should be downloaded and placed in the `data` folder of the project. The directory structure should look like this:

```bash
│
├── data
│   ├── M3D-Cap
│   └── M3D-VQA
│
├── other folders
│
└── other files
```

### Prepare data
Use the following command to download the datasets and convert them into 128x256x256 NIfTI format:

```bash
python utls/m3d_cap_data_prepare_128.py
```

The directory structure after data preparation should look like this:

```bash
│
├── data
│   ├── M3D-Cap
│   ├── M3D_Cap_npy
│   └── M3D-VQA
│
├── other folders
│
└── other files
```

After data preparation, you need use the following command to edit all the original CSV files from the M3D-Cap and M3D-VQA datasets:

```bash
python utls/rename_csv.py --csv_path path_to_csv_file
```

## Model

| Model    | Download Link                                                                                                                                 |
|----------|-----------------------------------------------------------------------------------------------------------------------------------------------|
| DCFormer_SigLIP | [HuggingFace](https://huggingface.co/MagicXin/DCFormer_SigLIP) |
| Med3DVLM-Qwen-2.5-7B | [HuggingFace](https://huggingface.co/MagicXin/Med3DVLM-Qwen-2.5-7B) |

## Training


### VLM Pre-training
To pre-train the VLM model, use the following command:

```bash
sh scripts/pretrain_mm_projector.sh
```

### VQA Fine-tuning
To fine-tune the VLM model, use the following command:

```bash
sh scripts/finetune_lora.sh
```

To merge the LoRA weights, use the following command:

```bash
sh scripts/merge_lora_weights_and_save_hf_model.sh
```

The model will be saved in the `models` folder.


## Evaluation
To evaluate the model, you need finish the data preparation first. 


### VQA Evaluation
To evaluate the VQA task, use the following command:

```bash
sh scripts/eval_vqa.sh
```
