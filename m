From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: [PATCH 4/4] rtc: s3c: enable/disable clocks for alarm
Date: Tue, 11 Aug 2015 20:28:22 +0900
Message-ID: <1439292502-22912-4-git-send-email-jy0922.shim@samsung.com>
References: <1439292502-22912-1-git-send-email-jy0922.shim@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1439292502-22912-1-git-send-email-jy0922.shim@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rtc-linux@googlegroups.com
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, cw00.choi@samsung.com, k.kozlowski@samsung.com, jy0922.shim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

The clock enable/disable codes for alarm have removed from
'commit 24e1455493da ("drivers/rtc/rtc-s3c.c: delete duplicate clock
control")' and the clocks keep disabling even if alarm is set, so alarm
interrupt can't happen.

The s3c_rtc_setaie function can be called several times with that
enabled argument has same value, so it needs to check whether clocks is
enabled or not.

Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
---
 drivers/rtc/rtc-s3c.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index abe2a6d..fce078c 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -39,6 +39,7 @@ struct s3c_rtc {
 	void __iomem *base;
 	struct clk *rtc_clk;
 	struct clk *rtc_src_clk;
+	bool clk_enabled;
 
 	struct s3c_rtc_data *data;
 
@@ -71,9 +72,12 @@ static void s3c_rtc_enable_clk(struct s3c_rtc *info)
 	unsigned long irq_flags;
 
 	spin_lock_irqsave(&info->alarm_clk_lock, irq_flags);
-	clk_enable(info->rtc_clk);
-	if (info->data->needs_src_clk)
-		clk_enable(info->rtc_src_clk);
+	if (!info->clk_enabled) {
+		clk_enable(info->rtc_clk);
+		if (info->data->needs_src_clk)
+			clk_enable(info->rtc_src_clk);
+		info->clk_enabled = true;
+	}
 	spin_unlock_irqrestore(&info->alarm_clk_lock, irq_flags);
 }
 
@@ -82,9 +86,12 @@ static void s3c_rtc_disable_clk(struct s3c_rtc *info)
 	unsigned long irq_flags;
 
 	spin_lock_irqsave(&info->alarm_clk_lock, irq_flags);
-	if (info->data->needs_src_clk)
-		clk_disable(info->rtc_src_clk);
-	clk_disable(info->rtc_clk);
+	if (info->clk_enabled) {
+		if (info->data->needs_src_clk)
+			clk_disable(info->rtc_src_clk);
+		clk_disable(info->rtc_clk);
+		info->clk_enabled = false;
+	}
 	spin_unlock_irqrestore(&info->alarm_clk_lock, irq_flags);
 }
 
@@ -128,6 +135,11 @@ static int s3c_rtc_setaie(struct device *dev, unsigned int enabled)
 
 	s3c_rtc_disable_clk(info);
 
+	if (enabled)
+		s3c_rtc_enable_clk(info);
+	else
+		s3c_rtc_disable_clk(info);
+
 	return 0;
 }
 
-- 
1.9.1
