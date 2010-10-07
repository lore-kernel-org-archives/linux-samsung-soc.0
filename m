From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 6/6] rtc: rtc-s3c: Add rtc_valid_tm in s3c_rtc_gettime()
Date: Fri,  8 Oct 2010 08:41:19 +0900
Message-ID: <1286494879-2932-7-git-send-email-kgene.kim@samsung.com>
References: <1286494879-2932-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:46184 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751601Ab0JGXt5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Oct 2010 19:49:57 -0400
In-Reply-To: <1286494879-2932-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com
Cc: ben-linux@fluff.org, p_gortmaker@yahoo.com, a.zummo@towertech.it, akpm@linux-foundation.org, Kukjin Kim <kgene.kim@samsung.com>

This patch adds "rtc_valid_tm" in s3c_rtc_gettime()
as per Wan ZongShun's suggestion.

Suggested-by: Wan ZongShun <mcuos.com@gmail.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
Cc: Ben Dooks <ben-linux@fluff.org>
---
 drivers/rtc/rtc-s3c.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index 51e7b25..7c7db81 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -185,7 +185,7 @@ static int s3c_rtc_gettime(struct device *dev, struct rtc_time *rtc_tm)
 	rtc_tm->tm_year += 100;
 	rtc_tm->tm_mon -= 1;
 
-	return 0;
+	return rtc_valid_tm(rtc_tm);
 }
 
 static int s3c_rtc_settime(struct device *dev, struct rtc_time *tm)
-- 
1.6.2.5
