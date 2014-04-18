From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCHv3 3/7] ARM: EXYNOS: Support secondary CPU boot of Exynos3250
Date: Fri, 18 Apr 2014 10:15:24 +0900
Message-ID: <1397783728-6193-4-git-send-email-cw00.choi@samsung.com>
References: <1397783728-6193-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:53758 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751208AbaDRBPa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Apr 2014 21:15:30 -0400
In-reply-to: <1397783728-6193-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux@arm.linux.org.uk, ben-linux@fluff.org, kgene.kim@samsung.com, t.figa@samsung.com, arnd@arndb.de, olof@lixom.net, marc.zyngier@arm.com, thomas.abraham@linaro.org, kyungmin.park@samsung.com, cw00.choi@samsung.com, sw0312.kim@samsung.com, hyunhee.kim@samsung.com, yj44.cho@samsung.com, chanho61.park@samsung.com, sajjan.linux@gmail.com, tushar.behera@linaro.org, sachin.kamat@linaro.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org

This patch fix the offset of CPU boot address and don't need to send smc call
of SMC_CMD_CPU1BOOT command for secondary CPU boot because Exynos3250 removes
WFE in secure mode.

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/firmware.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/firmware.c b/arch/arm/mach-exynos/firmware.c
index aa01c42..386d01d 100644
--- a/arch/arm/mach-exynos/firmware.c
+++ b/arch/arm/mach-exynos/firmware.c
@@ -31,11 +31,17 @@ static int exynos_do_idle(void)
 static int exynos_cpu_boot(int cpu)
 {
 	/*
+	 * Exynos3250 doesn't need to send smc command for secondary CPU boot
+	 * because Exynos3250 removes WFE in secure mode.
+	 */
+	if (soc_is_exynos3250())
+		return 0;
+	/*
 	 * The second parameter of SMC_CMD_CPU1BOOT command means CPU id.
 	 * But, Exynos4212 has only one secondary CPU so second parameter
 	 * isn't used for informing secure firmware about CPU id.
 	 */
-	if (soc_is_exynos4212())
+	else if (soc_is_exynos4212())
 		cpu = 0;
 
 	exynos_smc(SMC_CMD_CPU1BOOT, cpu, 0, 0);
@@ -46,7 +52,7 @@ static int exynos_set_cpu_boot_addr(int cpu, unsigned long boot_addr)
 {
 	void __iomem *boot_reg = S5P_VA_SYSRAM_NS + 0x1c;
 
-	if (!soc_is_exynos4212())
+	if (!soc_is_exynos4212() && !soc_is_exynos3250())
 		boot_reg += 4*cpu;
 
 	__raw_writel(boot_addr, boot_reg);
-- 
1.8.0
