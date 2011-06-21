From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH v3 1/5] ARM: EXYNOS4: Change clock name for FIMD
Date: Tue, 21 Jun 2011 15:19:29 +0900
Message-ID: <1308637169-18169-1-git-send-email-jg1.han@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:36780 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751806Ab1FUG0h (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Jun 2011 02:26:37 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Paul Mundt <lethal@linux-sh.org>, linux-samsung-soc@vger.kernel.org, Jonghun Han <jonghun.han@samsung.com>
Cc: Anand Kumar N <anand.kn@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kmpark@infradead.org>, Inki Dae <inki.dae@samsung.com>, ARM Linux <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>, Jingoo Han <jg1.han@samsung.com>

This patch changes clock name for FIMD from "fimd" to "lcd".

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 arch/arm/mach-exynos4/clock.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos4/clock.c b/arch/arm/mach-exynos4/clock.c
index 871f9d5..12e6853 100644
--- a/arch/arm/mach-exynos4/clock.c
+++ b/arch/arm/mach-exynos4/clock.c
@@ -433,12 +433,12 @@ static struct clk init_clocks_off[] = {
 		.enable		= exynos4_clk_ip_cam_ctrl,
 		.ctrlbit	= (1 << 3),
 	}, {
-		.name		= "fimd",
+		.name		= "lcd",
 		.id		= 0,
 		.enable		= exynos4_clk_ip_lcd0_ctrl,
 		.ctrlbit	= (1 << 0),
 	}, {
-		.name		= "fimd",
+		.name		= "lcd",
 		.id		= 1,
 		.enable		= exynos4_clk_ip_lcd1_ctrl,
 		.ctrlbit	= (1 << 0),
-- 
1.7.1
