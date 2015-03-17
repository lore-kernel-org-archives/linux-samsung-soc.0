From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH] rtc: s5m: Allow usage on device type different than main MFD
 type
Date: Tue, 17 Mar 2015 10:24:20 +0100
Message-ID: <1426584260-6623-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:48738 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932619AbbCQJY3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Mar 2015 05:24:29 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alessandro Zummo <a.zummo@towertech.it>, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

The RTC driver supports two flavors of S5M devices: S5M8767-like and
S2MPS14-like.

On S2MPS13 and S2MPS14 devices the RTC module is the same so we want to
re-use the existing support of S2MPS14. However device type was passed
from parent MFD driver in platform data structure.  This way for the
S2MPS13 device the main MFD driver passed device type of 'S2MPS13X'.

Instead decouple detecting of device type between main MFD and
RTC driver. This allows adding support for other S2MPS14 variations
(like S2MPS11 and S2MPS13) easily by adding to mfd/sec-core.c:

static const struct mfd_cell s2mps13_devs[] = {
	{ .name = "s2mps14-rtc", }
};

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/rtc/rtc-s5m.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 4008b84246ca..df6fd7df8eed 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -90,7 +90,7 @@ struct s5m_rtc_info {
 	struct regmap *regmap;
 	struct rtc_device *rtc_dev;
 	int irq;
-	int device_type;
+	enum sec_device_type device_type;
 	int rtc_24hr_mode;
 	const struct s5m_rtc_reg_config	*regs;
 };
@@ -650,7 +650,7 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 	if (!info)
 		return -ENOMEM;
 
-	switch (pdata->device_type) {
+	switch (platform_get_device_id(pdev)->driver_data) {
 	case S2MPS14X:
 		regmap_cfg = &s2mps14_rtc_regmap_config;
 		info->regs = &s2mps_rtc_regs;
@@ -667,7 +667,9 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 		alarm_irq = S5M8767_IRQ_RTCA1;
 		break;
 	default:
-		dev_err(&pdev->dev, "Device type is not supported by RTC driver\n");
+		dev_err(&pdev->dev,
+				"Device type %lu is not supported by RTC driver\n",
+				pdev->id_entry->driver_data);
 		return -ENODEV;
 	}
 
@@ -687,7 +689,7 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 
 	info->dev = &pdev->dev;
 	info->s5m87xx = s5m87xx;
-	info->device_type = s5m87xx->device_type;
+	info->device_type = pdev->id_entry->driver_data;
 
 	if (s5m87xx->irq_data) {
 		info->irq = regmap_irq_get_virq(s5m87xx->irq_data, alarm_irq);
-- 
1.9.1
