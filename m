Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030493;
	b=yZKMbbDDz/Cfi73MlJCFf44BV6UhbSntNdSRu7mQoD1/K4rgOMzbDvBfSlNkHqS6t/+3
	 KyT/ln3vbagPttMup/yvKIC0jpEOUFe2u3WggCjtbadJ+ybI8Mpi+QMLDBSI0Ym9ZIkxf
	 5Q+/6s8UDH0dmG3Hn3xzNZqA35hjOjaxH/fIlMtz2WhTiESIAN7AwI+K1GsWJIExsqtf2
	 aU3eM1n/OZ9wAsU10KT/5uxD22QtfJpXGGdvOsWooEhVZOh6/kjXNAM3eTedv0KOzho1f
	 B0CDfs8n2m7qb+yZ9hKJe1ZqBQNui58XopNuDcKSXUYU5pW8GD5ReMe/NswGkb3XQEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=c6EuVLjw7aLVrQNqvXTXfqYTtqWjy0bjr6R8GsvXIw8=;
	b=HW45Z7+l2qbw4+AosD75dtbNqet/z5Bi5ZIszp0Bc6qfl+ccJxZzHhfa1J2dhyWZOstk
	 06HOegLTncV6uVR6pkuS7UaoGqKlY3lQWPoPdLPmtNzWDMYXw7Fa1q85nTOMep3SJ8bF8
	 jiLODe93f8MJeec22OM+VpxrVSviDU9htHKbl21chxNmetJRsZfa3HmtpU4AbsjYi9O3X
	 ty10HjVkTIQ6GI5YD5dFzHFJ5FQ7wiDu8QXix6QFMCrjFIAXkaUQizuUCy/SoGuMGhSHJ
	 rP45UApKOO8MxKD84gjZlyP6N7d0xsnAAg15f5ZKKcgsJ4bCjZ38qWni+jK8CTX9rlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="rciUpn1/";
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4E3606A32C
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 16:01:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D4E3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rciUpn1/
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4301e334ceso195618566b.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 09:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793030488; x=1793635288; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c6EuVLjw7aLVrQNqvXTXfqYTtqWjy0bjr6R8GsvXIw8=;
        b=rciUpn1/7Xo7G9njTEVek3Qj3kMcASnP7qFcKPmeSxqzy/u724P5SfiWmOoE6gXvXJ
         3BYGmxxpueNy0gfq0m4mlwwg6BYEc2DwpROrJEHUwsryDzaS+XZ/X5y4Y7B+sL1+3GBg
         dqdpX7AC3YFaR8SeknL/u3NAxnLmubfKP9QYAYnPZWb7qBwZEmzr5PdLdXkTl7Z7crHb
         4Vq6dgXtHl7fgXOITxf57vUaTUtn4BAl+y4AJ4uyIq5SzXNu5L+GlDi4flUQkOr7QQSB
         XLWo97cL+JBSUfx6chs8W3XsrBqH8j0c7gdR7iNE/LZuVJJ43I94IdxrbDMJudh03FZc
         84vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030488; x=1793635288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c6EuVLjw7aLVrQNqvXTXfqYTtqWjy0bjr6R8GsvXIw8=;
        b=q0Yjw81ood3lhP3xAUjfPNWHKrCF+czscVTT+VGp9+NCTE4jKVZw5w4vD/gi3F7j0C
         mTdlmwdtl9vFetY8AhFJSAwUM74vqkom9RcpiVElm1U/8oLgFrdAnDL7GSnRpo6CnA5y
         6ZuRhrS57uJzNvwXb/XB8iAQuU5PQnNlH/dGgKiQ8Yy+Aym7ZgbqQzv4NhT8Oz6j2LUY
         W87HrQvl5p+t2r67e/j4f5yOKAaMuK0sgkQwL14kEAG2HkdeIGbsu9EExXuV4evjEjXw
         G40Iv9PQXtCyZKZCglCZTxoryrRLoe0i6Ql1keHUNzfInblI6FbHFV+IwlIS7fysMa5o
         rlmg==
X-Forwarded-Encrypted: i=1; AKwUvBzUlgEepfCHwmGX5X7ecahTRlwAFzyxUaX2sDR3d5gkZyM/6QAvndrRKo7YRlOzoy6mX4TpnWONgSesQF/c5KeGQA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKJXefvGZrO8yRJknqKvvOqrF9p0gHjvnu+c5bTaQPLWW2F82F1
	WY0eJjb/buSi3GmiFGahGm5i08K68wtmbQpSYXrgqMCQlXCfSQG0EjW6b5IykprC5+0=
