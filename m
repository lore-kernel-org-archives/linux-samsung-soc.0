From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v2 0/2] ARM: Exynos4-DT: Enable pinctrl driver support
Date: Thu, 23 Aug 2012 16:54:56 +0530
Message-ID: <1345721098-32459-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:20128 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756333Ab2HWLIO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Aug 2012 07:08:14 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M970064BG9NBF90@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 23 Aug 2012 20:08:13 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M9700CFKG7RAC20@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 23 Aug 2012 20:08:12 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linus.walleij@linaro.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, kgene.kim@samsung.com, patches@linaro.org

This patch series enables support for pin controller driver for Exynos4210 SoC
based device tree enabled platforms. The first patch in this series adds the
pin group nodes for each of the three pin controller instances, but it is not
a exhaustive list of all possible pin group nodes. As the coverage of pinctrl
driver is extended device drivers used on Exynos4210 platforms, additional
pin group nodes can be added as required.

Thomas Abraham (2):
  ARM: dts: Add pinctrl node entries for Samsung Exynos4210 SoC
  ARM: EXYNOS: Enable pinctrl driver support for Exynos4 device tree enabled platform

 arch/arm/boot/dts/exynos4210-pinctrl.dtsi |  457 +++++++++++++++++++++++++++++
 arch/arm/boot/dts/exynos4210.dtsi         |   37 +++
 arch/arm/mach-exynos/Kconfig              |    2 +
 3 files changed, 496 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/boot/dts/exynos4210-pinctrl.dtsi
