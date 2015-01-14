From: Kevin Hilman <khilman@kernel.org>
Subject: [PATCH] hwmon: (ina2xx) Add ina231 compatible string
Date: Wed, 14 Jan 2015 15:57:32 -0800
Message-ID: <1421279852-27965-1-git-send-email-khilman@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:44417 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753862AbbANX5e (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Jan 2015 18:57:34 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>, lm-sensors@lm-sensors.org
Cc: linux-samsung-soc@vger.kernel.org, Jean Delvare <jdelvare@suse.de>, open list <linux-kernel@vger.kernel.org>

From: Kevin Hilman <khilman@linaro.org>

Add support for "ina231" as compatible string.

Tested with the Exynos5422-based odroid-xu3 board which has on-board
INA231 sensors.

Signed-off-by: Kevin Hilman <khilman@linaro.org>
---
 drivers/hwmon/ina2xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index e01feba909c3..8c4a29bd2eaf 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -287,6 +287,7 @@ static const struct i2c_device_id ina2xx_id[] = {
 	{ "ina220", ina219 },
 	{ "ina226", ina226 },
 	{ "ina230", ina226 },
+	{ "ina231", ina226 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ina2xx_id);
-- 
2.1.3
