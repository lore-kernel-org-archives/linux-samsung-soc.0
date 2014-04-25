From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCHv4 2/7] ARM: EXYNOS: Support secondary CPU boot of Exynos4212
Date: Fri, 25 Apr 2014 10:16:07 +0900
Message-ID: <1398388572-30239-3-git-send-email-cw00.choi@samsung.com>
References: <1398388572-30239-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:39160 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751176AbaDYBQW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Apr 2014 21:16:22 -0400
In-reply-to: <1398388572-30239-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, t.figa@samsung.com
Cc: linux-kernel@vger.kernel.org, linux@arm.linux.org.uk, ben-linux@fluff.org, arnd@arndb.de, olof@lixom.net, marc.zyngier@arm.com, thomas.abraham@linaro.org, kyungmin.park@samsung.com, cw00.choi@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, hyunhee.kim@samsung.com, yj44.cho@samsung.com, chanho61.park@samsung.com, sajjan.linux@gmail.com, tushar.behera@linaro.org, sachin.kamat@linaro.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org

From: Kyungmin Park <kyungmin.park@samsung.com>

This patch fix the offset of CPU boot address and change parameter of smc call
of SMC_CMD_CPU1BOOT command for Exynos4212.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 arch/arm/mach-exynos/firmware.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-exynos/firmware.c b/arch/arm/mach-exynos/firmware.c
index 932129e..aa01c42 100644
--- a/arch/arm/mach-exynos/firmware.c
+++ b/arch/arm/mach-exynos/firmware.c
@@ -18,6 +18,8 @@
 
 #include <mach/map.h>
 
+#include <plat/cpu.h>
+
 #include "smc.h"
 
 static int exynos_do_idle(void)
@@ -28,13 +30,24 @@ static int exynos_do_idle(void)
 
 static int exynos_cpu_boot(int cpu)
 {
+	/*
+	 * The second parameter of SMC_CMD_CPU1BOOT command means CPU id.
+	 * But, Exynos4212 has only one secondary CPU so second parameter
+	 * isn't used for informing secure firmware about CPU id.
+	 */
+	if (soc_is_exynos4212())
+		cpu = 0;
+
 	exynos_smc(SMC_CMD_CPU1BOOT, cpu, 0, 0);
 	return 0;
 }
 
 static int exynos_set_cpu_boot_addr(int cpu, unsigned long boot_addr)
 {
-	void __iomem *boot_reg = S5P_VA_SYSRAM_NS + 0x1c + 4*cpu;
+	void __iomem *boot_reg = S5P_VA_SYSRAM_NS + 0x1c;
+
+	if (!soc_is_exynos4212())
+		boot_reg += 4*cpu;
 
 	__raw_writel(boot_addr, boot_reg);
 	return 0;
-- 
1.8.0
