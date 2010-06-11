From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: [PATCH v2 3/4] ARM: S5PC100: Move external interrupt defines
Date: Fri, 11 Jun 2010 17:33:19 +0900
Message-ID: <1276245200-18052-3-git-send-email-jy0922.shim@samsung.com>
References: <1276245200-18052-1-git-send-email-jy0922.shim@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:40247 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759152Ab0FKIdZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Jun 2010 04:33:25 -0400
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L3U00586D3MNU40@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 11 Jun 2010 17:33:22 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L3U00GE5D3MIA@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 11 Jun 2010 17:33:22 +0900 (KST)
In-reply-to: <1276245200-18052-1-git-send-email-jy0922.shim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: ben-linux@fluff.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com

This patch moves external interrupt defines from gpio.h to regs-gpio.h
for consistency with s5pv210.

Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-s5pc100/include/mach/gpio.h      |    7 -------
 arch/arm/mach-s5pc100/include/mach/regs-gpio.h |    7 +++++++
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-s5pc100/include/mach/gpio.h b/arch/arm/mach-s5pc100/include/mach/gpio.h
index 71ae1f5..29a8a12 100644
--- a/arch/arm/mach-s5pc100/include/mach/gpio.h
+++ b/arch/arm/mach-s5pc100/include/mach/gpio.h
@@ -146,13 +146,6 @@ enum s5p_gpio_number {
 /* define the number of gpios we need to the one after the MP04() range */
 #define ARCH_NR_GPIOS		(S5PC100_GPIO_END + 1)
 
-#define EINT_MODE		S3C_GPIO_SFN(0x2)
-
-#define EINT_GPIO_0(x)		S5PC100_GPH0(x)
-#define EINT_GPIO_1(x)		S5PC100_GPH1(x)
-#define EINT_GPIO_2(x)		S5PC100_GPH2(x)
-#define EINT_GPIO_3(x)		S5PC100_GPH3(x)
-
 #include <asm-generic/gpio.h>
 
 #endif /* __ASM_ARCH_GPIO_H */
diff --git a/arch/arm/mach-s5pc100/include/mach/regs-gpio.h b/arch/arm/mach-s5pc100/include/mach/regs-gpio.h
index dd6295e..6abe481 100644
--- a/arch/arm/mach-s5pc100/include/mach/regs-gpio.h
+++ b/arch/arm/mach-s5pc100/include/mach/regs-gpio.h
@@ -71,5 +71,12 @@
 #define S5P_EXTINT_RISEEDGE		(0x03)
 #define S5P_EXTINT_BOTHEDGE		(0x04)
 
+#define EINT_MODE		S3C_GPIO_SFN(0x2)
+
+#define EINT_GPIO_0(x)		S5PC100_GPH0(x)
+#define EINT_GPIO_1(x)		S5PC100_GPH1(x)
+#define EINT_GPIO_2(x)		S5PC100_GPH2(x)
+#define EINT_GPIO_3(x)		S5PC100_GPH3(x)
+
 #endif /* __ASM_MACH_S5PC100_REGS_GPIO_H */
 
-- 
1.7.0.4
