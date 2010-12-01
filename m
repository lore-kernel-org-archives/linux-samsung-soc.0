From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH] ARM :S5P64X0 :add clock support for rtc
Date: Wed,  1 Dec 2010 16:18:56 +0900
Message-ID: <1291187936-21332-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:39071 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751517Ab0LAHc4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Dec 2010 02:32:56 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, Atul Dahiya <atul.dahiya@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>

From: Atul Dahiya <atul.dahiya@samsung.com>

This patch adds rtc clock for S5P6450.

Signed-off-by: Atul Dahiya <atul.dahiya@samsung.com>
Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
---
 arch/arm/mach-s5p64x0/clock-s5p6450.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5p64x0/clock-s5p6450.c b/arch/arm/mach-s5p64x0/clock-s5p6450.c
index 7dbf3c9..8ba2b3c 100644
--- a/arch/arm/mach-s5p64x0/clock-s5p6450.c
+++ b/arch/arm/mach-s5p64x0/clock-s5p6450.c
@@ -231,6 +231,12 @@ static struct clk init_clocks_disable[] = {
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 5),
 	}, {
+		.name		= "rtc",
+		.id		= -1,
+		.parent		= &clk_pclk_low.clk,
+		.enable		= s5p64x0_pclk_ctrl,
+		.ctrlbit	= (1 << 6),
+	}, {
 		.name		= "adc",
 		.id		= -1,
 		.parent		= &clk_pclk_low.clk,
-- 
1.6.6.1
