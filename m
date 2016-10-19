From: Sergio Prado <sergio.prado-1e4yhPs3/ABSwrhanM7KvQ@public.gmane.org>
Subject: [PATCH v2 0/3] mtd: s3c2410: add device tree support
Date: Wed, 19 Oct 2016 17:52:02 -0200
Message-ID: <1476906725-22613-1-git-send-email-sergio.prado@e-labworks.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-Y5A6D6n0/KfQXOPxS62xeg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sergio Prado <sergio.prado-1e4yhPs3/ABSwrhanM7KvQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

This series adds support for configuring Samsung's s3c2410 and
compatible flash memory controller via devicetree.

Tested on FriendlyARM mini2440, based on s3c2440 SoC.

Patch 3 depends on patch 1.

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
 drivers/mtd/nand/s3c2410.c                         | 274 +++++++++++++++------
 include/linux/platform_data/mtd-nand-s3c2410.h     |   7 +-
 19 files changed, 275 insertions(+), 86 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/samsung-s3c2410.txt

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
