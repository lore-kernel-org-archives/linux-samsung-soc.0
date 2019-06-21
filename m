From: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH v4 1/2] power: supply: max8998-charger: Parse device tree for required data.
Date: Fri, 21 Jun 2019 13:56:01 +0200
Message-ID: <20190621115602.17559-2-pawel.mikolaj.chmiel@gmail.com>
References: <20190621115602.17559-1-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190621115602.17559-1-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sre@kernel.org
Cc: lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds missing code for reading charger configuration
from devicetree.

Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
---
Changes from v3:
  - Property prefix should be maxim, not max8998
  - Changed property name to more meaning full

Changes from v2:
  - Make restart level and charge timeout properties optional.
    If they're not present in devicetree, assume they're disabled.

Changes from v1:
  - Removed unneeded Fixes tag
  - Use new property names
---
 drivers/power/supply/max8998_charger.c | 60 ++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/drivers/power/supply/max8998_charger.c b/drivers/power/supply/max8998_charger.c
index 9a926c7c0f22..dfd473ed4c5b 100644
--- a/drivers/power/supply/max8998_charger.c
+++ b/drivers/power/supply/max8998_charger.c
@@ -8,6 +8,7 @@
 #include <linux/err.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
+#include <linux/of.h>
 #include <linux/slab.h>
 #include <linux/platform_device.h>
 #include <linux/power_supply.h>
@@ -69,6 +70,59 @@ static const struct power_supply_desc max8998_battery_desc = {
 	.num_properties	= ARRAY_SIZE(max8998_battery_props),
 };
 
+static int max8998_pmic_dt_parse_pdata(struct max8998_dev *iodev,
+					struct max8998_platform_data *pdata)
+{
+	struct device_node *pmic_np = iodev->dev->of_node;
+	struct device_node *charger_np;
+	int ret;
+
+	charger_np = of_get_child_by_name(pmic_np, "charger");
+	if (!charger_np) {
+		dev_err(iodev->dev, "could not find charger sub-node\n");
+		return -EINVAL;
+	}
+
+	ret = of_property_read_u32(charger_np,
+					"maxim,end-of-charge-percentage",
+					&pdata->eoc);
+	if (ret < 0) {
+		dev_err(iodev->dev,
+			"Could not find maxim,end-of-charge-percentage in devicetree\n");
+		return ret;
+	}
+
+	ret = of_property_read_u32(charger_np,
+					"maxim,charge-restart-threshold",
+					&pdata->restart);
+	if (ret < 0) {
+		if (ret != -EINVAL) {
+			dev_err(iodev->dev,
+				"Failed to read maxim,charge-restart-threshold\n");
+			return ret;
+		}
+
+		pdata->restart = -1;
+		dev_dbg(iodev->dev, "Charge Restart Threshold disabled\n");
+	}
+
+	ret = of_property_read_u32(charger_np,
+					"maxim,charge-timeout",
+					&pdata->timeout);
+	if (ret < 0) {
+		if (ret != -EINVAL) {
+			dev_err(iodev->dev,
+				"Failed to read maxim,charge-timeout\n");
+			return ret;
+		}
+
+		pdata->timeout = -1;
+		dev_dbg(iodev->dev, "Charge Full Timeout disabled\n");
+	}
+
+	return 0;
+}
+
 static int max8998_battery_probe(struct platform_device *pdev)
 {
 	struct max8998_dev *iodev = dev_get_drvdata(pdev->dev.parent);
@@ -83,6 +137,12 @@ static int max8998_battery_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	if (IS_ENABLED(CONFIG_OF) && iodev->dev->of_node) {
+		ret = max8998_pmic_dt_parse_pdata(iodev, pdata);
+		if (ret)
+			return ret;
+	}
+
 	max8998 = devm_kzalloc(&pdev->dev, sizeof(struct max8998_battery_data),
 				GFP_KERNEL);
 	if (!max8998)
-- 
2.17.1
