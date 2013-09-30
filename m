From: Jungseok Lee <jays.lee@samsung.com>
Subject: [PATCH V2] ARM: EXYNOS: implement pm_power_off for EXYNOS5440
Date: Mon, 30 Sep 2013 10:32:05 +0900
Message-ID: <003101cebd7c$ded3a610$9c7af230$%lee@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:24568 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753565Ab3I3BcY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 29 Sep 2013 21:32:24 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MTX003AX09HOED0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 30 Sep 2013 10:32:05 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-samsung-soc@vger.kernel.org


This patch implements pm_power_off function since a power-down
control register should be set in order to turn off EXYNOS5440.
Otherwise, power domains remain alive despite "poweroff" action.

Signed-off-by: Jungseok Lee <jays.lee@samsung.com>
---
Changes since v1:
- Added a comment to the effect of register configuration.

 arch/arm/mach-exynos/common.c |   17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index ba95e5d..24eaa65 100644
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
+	/* turn off all power domains */
+	addr = of_iomap(np, 0) + 0x14;
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
