From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 1/2] ARM: S5PV210: Rename sclk_cam clocks for FIMC media driver
Date: Wed, 22 Jun 2011 18:34:11 +0200
Message-ID: <1308760452-30676-2-git-send-email-s.nawrocki@samsung.com>
References: <1308760452-30676-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:27453 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755104Ab1FVQeR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Jun 2011 12:34:17 -0400
Received: from eu_spt1 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LN700H76A147N@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 22 Jun 2011 17:34:16 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LN700BIWA12FS@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 22 Jun 2011 17:34:15 +0100 (BST)
In-reply-to: <1308760452-30676-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, m.szyprowski@samsung.com, kyungmin.park@samsung.com, s.nawrocki@samsung.com, sw0312.kim@samsung.com, riverful.kim@samsung.com

After s5p-fimc driver cvonversion to the media controller API
the sclk_cam clocks are managed by a top level media device driver
bound to "s5p-fimc-md" platform device. Rename sclk_cam clocks
so they can be aquired by the fimc media device.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-s5pv210/clock.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-s5pv210/clock.c b/arch/arm/mach-s5pv210/clock.c
index b5c95e6..0392f8b 100644
--- a/arch/arm/mach-s5pv210/clock.c
+++ b/arch/arm/mach-s5pv210/clock.c
@@ -844,8 +844,7 @@ static struct clksrc_clk clksrcs[] = {
 		.reg_div = { .reg = S5P_CLK_DIV3, .shift = 20, .size = 4 },
 	}, {
 		.clk		= {
-			.name		= "sclk_cam",
-			.devname	= "s5pv210-fimc.0",
+			.name		= "sclk_cam0",
 			.enable		= s5pv210_clk_mask0_ctrl,
 			.ctrlbit	= (1 << 3),
 		},
@@ -854,8 +853,7 @@ static struct clksrc_clk clksrcs[] = {
 		.reg_div = { .reg = S5P_CLK_DIV1, .shift = 12, .size = 4 },
 	}, {
 		.clk		= {
-			.name		= "sclk_cam",
-			.devname	= "s5pv210-fimc.1",
+			.name		= "sclk_cam1",
 			.enable		= s5pv210_clk_mask0_ctrl,
 			.ctrlbit	= (1 << 4),
 		},
-- 
1.7.5.4
