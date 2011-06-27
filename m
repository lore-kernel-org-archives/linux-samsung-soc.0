From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: [PATCH 3/3] rtc: rtc-s3c: allow multiple open / allow no-ioctl-open'ed
 rtc to have irq.
Date: Mon, 27 Jun 2011 20:43:26 +0900
Message-ID: <1309175006-9218-4-git-send-email-myungjoo.ham@samsung.com>
References: <1309175006-9218-1-git-send-email-myungjoo.ham@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:41410 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757817Ab1F0Lna (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Jun 2011 07:43:30 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LNG001FX5WFV460@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 27 Jun 2011 20:43:27 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LNG0069V5WFYQ@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 27 Jun 2011 20:43:27 +0900 (KST)
In-reply-to: <1309175006-9218-1-git-send-email-myungjoo.ham@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com
Cc: Kukjin Kim <kgene.kim@samsung.com>, Changhwan Youn <chaos.youn@samsung.com>, ben-linux@fluff.org, a.zummo@towertech.it, kyungmin.park@samsung.com, dg77.kim@samsung.com, myungjoo.ham@gmail.com

The previous rtc-s3c had two issues related with its IRQ.
1. Users cannot open rtc multiple times because an open operation calls
request_irq on the same IRQ. (e.g., two user processes wants to open and
read RTC time from rtc-s3c at the same time)
2. If alarm is set and no one has the rtc opened with filesystem
(either the alarm is set by kernel/boot-loader or user set an alarm
and closed rtc dev file), the pending bit is not cleared and no further
interrupt is invoked. When the alarm is used by the system itself such
as a resume from suspend-to-RAM or other Low-power modes/idle, this is a
critical issue.

This patch mitigates these issue by calling request_irq at probe and
free_irq at remove.

Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/rtc/rtc-s3c.c |   63 ++++++++++++++----------------------------------
 1 files changed, 19 insertions(+), 44 deletions(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index be85ea5..8d2807f 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -320,50 +320,7 @@ static int s3c_rtc_proc(struct device *dev, struct seq_file *seq)
 	return 0;
 }
 
-static int s3c_rtc_open(struct device *dev)
-{
-	struct platform_device *pdev = to_platform_device(dev);
-	struct rtc_device *rtc_dev = platform_get_drvdata(pdev);
-	int ret;
-
-	ret = request_irq(s3c_rtc_alarmno, s3c_rtc_alarmirq,
-			  IRQF_DISABLED,  "s3c2410-rtc alarm", rtc_dev);
-
-	if (ret) {
-		dev_err(dev, "IRQ%d error %d\n", s3c_rtc_alarmno, ret);
-		return ret;
-	}
-
-	ret = request_irq(s3c_rtc_tickno, s3c_rtc_tickirq,
-			  IRQF_DISABLED,  "s3c2410-rtc tick", rtc_dev);
-
-	if (ret) {
-		dev_err(dev, "IRQ%d error %d\n", s3c_rtc_tickno, ret);
-		goto tick_err;
-	}
-
-	return ret;
-
- tick_err:
-	free_irq(s3c_rtc_alarmno, rtc_dev);
-	return ret;
-}
-
-static void s3c_rtc_release(struct device *dev)
-{
-	struct platform_device *pdev = to_platform_device(dev);
-	struct rtc_device *rtc_dev = platform_get_drvdata(pdev);
-
-	/* do not clear AIE here, it may be needed for wake */
-
-	free_irq(s3c_rtc_alarmno, rtc_dev);
-	free_irq(s3c_rtc_tickno, rtc_dev);
-}
-
-
 static const struct rtc_class_ops s3c_rtcops = {
-	.open		= s3c_rtc_open,
-	.release	= s3c_rtc_release,
 	.read_time	= s3c_rtc_gettime,
 	.set_time	= s3c_rtc_settime,
 	.read_alarm	= s3c_rtc_getalarm,
@@ -427,6 +384,9 @@ static int __devexit s3c_rtc_remove(struct platform_device *dev)
 {
 	struct rtc_device *rtc = platform_get_drvdata(dev);
 
+	free_irq(s3c_rtc_alarmno, rtc);
+	free_irq(s3c_rtc_tickno, rtc);
+
 	platform_set_drvdata(dev, NULL);
 	rtc_device_unregister(rtc);
 
@@ -553,8 +513,23 @@ static int __devinit s3c_rtc_probe(struct platform_device *pdev)
 
 	clk_disable(rtc_clk);
 
-	return 0;
+	ret = request_irq(s3c_rtc_alarmno, s3c_rtc_alarmirq,
+			  IRQF_DISABLED,  "s3c2410-rtc alarm", rtc);
 
+	if (ret) {
+		dev_err(&pdev->dev, "IRQ%d error %d\n", s3c_rtc_alarmno, ret);
+		return ret;
+	}
+
+	ret = request_irq(s3c_rtc_tickno, s3c_rtc_tickirq,
+			  IRQF_DISABLED,  "s3c2410-rtc tick", rtc);
+
+	if (ret) {
+		dev_err(&pdev->dev, "IRQ%d error %d\n", s3c_rtc_tickno, ret);
+		free_irq(s3c_rtc_alarmno, rtc);
+	}
+
+	return ret;
  err_nortc:
 	s3c_rtc_enable(pdev, 0);
 	clk_disable(rtc_clk);
-- 
1.7.4.1
