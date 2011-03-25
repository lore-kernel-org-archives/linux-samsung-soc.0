From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH v2] ARM: SAMSUNG: Fix CPU idmask
Date: Fri, 25 Mar 2011 19:03:41 +0900
Message-ID: <1301047421-25235-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:52514 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934355Ab1CYKbk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Mar 2011 06:31:40 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

This patch fixes CPU idmask of S5P64X0 and EXYNOS4210
and its comparison method because just want to use CPU
id for it.

Cc: Ben Dooks <ben-linux@fluff.org>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/plat-s5p/cpu.c      |    8 ++++----
 arch/arm/plat-samsung/init.c |    2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/plat-s5p/cpu.c b/arch/arm/plat-s5p/cpu.c
index c3bfe9b..5cf5e72 100644
--- a/arch/arm/plat-s5p/cpu.c
+++ b/arch/arm/plat-s5p/cpu.c
@@ -39,7 +39,7 @@ static const char name_exynos4210[] = "EXYNOS4210";
 static struct cpu_table cpu_ids[] __initdata = {
 	{
 		.idcode		= 0x56440100,
-		.idmask		= 0xffffff00,
+		.idmask		= 0xfffff000,
 		.map_io		= s5p6440_map_io,
 		.init_clocks	= s5p6440_init_clocks,
 		.init_uarts	= s5p6440_init_uarts,
@@ -47,7 +47,7 @@ static struct cpu_table cpu_ids[] __initdata = {
 		.name		= name_s5p6440,
 	}, {
 		.idcode		= 0x36442000,
-		.idmask		= 0xffffff00,
+		.idmask		= 0xfffff000,
 		.map_io		= s5p6442_map_io,
 		.init_clocks	= s5p6442_init_clocks,
 		.init_uarts	= s5p6442_init_uarts,
@@ -55,7 +55,7 @@ static struct cpu_table cpu_ids[] __initdata = {
 		.name		= name_s5p6442,
 	}, {
 		.idcode		= 0x36450000,
-		.idmask		= 0xffffff00,
+		.idmask		= 0xfffff000,
 		.map_io		= s5p6450_map_io,
 		.init_clocks	= s5p6450_init_clocks,
 		.init_uarts	= s5p6450_init_uarts,
@@ -79,7 +79,7 @@ static struct cpu_table cpu_ids[] __initdata = {
 		.name		= name_s5pv210,
 	}, {
 		.idcode		= 0x43210000,
-		.idmask		= 0xfffff000,
+		.idmask		= 0xfffe0000,
 		.map_io		= exynos4_map_io,
 		.init_clocks	= exynos4_init_clocks,
 		.init_uarts	= exynos4_init_uarts,
diff --git a/arch/arm/plat-samsung/init.c b/arch/arm/plat-samsung/init.c
index 6790edf..79d10fc 100644
--- a/arch/arm/plat-samsung/init.c
+++ b/arch/arm/plat-samsung/init.c
@@ -36,7 +36,7 @@ static struct cpu_table * __init s3c_lookup_cpu(unsigned long idcode,
 						unsigned int count)
 {
 	for (; count != 0; count--, tab++) {
-		if ((idcode & tab->idmask) == tab->idcode)
+		if ((idcode & tab->idmask) == (tab->idcode & tab->idmask))
 			return tab;
 	}
 
-- 
1.7.1
