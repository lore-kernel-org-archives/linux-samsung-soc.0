From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 1/2] ARM: S5PC100: cleanup hsmmc clock definitions
Date: Tue, 03 Aug 2010 13:09:53 +0200
Message-ID: <1280833794-11147-2-git-send-email-m.szyprowski@samsung.com>
References: <1280833794-11147-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:18999 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755475Ab0HCLKA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Aug 2010 07:10:00 -0400
Received: from eu_spt1 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0L6K00B8NPOMYZ50@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 03 Aug 2010 12:09:58 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L6K009FQPOMCP@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 03 Aug 2010 12:09:58 +0100 (BST)
In-reply-to: <1280833794-11147-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org

This patch performs minor clocks cleanup for S5PC100 SoC. HSMMC special
clocks has been renamed back to sclk_mmc to match the common style of
clock names. This clock has been also added to sdhci clock source list.
The duplicate HCLK clock entry for sdhci-s3c has been disabled.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-s5pc100/clock.c       |    6 +++---
 arch/arm/mach-s5pc100/setup-sdhci.c |    8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-s5pc100/clock.c b/arch/arm/mach-s5pc100/clock.c
index 3ca2c44..ba66f6a 100644
--- a/arch/arm/mach-s5pc100/clock.c
+++ b/arch/arm/mach-s5pc100/clock.c
@@ -1072,7 +1072,7 @@ static struct clksrc_clk clksrcs[] = {
 		.reg_div = { .reg = S5P_CLK_DIV3, .shift = 24, .size = 4 },
 	}, {
 		.clk	= {
-			.name		= "mmc_bus",
+			.name		= "sclk_mmc",
 			.id		= 0,
 			.ctrlbit	= (1 << 12),
 			.enable		= s5pc100_sclk1_ctrl,
@@ -1083,7 +1083,7 @@ static struct clksrc_clk clksrcs[] = {
 		.reg_div = { .reg = S5P_CLK_DIV3, .shift = 0, .size = 4 },
 	}, {
 		.clk	= {
-			.name		= "mmc_bus",
+			.name		= "sclk_mmc",
 			.id		= 1,
 			.ctrlbit	= (1 << 13),
 			.enable		= s5pc100_sclk1_ctrl,
@@ -1094,7 +1094,7 @@ static struct clksrc_clk clksrcs[] = {
 		.reg_div = { .reg = S5P_CLK_DIV3, .shift = 4, .size = 4 },
 	}, {
 		.clk	= {
-			.name		= "mmc_bus",
+			.name		= "sclk_mmc",
 			.id		= 2,
 			.ctrlbit	= (1 << 14),
 			.enable		= s5pc100_sclk1_ctrl,
diff --git a/arch/arm/mach-s5pc100/setup-sdhci.c b/arch/arm/mach-s5pc100/setup-sdhci.c
index ea7ff19..f16946e 100644
--- a/arch/arm/mach-s5pc100/setup-sdhci.c
+++ b/arch/arm/mach-s5pc100/setup-sdhci.c
@@ -26,10 +26,10 @@
 /* clock sources for the mmc bus clock, order as for the ctrl2[5..4] */
 
 char *s5pc100_hsmmc_clksrcs[4] = {
-	[0] = "hsmmc",
-	[1] = "hsmmc",
-	/* [2] = "mmc_bus", not yet successfully used yet */
-	/* [3] = "48m", - note not successfully used yet */
+	[0] = "hsmmc",		/* HCLK */
+	/* [1] = "hsmmc",	- duplicate HCLK entry */
+	[2] = "sclk_mmc",	/* mmc_bus */
+	/* [3] = "48m",		- note not successfully used yet */
 };
 
 
-- 
1.7.1.569.g6f426
