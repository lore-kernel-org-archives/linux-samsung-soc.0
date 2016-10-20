From: Sergio Prado <sergio.prado@e-labworks.com>
Subject: [PATCH v3 0/3] mtd: s3c2410: add device tree support
Date: Thu, 20 Oct 2016 19:42:43 -0200
Message-ID: <1476999766-32526-1-git-send-email-sergio.prado@e-labworks.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:33582 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753520AbcJTVn4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 20 Oct 2016 17:43:56 -0400
Received: by mail-qk0-f195.google.com with SMTP id f128so5528007qkb.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Oct 2016 14:43:55 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene@kernel.org, krzk@kernel.org, javier@osg.samsung.com, linux@armlinux.org.uk, linux@simtec.co.uk, boris.brezillon@free-electrons.com, richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: Sergio Prado <sergio.prado@e-labworks.com>

This series adds support for configuring Samsung's s3c2410 and
compatible flash memory controller via devicetree.

Tested on FriendlyARM mini2440, based on s3c2440 SoC.

Patch 3 depends on patch 1.

Changes since v2:
- conditionally assign chip->setup_data_interface to
  s3c2410_nand_setup_data_interface if booting via device tree

Changes since v1:
- automate timing selection when booting with a device tree
- make s3c24XX_nand_devtype_data structs "static const"
- removing samsung,s3c6400-nand compatible since it is equivalent to
  samsung,s3c2412-nand

Changes since initial version:
- patch converted to a patch series
- read timings from nand_sdr_timings when booting with a device tree
- naming improvements in the device tree binding
  (s/nand/nand-controller/, s/_/-, s/children/child)
- dropped property samsung,ignore_unset_ecc
- remove @0 from nand device node
- checking pdev->dev.of_node instead of using ifdef CONFIG_OF_MTD
- preventing from parsing device tree properties twice
- increment the nand controller child node refcount, since we
  maintain a reference to it and its name field
- using of_device_get_match_data() instead of of_match_device()
  to make the code simpler
- remove CONFIG_MTD_NAND_S3C2410_HWECC compile option so we can
  select ECC mode using nand-ecc-mode property in the device tree

Sergio Prado (3):
  mtd: s3c2410: make ecc mode configurable via platform data
  dt-bindings: mtd: add DT binding for s3c2410 flash controller
  mtd: s3c2410: parse the device configuration from OF node

 .../devicetree/bindings/mtd/samsung-s3c2410.txt    |  56 +++++
 arch/arm/mach-s3c24xx/common-smdk.c                |   1 +
 arch/arm/mach-s3c24xx/mach-anubis.c                |   1 +
 arch/arm/mach-s3c24xx/mach-at2440evb.c             |   1 +
 arch/arm/mach-s3c24xx/mach-bast.c                  |   1 +
 arch/arm/mach-s3c24xx/mach-gta02.c                 |   1 +
 arch/arm/mach-s3c24xx/mach-jive.c                  |   1 +
 arch/arm/mach-s3c24xx/mach-mini2440.c              |   1 +
 arch/arm/mach-s3c24xx/mach-osiris.c                |   1 +
 arch/arm/mach-s3c24xx/mach-qt2410.c                |   1 +
 arch/arm/mach-s3c24xx/mach-rx1950.c                |   1 +
 arch/arm/mach-s3c24xx/mach-rx3715.c                |   1 +
 arch/arm/mach-s3c24xx/mach-vstms.c                 |   1 +
 arch/arm/mach-s3c64xx/mach-hmt.c                   |   1 +
 arch/arm/mach-s3c64xx/mach-mini6410.c              |   1 +
 arch/arm/mach-s3c64xx/mach-real6410.c              |   1 +
 drivers/mtd/nand/Kconfig                           |   9 -
 drivers/mtd/nand/s3c2410.c                         | 277 +++++++++++++++------
 include/linux/platform_data/mtd-nand-s3c2410.h     |   7 +-
 19 files changed, 278 insertions(+), 86 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/samsung-s3c2410.txt

-- 
1.9.1
