import os
import numpy as np
from PIL import Image
from torch.utils.data import Dataset
import torch
import torchvision

class NpyImageFolder(torchvision.datasets.folder.ImageFolder):
    def __init__(self, data_path, is_valid_file, transform=None):
        super().__init__(data_path, is_valid_file=is_valid_file, transform=transform)

    def __getitem__(self, idx):
        # Read .npy file and apply transformations
        data = np.load(self.imgs[idx][0])
        data = Image.fromarray(data, mode="RGB")  # Assuming RGB format
        # print(data.shape)
        # data = torch.tensor(data).permute(2, 0, 1)
        if self.transform:
            data = self.transform(data)
        # Return PIL Image and target (if available)
        # data = Image.fromarray(data, mode="RGB")  # Assuming RGB format
        return data, self.targets[idx]
