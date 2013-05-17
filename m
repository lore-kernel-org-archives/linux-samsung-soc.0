From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 2/6] ARM: EXYNOS: Fix EINT wake-up mask configuration when
 pinctrl is used
Date: Fri, 17 May 2013 18:24:28 +0200
Message-ID: <1368807872-2601-3-git-send-email-t.figa@samsung.com>
References: <1368807872-2601-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:44235 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755807Ab3EQQZC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 May 2013 12:25:02 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MMY009ZMAXN4WA0@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 17 May 2013 17:25:00 +0100 (BST)
In-reply-to: <1368807872-2601-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, arnd@arndb.de, olof@lixom.net, Doug Anderson <dianders@chromium.org>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Abraham <thomas.abraham@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Prathyush K <prathyush.k@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Tomasz Figa <t.figa@samsung.com>

On DT-enabled systems pinctrl-exynos driver is responsible for handling
of wake-up EINT interrupts. This patch adjusts wake-up mask
configuration code to take wake-up mask value from pinctrl-exynos driver
on DT-enabled systems.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/include/mach/pm-core.h | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-exynos/include/mach/pm-core.h b/arch/arm/mach-exynos/include/mach/pm-core.h
index 7dbbfec..296090e 100644
--- a/arch/arm/mach-exynos/include/mach/pm-core.h
+++ b/arch/arm/mach-exynos/include/mach/pm-core.h
@@ -18,8 +18,15 @@
 #ifndef __ASM_ARCH_PM_CORE_H
 #define __ASM_ARCH_PM_CORE_H __FILE__
 
+#include <linux/of.h>
 #include <mach/regs-pmu.h>
 
+#ifdef CONFIG_PINCTRL_EXYNOS
+extern u32 exynos_get_eint_wake_mask(void);
+#else
+static inline u32 exynos_get_eint_wake_mask(void) { return 0xffffffff; }
+#endif
+
 static inline void s3c_pm_debug_init_uart(void)
 {
 	/* nothing here yet */
@@ -27,7 +34,12 @@ static inline void s3c_pm_debug_init_uart(void)
 
 static inline void s3c_pm_arch_prepare_irqs(void)
 {
-	__raw_writel(s3c_irqwake_eintmask, S5P_EINT_WAKEUP_MASK);
+	u32 eintmask = s3c_irqwake_eintmask;
+
+	if (of_have_populated_dt())
+		eintmask = exynos_get_eint_wake_mask();
+
+	__raw_writel(eintmask, S5P_EINT_WAKEUP_MASK);
 	__raw_writel(s3c_irqwake_intmask & ~(1 << 31), S5P_WAKEUP_MASK);
 }
 
-- 
1.8.2.1
