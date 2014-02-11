From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 7/7] mfd: max8998: Fix possible NULL pointer dereference on
 i2c_new_dummy error
Date: Tue, 11 Feb 2014 11:03:35 +0100
Message-ID: <1392113015-11180-7-git-send-email-k.kozlowski@samsung.com>
References: <1392113015-11180-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:22473 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751469AbaBKKD5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Feb 2014 05:03:57 -0500
In-reply-to: <1392113015-11180-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, stable@vger.kernel.org

During probe the driver allocates dummy I2C device for RTC with i2c_new_dummy() but it does not check the return value of this call.

In case of error (i2c_new_device(): memory allocation failure or I2C
address cannot be used) this function returns NULL which is later used
by i2c_unregister_device().

If i2c_new_dummy() fails for RTC device, fail also the probe for
main MFD driver.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: stable@vger.kernel.org
---
 drivers/mfd/max8998.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mfd/max8998.c b/drivers/mfd/max8998.c
index 612ca404e150..61ea1826f8b4 100644
--- a/drivers/mfd/max8998.c
+++ b/drivers/mfd/max8998.c
@@ -215,6 +215,10 @@ static int max8998_i2c_probe(struct i2c_client *i2c,
 	mutex_init(&max8998->iolock);
 
 	max8998->rtc = i2c_new_dummy(i2c->adapter, RTC_I2C_ADDR);
+	if (!max8998->rtc) {
+		dev_err(&i2c->dev, "Failed to allocate I2C device for RTC\n");
+		return -ENODEV;
+	}
 	i2c_set_clientdata(max8998->rtc, max8998);
 
 	max8998_irq_init(max8998);
-- 
1.7.9.5