X-Gm-Gg: AYBFou1c93gbBFolKwyzgt2s3W99KkAky5c2QyFEJe3QUAo8LSfIjliKxgWyV+IPWtF
	sl7InFOqbTPhsQCHaVYdRX14gzDEqyfvUt4/ikciQMxvXLkN0dMlQog20MzNO/JTk+bZFDN29H0
	a3F0OWKOT+UdW7lgN+JzgLQ8Wdx4JlpOhQhSMZrp7bDvQL3bNYu+LlQNDq9vyjDyjQQHUXER+i3
	YFubMnwemd6qBomsWfWBiUyR0qdjINE34zs7BIO1xx8NZCJKUZDqYQBvkTX1T8WOTM3YDctFiqt
	GWDhEwmD9GTDybHQXPZU9eYYILHhCEehHke81qs6e+MY4CSMUL+M3UTRS7Xa6PqnacXh6toAUdW
	5bPAM8n9SesteeM0aD9PvAep+XsVQrjQFnL5ZI8UgaiLaHnXrdhZkUvhVrDZbw0xuI2O0Pzvuc+
	mr2Bi5hqsbaunztABzyr6JjoG15kBpjlJWscs0IE4Xa/dAYL67lyMUJ8hAv50ShgYUBNQSZDJHb
	8XIh2vBPB4n576Dek9TzbnKS2MRYjIS2LSQYXQXQQ8d4mVuWGO5f0C3xbBWB1jPsnrFiOOMc2lF
	ddbmAQUDES19XN3+7KZHphJz/SRaUDMsaxbk
X-Received: by 2002:a17:907:6088:b0:c46:9ca9:f524 with SMTP id a640c23a62f3a-c46bde7a7fbmr786701066b.32.1793030487883;
        Mon, 26 Oct 2026 09:01:27 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a530f520sm17307466b.23.2026.10.26.09.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:01:27 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 26 Oct 2026 16:01:22 +0000
Subject: [PATCH 05/15] thermal/drivers/samsung: acpm-tmu: Implement
 .change_mode() callback
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-acpm-tmu-fixes-v1-5-0637431b7268@linaro.org>
References: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
In-Reply-To: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
To: Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Juan Yescas <jyescas@google.com>, linux-pm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793030483; l=5675;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=w2ecfEB/xX3PndCX8EcUnYllde5x9JugkBdWgmk2zsc=;
 b=eRDnPhWbxd6q7jd4dlxppZcodrM59EH+3xuhEo1aKtKeDKGb6bDzFcr34WgVTeS3FyUuFlVDG
 Ahojv5tTVdQBKBQvdN+e1CXDzcZrHo/4kEqzUqSXDjfuBD2436BRJbC
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Because acpm-tmu did not implement the .change_mode() callback and
instead enabled the hardware sensor manually after registration, the
hardware sensor state was out of sync with the thermal core:

1. Disabling a thermal zone (e.g. via /sys/class/thermal/thermal_zone*/mode
   or thermal_of_zone_unregister()) only set tz->mode to
   THERMAL_DEVICE_DISABLED and stopped software polling, while leaving
   sensor->enabled true and the ACPM TMU sensor active in hardware.
   Consequently, crossing a trip threshold still fired the hardware IRQ
   and ran acpm_tmu_thread_fn(), where thermal_zone_device_update()
   returned early without updating the trip window. Direct sysfs and
   hwmon temperature reads via thermal_zone_get_temp() also continued to
   resume the device and query ACPM over IPC on a disabled zone.
2. System suspend/resume paths in acpm_tmu_control() unconditionally
   toggled all registered sensors without checking the thermal zone mode
   or current hardware state. As a result, acpm_tmu_suspend() issued
   redundant disable IPC calls for already-disabled zones,
   acpm_tmu_resume() unconditionally re-enabled zones that had been
   disabled via sysfs prior to suspend, and suspend error recovery sent
   redundant enable IPC calls to sensors that had not yet been disabled.
3. devm_thermal_of_zone_register() enables the zone and triggers an
   initial thermal_zone_device_update() before returning. Because
   sensor->enabled was still false during registration, the initial
   acpm_tmu_get_temp() call failed with -EAGAIN and scheduled a retry,
   requiring a manual sensor enable and a second
   thermal_zone_device_update() call in acpm_tmu_probe().

Implement the .change_mode() callback to manage sensor hardware state
transitions directly through the thermal core and record the requested
zone mode in sensor->mode. Update acpm_tmu_control() to only toggle
sensors whose zone mode is THERMAL_DEVICE_ENABLED and whose
sensor->enabled state differs from the target state. Drop the redundant
manual sensor enablement and thermal_zone_device_update() call from
acpm_tmu_probe().

