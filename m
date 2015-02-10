From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH] rtc: s3c: Fix the duplicate clock control
Date: Tue, 10 Feb 2015 12:07:30 +0900
Message-ID: <1423537650-11832-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:11578 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751445AbbBJDHh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Feb 2015 22:07:37 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: a.zummo@towertech.it
Cc: kgene@kernel.org, kyungmin.park@samsung.com, akpm@linux-foundation.org, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>

This patch fixes the duplicate clock control and split out clock control
function as s3c_rtc_enable_clk()/s3c_rtc_disable_clk() to simplify code.

Cc: Alessandro Zummo <a.zummo@towertech.it>
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 drivers/rtc/rtc-s3c.c | 163 ++++++++++++--------------------------------------
 1 file changed, 39 insertions(+), 124 deletions(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index 4241eea..16aca50 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -39,7 +39,6 @@ struct s3c_rtc {
 	void __iomem *base;
 	struct clk *rtc_clk;
 	struct clk *rtc_src_clk;
-	bool enabled;
 
 	struct s3c_rtc_data *data;
 
@@ -67,26 +66,25 @@ struct s3c_rtc_data {
 	void (*disable) (struct s3c_rtc *info);
 };
 
-static void s3c_rtc_alarm_clk_enable(struct s3c_rtc *info, bool enable)
+static void s3c_rtc_enable_clk(struct s3c_rtc *info)
 {
 	unsigned long irq_flags;
 
 	spin_lock_irqsave(&info->alarm_clk_lock, irq_flags);
-	if (enable) {
-		if (!info->enabled) {
-			clk_enable(info->rtc_clk);
-			if (info->data->needs_src_clk)
-				clk_enable(info->rtc_src_clk);
-			info->enabled = true;
-		}
-	} else {
-		if (info->enabled) {
-			if (info->data->needs_src_clk)
-				clk_disable(info->rtc_src_clk);
-			clk_disable(info->rtc_clk);
-			info->enabled = false;
-		}
-	}
+	clk_enable(info->rtc_clk);
+	if (info->data->needs_src_clk)
+		clk_enable(info->rtc_src_clk);
+	spin_unlock_irqrestore(&info->alarm_clk_lock, irq_flags);
+}
+
+static void s3c_rtc_disable_clk(struct s3c_rtc *info)
+{
+	unsigned long irq_flags;
+
+	spin_lock_irqsave(&info->alarm_clk_lock, irq_flags);
+	if (info->data->needs_src_clk)
+		clk_disable(info->rtc_src_clk);
+	clk_disable(info->rtc_clk);
 	spin_unlock_irqrestore(&info->alarm_clk_lock, irq_flags);
 }
 
@@ -119,20 +117,16 @@ static int s3c_rtc_setaie(struct device *dev, unsigned int enabled)
 
 	dev_dbg(info->dev, "%s: aie=%d\n", __func__, enabled);
 
-	clk_enable(info->rtc_clk);
-	if (info->data->needs_src_clk)
-		clk_enable(info->rtc_src_clk);
+	s3c_rtc_enable_clk(info);
+
 	tmp = readb(info->base + S3C2410_RTCALM) & ~S3C2410_RTCALM_ALMEN;
 
 	if (enabled)
 		tmp |= S3C2410_RTCALM_ALMEN;
 
 	writeb(tmp, info->base + S3C2410_RTCALM);
-	if (info->data->needs_src_clk)
-		clk_disable(info->rtc_src_clk);
-	clk_disable(info->rtc_clk);
 
-	s3c_rtc_alarm_clk_enable(info, enabled);
+	s3c_rtc_disable_clk(info);
 
 	return 0;
 }
@@ -143,18 +137,12 @@ static int s3c_rtc_setfreq(struct s3c_rtc *info, int freq)
 	if (!is_power_of_2(freq))
 		return -EINVAL;
 
-	clk_enable(info->rtc_clk);
-	if (info->data->needs_src_clk)
-		clk_enable(info->rtc_src_clk);
 	spin_lock_irq(&info->pie_lock);
 
 	if (info->data->set_freq)
 		info->data->set_freq(info, freq);
 
 	spin_unlock_irq(&info->pie_lock);
-	if (info->data->needs_src_clk)
-		clk_disable(info->rtc_src_clk);
-	clk_disable(info->rtc_clk);
 
 	return 0;
 }
