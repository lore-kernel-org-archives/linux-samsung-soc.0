From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] mfd: sec: Export OF module alias table
Date: Wed, 25 Jul 2018 17:53:02 +0200
Message-ID: <20180725155302.4718-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

In case of Device Tree platforms, even though the Samsung PMIC sec
device is instantiated from DT, the driver is still matched through I2C
module alias.  That is because I2C core always reports an I2C module
alias instead of DT one.

This could change in the future so export DT module alias.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/mfd/sec-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index ca6b80d08ffc..9613b4257302 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -146,6 +146,7 @@ static const struct of_device_id sec_dt_match[] = {
 		/* Sentinel */
 	},
 };
+MODULE_DEVICE_TABLE(of, sec_dt_match);
 #endif
 
 static bool s2mpa01_volatile(struct device *dev, unsigned int reg)
-- 
2.14.1
