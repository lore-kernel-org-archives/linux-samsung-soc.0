From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 0/5] ARM: EXYNOS: Add support for Trats board using device
 tree
Date: Tue, 04 Sep 2012 10:50:04 +0200
Message-ID: <1346748609-11115-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:57796 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752850Ab2IDIu2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Sep 2012 04:50:28 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M9T0086XHVDINR0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 04 Sep 2012 17:50:27 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M9T00APCHVV47N0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 04 Sep 2012 17:50:27 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, jy0922.shim@samsung.com, kgene.kim@samsung.com, thomas.abraham@linaro.org, Tomasz Figa <t.figa@samsung.com>

This patch series adds basic device tree support for Samsung Trats board
along with any necessary prerequisites.

In addition it refactors Exynos4 dts include files to split parts common to
the whole Exynos4 part from parts specific to Exynos4210 to allow further
extension of Exynos4210 dts include file and addition of include files for
other SoCs from Exynos4 line.

Changes since v1:
 - Split into two series, general Exynos4 DT reorganization and this one.
 - Addressed comments from v1.

Dependencies:
-> [PATCH v5] mmc: sdhci-s3c: Add device tree support
http://www.spinics.net/lists/linux-samsung-soc/msg12056.html
-> [PATCH v5 2/2] regulator: add device tree support for max8997
http://www.spinics.net/lists/kernel/msg1328117.html
-> [PATCH 0/3] ARM: dts: Exynos4 dts reorganization
http://www.spinics.net/lists/arm-kernel/msg192237.html

Tomasz Figa (5):
  mmc: host: sdhci-s3c: Add broken-voltage DT property for broken
    voltage quirk
  ARM: Exynos4: dts: Specify address and size cells for i2c controllers
  ARM: Exynos4: Add OF compatibility lookups for Exynos4 i2c adapters
  ARM: EXYNOS: Increase maximum possible memory bank size to 512MiB
  ARM: Exynos: Add basic dts file for Samsung Trats board

 Documentation/devicetree/bindings/mmc/mmc.txt |   1 +
 arch/arm/boot/dts/exynos4.dtsi                |  16 ++
 arch/arm/boot/dts/exynos4210-trats.dts        | 237 ++++++++++++++++++++++++++
 arch/arm/mach-exynos/Makefile.boot            |   2 +-
 arch/arm/mach-exynos/include/mach/memory.h    |   4 +-
 arch/arm/mach-exynos/mach-exynos4-dt.c        |  14 ++
 drivers/mmc/host/sdhci-s3c.c                  |   3 +
 7 files changed, 274 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/exynos4210-trats.dts

-- 
1.7.12