@@ -165,9 +153,7 @@ static int s3c_rtc_gettime(struct device *dev, struct rtc_time *rtc_tm)
 	struct s3c_rtc *info = dev_get_drvdata(dev);
 	unsigned int have_retried = 0;
 
-	clk_enable(info->rtc_clk);
-	if (info->data->needs_src_clk)
-		clk_enable(info->rtc_src_clk);
+	s3c_rtc_enable_clk(info);
 
  retry_get_time:
 	rtc_tm->tm_min  = readb(info->base + S3C2410_RTCMIN);
@@ -194,6 +180,8 @@ static int s3c_rtc_gettime(struct device *dev, struct rtc_time *rtc_tm)
 	rtc_tm->tm_mon = bcd2bin(rtc_tm->tm_mon);
 	rtc_tm->tm_year = bcd2bin(rtc_tm->tm_year);
 
+	s3c_rtc_disable_clk(info);
+
 	rtc_tm->tm_year += 100;
 
 	dev_dbg(dev, "read time %04d.%02d.%02d %02d:%02d:%02d\n",
@@ -202,10 +190,6 @@ static int s3c_rtc_gettime(struct device *dev, struct rtc_time *rtc_tm)
 
 	rtc_tm->tm_mon -= 1;
 
-	if (info->data->needs_src_clk)
-		clk_disable(info->rtc_src_clk);
-	clk_disable(info->rtc_clk);
-
 	return rtc_valid_tm(rtc_tm);
 }
 
@@ -225,9 +209,7 @@ static int s3c_rtc_settime(struct device *dev, struct rtc_time *tm)
 		return -EINVAL;
 	}
 
-	clk_enable(info->rtc_clk);
-	if (info->data->needs_src_clk)
-		clk_enable(info->rtc_src_clk);
+	s3c_rtc_enable_clk(info);
 
 	writeb(bin2bcd(tm->tm_sec),  info->base + S3C2410_RTCSEC);
 	writeb(bin2bcd(tm->tm_min),  info->base + S3C2410_RTCMIN);
@@ -236,9 +218,7 @@ static int s3c_rtc_settime(struct device *dev, struct rtc_time *tm)
 	writeb(bin2bcd(tm->tm_mon + 1), info->base + S3C2410_RTCMON);
 	writeb(bin2bcd(year), info->base + S3C2410_RTCYEAR);
 
-	if (info->data->needs_src_clk)
-		clk_disable(info->rtc_src_clk);
-	clk_disable(info->rtc_clk);
+	s3c_rtc_disable_clk(info);
 
 	return 0;
 }
@@ -249,9 +229,7 @@ static int s3c_rtc_getalarm(struct device *dev, struct rtc_wkalrm *alrm)
 	struct rtc_time *alm_tm = &alrm->time;
 	unsigned int alm_en;
 
-	clk_enable(info->rtc_clk);
-	if (info->data->needs_src_clk)
-		clk_enable(info->rtc_src_clk);
+	s3c_rtc_enable_clk(info);
 
 	alm_tm->tm_sec  = readb(info->base + S3C2410_ALMSEC);
 	alm_tm->tm_min  = readb(info->base + S3C2410_ALMMIN);
@@ -262,6 +240,8 @@ static int s3c_rtc_getalarm(struct device *dev, struct rtc_wkalrm *alrm)
 
 	alm_en = readb(info->base + S3C2410_RTCALM);
 
+	s3c_rtc_disable_clk(info);
+
 	alrm->enabled = (alm_en & S3C2410_RTCALM_ALMEN) ? 1 : 0;
 
 	dev_dbg(dev, "read alarm %d, %04d.%02d.%02d %02d:%02d:%02d\n",
@@ -269,9 +249,7 @@ static int s3c_rtc_getalarm(struct device *dev, struct rtc_wkalrm *alrm)
 		 1900 + alm_tm->tm_year, alm_tm->tm_mon, alm_tm->tm_mday,
 		 alm_tm->tm_hour, alm_tm->tm_min, alm_tm->tm_sec);
 
-
 	/* decode the alarm enable field */
-
 	if (alm_en & S3C2410_RTCALM_SECEN)
 		alm_tm->tm_sec = bcd2bin(alm_tm->tm_sec);
 	else
@@ -304,10 +282,6 @@ static int s3c_rtc_getalarm(struct device *dev, struct rtc_wkalrm *alrm)
 	else
 		alm_tm->tm_year = -1;
 
