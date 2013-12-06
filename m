From: Arun Kumar K <arun.kk@samsung.com>
Subject: [PATCH 1/3] ARM: EXYNOS: Add exynos5 CPU clock divider offsets
Date: Fri,  6 Dec 2013 15:18:02 +0530
Message-ID: <1386323284-15646-2-git-send-email-arun.kk@samsung.com>
References: <1386323284-15646-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:56629 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755124Ab3LFJtH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Dec 2013 04:49:07 -0500
In-Reply-To: <1386323284-15646-1-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, cpufreq@vger.kernel.org
Cc: mturquette@linaro.org, kgene.kim@samsung.com, rjw@rjwysocki.net, viresh.kumar@linaro.org, tomasz.figa@gmail.com, arjun.kv@samsung.com, abrestic@chromium.org, arunkk.samsung@gmail.com

Adds the CPU clock divider shifts and masks for Exynos5 SoC.
These defines will be used in cpufreq driver.

Signed-off-by: Arjun.K.V <arjun.kv@samsung.com>
Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
---
 arch/arm/mach-exynos/include/mach/regs-clock.h |   24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/mach-exynos/include/mach/regs-clock.h b/arch/arm/mach-exynos/include/mach/regs-clock.h
index d36ad76..d0186d3 100644
--- a/arch/arm/mach-exynos/include/mach/regs-clock.h
+++ b/arch/arm/mach-exynos/include/mach/regs-clock.h
@@ -347,6 +347,30 @@
 
 #define EXYNOS5_EPLLCON0_LOCKED_SHIFT		(29)
 
+/* CLK_DIV_CPU0 */
+#define EXYNOS5_CLKDIV_CPU0_CORE_SHIFT		0
+#define EXYNOS5_CLKDIV_CPU0_CORE_MASK		(0x7 << EXYNOS5_CLKDIV_CPU0_CORE_SHIFT)
+#define EXYNOS5_CLKDIV_CPU0_CPUD_SHIFT		4
+#define EXYNOS5_CLKDIV_CPU0_CPUD_MASK		(0x7 << EXYNOS5_CLKDIV_CPU0_CPUD_SHIFT)
+#define EXYNOS5_CLKDIV_CPU0_ACP_SHIFT		8
+#define EXYNOS5_CLKDIV_CPU0_ACP_MASK		(0x7 << EXYNOS5_CLKDIV_CPU0_ACP_SHIFT)
+#define EXYNOS5_CLKDIV_CPU0_ATB_SHIFT		16
+#define EXYNOS5_CLKDIV_CPU0_ATB_MASK		(0x7 << EXYNOS5_CLKDIV_CPU0_ATB_SHIFT)
+#define EXYNOS5_CLKDIV_CPU0_PCLKDBG_SHIFT	20
+#define EXYNOS5_CLKDIV_CPU0_PCLKDBG_MASK	(0x7 << EXYNOS5_CLKDIV_CPU0_PCLKDBG_SHIFT)
+#define EXYNOS5_CLKDIV_CPU0_APLL_SHIFT		24
+#define EXYNOS5_CLKDIV_CPU0_APLL_MASK		(0x7 << EXYNOS5_CLKDIV_CPU0_APLL_SHIFT)
+#define EXYNOS5_CLKDIV_CPU0_CORE2_SHIFT		28
+#define EXYNOS5_CLKDIV_CPU0_CORE2_MASK		(0x7 << EXYNOS5_CLKDIV_CPU0_CORE2_SHIFT)
+
+/* CLK_DIV_CPU1 */
+#define EXYNOS5_CLKDIV_CPU1_COPY_SHIFT		0
+#define EXYNOS5_CLKDIV_CPU1_COPY_MASK		(0x7 << EXYNOS5_CLKDIV_CPU1_COPY_SHIFT)
+#define EXYNOS5_CLKDIV_CPU1_HPM_SHIFT		4
+#define EXYNOS5_CLKDIV_CPU1_HPM_MASK		(0x7 << EXYNOS5_CLKDIV_CPU1_HPM_SHIFT)
+#define EXYNOS5_CLKSRC_CPU_MUXCORE_SHIFT	16
+#define EXYNOS5_CLKMUX_STATCPU_MUXCORE_MASK	(0x7 << EXYNOS5_CLKSRC_CPU_MUXCORE_SHIFT)
+
 #define PWR_CTRL1_CORE2_DOWN_RATIO		(7 << 28)
 #define PWR_CTRL1_CORE1_DOWN_RATIO		(7 << 16)
 #define PWR_CTRL1_DIV2_DOWN_EN			(1 << 9)
-- 
1.7.9.5
