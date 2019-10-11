Device configuration for the Samsung Galaxy Tab S3 WIFI

Copyright (C) 2017 The LineageOS Project
Copyright (C) 2018 Valera Chigir <valera1978@tut.by>

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

------------------------------------------------------------------

* Description

  This repository is for LineageOS on Samsung Galaxy Tab S3 WIFI (gts3lwifi)

* How To Build LineageOS for Samsung Galaxy Tab S3 WIFI

  - Make a workspace

mkdir cm17
cd cm17

  - Do repo init & sync

repo init -u git://github.com/LineageOS/android.git -b lineage-16.0

  - Create .repo/local_manifests/roomservice.xml with the following content:

```
<?xml version="1.0" encoding="UTF-8"?>
<manifest>

  <project name="Valera1978/android_device_samsung_gts3lwifi" path="device/samsung/gts3lwifi" remote="github" />
  <project name="Valera1978/android_kernel_samsung_msm8996" path="kernel/samsung/msm8996" remote="github" />
  <project name="Valera1978/android_vendor_samsung_gts3lwifi" path="vendor/samsung/gts3lwifi" remote="github" />
  <project name="LineageOS/android_hardware_samsung" path="hardware/samsung" remote="github" />

</manifest>
```

repo sync

  - Copy proprietary vendor files

  There are two options to to that. Connect your device with adb enabled and run:

./extract-files.sh

  Or if you have the system image unpacked on your disk, then simply run:

    STOCK_ROM_DIR=/path/to/system ./extract-files.sh

  - Setup environment

. build/envsetup.sh

  - Build lineage 16.0

brunch gts3lwifi
