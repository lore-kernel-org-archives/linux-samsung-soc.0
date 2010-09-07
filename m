From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 2/5] rtc: rtc-s3c: Fix setting missing field of getalarm
Date: Tue,  7 Sep 2010 14:29:38 +0900
Message-ID: <1283837381-9575-3-git-send-email-kgene.kim@samsung.com>
References: <1283837381-9575-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:45973 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752711Ab0IGFqq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Sep 2010 01:46:46 -0400
In-Reply-To: <1283837381-9575-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com
Cc: ben-linux@fluff.org, p_gortmaker@yahoo.com, a.zummo@towertech.it, Changhwan Youn <chaos.youn@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Changhwan Youn <chaos.youn@samsung.com>

Current s3c_rtc_getalarm() sets missing field of alarm time with 0xff.
But this value should be -1 according to drivers/rtc/interface.c.

Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
Cc: Ben Dooks <ben-linux@fluff.org>
---
 drivers/rtc/rtc-s3c.c |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index 557a538..e9eb0a0 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -242,34 +242,34 @@ static int s3c_rtc_getalarm(struct device *dev, struct rtc_wkalrm *alrm)
 	if (alm_en & S3C2410_RTCALM_SECEN)
 		alm_tm->tm_sec = bcd2bin(alm_tm->tm_sec);
 	else
-		alm_tm->tm_sec = 0xff;
+		alm_tm->tm_sec = -1;
 
 	if (alm_en & S3C2410_RTCALM_MINEN)
 		alm_tm->tm_min = bcd2bin(alm_tm->tm_min);
 	else
-		alm_tm->tm_min = 0xff;
+		alm_tm->tm_min = -1;
 
 	if (alm_en & S3C2410_RTCALM_HOUREN)
 		alm_tm->tm_hour = bcd2bin(alm_tm->tm_hour);
 	else
-		alm_tm->tm_hour = 0xff;
+		alm_tm->tm_hour = -1;
 
 	if (alm_en & S3C2410_RTCALM_DAYEN)
 		alm_tm->tm_mday = bcd2bin(alm_tm->tm_mday);
 	else
-		alm_tm->tm_mday = 0xff;
+		alm_tm->tm_mday = -1;
 
 	if (alm_en & S3C2410_RTCALM_MONEN) {
 		alm_tm->tm_mon = bcd2bin(alm_tm->tm_mon);
 		alm_tm->tm_mon -= 1;
 	} else {
-		alm_tm->tm_mon = 0xff;
+		alm_tm->tm_mon = -1;
 	}
 
 	if (alm_en & S3C2410_RTCALM_YEAREN)
 		alm_tm->tm_year = bcd2bin(alm_tm->tm_year);
 	else
-		alm_tm->tm_year = 0xffff;
+		alm_tm->tm_year = -1;
 
 	return 0;
 }
-- 
1.6.2.5
