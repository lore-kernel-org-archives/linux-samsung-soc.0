From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCHv5 2/5] ARM: EXYNOS: Support secondary CPU boot of Exynos3250
Date: Tue, 13 May 2014 22:05:05 +0900
Message-ID: <1399986308-23744-3-git-send-email-cw00.choi@samsung.com>
References: <1399986308-23744-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1399986308-23744-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kgene.kim@samsung.com, t.figa@samsung.com
Cc: linux-kernel@vger.kernel.org, linux@arm.linux.org.uk, ben-linux@fluff.org, arnd@arndb.de, olof@lixom.net, marc.zyngier@arm.com, thomas.abraham@linaro.org, kyungmin.park@samsung.com, cw00.choi@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, hyunhee.kim@samsung.com, yj44.cho@samsung.com, chanho61.park@samsung.com, sajjan.linux@gmail.com, tushar.behera@linaro.org, sachin.kamat@linaro.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch fix the offset of CPU boot address and don't need to send smc call
of SMC_CMD_CPU1BOOT command for secondary CPU boot because Exynos3250 removes
WFE in secure mode.

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/firmware.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-exynos/firmware.c b/arch/arm/mach-exynos/firmware.c
index 739bdc8..eb91d23 100644
--- a/arch/arm/mach-exynos/firmware.c
+++ b/arch/arm/mach-exynos/firmware.c
@@ -30,6 +30,13 @@ static int exynos_do_idle(void)
 static int exynos_cpu_boot(int cpu)
 {
 	/*
+	 * Exynos3250 doesn't need to send smc command for secondary CPU boot
+	 * because Exynos3250 removes WFE in secure mode.
+	 */
+	if (soc_is_exynos3250())
+		return 0;
+
+	/*
 	 * The second parameter of SMC_CMD_CPU1BOOT command means CPU id.
 	 * But, Exynos4212 has only one secondary CPU so second parameter
 	 * isn't used for informing secure firmware about CPU id.
@@ -50,7 +57,7 @@ static int exynos_set_cpu_boot_addr(int cpu, unsigned long boot_addr)
 
 	boot_reg = sysram_ns_base_addr + 0x1c;
 
-	if (!soc_is_exynos4212())
+	if (!soc_is_exynos4212() && !soc_is_exynos3250())
 		boot_reg += 4*cpu;
 
 	__raw_writel(boot_addr, boot_reg);
-- 
1.8.0
