From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 3/3] rtc: rtc-s3c: Change set alarm interrupt method in s3c_rtc_setaie
Date: Tue, 16 Nov 2010 09:02:54 +0900
Message-ID: <1289865774-31073-4-git-send-email-kgene.kim@samsung.com>
References: <1289865774-31073-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:33036 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753012Ab0KPAOg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Nov 2010 19:14:36 -0500
In-Reply-To: <1289865774-31073-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com
Cc: ben-linux@fluff.org, p_gortmaker@yahoo.com, a.zummo@towertech.it, Kukjin Kim <kgene.kim@samsung.com>, Wan ZongShun <mcuos.com@gmail.com>

This patch changes method of setting alarm interrupt.

Cc: Ben Dooks <ben-linux@fluff.org>
Cc: Wan ZongShun <mcuos.com@gmail.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 drivers/rtc/rtc-s3c.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index bb88027..1ccf81c 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -83,10 +83,12 @@ static int s3c_rtc_setaie(struct device *dev, unsigned int enabled)
 	pr_debug("%s: aie=%d\n", __func__, enabled);
 
 	spin_lock_irq(&s3c_rtc_pie_lock);
-	tmp = readb(s3c_rtc_base + S3C2410_RTCALM) & ~S3C2410_RTCALM_ALMEN;
+	tmp = readb(s3c_rtc_base + S3C2410_RTCALM);
 
 	if (enabled)
 		tmp |= S3C2410_RTCALM_ALMEN;
+	else
+		tmp &= ~S3C2410_RTCALM_ALMEN;
 
 	writeb(tmp, s3c_rtc_base + S3C2410_RTCALM);
 	spin_unlock_irq(&s3c_rtc_pie_lock);
-- 
1.6.2.5
