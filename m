From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH] rtc: rtc-s3c: use clk_prepare_enable and clk_disable_unprepare
Date: Wed,  3 Oct 2012 08:33:37 +0900
Message-ID: <1349220817-2569-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:37663 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752997Ab2JBXg3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Oct 2012 19:36:29 -0400
Received: by padhz1 with SMTP id hz1so5718235pad.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Oct 2012 16:36:29 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: rtc-linux@googlegroups.com
Cc: a.zummo@towertech.it, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org

Convert clk_enable/clk_disable to clk_prepare_enable/clk_disable_unprepare
calls as required by common clock framework.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 drivers/rtc/rtc-s3c.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index 77823d2..ff5b928 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -520,7 +520,7 @@ static int __devinit s3c_rtc_probe(struct platform_device *pdev)
 		goto err_clk;
 	}
 
-	clk_enable(rtc_clk);
+	clk_prepare_enable(rtc_clk);
 
 	/* check to see if everything is setup correctly */
 
@@ -591,7 +591,7 @@ static int __devinit s3c_rtc_probe(struct platform_device *pdev)
 		goto err_tick_irq;
 	}
 
-	clk_disable(rtc_clk);
+	clk_disable_unprepare(rtc_clk);
 
 	return 0;
 
@@ -604,7 +604,7 @@ static int __devinit s3c_rtc_probe(struct platform_device *pdev)
 
  err_nortc:
 	s3c_rtc_enable(pdev, 0);
-	clk_disable(rtc_clk);
+	clk_disable_unprepare(rtc_clk);
 	clk_put(rtc_clk);
 
  err_clk:
-- 
1.7.4.1