Fixes: 50a2c5d4062a ("thermal/drivers/samsung: Add Exynos ACPM TMU driver GS101")
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/thermal/samsung/acpm-tmu.c | 59 ++++++++++++++++++++++++++------------
 1 file changed, 40 insertions(+), 19 deletions(-)

diff --git a/drivers/thermal/samsung/acpm-tmu.c b/drivers/thermal/samsung/acpm-tmu.c
index 55ee97218f47..69793fce3bf1 100644
--- a/drivers/thermal/samsung/acpm-tmu.c
+++ b/drivers/thermal/samsung/acpm-tmu.c
@@ -68,6 +68,7 @@ struct acpm_tmu_sensor {
 	struct thermal_zone_device *tzd;
 	struct acpm_tmu_priv *priv;
 	struct mutex lock; /* protects sensor state */
+	enum thermal_device_mode mode;
 	bool enabled;
 };
 
@@ -188,9 +189,12 @@ static int acpm_tmu_control(struct acpm_tmu_priv *priv, bool on)
 		if (!sensor->tzd)
 			continue;
 
-		mutex_lock(&sensor->lock);
-		ret = acpm_tmu_op_tz_control(sensor, on);
-		mutex_unlock(&sensor->lock);
+		scoped_guard(mutex, &sensor->lock) {
+			ret = 0;
+			if (sensor->mode == THERMAL_DEVICE_ENABLED &&
+			    sensor->enabled != on)
+				ret = acpm_tmu_op_tz_control(sensor, on);
+		}
 		if (ret && !err)
 			err = ret;
 	}
@@ -313,7 +317,34 @@ static int acpm_tmu_set_trips(struct thermal_zone_device *tz, int low, int high)
 	return ret;
 }
 
+static int acpm_tmu_change_mode(struct thermal_zone_device *tz,
+				enum thermal_device_mode mode)
+{
+	struct acpm_tmu_sensor *sensor = thermal_zone_device_priv(tz);
+	struct acpm_tmu_priv *priv = sensor->priv;
+	struct device *dev = priv->dev;
+	bool enable = (mode == THERMAL_DEVICE_ENABLED);
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return ret;
+
+	scoped_guard(mutex, &sensor->lock) {
+		ret = 0;
+		if (sensor->enabled != enable)
+			ret = acpm_tmu_op_tz_control(sensor, enable);
+		if (!ret)
+			sensor->mode = mode;
+	}
+
+	pm_runtime_put_autosuspend(dev);
+
+	return ret;
+}
+
 static const struct thermal_zone_device_ops acpm_tmu_sensor_ops = {
+	.change_mode = acpm_tmu_change_mode,
 	.get_temp = acpm_tmu_get_temp,
 	.set_trips = acpm_tmu_set_trips,
 };
@@ -463,17 +494,17 @@ static int acpm_tmu_probe(struct platform_device *pdev)
 
 	for (i = 0; i < priv->num_sensors; i++) {
 		struct acpm_tmu_sensor *sensor = &priv->sensors[i];
+		struct thermal_zone_device *tzd;
 
 		mutex_init(&sensor->lock);
 		sensor->group = &data->sensor_groups[i];
 		sensor->priv = priv;
 
-		sensor->tzd = devm_thermal_of_zone_register(dev, i, sensor,
-							    &acpm_tmu_sensor_ops);
-		if (IS_ERR(sensor->tzd)) {
-			ret = PTR_ERR(sensor->tzd);
+		tzd = devm_thermal_of_zone_register(dev, i, sensor,
+						    &acpm_tmu_sensor_ops);
+		if (IS_ERR(tzd)) {
+			ret = PTR_ERR(tzd);
 			if (ret == -ENODEV) {
-				sensor->tzd = NULL;
 				dev_dbg(dev, "Sensor %d not used in DT, skipping\n", i);
 				continue;
 			}
@@ -481,17 +512,7 @@ static int acpm_tmu_probe(struct platform_device *pdev)
 			ret = dev_err_probe(dev, ret, "Failed to register sensor %d\n", i);
 			goto err_rollback;
 		}
-
-		mutex_lock(&sensor->lock);
-		ret = acpm_tmu_op_tz_control(sensor, true);
-		mutex_unlock(&sensor->lock);
-		if (ret) {
-			ret = dev_err_probe(dev, ret, "Failed to enable sensor %d\n", i);
-			goto err_rollback;
-		}
-
-		thermal_zone_device_update(sensor->tzd,
-					   THERMAL_EVENT_UNSPECIFIED);
+		sensor->tzd = tzd;
 
 		ret = devm_thermal_add_hwmon_sysfs(dev, sensor->tzd);
 		if (ret)

-- 
2.56.0.257.gf7497c7d27-goog

