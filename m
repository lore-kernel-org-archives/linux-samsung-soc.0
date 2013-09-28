From: Jungseok Lee <jays.lee@samsung.com>
Subject: ARM: EXYNOS: implement pm_power_off for EXYNOS5440
Date: Sat, 28 Sep 2013 14:07:15 +0900
Message-ID: <006e01cebc08$995a8650$cc0f92f0$%lee@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:63668 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750844Ab3I1FHT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 28 Sep 2013 01:07:19 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MTT00D2KKW11V50@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 28 Sep 2013 14:07:17 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: '???' <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org


This patch implements pm_power_off function since a power-down
control register should be set in order to turn off EXYNOS5440.
Otherwise, power domains remain alive despite "poweroff" action.

Signed-off-by: Jungseok Lee <jays.lee@samsung.com>
---
 arch/arm/mach-exynos/common.c |   17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index ba95e5d..21f3ce9 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -294,11 +294,24 @@ void exynos5_restart(enum reboot_mode mode, const char *cmd)
 	__raw_writel(val, addr);
 }
 
+static void exynos5440_power_off(void)
+{
+	struct device_node *np;
+	void __iomem *addr;
+
+	np = of_find_compatible_node(NULL, NULL, "samsung,exynos5440-clock");
+
+	addr = of_iomap(np, 0) + 0x14;
+
+	__raw_writel(0x1, addr);
+}
+
 void __init exynos_init_late(void)
 {
-	if (of_machine_is_compatible("samsung,exynos5440"))
-		/* to be supported later */
+	if (of_machine_is_compatible("samsung,exynos5440")) {
+		pm_power_off = exynos5440_power_off;
 		return;
+	}
 
 	exynos_pm_late_initcall();
 }
-- 
1.7.10.4
