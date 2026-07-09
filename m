Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE4E38F254
	for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Jul 2026 01:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783559445; cv=none; b=ZiMX0jNb/NAH7ymsk0bhFX+FZHY8cQf9EuO/LQ23BJaQpL6S4e7BAxNhIDiM15MxX9Y2t+LY3pjdsrOPuL7Ja86A/UWM/gQ7YoIO5kDDBkdte9R3OuQ1/QRn7BsPdLBXzqGYNUvz+Ra+2vtQyfbAbWX/nrmlLV2QstnkQVC1+q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783559445; c=relaxed/simple;
	bh=223TOTp79VOsGKtAPmgofIZTevSQt+5lcuqNLQQkNhg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W8BDkIhfFdoMC1FCODkJuqZ+j1JAAYK9gWZ+wl+FX2Ua27aYm1/sotrj60fMC/zXnNExFm9124trNRvowzLJ6VNDjWrtv6ObQRKjDv7kh/CySla39vQQyHUXn33Icr97QM9wC9fObfiAtKsZwPh1aVcmov91s8XB03+iEIvexdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XRyaOky5; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XRyaOky5"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso2800015e9.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Jul 2026 18:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783559436; x=1784164236; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V7eMQkXnTBigOm6CMpOEGhcl7xxsHMUYLRGQDej44Ls=;
        b=XRyaOky52mWMfaiZA22VkKhxr2PzIRAViUNWYwEVY/mnwj0SDBuWK4yz7gzaLdrbIK
         kZy5S4nXEiH8XTwHDGDmWwuWLHbM7jFQJPQiQB9Y49BkM1kVdp2OFoZGx0OELU3rSVjS
         w+phXSFi/whcw4gxc39J9OxcXwo5DGOsZKCh3iPcnYgXJ5KIXckNlisUayctz4QTFkT0
         mWc5PaE5D+45kTZUePG5R7VhSV5J5M3GvxPDvEE7BhluiohHkF0k1tIn1xuBQAB5Y/dU
         blMf2O9OtnG+hBTiw7Y7u0euvwczCo1XAWLBRGEABuvM8leLhbPqsqO3xbddbrKUkMer
         fRUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783559436; x=1784164236;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V7eMQkXnTBigOm6CMpOEGhcl7xxsHMUYLRGQDej44Ls=;
        b=heoZMFz7QrPNaK0C6C03sKNymxZy/dsNL1vMH7bzWkAYoNTtDowDGuSICvchO2UEGs
         zxeSAaQUy7NrxGsPtC6AXS9ZIh2D61EPFm512krQdKLsHT/tdWaLyDpL1waXDbXu7Q8y
         6n7zGTALJecyeaQjZXMQ6doxanWvngTioZ7K4jBMObANLJ7ds0n2OXmc7pr8lpmoGgLS
         BDbH/xZ1m5nISP+bpjba8xmsowolzYO5sLTL0SzvUU3g+Uqor89NkpFwVV9AhnydEP5G
         nk4XfFDYa2hgkdy/dOowEaVO3QBUP8dBRcsOpaCD5tTce20TQFNJD+GVE/FUmaDQLkSI
         cUiQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrovng1Zd+aGp+nh/tnePFQ3oZucnP269CQ9HTSryHj7vPsWR3t794zyP1gNvpQcFMMETEUo/XiiZgzvy2b2RlYQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpioFUPVFD276tEQiAjlx3V0l4G2EbZfiss2GFk5hOEwtJhUG/
	1JOmF3/xgBgwSFxhh7R/vgBsCzOC2ejhdxH3sL7mMkL4+OBVBwd4Em47JPwNh8d37/k=
