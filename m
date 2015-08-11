From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: [PATCH 2/4] rtc: s3c: remove unnecessary NULL assignment
Date: Tue, 11 Aug 2015 20:28:20 +0900
Message-ID: <1439292502-22912-2-git-send-email-jy0922.shim@samsung.com>
References: <1439292502-22912-1-git-send-email-jy0922.shim@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1439292502-22912-1-git-send-email-jy0922.shim@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rtc-linux@googlegroups.com
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, cw00.choi@samsung.com, k.kozlowski@samsung.com, jy0922.shim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

It's unnecessary the code that assigns info->rtc_clk to NULL in
s3c_rtc_remove.

Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
---
 drivers/rtc/rtc-s3c.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index d1866a4..44b2921 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -413,7 +413,6 @@ static int s3c_rtc_remove(struct platform_device *pdev)
 	if (info->data->needs_src_clk)
 		clk_unprepare(info->rtc_src_clk);
 	clk_unprepare(info->rtc_clk);
-	info->rtc_clk = NULL;
 
 	return 0;
 }
-- 
1.9.1
