From: Amit Daniel Kachhap <amit.kachhap@linaro.org>
Subject: [RFC PATCH 2/4] ARM: EXYNOS4: Fix to work with origen boards.
Date: Fri, 19 Aug 2011 18:39:58 +0530
Message-ID: <1313759400-31347-2-git-send-email-amit.kachhap@linaro.org>
References: <1313759340-31319-1-git-send-email-amit.kachhap@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f170.google.com ([209.85.210.170]:49880 "EHLO
	mail-iy0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751277Ab1HSNKO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Aug 2011 09:10:14 -0400
Received: by mail-iy0-f170.google.com with SMTP id 16so5571073iye.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Aug 2011 06:10:14 -0700 (PDT)
In-Reply-To: <1313759340-31319-1-git-send-email-amit.kachhap@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linaro-dev@lists.linaro.org, linux-arm-kernel@lists.infradead.org, amit.kachhap@linaro.org, patches@linaro.org

This adds a function to get the revision id.

Signed-off-by: Jaecheol Lee <jc.lee@samsung.com>
Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
---
 arch/arm/mach-exynos4/cpu.c              |   10 ++++++++++
 arch/arm/plat-s5p/include/plat/exynos4.h |    1 +
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/cpu.c b/arch/arm/mach-exynos4/cpu.c
index 2d8a40c..8b106b8 100644
--- a/arch/arm/mach-exynos4/cpu.c
+++ b/arch/arm/mach-exynos4/cpu.c
@@ -234,6 +234,16 @@ static int __init exynos4_l2x0_cache_init(void)
 early_initcall(exynos4_l2x0_cache_init);
 #endif
 
+int exynos4_subrev(void)
+{
+	static int subrev = -1;
+
+	if (unlikely(subrev < 0))
+		subrev = readl(S5P_VA_CHIPID) & 0xf;
+
+	return subrev;
+}
+
 int __init exynos4_init(void)
 {
 	printk(KERN_INFO "EXYNOS4: Initializing architecture\n");
diff --git a/arch/arm/plat-s5p/include/plat/exynos4.h b/arch/arm/plat-s5p/include/plat/exynos4.h
index 907caab..d62f7f7 100644
--- a/arch/arm/plat-s5p/include/plat/exynos4.h
+++ b/arch/arm/plat-s5p/include/plat/exynos4.h
@@ -15,6 +15,7 @@
 extern void exynos4_common_init_uarts(struct s3c2410_uartcfg *cfg, int no);
 extern void exynos4_register_clocks(void);
 extern void exynos4_setup_clocks(void);
+extern int exynos4_subrev(void);
 
 #ifdef CONFIG_CPU_EXYNOS4210
 
-- 
1.7.1