X-Gm-Gg: AfdE7cl1JTnJoqXRq7xfVusVJVADucBgyvYMlMPbLgsJcpsMchAc9zyUr6YaXhundnP
	Ts0CXRUvJ0niSq90pX5O7if0iP9f9JBYKIXRvTi4iuq7HI+SXOinCODU/4NqXd3nwlnRJAcFR3q
	9DzxcHHba/yKH0F6G3ool+2CNTg18hrl3O1/9+HepXsWxh0InZ19i7lz/KWCCPsMFuRyFEHqBat
	B9WTbKHJrySfOBkOQ5Pd4LU9GzeS9PwscpA/dL439I3tFy3EvGGL8f2SGvXH2rzltJO6cwcgch9
	zjTEwQJLVTQxqfrEAfjmztXLIW/p9rjV5HznS3VEwtWAZ3fVeHBYCQciX7Fj5JFJpcqdbBRaASV
	YsBJjZ4xsZEUJZpuwCWnhpWv9YlXoR5EjYg6Zr+UG+K1+w+aivnhOi/HOzj+hi4WEv21oh5HSsN
	ynNCHmyVcCY14tQDO1+4A/gL+a7x9Vt+QZ9EdsrX+nJBGBbPI6quRgLjcMed1AhmBl0S5bUwGoa
	h06
X-Received: by 2002:a05:600c:8b6a:b0:493:b55f:bca2 with SMTP id 5b1f17b1804b1-493e88760f3mr32980535e9.34.1783559436451;
        Wed, 08 Jul 2026 18:10:36 -0700 (PDT)
