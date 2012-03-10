From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 5/5] ARM: EXYNOS: add clock registers for exynos4x12-cpufreq
Date: Sat, 10 Mar 2012 02:19:09 -0800
Message-ID: <1331374749-23256-6-git-send-email-kgene.kim@samsung.com>
References: <1331374749-23256-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:62343 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753792Ab2CJKT2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 10 Mar 2012 05:19:28 -0500
Received: by mail-iy0-f174.google.com with SMTP id z16so3631387iag.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 10 Mar 2012 02:19:28 -0800 (PST)
In-Reply-To: <1331374749-23256-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: olof@lixom.net, Jaecheol Lee <jc.lee@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Jaecheol Lee <jc.lee@samsung.com>

Signed-off-by: Jaecheol Lee <jc.lee@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-exynos/include/mach/regs-clock.h |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/include/mach/regs-clock.h b/arch/arm/mach-exynos/include/mach/regs-clock.h
index 790f525..b1a2aeb 100644
--- a/arch/arm/mach-exynos/include/mach/regs-clock.h
+++ b/arch/arm/mach-exynos/include/mach/regs-clock.h
@@ -160,6 +160,15 @@
 #define EXYNOS4_CLKDIV_CPU0_PCLKDBG_MASK	(0x7 << EXYNOS4_CLKDIV_CPU0_PCLKDBG_SHIFT)
 #define EXYNOS4_CLKDIV_CPU0_APLL_SHIFT		(24)
 #define EXYNOS4_CLKDIV_CPU0_APLL_MASK		(0x7 << EXYNOS4_CLKDIV_CPU0_APLL_SHIFT)
+#define EXYNOS4_CLKDIV_CPU0_CORE2_SHIFT		28
+#define EXYNOS4_CLKDIV_CPU0_CORE2_MASK		(0x7 << EXYNOS4_CLKDIV_CPU0_CORE2_SHIFT)
+
+#define EXYNOS4_CLKDIV_CPU1_COPY_SHIFT		0
+#define EXYNOS4_CLKDIV_CPU1_COPY_MASK		(0x7 << EXYNOS4_CLKDIV_CPU1_COPY_SHIFT)
+#define EXYNOS4_CLKDIV_CPU1_HPM_SHIFT		4
+#define EXYNOS4_CLKDIV_CPU1_HPM_MASK		(0x7 << EXYNOS4_CLKDIV_CPU1_HPM_SHIFT)
+#define EXYNOS4_CLKDIV_CPU1_CORES_SHIFT		8
+#define EXYNOS4_CLKDIV_CPU1_CORES_MASK		(0x7 << EXYNOS4_CLKDIV_CPU1_CORES_SHIFT)
 
 #define EXYNOS4_CLKDIV_DMC0_ACP_SHIFT		(0)
 #define EXYNOS4_CLKDIV_DMC0_ACP_MASK		(0x7 << EXYNOS4_CLKDIV_DMC0_ACP_SHIFT)
-- 
1.7.4.4
