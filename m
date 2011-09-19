From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v3 3/4] ARM: EXYNOS4: Rename sclk_cam clocks for FIMC driver
Date: Mon, 19 Sep 2011 19:30:40 +0200
Message-ID: <1316453441-13525-4-git-send-email-s.nawrocki@samsung.com>
References: <1316453441-13525-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:49786 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753863Ab1ISRaz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Sep 2011 13:30:55 -0400
Received: from euspt2 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LRS00I015ZGQ6@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 Sep 2011 18:30:52 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LRS00C7F5ZFL6@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 Sep 2011 18:30:52 +0100 (BST)
In-reply-to: <1316453441-13525-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, m.szyprowski@samsung.com, riverful.kim@samsung.com, sw0312.kim@samsung.com, s.nawrocki@samsung.com, Kyungmin Park <kyungmin.park@samsung.com>

The sclk_cam clocks are now controlled by the top level FIMC media
device driver bound to "s5p-fimc-md" platform device.
Rename sclk_cam clocks so they accessible by the corresponding
driver.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos4/clock.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-exynos4/clock.c b/arch/arm/mach-exynos4/clock.c
index da9567a..a25c818 100644
--- a/arch/arm/mach-exynos4/clock.c
+++ b/arch/arm/mach-exynos4/clock.c
@@ -1084,8 +1084,7 @@ static struct clksrc_clk clksrcs[] = {
 		.reg_div = { .reg = S5P_CLKDIV_CAM, .shift = 28, .size = 4 },
 	}, {
 		.clk		= {
-			.name		= "sclk_cam",
-			.devname	= "exynos4-fimc.0",
+			.name		= "sclk_cam0",
 			.enable		= exynos4_clksrc_mask_cam_ctrl,
 			.ctrlbit	= (1 << 16),
 		},
@@ -1094,8 +1093,7 @@ static struct clksrc_clk clksrcs[] = {
 		.reg_div = { .reg = S5P_CLKDIV_CAM, .shift = 16, .size = 4 },
 	}, {
 		.clk		= {
-			.name		= "sclk_cam",
-			.devname	= "exynos4-fimc.1",
+			.name		= "sclk_cam1",
 			.enable		= exynos4_clksrc_mask_cam_ctrl,
 			.ctrlbit	= (1 << 20),
 		},
-- 
1.7.6.3
