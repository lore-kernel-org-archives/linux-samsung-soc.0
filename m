From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH 1/4] ARM: S5P64X0: Changed the name for mmc special clock on s5p6440
Date: Mon, 13 Dec 2010 14:46:22 +0900
Message-ID: <1292219185-3911-2-git-send-email-sbkim73@samsung.com>
References: <1292219185-3911-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:41975 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751299Ab0LMGFh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Dec 2010 01:05:37 -0500
In-Reply-To: <1292219185-3911-1-git-send-email-sbkim73@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, Abhilash Kesavan <a.kesavan@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>

From: Abhilash Kesavan <a.kesavan@samsung.com>

Change the name of mmc spcial clock from mmc_bus to sclk_mmc to be
in line with the naming across the s5p series

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
---
 arch/arm/mach-s5p64x0/clock-s5p6440.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-s5p64x0/clock-s5p6440.c b/arch/arm/mach-s5p64x0/clock-s5p6440.c
index e4883dc..d27ff1a 100644
--- a/arch/arm/mach-s5p64x0/clock-s5p6440.c
+++ b/arch/arm/mach-s5p64x0/clock-s5p6440.c
@@ -419,7 +419,7 @@ static struct clksrc_sources clkset_audio = {
 static struct clksrc_clk clksrcs[] = {
 	{
 		.clk	= {
-			.name		= "mmc_bus",
+			.name		= "sclk_mmc",
 			.id		= 0,
 			.ctrlbit	= (1 << 24),
 			.enable		= s5p64x0_sclk_ctrl,
@@ -429,7 +429,7 @@ static struct clksrc_clk clksrcs[] = {
 		.reg_div = { .reg = S5P64X0_CLK_DIV1, .shift = 0, .size = 4 },
 	}, {
 		.clk	= {
-			.name		= "mmc_bus",
+			.name		= "sclk_mmc",
 			.id		= 1,
 			.ctrlbit	= (1 << 25),
 			.enable		= s5p64x0_sclk_ctrl,
@@ -439,7 +439,7 @@ static struct clksrc_clk clksrcs[] = {
 		.reg_div = { .reg = S5P64X0_CLK_DIV1, .shift = 4, .size = 4 },
 	}, {
 		.clk	= {
-			.name		= "mmc_bus",
+			.name		= "sclk_mmc",
 			.id		= 2,
 			.ctrlbit	= (1 << 26),
 			.enable		= s5p64x0_sclk_ctrl,
-- 
1.6.6.1
