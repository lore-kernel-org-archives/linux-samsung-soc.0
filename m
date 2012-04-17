From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 06/12] rtc-s3c: Fix breakage introduced by S3C2443/S3C2416
 support
Date: Tue, 17 Apr 2012 11:16:29 +0530
Message-ID: <1334641595-25301-7-git-send-email-thomas.abraham@linaro.org>
References: <1334641595-25301-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:25065 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752306Ab2DQFib (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Apr 2012 01:38:31 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M2L00M32ZM06YN0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 17 Apr 2012 14:38:30 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M2L00E01ZNEZ8D2@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 17 Apr 2012 14:38:30 +0900 (KST)
In-reply-to: <1334641595-25301-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, Heiko Stuebner <heiko@sntech.de>

From: Heiko Stuebner <heiko@sntech.de>

Commits 7006ee4f (rtc-s3c: make room for more variants in devicetree block)
and 6c0a2365 (rtc-s3c: add variants for S3C2443 and S3C2416)
introduced build-failures with enabled CONFIG_USE_OF option.

This patch fixes missing "," in s3c_rtc_dt_match and wrong handling of
the of_device_id.data property.

Reported-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/rtc/rtc-s3c.c |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index 9ccea13..c792b6d 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -449,7 +449,7 @@ static inline int s3c_rtc_get_driver_data(struct platform_device *pdev)
 	if (pdev->dev.of_node) {
 		const struct of_device_id *match;
 		match = of_match_node(s3c_rtc_dt_match, pdev->dev.of_node);
-		return match->data;
+		return (int)match->data;
 	}
 #endif
 	return platform_get_device_id(pdev)->driver_data;
@@ -667,17 +667,17 @@ static int s3c_rtc_resume(struct platform_device *pdev)
 #ifdef CONFIG_OF
 static const struct of_device_id s3c_rtc_dt_match[] = {
 	{
-		.compatible = "samsung,s3c2410-rtc"
-		.data = TYPE_S3C2410,
+		.compatible = "samsung,s3c2410-rtc",
+		.data = (void *)TYPE_S3C2410,
 	}, {
-		.compatible = "samsung,s3c2416-rtc"
-		.data = TYPE_S3C2416,
+		.compatible = "samsung,s3c2416-rtc",
+		.data = (void *)TYPE_S3C2416,
 	}, {
-		.compatible = "samsung,s3c2443-rtc"
-		.data = TYPE_S3C2443,
+		.compatible = "samsung,s3c2443-rtc",
+		.data = (void *)TYPE_S3C2443,
 	}, {
-		.compatible = "samsung,s3c6410-rtc"
-		.data = TYPE_S3C64XX,
+		.compatible = "samsung,s3c6410-rtc",
+		.data = (void *)TYPE_S3C64XX,
 	},
 	{},
 };
-- 
1.6.6.rc2
