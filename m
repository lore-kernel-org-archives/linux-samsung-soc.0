From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: Exynos: Add generic compatible string
Date: Wed, 19 Feb 2014 17:04:05 +0530
Message-ID: <1392809645-631-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f181.google.com ([209.85.192.181]:33814 "EHLO
	mail-pd0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751959AbaBSLjh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Feb 2014 06:39:37 -0500
Received: by mail-pd0-f181.google.com with SMTP id y10so265862pdj.12
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Feb 2014 03:39:36 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, arnd@arndb.de, sachin.kamat@linaro.org

To avoid modifying the kernel every time a new SoC variant
comes out.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos/mach-exynos4-dt.c |    1 +
 arch/arm/mach-exynos/mach-exynos5-dt.c |    1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/mach-exynos/mach-exynos4-dt.c b/arch/arm/mach-exynos/mach-exynos4-dt.c
index d3e54b7644d7..5d037b561253 100644
--- a/arch/arm/mach-exynos/mach-exynos4-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos4-dt.c
@@ -28,6 +28,7 @@ static void __init exynos4_dt_machine_init(void)
 }
 
 static char const *exynos4_dt_compat[] __initdata = {
+	"samsung,exynos4",
 	"samsung,exynos4210",
 	"samsung,exynos4212",
 	"samsung,exynos4412",
diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
index 37ea261f0f6c..ad0db5a93da8 100644
--- a/arch/arm/mach-exynos/mach-exynos5-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
@@ -50,6 +50,7 @@ static void __init exynos5_dt_machine_init(void)
 }
 
 static char const *exynos5_dt_compat[] __initdata = {
+	"samsung,exynos5",
 	"samsung,exynos5250",
 	"samsung,exynos5420",
 	"samsung,exynos5440",
-- 
1.7.9.5
