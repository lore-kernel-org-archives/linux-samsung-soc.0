From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: [PATCH 1/4] rtc: s3c: add missing clk control
Date: Tue, 11 Aug 2015 20:28:19 +0900
Message-ID: <1439292502-22912-1-git-send-email-jy0922.shim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:47237 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934257AbbHKL2X (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Aug 2015 07:28:23 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: rtc-linux@googlegroups.com
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, cw00.choi@samsung.com, k.kozlowski@samsung.com, jy0922.shim@samsung.com

It's missed to call clk_unprepare() about info->rtc_src_clk in
s3c_rtc_remove and to call clk_disable_unprepare about info->rtc_clk in
error routine of s3c_rtc_probe.

Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
---
 drivers/rtc/rtc-s3c.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index a0f8323..d1866a4 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -410,6 +410,8 @@ static int s3c_rtc_remove(struct platform_device *pdev)
 
 	s3c_rtc_setaie(info->dev, 0);
 
+	if (info->data->needs_src_clk)
+		clk_unprepare(info->rtc_src_clk);
 	clk_unprepare(info->rtc_clk);
 	info->rtc_clk = NULL;
 
@@ -482,6 +484,7 @@ static int s3c_rtc_probe(struct platform_device *pdev)
 		if (IS_ERR(info->rtc_src_clk)) {
 			dev_err(&pdev->dev,
 				"failed to find rtc source clock\n");
+			clk_disable_unprepare(info->rtc_clk);
 			return PTR_ERR(info->rtc_src_clk);
 		}
 		clk_prepare_enable(info->rtc_src_clk);
-- 
1.9.1
