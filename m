From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: S5P: Fix CPU idmask
Date: Wed, 23 Mar 2011 14:49:47 +0900
Message-ID: <1300859387-25418-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:51769 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751066Ab1CWGVL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Mar 2011 02:21:11 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

This patch fixes CPU idmask of S5P64X0 and EXYNOS4210.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/plat-s5p/cpu.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

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
-- 
1.7.1
