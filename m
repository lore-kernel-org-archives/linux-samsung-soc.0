From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: [PATCH 3/4] rtc: s3c: use unified functions for enable/disable of clk
Date: Tue, 11 Aug 2015 20:28:21 +0900
Message-ID: <1439292502-22912-3-git-send-email-jy0922.shim@samsung.com>
References: <1439292502-22912-1-git-send-email-jy0922.shim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:50127 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934259AbbHKL2Y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Aug 2015 07:28:24 -0400
In-reply-to: <1439292502-22912-1-git-send-email-jy0922.shim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: rtc-linux@googlegroups.com
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, cw00.choi@samsung.com, k.kozlowski@samsung.com, jy0922.shim@samsung.com

The driver uses clk_prepare_enable()/clk_disable_unprepare() only in
probe only, elsewhere, use the unified functions for enable/disable of
clk, e.g. s3c_rtc_enable_clk() / s3c_rtc_disable_clk(), so it's better
to use them for consistency of code.

Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
---
 drivers/rtc/rtc-s3c.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index 44b2921..abe2a6d 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -476,19 +476,21 @@ static int s3c_rtc_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "failed to find rtc clock\n");
 		return PTR_ERR(info->rtc_clk);
 	}
-	clk_prepare_enable(info->rtc_clk);
+	clk_prepare(info->rtc_clk);
 
 	if (info->data->needs_src_clk) {
 		info->rtc_src_clk = devm_clk_get(&pdev->dev, "rtc_src");
 		if (IS_ERR(info->rtc_src_clk)) {
 			dev_err(&pdev->dev,
 				"failed to find rtc source clock\n");
-			clk_disable_unprepare(info->rtc_clk);
+			clk_unprepare(info->rtc_clk);
 			return PTR_ERR(info->rtc_src_clk);
 		}
-		clk_prepare_enable(info->rtc_src_clk);
+		clk_prepare(info->rtc_src_clk);
 	}
 
+	s3c_rtc_enable_clk(info);
+
 	/* check to see if everything is setup correctly */
 	if (info->data->enable)
 		info->data->enable(info);
@@ -548,9 +550,11 @@ static int s3c_rtc_probe(struct platform_device *pdev)
 	if (info->data->disable)
 		info->data->disable(info);
 
+	s3c_rtc_disable_clk(info);
+
 	if (info->data->needs_src_clk)
-		clk_disable_unprepare(info->rtc_src_clk);
-	clk_disable_unprepare(info->rtc_clk);
+		clk_unprepare(info->rtc_src_clk);
+	clk_unprepare(info->rtc_clk);
 
 	return ret;
 }
-- 
1.9.1
