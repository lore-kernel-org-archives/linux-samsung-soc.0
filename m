From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH V2 6/7] ARM: EXYNOS5: Add the bus clock for FIMD
Date: Wed, 18 Jul 2012 11:27:32 +0530
Message-ID: <1342591053-7092-7-git-send-email-l.krishna@samsung.com>
References: <1342591053-7092-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:34487 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752694Ab2GRFnO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Jul 2012 01:43:14 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7C00IWUD7M5640@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 18 Jul 2012 14:43:12 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M7C000CUD7GD990@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 18 Jul 2012 14:43:12 +0900 (KST)
In-reply-to: <1342591053-7092-1-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, olofj@google.com, thomas.ab@samsung.com, kgene.kim@samsung.com, joshi@samsung.com, jg1.han@samsung.com

This patch adds the bus clock for FIMD and changes
the device name for lcd clock

Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
---
 arch/arm/mach-exynos/clock-exynos5.c |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
index 774533c..f001876 100644
--- a/arch/arm/mach-exynos/clock-exynos5.c
+++ b/arch/arm/mach-exynos/clock-exynos5.c
@@ -634,6 +634,11 @@ static struct clk exynos5_init_clocks_off[] = {
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
@@ -1132,7 +1137,7 @@ static struct clksrc_clk exynos5_clksrcs[] = {
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