Received: from [127.0.1.1] ([2.122.8.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb742d0esm18994725e9.13.2026.07.08.18.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 18:10:35 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 09 Jul 2026 02:10:28 +0100
Subject: [PATCH 2/3] thermal: samsung: acpm-tmu: refactor SoC-specific
 operations into driver data
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-acpm-tmu-e850-support-v1-2-9fdd58b634af@linaro.org>
References: <20260709-acpm-tmu-e850-support-v1-0-9fdd58b634af@linaro.org>
In-Reply-To: <20260709-acpm-tmu-e850-support-v1-0-9fdd58b634af@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Mateusz Majewski <m.majewski2@samsung.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3

The current ACPM TMU driver assumes that all TMU operations (init,
threshold updates, and interrupt clearing) are handled exclusively
via ACPM IPC commands, which is true for the GS101.

However, other Exynos platforms (like Exynos850) lack complete firmware
support for these operations and require direct MMIO register access
instead for missing ACPM TMU IPC calls.

Prepare the driver for multi-SoC support by moving the hardcoded GS101
IPC calls into SoC-specific callbacks: "tz_control", "tmu_init",
"tmu_update_thresholds" and "tmu_check_and_clear_irqs" within the
acpm_tmu_driver_data struct. Additionally, save the regmap pointer in
the private structure so that these callbacks can utilize it for other
SoCs.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/thermal/samsung/acpm-tmu.c | 112 +++++++++++++++++++++++++------------
 1 file changed, 76 insertions(+), 36 deletions(-)

diff --git a/drivers/thermal/samsung/acpm-tmu.c b/drivers/thermal/samsung/acpm-tmu.c
index f9802080acd7..b3cea9890b4b 100644
--- a/drivers/thermal/samsung/acpm-tmu.c
+++ b/drivers/thermal/samsung/acpm-tmu.c
@@ -72,6 +72,8 @@ struct acpm_tmu_sensor {
 };
 
 struct acpm_tmu_priv {
+	const struct acpm_tmu_driver_data *data;
+	struct regmap *regmap;
 	struct regmap_field *regmap_fields[REG_INTPEND_COUNT];
 	struct acpm_handle *handle;
 	struct device *dev;
@@ -84,9 +86,18 @@ struct acpm_tmu_priv {
 
 struct acpm_tmu_driver_data {
 	const struct reg_field *reg_fields;
+	const struct regmap_config *regmap_config;
 	const struct acpm_tmu_sensor_group *sensor_groups;
 	unsigned int num_sensor_groups;
 	unsigned int mbox_chan_id;
+
+	/* SoC-specific TMU routines and values */
+	int (*tz_control)(struct acpm_tmu_sensor *sensor, bool on);
+	int (*tmu_check_and_clear_irqs)(struct acpm_tmu_sensor *sensor,
+					bool *pending_irq);
+	int (*tmu_init)(struct acpm_tmu_priv *priv);
+	int (*tmu_update_thresholds)(struct acpm_tmu_sensor *sensor,
+				     u8 thresholds[2], u8 inten);
 };
 
 #define ACPM_TMU_SENSOR_GROUP(_mask, _id)		\
@@ -128,24 +139,32 @@ static const struct regmap_config gs101_regmap_config = {
 	.max_register = GS101_REG_INTPEND(15),
 };
 
-static const struct acpm_tmu_driver_data acpm_tmu_gs101 = {
-	.reg_fields = gs101_reg_fields,
-	.sensor_groups = gs101_sensor_groups,
-	.num_sensor_groups = ARRAY_SIZE(gs101_sensor_groups),
-	.mbox_chan_id = 9,
-};
+static int gs101_tz_control(struct acpm_tmu_sensor *sensor, bool on)
+{
+	struct acpm_tmu_priv *priv = sensor->priv;
+	struct acpm_handle *handle = priv->handle;
+
+	return handle->ops->tmu.tz_control(handle, priv->mbox_chan_id,
+					   sensor->group->id, on);
+}
+
+static int gs101_tmu_init(struct acpm_tmu_priv *priv)
+{
+	struct acpm_handle *handle = priv->handle;
+
+	return handle->ops->tmu.init(handle, priv->mbox_chan_id);
+}
 
 static int acpm_tmu_op_tz_control(struct acpm_tmu_sensor *sensor, bool on)
 {
 	struct acpm_tmu_priv *priv = sensor->priv;
-	struct acpm_handle *handle = priv->handle;
-	const struct acpm_tmu_ops *ops = &handle->ops->tmu;
 	int ret;
 
-	ret = ops->tz_control(handle, priv->mbox_chan_id, sensor->group->id,
-			      on);
-	if (ret)
-		return ret;
+	if (priv->data->tz_control) {
+		ret = priv->data->tz_control(sensor, on);
+		if (ret)
+			return ret;
+	}
 
 	sensor->enabled = on;
 
@@ -249,8 +268,8 @@ static int acpm_tmu_get_temp(struct thermal_zone_device *tz, int *temp)
 	return 0;
 }
 
-static int acpm_tmu_update_thresholds(struct acpm_tmu_sensor *sensor,
-				      u8 thresholds[2], u8 inten)
+static int gs101_tmu_update_thresholds(struct acpm_tmu_sensor *sensor,
+				       u8 thresholds[2], u8 inten)
 {
 	struct acpm_tmu_priv *priv = sensor->priv;
 	struct acpm_handle *handle = priv->handle;
@@ -314,7 +333,8 @@ static int acpm_tmu_set_trips(struct thermal_zone_device *tz, int low, int high)
 	if (ret)
 		return ret;
 
-	ret = acpm_tmu_update_thresholds(sensor, thresholds, inten);
+	if (priv->data->tmu_update_thresholds)
+		ret = priv->data->tmu_update_thresholds(sensor, thresholds, inten);
 
 	pm_runtime_put_autosuspend(dev);
 
@@ -326,10 +346,11 @@ static const struct thermal_zone_device_ops acpm_tmu_sensor_ops = {
 	.set_trips = acpm_tmu_set_trips,
 };
 
-static int acpm_tmu_has_pending_irq(struct acpm_tmu_sensor *sensor,
-				    bool *pending_irq)
+static int gs101_handle_irqs(struct acpm_tmu_sensor *sensor, bool *pending_irq)
 {
 	struct acpm_tmu_priv *priv = sensor->priv;
+	struct acpm_handle *handle = priv->handle;
+	const struct acpm_tmu_ops *ops = &handle->ops->tmu;
 	unsigned long mask = sensor->group->mask;
 	int i, ret;
 	u32 val;
@@ -347,14 +368,17 @@ static int acpm_tmu_has_pending_irq(struct acpm_tmu_sensor *sensor,
 		}
 	}
 
-	return 0;
+	ret = ops->clear_tz_irq(handle, priv->mbox_chan_id, sensor->group->id);
+	if (ret)
+		dev_err(priv->dev, "Sensor %d: failed to clear IRQ (%d)\n",
+			i, ret);
+
+	return ret;
 }
 
 static irqreturn_t acpm_tmu_thread_fn(int irq, void *id)
 {
 	struct acpm_tmu_priv *priv = id;
-	struct acpm_handle *handle = priv->handle;
-	const struct acpm_tmu_ops *ops = &handle->ops->tmu;
 	struct device *dev = priv->dev;
 	bool handled = false;
 	int i, ret;
@@ -372,20 +396,12 @@ static irqreturn_t acpm_tmu_thread_fn(int irq, void *id)
 		if (!sensor->tzd)
 			continue;
 
-		ret = acpm_tmu_has_pending_irq(sensor, &pending_irq);
+		ret = priv->data->tmu_check_and_clear_irqs(sensor, &pending_irq);
 		if (ret || !pending_irq)
 			continue;
 
 		handled = true;
 
-		scoped_guard(mutex, &sensor->lock) {
-			ret = ops->clear_tz_irq(handle, priv->mbox_chan_id,
-						sensor->group->id);
-			if (ret)
-				dev_err(priv->dev, "Sensor %d: failed to clear IRQ (%d)\n",
-					i, ret);
-		}
-
 		thermal_zone_device_update(sensor->tzd,
 					   THERMAL_EVENT_UNSPECIFIED);
 	}
@@ -395,15 +411,30 @@ static irqreturn_t acpm_tmu_thread_fn(int irq, void *id)
 	return handled ? IRQ_HANDLED : IRQ_NONE;
 }
 
+static const struct acpm_tmu_driver_data acpm_tmu_gs101 = {
+	.reg_fields = gs101_reg_fields,
+	.regmap_config = &gs101_regmap_config,
+	.sensor_groups = gs101_sensor_groups,
+	.num_sensor_groups = ARRAY_SIZE(gs101_sensor_groups),
+	.mbox_chan_id = 9,
+	.tz_control = gs101_tz_control,
+	.tmu_check_and_clear_irqs = gs101_handle_irqs,
+	.tmu_init = gs101_tmu_init,
+	.tmu_update_thresholds = gs101_tmu_update_thresholds,
+};
+
 static const struct of_device_id acpm_tmu_match[] = {
-	{ .compatible = "google,gs101-tmu-top" },
+	{
+		.compatible = "google,gs101-tmu-top",
+		.data = &acpm_tmu_gs101
+	},
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, acpm_tmu_match);
 
 static int acpm_tmu_probe(struct platform_device *pdev)
 {
-	const struct acpm_tmu_driver_data *data = &acpm_tmu_gs101;
+	const struct acpm_tmu_driver_data *data;
 	struct acpm_handle *acpm_handle;
 	struct device *dev = &pdev->dev;
 	struct acpm_tmu_priv *priv;
@@ -411,6 +442,10 @@ static int acpm_tmu_probe(struct platform_device *pdev)
 	void __iomem *base;
 	int i, ret;
 
+	data = of_device_get_match_data(dev);
+	if (!data)
+		return dev_err_probe(dev, -ENODEV, "No matching driver data found\n");
+
 	acpm_handle = devm_acpm_get_by_phandle(dev);
 	if (IS_ERR(acpm_handle))
 		return dev_err_probe(dev, PTR_ERR(acpm_handle),
@@ -422,6 +457,7 @@ static int acpm_tmu_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
+	priv->data = data;
 	priv->dev = dev;
 	priv->handle = acpm_handle;
 	priv->mbox_chan_id = data->mbox_chan_id;
@@ -433,10 +469,12 @@ static int acpm_tmu_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return dev_err_probe(dev, PTR_ERR(base), "Failed to ioremap resource\n");
 
-	regmap = devm_regmap_init_mmio(dev, base, &gs101_regmap_config);
+	regmap = devm_regmap_init_mmio(dev, base, data->regmap_config);
 	if (IS_ERR(regmap))
 		return dev_err_probe(dev, PTR_ERR(regmap), "Failed to init regmap\n");
 
+	priv->regmap = regmap;
+
 	ret = devm_regmap_field_bulk_alloc(dev, regmap, priv->regmap_fields,
 					   data->reg_fields, REG_INTPEND_COUNT);
 	if (ret)
@@ -463,10 +501,12 @@ static int acpm_tmu_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "Failed to resume device\n");
 
-	ret = acpm_handle->ops->tmu.init(acpm_handle, priv->mbox_chan_id);
-	if (ret) {
-		ret = dev_err_probe(dev, ret, "Failed to init TMU\n");
-		goto err_pm_put;
+	if (priv->data->tmu_init) {
+		ret = priv->data->tmu_init(priv);
+		if (ret) {
+			ret = dev_err_probe(dev, ret, "Failed to init TMU\n");
+			goto err_pm_put;
+		}
 	}
 
 	for (i = 0; i < priv->num_sensors; i++) {

-- 
2.51.0

