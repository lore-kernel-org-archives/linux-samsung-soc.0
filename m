From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 01/14] mfd: sec: Add maximum RTC register for regmap config
Date: Tue, 11 Feb 2014 14:03:44 +0100
Message-ID: <1392123837-5517-2-git-send-email-k.kozlowski@samsung.com>
References: <1392123837-5517-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1392123837-5517-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add maximum register to the regmap used by rtc-s5m driver.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/mfd/sec-core.c          |    2 ++
 include/linux/mfd/samsung/rtc.h |    2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index 7c6ce2e4aaa6..6021c54f74cf 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -141,6 +141,8 @@ static const struct regmap_config s5m8767_regmap_config = {
 static const struct regmap_config sec_rtc_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
+
+	.max_register = SEC_RTC_REG_MAX,
 };
 
 #ifdef CONFIG_OF
diff --git a/include/linux/mfd/samsung/rtc.h b/include/linux/mfd/samsung/rtc.h
index 94b7cd6d8891..4627f59ebd84 100644
--- a/include/linux/mfd/samsung/rtc.h
+++ b/include/linux/mfd/samsung/rtc.h
@@ -43,6 +43,8 @@ enum sec_rtc_reg {
 	SEC_RTC_STATUS,
 	SEC_WTSR_SMPL_CNTL,
 	SEC_RTC_UDR_CON,
+
+	SEC_RTC_REG_MAX,
 };
 
 #define RTC_I2C_ADDR		(0x0C >> 1)
-- 
1.7.9.5
