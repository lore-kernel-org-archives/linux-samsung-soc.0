From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 3/5] rtc: rtc-s3c: Fix on support RTC Alarm
Date: Tue,  7 Sep 2010 14:29:39 +0900
Message-ID: <1283837381-9575-4-git-send-email-kgene.kim@samsung.com>
References: <1283837381-9575-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:45991 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752726Ab0IGFqq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Sep 2010 01:46:46 -0400
In-Reply-To: <1283837381-9575-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com
Cc: ben-linux@fluff.org, p_gortmaker@yahoo.com, a.zummo@towertech.it, Changhwan Youn <chaos.youn@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Changhwan Youn <chaos.youn@samsung.com>

The alarm_irq_enable function should be implemented to support RTC alarm.
And fixes tab instead of white space abound proc field.

Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
Cc: Ben Dooks <ben-linux@fluff.org>
---
 drivers/rtc/rtc-s3c.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index e9eb0a0..c078548 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -384,7 +384,8 @@ static const struct rtc_class_ops s3c_rtcops = {
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
