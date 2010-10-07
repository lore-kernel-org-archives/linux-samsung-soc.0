From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 3/6] rtc: rtc-s3c: Fix on support RTC Alarm
Date: Fri,  8 Oct 2010 08:41:16 +0900
Message-ID: <1286494879-2932-4-git-send-email-kgene.kim@samsung.com>
References: <1286494879-2932-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:46158 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751680Ab0JGXt5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Oct 2010 19:49:57 -0400
In-Reply-To: <1286494879-2932-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com
Cc: ben-linux@fluff.org, p_gortmaker@yahoo.com, a.zummo@towertech.it, akpm@linux-foundation.org, Changhwan Youn <chaos.youn@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Changhwan Youn <chaos.youn@samsung.com>

The alarm_irq_enable function should be implemented to support RTC alarm.
And fixes tab instead of white space abound proc field.

Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
Acked-by: Ben Dooks <ben-linux@fluff.org>
---
 drivers/rtc/rtc-s3c.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index fd08876..39fa5b0 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -379,7 +379,8 @@ static const struct rtc_class_ops s3c_rtcops = {
 	.set_alarm	= s3c_rtc_setalarm,
 	.irq_set_freq	= s3c_rtc_setfreq,
 	.irq_set_state	= s3c_rtc_setpie,
-	.proc	        = s3c_rtc_proc,
+	.proc		= s3c_rtc_proc,
+	.alarm_irq_enable = s3c_rtc_setaie,
 };
 
 static void s3c_rtc_enable(struct platform_device *pdev, int en)
-- 
1.6.2.5
