From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v2 2/3] rtc: s5m: Add separate field for storing auto-cleared
 mask in register config
Date: Wed, 30 Dec 2015 13:47:26 +0900
Message-ID: <1451450847-928-2-git-send-email-k.kozlowski@samsung.com>
References: <1451450847-928-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:33122 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754220AbbL3Ern (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Dec 2015 23:47:43 -0500
In-reply-to: <1451450847-928-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Yadwinder Singh Brar <yadi.brar01@gmail.com>

Some devices from S2M/S5M family use different register update masks for
different operations (alarm and register update). Now the driver uses
common register configuration and a lot of exceptions per device in code.

Before eliminating the exceptions and using specific register
configuration for given device, make the auto-cleared mask a separate
field. This is merely a refactoring.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

---

Changes since v1:
1. None.
---
 drivers/rtc/rtc-s5m.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 85649861a6b0..559db8f72117 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -56,6 +56,8 @@ struct s5m_rtc_reg_config {
 	 * auto-cleared after successful update.
 	 */
 	unsigned int udr_update;
+	/* Auto-cleared mask in UDR field for writing time and alarm */
+	unsigned int autoclear_udr_mask;
 	/* Mask for UDR field in 'udr_update' register */
 	unsigned int udr_mask;
 };
@@ -68,6 +70,7 @@ static const struct s5m_rtc_reg_config s5m_rtc_regs = {
 	.alarm0			= S5M_ALARM0_SEC,
 	.alarm1			= S5M_ALARM1_SEC,
 	.udr_update		= S5M_RTC_UDR_CON,
+	.autoclear_udr_mask	= S5M_RTC_UDR_MASK,
 	.udr_mask		= S5M_RTC_UDR_MASK,
 };
 
@@ -82,6 +85,7 @@ static const struct s5m_rtc_reg_config s2mps_rtc_regs = {
 	.alarm0			= S2MPS_ALARM0_SEC,
 	.alarm1			= S2MPS_ALARM1_SEC,
 	.udr_update		= S2MPS_RTC_UDR_CON,
+	.autoclear_udr_mask	= S2MPS_RTC_WUDR_MASK,
 	.udr_mask		= S2MPS_RTC_WUDR_MASK,
 };
 
@@ -167,7 +171,7 @@ static inline int s5m8767_wait_for_udr_update(struct s5m_rtc_info *info)
 
 	do {
 		ret = regmap_read(info->regmap, info->regs->udr_update, &data);
-	} while (--retry && (data & info->regs->udr_mask) && !ret);
+	} while (--retry && (data & info->regs->autoclear_udr_mask) && !ret);
 
 	if (!retry)
 		dev_err(info->dev, "waiting for UDR update, reached max number of retries\n");
-- 
1.9.1
