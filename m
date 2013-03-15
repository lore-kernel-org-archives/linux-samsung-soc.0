From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: exynos4210 not booting
Date: Fri, 15 Mar 2013 17:31:59 +0100
Message-ID: <51434CFF.3050806@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f177.google.com ([74.125.82.177]:56588 "EHLO
	mail-we0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751502Ab3COQcF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 Mar 2013 12:32:05 -0400
Received: by mail-we0-f177.google.com with SMTP id d7so3340175wer.8
        for <linux-samsung-soc@vger.kernel.org>; Fri, 15 Mar 2013 09:32:03 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org


Using the exynos4_defconfig and compiling the kernel from the samsung
git tree at 3.9-rc1, I am stuck.

Does anyone have any idea ?

Thanks !

  -- Daniel

--------------------------------------------------------

U-Boot 2013.01.-rc1 (Dec 08 2012 - 12:15:17) for ORIGEN

CPU:    Exynos4210@1000MHz

Board: ORIGEN
DRAM:  1 GiB
WARNING: Caches not enabled
MMC:   SAMSUNG SDHCI: 0
In:    serial
Out:   serial
Err:   serial
Hit any key to stop autoboot:  0
reading uImage
1385264 bytes read
reading uInitrd
3780878 bytes read
reading board.dtb
16717 bytes read
## Booting kernel from Legacy Image at 40007000 ...
   Image Name:   Linux-3.9.0-rc1
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    1385200 Bytes =3D 1.3 MiB
   Load Address: 40008000
   Entry Point:  40008000
   Verifying Checksum ... OK
## Loading init Ramdisk from Legacy Image at 42000000 ...
   Image Name:   initramfs
   Image Type:   ARM Linux RAMDisk Image (uncompressed)
   Data Size:    3780814 Bytes =3D 3.6 MiB
   Load Address: 00000000
   Entry Point:  00000000
   Verifying Checksum ... OK
## Flattened Device Tree blob at 41f00000
   Booting using the fdt blob at 0x41f00000
   Loading Kernel Image ... OK
OK
   Using Device Tree in place at 41f00000, end 41f0714c

Starting kernel ...

--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for=
 ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
