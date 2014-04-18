From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v2 6/6] rtc: s5m: Consolidate two device type switch statements
Date: Fri, 18 Apr 2014 15:18:59 +0200
Message-ID: <1397827139-14589-7-git-send-email-k.kozlowski@samsung.com>
References: <1397827139-14589-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1397827139-14589-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alessandro Zummo <a.zummo@towertech.it>, Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

In probe the configuration of driver for different chipsets was done in
two switch (pdata->device_type) statements. Consolidate them into one
switch statement to increase code readability.

Additionally check the return value of regmap_irq_get_virq and exit
probe on error.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/rtc/rtc-s5m.c | 27 ++++++++-------------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 76287ebd0e35..8f06250a0389 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -666,7 +666,7 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 	struct sec_platform_data *pdata = s5m87xx->pdata;
 	struct s5m_rtc_info *info;
 	const struct regmap_config *regmap_cfg;
-	int ret;
+	int ret, alarm_irq;
 
 	if (!pdata) {
 		dev_err(pdev->dev.parent, "Platform data not supplied\n");
@@ -681,14 +681,17 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 	case S2MPS14X:
 		regmap_cfg = &s2mps14_rtc_regmap_config;
 		info->regs = &s2mps_rtc_regs;
+		alarm_irq = S2MPS14_IRQ_RTCA0;
 		break;
 	case S5M8763X:
 		regmap_cfg = &s5m_rtc_regmap_config;
 		info->regs = &s5m_rtc_regs;
+		alarm_irq = S5M8763_IRQ_ALARM0;
 		break;
 	case S5M8767X:
 		regmap_cfg = &s5m_rtc_regmap_config;
 		info->regs = &s5m_rtc_regs;
+		alarm_irq = S5M8767_IRQ_RTCA1;
 		break;
 	default:
 		dev_err(&pdev->dev, "Device type is not supported by RTC driver\n");
@@ -714,25 +717,11 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 	info->device_type = s5m87xx->device_type;
 	info->wtsr_smpl = s5m87xx->wtsr_smpl;
 
-	switch (pdata->device_type) {
-	case S2MPS14X:
-		info->irq = regmap_irq_get_virq(s5m87xx->irq_data,
-				S2MPS14_IRQ_RTCA0);
-		break;
-
-	case S5M8763X:
-		info->irq = regmap_irq_get_virq(s5m87xx->irq_data,
-				S5M8763_IRQ_ALARM0);
-		break;
-
-	case S5M8767X:
-		info->irq = regmap_irq_get_virq(s5m87xx->irq_data,
-				S5M8767_IRQ_RTCA1);
-		break;
-
-	default:
+	info->irq = regmap_irq_get_virq(s5m87xx->irq_data, alarm_irq);
+	if (info->irq <= 0) {
 		ret = -EINVAL;
-		dev_err(&pdev->dev, "Unsupported device type: %d\n", ret);
+		dev_err(&pdev->dev, "Failed to get virtual IRQ %d\n",
+				alarm_irq);
 		goto err;
 	}
 
-- 
1.8.3.2
