From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH] ARM: EXYNOS4: Increase reset delay for USB HOST PHY
Date: Thu, 11 Aug 2011 18:27:28 +0900
Message-ID: <1313054848-20515-1-git-send-email-jg1.han@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:58730 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753896Ab1HKJiv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Aug 2011 05:38:51 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: Yulgon Kim <yulgon.kim@samsung.com>, Jingoo Han <jg1.han@samsung.com>

From: Yulgon Kim <yulgon.kim@samsung.com>

This patch increases reset delay from 50 usec to 80 usec for USB HOST PHY.
In order to reset USB HOST PHY controller properly, a little extra time is
required during its reset cycle.

Signed-off-by: Yulgon Kim <yulgon.kim@samsung.com>
Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 arch/arm/mach-exynos4/setup-usb-phy.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos4/setup-usb-phy.c b/arch/arm/mach-exynos4/setup-usb-phy.c
index 0883c1b..39aca04 100644
--- a/arch/arm/mach-exynos4/setup-usb-phy.c
+++ b/arch/arm/mach-exynos4/setup-usb-phy.c
@@ -82,7 +82,7 @@ static int exynos4_usb_phy1_init(struct platform_device *pdev)
 
 	rstcon &= ~(HOST_LINK_PORT_SWRST_MASK | PHY1_SWRST_MASK);
 	writel(rstcon, EXYNOS4_RSTCON);
-	udelay(50);
+	udelay(80);
 
 	clk_disable(otg_clk);
 	clk_put(otg_clk);
-- 
1.7.1
