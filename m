From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v4 0/2] Move i2c sys_cfg register configuration to i2c driver
Date: Thu, 30 Oct 2014 13:34:28 +0530
Message-ID: <1414656270-8048-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:50389 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758467AbaJ3IKh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Oct 2014 04:10:37 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NE900F8L01NIM50@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 30 Oct 2014 17:10:35 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, thomas.ab@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>

This patch series is moving i2c sys_cfg register configuration settings from
mach-exynos to i2c driver. It will help in removing soc_is_exynos kind of
macro usage from mach-exynos also it will help in removing static mapping of
SYS registers.

This series is based on latest kgene/for-next and on top of following
Exynos-PMU patches

[1]: ARM: Exynos: Convert PMU implementation into a platform driver
https://lkml.org/lkml/2014/10/6/89

Revision V3 of these patches was posted along with Exynos Chipid driver
support patch [2]. 

[2]: https://lkml.org/lkml/2014/5/10/31

Change since v3:
 - Rebased on latest kgene/for-next (SHA-ID: 2b5fa1d5dabb9af8f2da4f380bea8684f9b96f59)
 - This series consist of only two patches from v3 [1] (v3[1/6] and v3[2/6]).
 - Addressed Tomasz Figa and Wolfram Sang's comments.
 - Updated i2c DT binding information.

Changes since v2:
 - Reorganized patches as suggested by Tomasz Figa.
 - Addressed review comments of Tomasz Figa in i2c-s3c2410.c file.

Changes since v1:
 - Added patch to move i2c interrupt re-configuration code from exynos.c
   to i2c driver, as suggested by Arnd.
 - After above patch only user of SYS_I2C_CFG register is pm.c so moving
   save/restore of this register also into i2c driver.
 - Spiltted up exynos4 and exynos5 machine descriptors to get rid from
   soc_is_exynos4/exynos5 kind of macros, as suggested by Arnd.
 - Changed location of chipid driver to "drivers/soc".
 - Added drivers/base/soc.c provided infrastructure to make SoC specific 
   information avaible to user space via sysfs entry, as suggested by Arnd.

Pankaj Dubey (2):
  i2c: s3c2410: Handle i2c sys_cfg register in i2c driver
  ARM: EXYNOS: Remove i2c sys configuration related code

 .../devicetree/bindings/i2c/i2c-s3c2410.txt        |    1 +
 arch/arm/boot/dts/exynos5250.dtsi                  |    4 ++
 arch/arm/boot/dts/exynos5420.dtsi                  |    4 ++
 arch/arm/mach-exynos/exynos.c                      |   39 +-------------------
 arch/arm/mach-exynos/include/mach/map.h            |    3 --
 arch/arm/mach-exynos/pm.c                          |    3 +-
 arch/arm/mach-exynos/regs-sys.h                    |   22 -----------
 arch/arm/mach-exynos/suspend.c                     |    7 ----
 drivers/i2c/busses/i2c-s3c2410.c                   |   31 ++++++++++++++++
 9 files changed, 44 insertions(+), 70 deletions(-)
 delete mode 100644 arch/arm/mach-exynos/regs-sys.h

-- 
1.7.9.5
