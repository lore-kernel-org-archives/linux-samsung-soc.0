From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH v4 02/12] ARM: EXYNOS: use exynos_init_uarts() instead of exynos4_init_uarts()
Date: Wed, 14 Mar 2012 07:42:08 -0700
Message-ID: <1331736138-28964-3-git-send-email-kgene.kim@samsung.com>
References: <1331736138-28964-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:45081 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755430Ab2CNOmh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Mar 2012 10:42:37 -0400
Received: by ghrr11 with SMTP id r11so1872516ghr.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Mar 2012 07:42:36 -0700 (PDT)
In-Reply-To: <1331736138-28964-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: arnd@arndb.de, olof@lixom.net, Kukjin Kim <kgene.kim@samsung.com>

Since exynos4_init_uarts() can be used for EXYNOS5 SoCs,
this patch changes the name of function to exynos_init_uarts().

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-exynos/common.c |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index a1f8a99..02eed29 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -52,7 +52,7 @@ static const char name_exynos4412[] = "EXYNOS4412";
 
 static void exynos4_map_io(void);
 static void exynos4_init_clocks(int xtal);
-static void exynos4_init_uarts(struct s3c2410_uartcfg *cfg, int no);
+static void exynos_init_uarts(struct s3c2410_uartcfg *cfg, int no);
 static int exynos_init(void);
 
 static struct cpu_table cpu_ids[] __initdata = {
@@ -61,7 +61,7 @@ static struct cpu_table cpu_ids[] __initdata = {
 		.idmask		= EXYNOS4_CPU_MASK,
 		.map_io		= exynos4_map_io,
 		.init_clocks	= exynos4_init_clocks,
-		.init_uarts	= exynos4_init_uarts,
+		.init_uarts	= exynos_init_uarts,
 		.init		= exynos_init,
 		.name		= name_exynos4210,
 	}, {
@@ -69,7 +69,7 @@ static struct cpu_table cpu_ids[] __initdata = {
 		.idmask		= EXYNOS4_CPU_MASK,
 		.map_io		= exynos4_map_io,
 		.init_clocks	= exynos4_init_clocks,
-		.init_uarts	= exynos4_init_uarts,
+		.init_uarts	= exynos_init_uarts,
 		.init		= exynos_init,
 		.name		= name_exynos4212,
 	}, {
@@ -77,7 +77,7 @@ static struct cpu_table cpu_ids[] __initdata = {
 		.idmask		= EXYNOS4_CPU_MASK,
 		.map_io		= exynos4_map_io,
 		.init_clocks	= exynos4_init_clocks,
-		.init_uarts	= exynos4_init_uarts,
+		.init_uarts	= exynos_init_uarts,
 		.init		= exynos_init,
 		.name		= name_exynos4412,
 	},
@@ -469,7 +469,7 @@ static int __init exynos_init(void)
 
 /* uart registration process */
 
-static void __init exynos4_init_uarts(struct s3c2410_uartcfg *cfg, int no)
+static void __init exynos_init_uarts(struct s3c2410_uartcfg *cfg, int no)
 {
 	struct s3c2410_uartcfg *tcfg = cfg;
 	u32 ucnt;
-- 
1.7.4.4
