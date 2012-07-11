From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH 6/7] ARM: EXYNOS5: Add the bus clock for FIMD
Date: Wed, 11 Jul 2012 14:54:40 +0530
Message-ID: <1341998681-1888-7-git-send-email-l.krishna@samsung.com>
References: <1341998681-1888-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:64230 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751850Ab2GKJLB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Jul 2012 05:11:01 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M6Z007WWO4RP3H0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 11 Jul 2012 18:11:00 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M6Z008NXO5HIZ50@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 11 Jul 2012 18:11:00 +0900 (KST)
In-reply-to: <1341998681-1888-1-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, prashanth.g@samsung.com, Leela Krishna <l.krishna@samsung.com>

From: Leela Krishna <l.krishna@samsung.com>

This patch adds the bus clock for FIMD and changes
the device name for lcd clock

Signed-off-by: Leela Krishna <l.krishna@samsung.com>
---
 arch/arm/mach-exynos/clock-exynos5.c |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
index fefa336..61bf88d 100644
--- a/arch/arm/mach-exynos/clock-exynos5.c
+++ b/arch/arm/mach-exynos/clock-exynos5.c
@@ -629,6 +629,11 @@ static struct clk exynos5_init_clocks_off[] = {
 		.enable		= exynos5_clk_ip_disp1_ctrl,
 		.ctrlbit	= (1 << 3),
 	}, {
+		.name           = "fimd",
+		.devname        = "exynos5-fb",
+		.enable         = exynos5_clk_ip_disp1_ctrl,
+		.ctrlbit        = (1 << 0),
+	}, {
 		.name		= "iis",
 		.devname	= "samsung-i2s.1",
 		.enable		= exynos5_clk_ip_peric_ctrl,
@@ -1046,7 +1051,7 @@ static struct clksrc_clk exynos5_clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "sclk_fimd",
-			.devname	= "s3cfb.1",
+			.devname	= "exynos5-fb",
 			.enable		= exynos5_clksrc_mask_disp1_0_ctrl,
 			.ctrlbit	= (1 << 0),
 		},
-- 
1.7.0.4
