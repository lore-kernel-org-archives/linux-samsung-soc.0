From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v2 2/2] ARM: EXYNOS: Enable pinctrl driver support for Exynos4
 device tree enabled platform
Date: Thu, 23 Aug 2012 16:54:58 +0530
Message-ID: <1345721098-32459-3-git-send-email-thomas.abraham@linaro.org>
References: <1345721098-32459-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:51725 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756548Ab2HWLJb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Aug 2012 07:09:31 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M97003YQGBU99A0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 23 Aug 2012 20:09:30 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M9700CFKG7RAC20@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 23 Aug 2012 20:09:30 +0900 (KST)
In-reply-to: <1345721098-32459-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linus.walleij@linaro.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, kgene.kim@samsung.com, patches@linaro.org

This enables support for Samsung and Exynos4 pinctrl driver for device
tree enabled Exynos4 platforms.

Cc: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/mach-exynos/Kconfig |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index b5b4c8c..195b50e 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -405,6 +405,8 @@ config MACH_EXYNOS4_DT
 	select USE_OF
 	select ARM_AMBA
 	select HAVE_SAMSUNG_KEYPAD if INPUT_KEYBOARD
+	select PINCTRL
+	select PINCTRL_EXYNOS4
 	help
 	  Machine support for Samsung Exynos4 machine with device tree enabled.
 	  Select this if a fdt blob is available for the Exynos4 SoC based board.
-- 
1.6.6.rc2
