Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 123C427B4FC;
	Tue, 15 Apr 2025 08:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744704780; cv=none; b=ELIRqBzvYbN47cOP/Ek17n6B5+TtTxt9uU4qi61iBFt/kSCJzYv+aZcgsaWv91KK+t4hLbO0Kw0J5YfiES82560FsM/Ihh3TiaiO8efvkPxIdKU6xD7OLlhrQBiXxVogK9bJdPZnxlsaUjiLwRS28Jr6NfQ/3jxFteobjCdp8yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744704780; c=relaxed/simple;
	bh=YrxfUUWbTW/SG8VF+JIHzbRGCvepBaRzdfGipUj4D7k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Z4MSpRCrVAwgJM9OO0f4YyrYegfo11x2EibPzWvQU05wMqgrP/kbQco/sZeljyzzA0eOxbJ+btDtzN6pzhlocZ535kMJetAom7VERc92XACaRbEcn21sMt9cXbrD7YTYJ6vz32LvhZCFsUgx5DJ1re7SUimE9dN0U8GRHyNOzSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=YqCjT3e/; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="YqCjT3e/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=yF/Wu
	sUCowZ0J952Z1eRkUOf7Yx0ySWy3BbB440mekM=; b=YqCjT3e/FFnMk5Awqb8Hh
	/FMHYhZz5c3zCak/V2iPNsh8exXMq8Wl6BaVuXg6BiYICm+4TyVrnaR6BvICzvxV
	iwEIVpANerFDeyEF2L3owg6frRaGuK7hs6a+20qHNyfJBSTIg9z7Ku7p63XmSk3Q
	fjYr43ojLIV12mrGxyn2rs=
Received: from nh50.. (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wAnWWXvFP5nmm3PAA--.20081S2;
	Tue, 15 Apr 2025 16:12:32 +0800 (CST)
From: He Yong <hyyoxhk@163.com>
To: krzk@kernel.org
Cc: linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] regulator: s5m8767: add support for GPIO descriptors
Date: Tue, 15 Apr 2025 16:12:31 +0800
Message-Id: <20250415081231.904289-1-hyyoxhk@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAnWWXvFP5nmm3PAA--.20081S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxtw47Gw45Jr1rAr1xuF1kuFg_yoW3tw13pF
	98Ww4fKrs7J3WrJ3W8ta1DZrWfCay7Kry7Kr17Jryayr4jqrn7WFn2qr1IvFyjkrWUAw15
	JFW5uFWFkr1DAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UTWlPUUUUU=
X-CM-SenderInfo: pk1105lkn6il2tof0z/1tbiTQkv0mf9aU3pYgABsN

This patch converts the S5M8767 PMIC driver to use GPIO descriptors
instead of the legacy GPIO interface. The changes include:

1. Replace integer GPIO numbers with struct gpio_desc pointers in the
   platform data structure
2. Use devm_gpiod_get_index() to get GPIO descriptors from device tree
3. Replace gpio_set_value() with gpiod_set_value() for GPIO control
4. Remove manual GPIO request and direction setting code
5. Simplify GPIO error handling

The conversion to GPIO descriptors provides several benefits:
- Better integration with the device tree
- Automatic GPIO resource management
- More consistent GPIO handling across the kernel
- Reduced boilerplate code

This change maintains backward compatibility with existing device trees
while modernizing the driver to use the preferred GPIO interface

Signed-off-by: He Yong <hyyoxhk@163.com>
---
 drivers/regulator/s5m8767.c      | 121 ++++++++-----------------------
 include/linux/mfd/samsung/core.h |   4 +-
 2 files changed, 31 insertions(+), 94 deletions(-)

diff --git a/drivers/regulator/s5m8767.c b/drivers/regulator/s5m8767.c
index d25cd81e3f36..0b001fe3495e 100644
--- a/drivers/regulator/s5m8767.c
+++ b/drivers/regulator/s5m8767.c
@@ -5,7 +5,7 @@
 
 #include <linux/cleanup.h>
 #include <linux/err.h>
-#include <linux/of_gpio.h>
+#include <linux/of.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -35,8 +35,8 @@ struct s5m8767_info {
 	u8 buck2_vol[8];
 	u8 buck3_vol[8];
 	u8 buck4_vol[8];
-	int buck_gpios[3];
-	int buck_ds[3];
+	struct gpio_desc *buck_dvs_gpios[3];
+	struct gpio_desc *buck_ds_gpios[3];
 	int buck_gpioindex;
 };
 
