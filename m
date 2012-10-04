From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH] video: exynos_dp: use clk_prepare_enable and
 clk_disable_unprepare
Date: Thu, 04 Oct 2012 15:45:14 +0900
Message-ID: <006701cda1fb$cee12fe0$6ca38fa0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:38071 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754964Ab2JDGpQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Oct 2012 02:45:16 -0400
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Florian Tobias Schandinat' <FlorianSchandinat@gmx.de>
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Jingoo Han' <jg1.han@samsung.com>

Convert clk_enable/clk_disable to clk_prepare_enable/clk_disable_unprepare
calls as required by common clock framework.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/video/exynos/exynos_dp_core.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/video/exynos/exynos_dp_core.c b/drivers/video/exynos/exynos_dp_core.c
index cdc1398..d55470e 100644
--- a/drivers/video/exynos/exynos_dp_core.c
+++ b/drivers/video/exynos/exynos_dp_core.c
@@ -885,7 +885,7 @@ static int __devinit exynos_dp_probe(struct platform_device *pdev)
 		return PTR_ERR(dp->clock);
 	}
 
-	clk_enable(dp->clock);
+	clk_prepare_enable(dp->clock);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 
@@ -956,7 +956,7 @@ static int __devexit exynos_dp_remove(struct platform_device *pdev)
 	if (pdata && pdata->phy_exit)
 		pdata->phy_exit();
 
-	clk_disable(dp->clock);
+	clk_disable_unprepare(dp->clock);
 
 	return 0;
 }
@@ -971,7 +971,7 @@ static int exynos_dp_suspend(struct device *dev)
 	if (pdata && pdata->phy_exit)
 		pdata->phy_exit();
 
-	clk_disable(dp->clock);
+	clk_disable_unprepare(dp->clock);
 
 	return 0;
 }
@@ -985,7 +985,7 @@ static int exynos_dp_resume(struct device *dev)
 	if (pdata && pdata->phy_init)
 		pdata->phy_init();
 
-	clk_enable(dp->clock);
+	clk_prepare_enable(dp->clock);
 
 	exynos_dp_init_dp(dp);
 
-- 
1.7.1
