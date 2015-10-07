From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v2 3/3] mfd: sec-core: Disable buck voltage reset on watchdog
 falling edge
Date: Wed, 07 Oct 2015 09:44:41 +0900
Message-ID: <1444178681-16188-3-git-send-email-k.kozlowski@samsung.com>
References: <1444178681-16188-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1444178681-16188-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Inki Dae <inki.dae@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The WRSTBI bit (disabled by default but enabled by bootloader), when
set, is responsible for resetting voltages to default values of
certain bucks on falling edge of Warm Reset Input pin from AP.

However on some boards (with S2MPS13) the pin is pulled down so any
suspend will effectively trigger the reset of bucks supplying the power
to the little and big cores. In the same time when resuming, these bucks
must provide voltage greater or equal to voltage before suspend to match
the frequency chosen by cpufreq. If voltage (default value of voltage
after reset) is lower than one set by cpufreq before suspend, then
system will hang during resuming.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Reported-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Tested-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

---

Changs since v1:
1. Add Bartlomiej's Reported-by and Tested-by.
---
 drivers/mfd/sec-core.c              | 26 ++++++++++++++++++++++++++
 include/linux/mfd/samsung/core.h    |  2 ++
 include/linux/mfd/samsung/s2mps13.h |  1 +
 3 files changed, 29 insertions(+)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index 589e5efc2d7f..2626fc0b5b8c 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -262,6 +262,29 @@ static void sec_pmic_dump_rev(struct sec_pmic_dev *sec_pmic)
 		dev_dbg(sec_pmic->dev, "Revision: 0x%x\n", val);
 }
 
+static void sec_pmic_configure(struct sec_pmic_dev *sec_pmic)
+{
+	int err;
+
+	if (sec_pmic->device_type != S2MPS13X)
+		return;
+
+	if (sec_pmic->pdata->disable_wrstbi) {
+		/*
+		 * If WRSTBI pin is pulled down this feature must be disabled
+		 * because each Suspend to RAM will trigger buck voltage reset
+		 * to default values.
+		 */
+		err = regmap_update_bits(sec_pmic->regmap_pmic,
+					 S2MPS13_REG_WRSTBI,
+					 S2MPS13_REG_WRSTBI_MASK, 0x0);
+		if (err)
+			dev_warn(sec_pmic->dev,
+				 "Cannot initialize WRSTBI config: %d\n",
+				 err);
+	}
+}
+
 #ifdef CONFIG_OF
 /*
  * Only the common platform data elements for s5m8767 are parsed here from the
@@ -289,6 +312,8 @@ static struct sec_platform_data *sec_pmic_i2c_parse_dt_pdata(
 
 	pd->manual_poweroff = of_property_read_bool(dev->of_node,
 						"samsung,s2mps11-acokb-ground");
+	pd->disable_wrstbi = of_property_read_bool(dev->of_node,
+						"samsung,s2mps11-wrstbi-ground");
 	return pd;
 }
 #else
@@ -434,6 +459,7 @@ static int sec_pmic_probe(struct i2c_client *i2c,
 		goto err_mfd;
 
 	device_init_wakeup(sec_pmic->dev, sec_pmic->wakeup);
+	sec_pmic_configure(sec_pmic);
 	sec_pmic_dump_rev(sec_pmic);
 
 	return ret;
diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index aa78957e092f..a06098639399 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -134,6 +134,8 @@ struct sec_platform_data {
 	int				buck4_init;
 	/* Whether or not manually set PWRHOLD to low during shutdown. */
 	bool				manual_poweroff;
+	/* Disable the WRSTBI (buck voltage warm reset) when probing? */
+	bool				disable_wrstbi;
 };
 
 /**
diff --git a/include/linux/mfd/samsung/s2mps13.h b/include/linux/mfd/samsung/s2mps13.h
index b1fd675fa36f..239e977ba45d 100644
--- a/include/linux/mfd/samsung/s2mps13.h
+++ b/include/linux/mfd/samsung/s2mps13.h
@@ -184,5 +184,6 @@ enum s2mps13_regulators {
  * Let's assume that default value will be set.
  */
 #define S2MPS13_BUCK_RAMP_DELAY		12500
+#define S2MPS13_REG_WRSTBI_MASK		BIT(5)
 
 #endif /*  __LINUX_MFD_S2MPS13_H */
-- 
1.9.1