@@ -272,9 +272,9 @@ static inline int s5m8767_set_high(struct s5m8767_info *s5m8767)
 {
 	int temp_index = s5m8767->buck_gpioindex;
 
-	gpio_set_value(s5m8767->buck_gpios[0], (temp_index >> 2) & 0x1);
-	gpio_set_value(s5m8767->buck_gpios[1], (temp_index >> 1) & 0x1);
-	gpio_set_value(s5m8767->buck_gpios[2], temp_index & 0x1);
+	gpiod_set_value(s5m8767->buck_dvs_gpios[0], (temp_index >> 2) & 0x1);
+	gpiod_set_value(s5m8767->buck_dvs_gpios[1], (temp_index >> 1) & 0x1);
+	gpiod_set_value(s5m8767->buck_dvs_gpios[2], temp_index & 0x1);
 
 	return 0;
 }
@@ -283,9 +283,9 @@ static inline int s5m8767_set_low(struct s5m8767_info *s5m8767)
 {
 	int temp_index = s5m8767->buck_gpioindex;
 
-	gpio_set_value(s5m8767->buck_gpios[2], temp_index & 0x1);
-	gpio_set_value(s5m8767->buck_gpios[1], (temp_index >> 1) & 0x1);
-	gpio_set_value(s5m8767->buck_gpios[0], (temp_index >> 2) & 0x1);
+	gpiod_set_value(s5m8767->buck_dvs_gpios[0], temp_index & 0x1);
+	gpiod_set_value(s5m8767->buck_dvs_gpios[1], (temp_index >> 1) & 0x1);
+	gpiod_set_value(s5m8767->buck_dvs_gpios[2], temp_index & 0x1);
 
 	return 0;
 }
