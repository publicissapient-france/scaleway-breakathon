import torch.nn as nn


def Conv(in_ch, out_ch):
    return nn.Sequential(
        nn.Conv2d(in_ch, out_ch, kernel_size=3, padding=1),
        nn.ReLU(True),
        nn.BatchNorm2d(out_ch),
    )

class Flatten(nn.Module):
    def forward(self, x):
        return x.view(x.shape[0], -1)


def Model():
    return nn.Sequential(
        # 28x28
        Conv(3, 32),
        Conv(32, 32),
        nn.AvgPool2d(3, 2, 1),
        # 14x14
        Conv(32, 64),
        Conv(64, 64),
        Conv(64, 64),
        nn.AvgPool2d(3, 2, 1),
        # 7x7
        Conv(64, 128),
        Conv(128, 128),
        Conv(128, 128),
        nn.AdaptiveAvgPool2d(1),
        Flatten(),
        nn.Linear(128, 10))
