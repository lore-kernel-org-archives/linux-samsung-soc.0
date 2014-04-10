From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 2/6] ARM: EXYNOS: Staticize exynos_subsys
Date: Thu, 10 Apr 2014 13:54:52 +0530
Message-ID: <1397118296-6846-3-git-send-email-sachin.kamat@linaro.org>
References: <1397118296-6846-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f47.google.com ([209.85.160.47]:48500 "EHLO
	mail-pb0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965598AbaDJIZp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Apr 2014 04:25:45 -0400
Received: by mail-pb0-f47.google.com with SMTP id up15so3673698pbc.20
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Apr 2014 01:25:45 -0700 (PDT)
In-Reply-To: <1397118296-6846-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, arnd@arndb.de, kgene.kim@samsung.com, sachin.kamat@linaro.org

'exynos_subsys' is now local to this file. Make it static
and remove the declaration from header file.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos/exynos.c            |    2 +-
 arch/arm/plat-samsung/include/plat/cpu.h |    1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index 6a5fe18ec9b1..0ef42b9efd36 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -284,7 +284,7 @@ void __init exynos_init_io(void)
 	of_scan_flat_dt(exynos_fdt_map_sysram, NULL);
 }
 
-struct bus_type exynos_subsys = {
+static struct bus_type exynos_subsys = {
 	.name		= "exynos-core",
 	.dev_name	= "exynos-core",
 };
diff --git a/arch/arm/plat-samsung/include/plat/cpu.h b/arch/arm/plat-samsung/include/plat/cpu.h
index 5992b8dd9b89..930b4be832cd 100644
--- a/arch/arm/plat-samsung/include/plat/cpu.h
+++ b/arch/arm/plat-samsung/include/plat/cpu.h
@@ -239,7 +239,6 @@ extern struct bus_type s3c2443_subsys;
 extern struct bus_type s3c6410_subsys;
 extern struct bus_type s5p64x0_subsys;
 extern struct bus_type s5pv210_subsys;
-extern struct bus_type exynos_subsys;
 
 extern void (*s5pc1xx_idle)(void);
 
-- 
1.7.9.5
