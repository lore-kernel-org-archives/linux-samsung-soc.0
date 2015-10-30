From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v5 4/4] drivers/rtc/rtc-s5m.c: add support for S2MPS15 RTC
Date: Fri, 30 Oct 2015 11:55:34 +0530
Message-ID: <1446186334-16510-5-git-send-email-alim.akhtar@samsung.com>
References: <1446186334-16510-1-git-send-email-alim.akhtar@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1446186334-16510-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, broonie@kernel.org
Cc: k.kozlowski@samsung.com, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@free-electrons.com>
List-Id: linux-samsung-soc@vger.kernel.org

RTC found in s2mps15 is almost same as one found on s2mps13
with few differences in RTC_UPDATE register fields, like:
1> Bit[4] and Bit[1] are reversed
   - On s2mps13
          WUDR -> bit[4], AUDR -> bit[1]
   - On s2mps15
	  WUDR -> bit[1], AUDR -> bit[4]
2> In case of s2mps13, for alarm register, need to set both
   WDUR and ADUR high, whereas for s2mps15 only set AUDR to high.
3> On s2mps15, WUDR, RUDR and AUDR functions should never be used
   at the same time.

This patch add required changes to enable s2mps15 rtc timer.

Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 drivers/rtc/rtc-s5m.c           |   37 +++++++++++++++++++++++++++++++++----
 include/linux/mfd/samsung/rtc.h |    2 ++
 2 files changed, 35 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index f2504b4eef34..0d68a85dd429 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -188,6 +188,7 @@ static inline int s5m_check_peding_alarm_interrupt(struct s5m_rtc_info *info,
 		ret = regmap_read(info->regmap, S5M_RTC_STATUS, &val);
 		val &= S5M_ALARM0_STATUS;
 		break;
+	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
 		ret = regmap_read(info->s5m87xx->regmap_pmic, S2MPS14_REG_ST2,
@@ -219,9 +220,22 @@ static inline int s5m8767_rtc_set_time_reg(struct s5m_rtc_info *info)
 		return ret;
 	}
 
-	data |= info->regs->rtc_udr_mask;
-	if (info->device_type == S5M8763X || info->device_type == S5M8767X)
-		data |= S5M_RTC_TIME_EN_MASK;
+	switch (info->device_type) {
+	case S5M8763X:
+	case S5M8767X:
+		data |= info->regs->rtc_udr_mask | S5M_RTC_TIME_EN_MASK;
+	case S2MPS15X:
+		/* As per UM, for write time register, set WUDR bit to high */
+		data |= S2MPS15_RTC_WUDR_MASK;
+		break;
+	case S2MPS14X:
+	case S2MPS13X:
+		data |= info->regs->rtc_udr_mask;
+		break;
+	default:
+		return -EINVAL;
+	}
+
 
 	ret = regmap_write(info->regmap, info->regs->rtc_udr_update, data);
 	if (ret < 0) {
@@ -252,6 +266,11 @@ static inline int s5m8767_rtc_set_alarm_reg(struct s5m_rtc_info *info)
 	case S5M8767X:
 		data &= ~S5M_RTC_TIME_EN_MASK;
 		break;
+	case S2MPS15X:
+		/* As per UM, for write alarm, set A_UDR(bit[4]) to high
+		 * rtc_udr_mask above sets bit[4]
+		 */
+		break;
 	case S2MPS14X:
 		data |= S2MPS_RTC_RUDR_MASK;
 		break;
@@ -317,7 +336,8 @@ static int s5m_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	u8 data[info->regs->regs_count];
 	int ret;
 
-	if (info->device_type == S2MPS14X || info->device_type == S2MPS13X) {
+	if (info->device_type == S2MPS15X || info->device_type == S2MPS14X ||
+			info->device_type == S2MPS13X) {
 		ret = regmap_update_bits(info->regmap,
 				info->regs->rtc_udr_update,
 				S2MPS_RTC_RUDR_MASK, S2MPS_RTC_RUDR_MASK);
@@ -339,6 +359,7 @@ static int s5m_rtc_read_time(struct device *dev, struct rtc_time *tm)
 		break;
 
 	case S5M8767X:
+	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
 		s5m8767_data_to_tm(data, tm, info->rtc_24hr_mode);
@@ -366,6 +387,7 @@ static int s5m_rtc_set_time(struct device *dev, struct rtc_time *tm)
 		s5m8763_tm_to_data(tm, data);
 		break;
 	case S5M8767X:
+	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
 		ret = s5m8767_tm_to_data(tm, data);
@@ -414,6 +436,7 @@ static int s5m_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 		break;
 
 	case S5M8767X:
+	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
 		s5m8767_data_to_tm(data, &alrm->time, info->rtc_24hr_mode);
@@ -463,6 +486,7 @@ static int s5m_rtc_stop_alarm(struct s5m_rtc_info *info)
 		break;
 
 	case S5M8767X:
+	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
 		for (i = 0; i < info->regs->regs_count; i++)
@@ -508,6 +532,7 @@ static int s5m_rtc_start_alarm(struct s5m_rtc_info *info)
 		break;
 
 	case S5M8767X:
+	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
 		data[RTC_SEC] |= ALARM_ENABLE_MASK;
@@ -548,6 +573,7 @@ static int s5m_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 		break;
 
 	case S5M8767X:
+	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
 		s5m8767_tm_to_data(&alrm->time, data);
@@ -631,6 +657,7 @@ static int s5m8767_rtc_init_reg(struct s5m_rtc_info *info)
 		ret = regmap_raw_write(info->regmap, S5M_ALARM0_CONF, data, 2);
 		break;
 
+	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
 		data[0] = (0 << BCD_EN_SHIFT) | (1 << MODEL24_SHIFT);
@@ -679,6 +706,7 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	switch (platform_get_device_id(pdev)->driver_data) {
+	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
 		regmap_cfg = &s2mps14_rtc_regmap_config;
@@ -805,6 +833,7 @@ static const struct platform_device_id s5m_rtc_id[] = {
 	{ "s5m-rtc",		S5M8767X },
 	{ "s2mps13-rtc",	S2MPS13X },
 	{ "s2mps14-rtc",	S2MPS14X },
+	{ "s2mps15-rtc",	S2MPS15X },
 	{ },
 };
 MODULE_DEVICE_TABLE(platform, s5m_rtc_id);
diff --git a/include/linux/mfd/samsung/rtc.h b/include/linux/mfd/samsung/rtc.h
index 29c30ac36020..a65e4655d470 100644
--- a/include/linux/mfd/samsung/rtc.h
+++ b/include/linux/mfd/samsung/rtc.h
@@ -107,6 +107,8 @@ enum s2mps_rtc_reg {
 #define S2MPS_RTC_WUDR_MASK	(1 << S2MPS_RTC_WUDR_SHIFT)
 #define S2MPS13_RTC_AUDR_SHIFT	1
 #define S2MPS13_RTC_AUDR_MASK	(1 << S2MPS13_RTC_AUDR_SHIFT)
+#define S2MPS15_RTC_WUDR_SHIFT	1
+#define S2MPS15_RTC_WUDR_MASK	(1 << S2MPS15_RTC_WUDR_SHIFT)
 #define S2MPS_RTC_RUDR_SHIFT	0
 #define S2MPS_RTC_RUDR_MASK	(1 << S2MPS_RTC_RUDR_SHIFT)
 #define RTC_TCON_SHIFT		1
-- 
1.7.10.4
