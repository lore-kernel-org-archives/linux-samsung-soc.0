From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH] mfd: sec-core: Fix possible NULL pointer dereference when
 i2c_new_dummy error
Date: Tue, 11 Feb 2014 10:12:25 +0100
Message-ID: <1392109945-333-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:24793 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751374AbaBKJOV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Feb 2014 04:14:21 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, stable@vger.kernel.org

During probe the sec-core driver allocates dummy I2C device for RTC with
i2c_new_dummy() but return value is not checked. In case of error
(i2c_new_device(): memory allocation failure or I2C address cannot be
used) this function returns NULL which is later used by
devm_regmap_init_i2c() or i2c_unregister_device().

If i2c_new_dummy() fails for RTC device, fail also the probe for main
MFD driver.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: stable@vger.kernel.org
---
 drivers/mfd/sec-core.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index a139798b8065..7c6ce2e4aaa6 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -252,6 +252,10 @@ static int sec_pmic_probe(struct i2c_client *i2c,
 	}
 
 	sec_pmic->rtc = i2c_new_dummy(i2c->adapter, RTC_I2C_ADDR);
+	if (!sec_pmic->rtc) {
+		dev_err(&i2c->dev, "Failed to allocate I2C for RTC\n");
+		return -ENODEV;
+	}
 	i2c_set_clientdata(sec_pmic->rtc, sec_pmic);
 
 	sec_pmic->regmap_rtc = devm_regmap_init_i2c(sec_pmic->rtc,
-- 
1.7.9.5
