From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: S5PV210: Fix the name of exynos4_clk_hdmiphy_ctrl() for
 S5PV210
Date: Fri, 27 Jan 2012 15:28:09 +0900
Message-ID: <01aa01ccdcbc$d6e36190$84aa24b0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:56965 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751371Ab2A0G2O (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Jan 2012 01:28:14 -0500
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LYG006M11YZDQ50@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 27 Jan 2012 15:28:12 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LYG00MCS1YXL9Z1@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Fri, 27 Jan 2012 15:28:12 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org


Should be s5pv210_clk_hdmiphy_ctrl() in mach-s5pv210/.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5pv210/clock.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-s5pv210/clock.c b/arch/arm/mach-s5pv210/clock.c
index c78dfdd..b9ec0c3 100644
--- a/arch/arm/mach-s5pv210/clock.c
+++ b/arch/arm/mach-s5pv210/clock.c
@@ -175,7 +175,7 @@ static int s5pv210_clk_mask1_ctrl(struct clk *clk, int enable)
 	return s5p_gatectrl(S5P_CLK_SRC_MASK1, clk, enable);
 }
 
-static int exynos4_clk_hdmiphy_ctrl(struct clk *clk, int enable)
+static int s5pv210_clk_hdmiphy_ctrl(struct clk *clk, int enable)
 {
 	return s5p_gatectrl(S5P_HDMI_PHY_CONTROL, clk, enable);
 }
@@ -372,7 +372,7 @@ static struct clk init_clocks_off[] = {
 	}, {
 		.name		= "hdmiphy",
 		.devname	= "s5pv210-hdmi",
-		.enable		= exynos4_clk_hdmiphy_ctrl,
+		.enable		= s5pv210_clk_hdmiphy_ctrl,
 		.ctrlbit	= (1 << 0),
 	}, {
 		.name		= "dacphy",
-- 
1.7.1
