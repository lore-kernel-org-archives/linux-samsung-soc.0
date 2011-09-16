From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 1/4 (RESEND)] ARM: S5PV210: Rename sclk_cam clocks for FIMC
 media driver
Date: Fri, 16 Sep 2011 12:27:50 +0200
Message-ID: <1316168873-22257-2-git-send-email-s.nawrocki@samsung.com>
References: <1316168873-22257-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:21683 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751469Ab1IPK17 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Sep 2011 06:27:59 -0400
Received: from euspt2 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LRM00MTT2EL0K@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 16 Sep 2011 11:27:57 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LRM00B032ELF2@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 16 Sep 2011 11:27:57 +0100 (BST)
In-reply-to: <1316168873-22257-1-git-send-email-s.nawrocki@samsung.com>
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
 arch/arm/mach-s5pv210/clock.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-s5pv210/clock.c b/arch/arm/mach-s5pv210/clock.c
index b673f47..231224a4 100644
--- a/arch/arm/mach-s5pv210/clock.c
+++ b/arch/arm/mach-s5pv210/clock.c
@@ -874,8 +874,7 @@ static struct clksrc_clk clksrcs[] = {
 		.reg_div = { .reg = S5P_CLK_DIV3, .shift = 20, .size = 4 },
 	}, {
 		.clk		= {
-			.name		= "sclk_cam",
-			.devname	= "s5pv210-fimc.0",
+			.name		= "sclk_cam0",
 			.enable		= s5pv210_clk_mask0_ctrl,
 			.ctrlbit	= (1 << 3),
 		},
@@ -884,8 +883,7 @@ static struct clksrc_clk clksrcs[] = {
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
1.7.6
