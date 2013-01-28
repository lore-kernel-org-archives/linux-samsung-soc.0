From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH 4/5] ARM: dts: adds FIMD AUXDATA node entry for exynos4 DT
Date: Mon, 28 Jan 2013 11:14:31 +0530
Message-ID: <1359351872-20518-5-git-send-email-vikas.sajjan@linaro.org>
References: <1359351872-20518-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f49.google.com ([209.85.160.49]:44738 "EHLO
	mail-pb0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751675Ab3A1Foz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jan 2013 00:44:55 -0500
Received: by mail-pb0-f49.google.com with SMTP id xa12so1252664pbc.8
        for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Jan 2013 21:44:55 -0800 (PST)
In-Reply-To: <1359351872-20518-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, thomas.abraham@linaro.org, sachin.kamat@linaro.org, t.figa@samsung.com, sylvester.nawrocki@gmail.com

This patch adds the FIMD AUXDATA node

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 arch/arm/mach-exynos/mach-exynos4-dt.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/mach-exynos/mach-exynos4-dt.c b/arch/arm/mach-exynos/mach-exynos4-dt.c
index ab1dacc..6c9e05f 100644
--- a/arch/arm/mach-exynos/mach-exynos4-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos4-dt.c
@@ -13,6 +13,7 @@
 
 #include <linux/of_platform.h>
 #include <linux/serial_core.h>
+#include <linux/fb.h>
 
 #include <asm/mach/arch.h>
 #include <asm/hardware/gic.h>
@@ -80,6 +81,9 @@ static const struct of_dev_auxdata exynos4_auxdata_lookup[] __initconst = {
 	OF_DEV_AUXDATA("arm,pl330", EXYNOS4_PA_MDMA1, "dma-pl330.2", NULL),
 	OF_DEV_AUXDATA("samsung,exynos4210-tmu", EXYNOS4_PA_TMU,
 				"exynos-tmu", NULL),
+	OF_DEV_AUXDATA("samsung,exynos4-fimd", EXYNOS4_PA_FIMD0,
+			"exynos4-fb.0", NULL),
+
 	{},
 };
 
-- 
1.7.9.5
