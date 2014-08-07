From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] mfd: max77686: fix support for devices without irq specified
Date: Thu, 07 Aug 2014 18:09:04 +0200
Message-ID: <1457999.lNPdqEWCCR@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:39000 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932082AbaHGQJL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Aug 2014 12:09:11 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Doug Anderson <dianders@chromium.org>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Before commit 6f1c1e71d933 ("mfd: max77686: Convert to use regmap_irq")
max77686_irq_init() return value was never checked so devices without
irq specified (like Hardkernel's Exynos4412 based ODROID-U3 board)
worked fine even though -ENODEV was returned by the function.  Add
handling for no irq specified case in max77686_i2c_probe() restoring
the previous driver's behavior.

The patch fixes boot for Hardkernel's Exynos4412 based ODROID-U3 board.

Error messages before the patch:
...
[    0.163995] max77686 0-0009: Failed to request IRQ 0 for max77686-pmic: -22
[    0.164020] max77686 0-0009: failed to add PMIC irq chip: -22
[    0.164478] max77686: probe of 0-0009 failed with error -22
...

Fixes: 6f1c1e71d933 ("mfd: max77686: Convert to use regmap_irq")
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Doug Anderson <dianders@chromium.org>
Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
patch is against next-20140804 branch of linux-next kernel

 drivers/mfd/max77686.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mfd/max77686.c b/drivers/mfd/max77686.c
index 86e5523..5fe024c 100644
--- a/drivers/mfd/max77686.c
+++ b/drivers/mfd/max77686.c
@@ -314,6 +314,11 @@ static int max77686_i2c_probe(struct i2c_client *i2c,
 		}
 	}
 
+	if (!max77686->irq) {
+		dev_info(max77686->dev, "irq is not specified\n");
+		goto skip_irq_setup;
+	}
+
 	ret = regmap_add_irq_chip(max77686->regmap, max77686->irq,
 				  IRQF_TRIGGER_FALLING | IRQF_ONESHOT |
 				  IRQF_SHARED, 0, irq_chip,
@@ -332,6 +337,7 @@ static int max77686_i2c_probe(struct i2c_client *i2c,
 		goto err_del_irqc;
 	}
 
+skip_irq_setup:
 	ret = mfd_add_devices(max77686->dev, -1, cells, n_devs, NULL, 0, NULL);
 	if (ret < 0) {
 		dev_err(&i2c->dev, "failed to add MFD devices: %d\n", ret);
-- 
1.8.2.3