@@ -482,38 +482,30 @@ static int s5m8767_enable_ext_control(struct s5m8767_info *s5m8767,
 
 
 #ifdef CONFIG_OF
-static int s5m8767_pmic_dt_parse_dvs_gpio(struct sec_pmic_dev *iodev,
-			struct sec_platform_data *pdata,
-			struct device_node *pmic_np)
+static int s5m8767_pmic_dt_parse_dvs_gpiod(struct sec_pmic_dev *iodev,
+			struct sec_platform_data *pdata)
 {
-	int i, gpio;
+	int i;
 
 	for (i = 0; i < 3; i++) {
-		gpio = of_get_named_gpio(pmic_np,
-					"s5m8767,pmic-buck-dvs-gpios", i);
-		if (!gpio_is_valid(gpio)) {
-			dev_err(iodev->dev, "invalid gpio[%d]: %d\n", i, gpio);
+		pdata->buck_dvs_gpios[i] = devm_gpiod_get_index(iodev->dev,
+					"s5m8767,pmic-buck-dvs", i, GPIOD_OUT_HIGH);
+		if (IS_ERR(pdata->buck_dvs_gpios[i]))
 			return -EINVAL;
-		}
-		pdata->buck_gpios[i] = gpio;
 	}
 	return 0;
 }
 
-static int s5m8767_pmic_dt_parse_ds_gpio(struct sec_pmic_dev *iodev,
-			struct sec_platform_data *pdata,
-			struct device_node *pmic_np)
+static int s5m8767_pmic_dt_parse_ds_gpiod(struct sec_pmic_dev *iodev,
+			struct sec_platform_data *pdata)
 {
-	int i, gpio;
+	int i;
 
 	for (i = 0; i < 3; i++) {
-		gpio = of_get_named_gpio(pmic_np,
-					"s5m8767,pmic-buck-ds-gpios", i);
-		if (!gpio_is_valid(gpio)) {
-			dev_err(iodev->dev, "invalid gpio[%d]: %d\n", i, gpio);
+		pdata->buck_ds_gpios[i] = devm_gpiod_get_index(iodev->dev,
+					"s5m8767,pmic-buck-ds", i, GPIOD_OUT_LOW);
+		if (IS_ERR(pdata->buck_ds_gpios[i]))
 			return -EINVAL;
-		}
-		pdata->buck_ds[i] = gpio;
 	}
 	return 0;
 }
@@ -635,7 +627,7 @@ static int s5m8767_pmic_dt_parse_pdata(struct platform_device *pdev,
 
 	if (pdata->buck2_gpiodvs || pdata->buck3_gpiodvs ||
 						pdata->buck4_gpiodvs) {
-		ret = s5m8767_pmic_dt_parse_dvs_gpio(iodev, pdata, pmic_np);
+		ret = s5m8767_pmic_dt_parse_dvs_gpiod(iodev, pdata);
 		if (ret)
 			return -EINVAL;
 
@@ -652,7 +644,7 @@ static int s5m8767_pmic_dt_parse_pdata(struct platform_device *pdev,
 		}
 	}
 
-	ret = s5m8767_pmic_dt_parse_ds_gpio(iodev, pdata, pmic_np);
+	ret = s5m8767_pmic_dt_parse_ds_gpiod(iodev, pdata);
 	if (ret)
 		return -EINVAL;
 
@@ -731,12 +723,12 @@ static int s5m8767_pmic_probe(struct platform_device *pdev)
 	s5m8767->buck2_gpiodvs = pdata->buck2_gpiodvs;
 	s5m8767->buck3_gpiodvs = pdata->buck3_gpiodvs;
 	s5m8767->buck4_gpiodvs = pdata->buck4_gpiodvs;
-	s5m8767->buck_gpios[0] = pdata->buck_gpios[0];
-	s5m8767->buck_gpios[1] = pdata->buck_gpios[1];
-	s5m8767->buck_gpios[2] = pdata->buck_gpios[2];
-	s5m8767->buck_ds[0] = pdata->buck_ds[0];
-	s5m8767->buck_ds[1] = pdata->buck_ds[1];
-	s5m8767->buck_ds[2] = pdata->buck_ds[2];
+	s5m8767->buck_dvs_gpios[0] = pdata->buck_dvs_gpios[0];
+	s5m8767->buck_dvs_gpios[1] = pdata->buck_dvs_gpios[1];
+	s5m8767->buck_dvs_gpios[2] = pdata->buck_dvs_gpios[2];
+	s5m8767->buck_ds_gpios[0] = pdata->buck_ds_gpios[0];
+	s5m8767->buck_ds_gpios[1] = pdata->buck_ds_gpios[1];
+	s5m8767->buck_ds_gpios[2] = pdata->buck_ds_gpios[2];
 
 	s5m8767->ramp_delay = pdata->buck_ramp_delay;
 	s5m8767->buck2_ramp = pdata->buck2_ramp_enable;
@@ -785,61 +777,6 @@ static int s5m8767_pmic_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (pdata->buck2_gpiodvs || pdata->buck3_gpiodvs ||
-						pdata->buck4_gpiodvs) {
-
-		if (!gpio_is_valid(pdata->buck_gpios[0]) ||
-			!gpio_is_valid(pdata->buck_gpios[1]) ||
-			!gpio_is_valid(pdata->buck_gpios[2])) {
-			dev_err(&pdev->dev, "GPIO NOT VALID\n");
-			return -EINVAL;
-		}
-
-		ret = devm_gpio_request(&pdev->dev, pdata->buck_gpios[0],
-					"S5M8767 SET1");
-		if (ret)
-			return ret;
-
-		ret = devm_gpio_request(&pdev->dev, pdata->buck_gpios[1],
-					"S5M8767 SET2");
-		if (ret)
-			return ret;
-
-		ret = devm_gpio_request(&pdev->dev, pdata->buck_gpios[2],
-					"S5M8767 SET3");
-		if (ret)
-			return ret;
-
-		/* SET1 GPIO */
-		gpio_direction_output(pdata->buck_gpios[0],
-				(s5m8767->buck_gpioindex >> 2) & 0x1);
-		/* SET2 GPIO */
-		gpio_direction_output(pdata->buck_gpios[1],
-				(s5m8767->buck_gpioindex >> 1) & 0x1);
-		/* SET3 GPIO */
-		gpio_direction_output(pdata->buck_gpios[2],
-				(s5m8767->buck_gpioindex >> 0) & 0x1);
-	}
-
-	ret = devm_gpio_request(&pdev->dev, pdata->buck_ds[0], "S5M8767 DS2");
-	if (ret)
-		return ret;
-
-	ret = devm_gpio_request(&pdev->dev, pdata->buck_ds[1], "S5M8767 DS3");
-	if (ret)
-		return ret;
-
-	ret = devm_gpio_request(&pdev->dev, pdata->buck_ds[2], "S5M8767 DS4");
-	if (ret)
-		return ret;
-
-	/* DS2 GPIO */
-	gpio_direction_output(pdata->buck_ds[0], 0x0);
-	/* DS3 GPIO */
-	gpio_direction_output(pdata->buck_ds[1], 0x0);
-	/* DS4 GPIO */
-	gpio_direction_output(pdata->buck_ds[2], 0x0);
-
 	regmap_update_bits(s5m8767->iodev->regmap_pmic,
 			   S5M8767_REG_BUCK2CTRL, 1 << 1,
 			   (pdata->buck2_gpiodvs) ? (1 << 1) : (0 << 1));
diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index a212b9f72bc9..cebf443c13d5 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -78,8 +78,8 @@ struct sec_platform_data {
 	struct sec_opmode_data		*opmode;
 	int				num_regulators;
 
-	int				buck_gpios[3];
-	int				buck_ds[3];
+	struct gpio_desc		*buck_dvs_gpios[3];
+	struct gpio_desc		*buck_ds_gpios[3];
 	unsigned int			buck2_voltage[8];
 	bool				buck2_gpiodvs;
 	unsigned int			buck3_voltage[8];
-- 
2.34.1

