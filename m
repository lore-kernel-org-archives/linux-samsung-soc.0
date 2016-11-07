From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH 1/6] mfd: max8997: Initialize max8997 register map
Date: Mon, 07 Nov 2016 15:39:31 +0530
Message-ID: <1478513376-14307-2-git-send-email-pankaj.dubey@samsung.com>
References: <1478513376-14307-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:39282 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751134AbcKGKGw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Nov 2016 05:06:52 -0500
Received: from epcpsbgm2new.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OG901JPAO2XHN20@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 07 Nov 2016 19:06:38 +0900 (KST)
In-reply-to: <1478513376-14307-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: krzk@kernel.org, javier@osg.samsung.com, kgene@kernel.org, thomas.ab@samsung.com, myungjoo.ham@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>, Lee Jones <lee.jones@linaro.org>

This patch add regmap initialization to use register map
in max8997-clk device driver

CC: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 drivers/mfd/max8997.c               | 14 ++++++++++++++
 include/linux/mfd/max8997-private.h |  3 +++
 2 files changed, 17 insertions(+)

diff --git a/drivers/mfd/max8997.c b/drivers/mfd/max8997.c
index 2d6e2c3..bda9ec8 100644
--- a/drivers/mfd/max8997.c
+++ b/drivers/mfd/max8997.c
@@ -175,11 +175,17 @@ static inline unsigned long max8997_i2c_get_driver_data(struct i2c_client *i2c,
 	return id->driver_data;
 }
 
+static const struct regmap_config max8997_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
 static int max8997_i2c_probe(struct i2c_client *i2c,
 			    const struct i2c_device_id *id)
 {
 	struct max8997_dev *max8997;
 	struct max8997_platform_data *pdata = dev_get_platdata(&i2c->dev);
+	const struct regmap_config *config = &max8997_regmap_config;
 	int ret = 0;
 
 	max8997 = devm_kzalloc(&i2c->dev, sizeof(struct max8997_dev),
@@ -202,6 +208,14 @@ static int max8997_i2c_probe(struct i2c_client *i2c,
 	if (!pdata)
 		return ret;
 
+	max8997->regmap = devm_regmap_init_i2c(i2c, config);
+	if (IS_ERR(max8997->regmap)) {
+		ret = PTR_ERR(max8997->regmap);
+		dev_err(max8997->dev, "Failed to allocate register map: %d\n",
+				ret);
+		return ret;
+	}
+
 	max8997->pdata = pdata;
 	max8997->ono = pdata->ono;
 
diff --git a/include/linux/mfd/max8997-private.h b/include/linux/mfd/max8997-private.h
index 78c76cd..50c7129 100644
--- a/include/linux/mfd/max8997-private.h
+++ b/include/linux/mfd/max8997-private.h
@@ -25,6 +25,7 @@
 #include <linux/i2c.h>
 #include <linux/export.h>
 #include <linux/irqdomain.h>
+#include <linux/regmap.h>
 
 #define MAX8997_REG_INVALID	(0xff)
 
@@ -388,6 +389,8 @@ struct max8997_dev {
 	struct mutex iolock;
 
 	unsigned long type;
+
+	struct regmap *regmap;
 	struct platform_device *battery; /* battery control (not fuel gauge) */
 
 	int irq;
-- 
2.7.4
