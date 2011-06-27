From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: [PATCH 1/3] rtc: rtc-s3c: Correct debug messages.
Date: Mon, 27 Jun 2011 20:43:24 +0900
Message-ID: <1309175006-9218-2-git-send-email-myungjoo.ham@samsung.com>
References: <1309175006-9218-1-git-send-email-myungjoo.ham@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1309175006-9218-1-git-send-email-myungjoo.ham@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com
Cc: a.zummo@towertech.it, Kukjin Kim <kgene.kim@samsung.com>, dg77.kim@samsung.com, kyungmin.park@samsung.com, myungjoo.ham@gmail.com, ben-linux@fluff.org, Changhwan Youn <chaos.youn@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

RTC-S3C used to print out debug messages incorrectly. This patch
corrects incorrect outputs. (undecoded bcd numbers, incorrectly decoded
register values) This patch affects the pr-debug messages only.

Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/rtc/rtc-s3c.c |   13 +++++++------
 1 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index 53c99b1..3c8dfa7 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -152,10 +152,6 @@ static int s3c_rtc_gettime(struct device *dev, struct rtc_time *rtc_tm)
 		goto retry_get_time;
 	}
 
-	pr_debug("read time %04d.%02d.%02d %02d:%02d:%02d\n",
-		 1900 + rtc_tm->tm_year, rtc_tm->tm_mon, rtc_tm->tm_mday,
-		 rtc_tm->tm_hour, rtc_tm->tm_min, rtc_tm->tm_sec);
-
 	rtc_tm->tm_sec = bcd2bin(rtc_tm->tm_sec);
 	rtc_tm->tm_min = bcd2bin(rtc_tm->tm_min);
 	rtc_tm->tm_hour = bcd2bin(rtc_tm->tm_hour);
@@ -164,6 +160,11 @@ static int s3c_rtc_gettime(struct device *dev, struct rtc_time *rtc_tm)
 	rtc_tm->tm_year = bcd2bin(rtc_tm->tm_year);
 
 	rtc_tm->tm_year += 100;
+
+	pr_debug("read time %04d.%02d.%02d %02d:%02d:%02d\n",
+		 1900 + rtc_tm->tm_year, rtc_tm->tm_mon, rtc_tm->tm_mday,
+		 rtc_tm->tm_hour, rtc_tm->tm_min, rtc_tm->tm_sec);
+
 	rtc_tm->tm_mon -= 1;
 
 	clk_disable(rtc_clk);
@@ -269,10 +270,9 @@ static int s3c_rtc_setalarm(struct device *dev, struct rtc_wkalrm *alrm)
 	clk_enable(rtc_clk);
 	pr_debug("s3c_rtc_setalarm: %d, %04d.%02d.%02d %02d:%02d:%02d\n",
 		 alrm->enabled,
-		 1900 + tm->tm_year, tm->tm_mon, tm->tm_mday,
+		 1900 + tm->tm_year, tm->tm_mon + 1, tm->tm_mday,
 		 tm->tm_hour, tm->tm_min, tm->tm_sec);
 
-
 	alrm_en = readb(base + S3C2410_RTCALM) & S3C2410_RTCALM_ALMEN;
 	writeb(0x00, base + S3C2410_RTCALM);
 
@@ -359,6 +359,7 @@ static void s3c_rtc_release(struct device *dev)
 	free_irq(s3c_rtc_tickno, rtc_dev);
 }
 
+
 static const struct rtc_class_ops s3c_rtcops = {
 	.open		= s3c_rtc_open,
 	.release	= s3c_rtc_release,
-- 
1.7.4.1