-	if (info->data->needs_src_clk)
-		clk_disable(info->rtc_src_clk);
-	clk_disable(info->rtc_clk);
-
 	return 0;
 }
 
@@ -317,15 +291,13 @@ static int s3c_rtc_setalarm(struct device *dev, struct rtc_wkalrm *alrm)
 	struct rtc_time *tm = &alrm->time;
 	unsigned int alrm_en;
 
-	clk_enable(info->rtc_clk);
-	if (info->data->needs_src_clk)
-		clk_enable(info->rtc_src_clk);
-
 	dev_dbg(dev, "s3c_rtc_setalarm: %d, %04d.%02d.%02d %02d:%02d:%02d\n",
 		 alrm->enabled,
 		 1900 + tm->tm_year, tm->tm_mon + 1, tm->tm_mday,
 		 tm->tm_hour, tm->tm_min, tm->tm_sec);
 
+	s3c_rtc_enable_clk(info);
+
 	alrm_en = readb(info->base + S3C2410_RTCALM) & S3C2410_RTCALM_ALMEN;
 	writeb(0x00, info->base + S3C2410_RTCALM);
 
@@ -348,11 +320,9 @@ static int s3c_rtc_setalarm(struct device *dev, struct rtc_wkalrm *alrm)
 
 	writeb(alrm_en, info->base + S3C2410_RTCALM);
 
-	s3c_rtc_setaie(dev, alrm->enabled);
+	s3c_rtc_disable_clk(info);
 
-	if (info->data->needs_src_clk)
-		clk_disable(info->rtc_src_clk);
-	clk_disable(info->rtc_clk);
+	s3c_rtc_setaie(dev, alrm->enabled);
 
 	return 0;
 }
@@ -361,16 +331,12 @@ static int s3c_rtc_proc(struct device *dev, struct seq_file *seq)
 {
 	struct s3c_rtc *info = dev_get_drvdata(dev);
 
-	clk_enable(info->rtc_clk);
-	if (info->data->needs_src_clk)
-		clk_enable(info->rtc_src_clk);
+	s3c_rtc_enable_clk(info);
 
 	if (info->data->enable_tick)
 		info->data->enable_tick(info, seq);
 
-	if (info->data->needs_src_clk)
-		clk_disable(info->rtc_src_clk);
-	clk_disable(info->rtc_clk);
+	s3c_rtc_disable_clk(info);
 
 	return 0;
 }
@@ -388,10 +354,6 @@ static void s3c24xx_rtc_enable(struct s3c_rtc *info)
 {
 	unsigned int con, tmp;
 
-	clk_enable(info->rtc_clk);
-	if (info->data->needs_src_clk)
-		clk_enable(info->rtc_src_clk);
-
 	con = readw(info->base + S3C2410_RTCCON);
 	/* re-enable the device, and check it is ok */
 	if ((con & S3C2410_RTCCON_RTCEN) == 0) {
@@ -417,20 +379,12 @@ static void s3c24xx_rtc_enable(struct s3c_rtc *info)
 		writew(tmp & ~S3C2410_RTCCON_CLKRST,
 			info->base + S3C2410_RTCCON);
 	}
-
-	if (info->data->needs_src_clk)
-		clk_disable(info->rtc_src_clk);
-	clk_disable(info->rtc_clk);
 }
 
 static void s3c24xx_rtc_disable(struct s3c_rtc *info)
 {
 	unsigned int con;
 
-	clk_enable(info->rtc_clk);
-	if (info->data->needs_src_clk)
-		clk_enable(info->rtc_src_clk);
-
 	con = readw(info->base + S3C2410_RTCCON);
 	con &= ~S3C2410_RTCCON_RTCEN;
 	writew(con, info->base + S3C2410_RTCCON);
@@ -438,28 +392,16 @@ static void s3c24xx_rtc_disable(struct s3c_rtc *info)
 	con = readb(info->base + S3C2410_TICNT);
 	con &= ~S3C2410_TICNT_ENABLE;
 	writeb(con, info->base + S3C2410_TICNT);
-
-	if (info->data->needs_src_clk)
-		clk_disable(info->rtc_src_clk);
-	clk_disable(info->rtc_clk);
 }
 
 static void s3c6410_rtc_disable(struct s3c_rtc *info)
 {
 	unsigned int con;
 
-	clk_enable(info->rtc_clk);
-	if (info->data->needs_src_clk)
-		clk_enable(info->rtc_src_clk);
-
 	con = readw(info->base + S3C2410_RTCCON);
 	con &= ~S3C64XX_RTCCON_TICEN;
 	con &= ~S3C2410_RTCCON_RTCEN;
 	writew(con, info->base + S3C2410_RTCCON);
-
-	if (info->data->needs_src_clk)
-		clk_disable(info->rtc_src_clk);
-	clk_disable(info->rtc_clk);
 }
 
 static int s3c_rtc_remove(struct platform_device *pdev)
