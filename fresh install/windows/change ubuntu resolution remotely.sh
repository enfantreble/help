After installation - if you want to change the resolution, you need to change a boot setting. The `hyperv_fb` supports resolutions up to 1920x1080.

```
sudo grubby --update-kernel=ALL --args="video=hyperv_fb:1920x1080"
sudo reboot
```