From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 05/27] ARM: EXYNOS: Support secondary CPU boot of Exynos3250
Date: Thu, 10 Apr 2014 18:28:22 +0900
Message-ID: <1397122124-15690-6-git-send-email-cw00.choi@samsung.com>
References: <1397122124-15690-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:64883 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934952AbaDJJ3M (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Apr 2014 05:29:12 -0400
In-reply-to: <1397122124-15690-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, t.figa@samsung.com, linux-samsung-soc@vger.kernel.org
Cc: kyungmin.park@samsung.com, cw00.choi@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, hyunhee.kim@samsung.com, yj44.cho@samsung.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

This patch fix the offset of CPU boot address and don't operate smc call
of SMC_CMD_CPU1BOOT command for Exynos3250.

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/firmware.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/firmware.c b/arch/arm/mach-exynos/firmware.c
index 91a911d..8350007 100644
--- a/arch/arm/mach-exynos/firmware.c
+++ b/arch/arm/mach-exynos/firmware.c
@@ -30,10 +30,13 @@ static int exynos_do_idle(void)
 
 static int exynos_cpu_boot(int cpu)
 {
-	if (soc_is_exynos4212())
+	if (soc_is_exynos3250())
+		goto out;
+	else if (soc_is_exynos4212())
 		exynos_smc(SMC_CMD_CPU1BOOT, 0, 0, 0);
 	else
 		exynos_smc(SMC_CMD_CPU1BOOT, cpu, 0, 0);
+out:
 	return 0;
 }
 
@@ -41,7 +44,7 @@ static int exynos_set_cpu_boot_addr(int cpu, unsigned long boot_addr)
 {
 	void __iomem *boot_reg = S5P_VA_SYSRAM_NS + 0x1c;
 
-	if (soc_is_exynos4212())
+	if (soc_is_exynos4212() || soc_is_exynos3250())
 		goto out;
 	else
 		boot_reg += 4*cpu;
-- 
1.8.0