@@ -598,15 +540,16 @@ static int s3c_rtc_probe(struct platform_device *pdev)
 
 	s3c_rtc_setfreq(info, 1);
 
-	if (info->data->needs_src_clk)
-		clk_disable(info->rtc_src_clk);
-	clk_disable(info->rtc_clk);
+	s3c_rtc_disable_clk(info);
 
 	return 0;
 
  err_nortc:
 	if (info->data->disable)
 		info->data->disable(info);
+
+	if (info->data->needs_src_clk)
+		clk_disable_unprepare(info->rtc_src_clk);
 	clk_disable_unprepare(info->rtc_clk);
 
 	return ret;
@@ -618,9 +561,7 @@ static int s3c_rtc_suspend(struct device *dev)
 {
 	struct s3c_rtc *info = dev_get_drvdata(dev);
 
-	clk_enable(info->rtc_clk);
-	if (info->data->needs_src_clk)
-		clk_enable(info->rtc_src_clk);
+	s3c_rtc_enable_clk(info);
 
 	/* save TICNT for anyone using periodic interrupts */
 	if (info->data->save_tick_cnt)
@@ -636,10 +577,6 @@ static int s3c_rtc_suspend(struct device *dev)
 			dev_err(dev, "enable_irq_wake failed\n");
 	}
 
-	if (info->data->needs_src_clk)
-		clk_disable(info->rtc_src_clk);
-	clk_disable(info->rtc_clk);
-
 	return 0;
 }
 
@@ -647,25 +584,19 @@ static int s3c_rtc_resume(struct device *dev)
 {
 	struct s3c_rtc *info = dev_get_drvdata(dev);
 
-	clk_enable(info->rtc_clk);
-	if (info->data->needs_src_clk)
-		clk_enable(info->rtc_src_clk);
-
 	if (info->data->enable)
 		info->data->enable(info);
 
 	if (info->data->restore_tick_cnt)
 		info->data->restore_tick_cnt(info);
 
+	s3c_rtc_disable_clk(info);
+
 	if (device_may_wakeup(dev) && info->wake_en) {
 		disable_irq_wake(info->irq_alarm);
 		info->wake_en = false;
 	}
 
-	if (info->data->needs_src_clk)
-		clk_disable(info->rtc_src_clk);
-	clk_disable(info->rtc_clk);
-
 	return 0;
 }
 #endif
@@ -673,29 +604,13 @@ static SIMPLE_DEV_PM_OPS(s3c_rtc_pm_ops, s3c_rtc_suspend, s3c_rtc_resume);
 
 static void s3c24xx_rtc_irq(struct s3c_rtc *info, int mask)
 {
-	clk_enable(info->rtc_clk);
-	if (info->data->needs_src_clk)
-		clk_enable(info->rtc_src_clk);
 	rtc_update_irq(info->rtc, 1, RTC_AF | RTC_IRQF);
-	if (info->data->needs_src_clk)
-		clk_disable(info->rtc_src_clk);
-	clk_disable(info->rtc_clk);
-
-	s3c_rtc_alarm_clk_enable(info, false);
 }
 
 static void s3c6410_rtc_irq(struct s3c_rtc *info, int mask)
 {
-	clk_enable(info->rtc_clk);
-	if (info->data->needs_src_clk)
-		clk_enable(info->rtc_src_clk);
 	rtc_update_irq(info->rtc, 1, RTC_AF | RTC_IRQF);
 	writeb(mask, info->base + S3C2410_INTP);
-	if (info->data->needs_src_clk)
-		clk_disable(info->rtc_src_clk);
-	clk_disable(info->rtc_clk);
-
-	s3c_rtc_alarm_clk_enable(info, false);
 }
 
 static void s3c2410_rtc_setfreq(struct s3c_rtc *info, int freq)
-- 
1.8.5.5
