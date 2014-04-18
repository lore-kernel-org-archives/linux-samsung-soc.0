From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v2 3/6] rtc: s5m: Use shorter time of register update
Date: Fri, 18 Apr 2014 15:18:56 +0200
Message-ID: <1397827139-14589-4-git-send-email-k.kozlowski@samsung.com>
References: <1397827139-14589-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:19301 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754852AbaDRNTL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Apr 2014 09:19:11 -0400
In-reply-to: <1397827139-14589-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alessandro Zummo <a.zummo@towertech.it>, Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Set the time needed for updating alarm and time registers to 0.45 ms.
The default is 7.32 ms which is too long and leads to warnings when
setting alarm or time:
	s5m-rtc: waiting for UDR update, reached max number of retries

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/rtc/rtc-s5m.c           |  7 +++++++
 include/linux/mfd/samsung/rtc.h | 10 ++++++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 22137d4dbadf..3751ef90f93c 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -519,6 +519,13 @@ static int s5m8767_rtc_init_reg(struct s5m_rtc_info *info)
 	u8 data[2];
 	int ret;
 
+	/* UDR update time. Default of 7.32 ms is too long. */
+	ret = regmap_update_bits(info->regmap, S5M_RTC_UDR_CON,
+			S5M_RTC_UDR_T_MASK, S5M_RTC_UDR_T_450_US);
+	if (ret < 0)
+		dev_err(info->dev, "%s: fail to change UDR time: %d\n",
+				__func__, ret);
+
 	/* Set RTC control register : Binary mode, 24hour mode */
 	data[0] = (1 << BCD_EN_SHIFT) | (1 << MODEL24_SHIFT);
 	data[1] = (0 << BCD_EN_SHIFT) | (1 << MODEL24_SHIFT);
diff --git a/include/linux/mfd/samsung/rtc.h b/include/linux/mfd/samsung/rtc.h
index 207fcfbde82e..b6401e7661c7 100644
--- a/include/linux/mfd/samsung/rtc.h
+++ b/include/linux/mfd/samsung/rtc.h
@@ -111,6 +111,16 @@ enum s2mps_rtc_reg {
 #define RTC_TCON_MASK		(1 << RTC_TCON_SHIFT)
 #define S5M_RTC_TIME_EN_SHIFT	3
 #define S5M_RTC_TIME_EN_MASK	(1 << S5M_RTC_TIME_EN_SHIFT)
+/*
+ * UDR_T field in S5M_RTC_UDR_CON register determines the time needed
+ * for updating alarm and time registers. Default is 7.32 ms.
+ */
+#define S5M_RTC_UDR_T_SHIFT	6
+#define S5M_RTC_UDR_T_MASK	(0x3 << S5M_RTC_UDR_T_SHIFT)
+#define S5M_RTC_UDR_T_7320_US	(0x0 << S5M_RTC_UDR_T_SHIFT)
+#define S5M_RTC_UDR_T_1830_US	(0x1 << S5M_RTC_UDR_T_SHIFT)
+#define S5M_RTC_UDR_T_3660_US	(0x2 << S5M_RTC_UDR_T_SHIFT)
+#define S5M_RTC_UDR_T_450_US	(0x3 << S5M_RTC_UDR_T_SHIFT)
 
 /* RTC Hour register */
 #define HOUR_PM_SHIFT		6
-- 
1.8.3.2
