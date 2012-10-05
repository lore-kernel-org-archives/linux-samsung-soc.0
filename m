From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH] ARM: EXYNOS5: Remove wrongly placed usb2.0 PHY_CFG definition
 from PMU_REG
Date: Fri, 05 Oct 2012 18:56:30 +0530
Message-ID: <1349443590-29901-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:52921 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755577Ab2JENVa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 5 Oct 2012 09:21:30 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MBF00D1J93LMY60@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 05 Oct 2012 22:21:28 +0900 (KST)
Received: from vivekkumarg-linuxpc.sisodomain.com ([107.108.73.134])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MBF0003N937ZSC0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 05 Oct 2012 22:21:27 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, thomas.abraham@linaro.org

EXYNOS5_USB_CFG macro should actually point to USB20PHY_CFG
system register (base addr + 0x230). It's wrongly placed in regs-pmu.
Actual register at offset 0x230 in PMU is SEQ_TRANSITION4.

Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
---
 arch/arm/mach-exynos/include/mach/regs-pmu.h |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/include/mach/regs-pmu.h b/arch/arm/mach-exynos/include/mach/regs-pmu.h
index d4e392b..70b2795 100644
--- a/arch/arm/mach-exynos/include/mach/regs-pmu.h
+++ b/arch/arm/mach-exynos/include/mach/regs-pmu.h
@@ -230,8 +230,6 @@
 
 /* For EXYNOS5 */
 
-#define EXYNOS5_USB_CFG						S5P_PMUREG(0x0230)
-
 #define EXYNOS5_AUTO_WDTRESET_DISABLE				S5P_PMUREG(0x0408)
 #define EXYNOS5_MASK_WDTRESET_REQUEST				S5P_PMUREG(0x040C)
 
-- 
1.7.6.5
