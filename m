Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7736730DD18
	for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Feb 2026 18:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771093222; cv=none; b=VCiIfLr1pj5yMhuZBUOlFa5HiUgI1mq3mcYG4ZrYGaJ9eNzzYduosb33XYpB7vC/9zG6W3TS2FxlrtTQQ8T/n74RwQmpik4F8hlm3qrVtckDFxkuYvHo0981bKMVO0pqmEf2iiETjTOK8HA8YBbSA9wP/jOTZBhcqifcXPNxLa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771093222; c=relaxed/simple;
	bh=rTYZwxYsUPF4sW5jMjmBsDvupBECmHmLTxzqxDFbFtE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XSaP/Kao/eMWkdUCWyK6955iOK+ISzRGC8680mSQrP8B1XbBtBEoTx13kS+8nXEY06+9j3aaChWzWaRoSR0Zl4J507D4zMYU3ozO9iZ+NNj6Qv1gVnclON88qKTgqj9AIfp103K+zXousG+/mVEebYKx66YqhJ8vn++kRzM10Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SwouEPes; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SwouEPes"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2aad1dc8856so13219495ad.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Feb 2026 10:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771093220; x=1771698020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gWfAd2vRItsyvlMWLwVt3tRxsgBndMGSKZF8F0wbFvI=;
        b=SwouEPes9Ke7hTDRJkMZJICvSVsiEWG/1rXZx8pOTduPdh5dmcBk0eeVmhjWvsxZjs
         PaCauFXnjG1rwWU3/Z4cyZEXHo4jPuTMGIacPuJ83tY6bCgVOSfkplplKeDNPp+F347y
         QV92q2HhYtfFjbLIkrYrTlrEp78tjsq4INPupY4TqSCg3z3XB9/OcSi23vrQ2jfYWEJi
         /fEKdoJ/Jn2uOXI2RoQIxsGWpIKwLhSAQ/i0NiW8OZfrPItfK+d34GZXz7wPI9oE+HS4
         TpERrp3f27XVv5EKnd3so54wj483V+L1nfRFTf7HIMDjzJENi1NUy1HE3gse0zHSroWF
         FttQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771093220; x=1771698020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gWfAd2vRItsyvlMWLwVt3tRxsgBndMGSKZF8F0wbFvI=;
        b=X1wGC3YgqFkZcfKsDtgJQRW0p8jCaRXVxrZNKCd2ai32sw3Mf1QcQe00o32yb4xAa9
         rR1d7qJ5UOCqc6BqWhtc+p1e2AF/vq4OzKYT83xSLr0j1dCH3HcMcaxRSL8Gg7J1c/Ag
         xwJdyJVLxZDVitMxPKpzSYfUBy0ZdemLeQIGaJ6a/GPVO3RgqlA3azORXCxTmLtZFIOZ
         8YhP7cL7nyRmY/6vp1gI67CGkYOpeuLqJHTJ8YbDYeyvq8MpdUqAri6FU7kezUfazbQA
         jG+WkonwiJ7qVRm3X3ujfBH4kZME1EJSdwm9TD4bygJEw6svx5VqtbC5jy67gepvSRWh
         HMtg==
X-Forwarded-Encrypted: i=1; AJvYcCWfX6eZzySHztEX9Wle4NWghjyLVyfjlEs03N1rs5LgoN9u63JKS575urShLGsP/xWPv27Emj9bH4IfHEkO1nfUqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdDtz1mBGgiYVah9zXfDfjZr4tupwg04He39hFMqSpSwe2Aso3
	2MYRUpVYYW/MKXju6xFpD2FOon27FoW31tN9MA9BUMR/MZtIUNO4+0rb
X-Gm-Gg: AZuq6aIh0+oaHcCKaWJyMZ7n8o1Dd5ehdqfAoPP730yuRA6CwU+T45fPCEHh5jK+T1v
	avf3Ki+vLfyjfpOpjQtTXsJloUU7A3tvfQ0T/0JywxYA/bHuKdxOV5p47gO9er2+V4HNOX8aTjh
	JVXY01666dK6NOg0mSh6uu+WXDbnSGAsrH0atQPUxFRy8ajtGGtvi9IkSReQwzPMPw+3orpb9Ul
	zhKjy5Mdzm+fftXaxJddi9MQEhPQpE1lMwT/B5BQzNQQZvjzNz5Uv0Ftgv/tibxe/r/Y6Yj7JSL
	bk5XzH6/yl6S94Megd0RRsAWmL2VVi/13sdNHfD3zPnL+94EEYi20/iqLz9QuHjiywo7tJtZeeT
	OIKPagxfYBrIwVvoOVWrf6qPrbq92AltukXYCv6Ojajp+3mefPgx22SVrUhDGLMEZedYc7UMGvI
	hZzzIssqG1jeTarRXjZY4=
X-Received: by 2002:a17:902:e5c8:b0:2aa:d647:c312 with SMTP id d9443c01a7336-2ad175c5952mr37771925ad.61.1771093219726;
        Sat, 14 Feb 2026 10:20:19 -0800 (PST)
Received: from rockpi-5b ([45.112.0.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a9d5e06sm28406615ad.50.2026.02.14.10.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 10:20:18 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-pm@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v8 6/9] thermal/drivers/exynos: Refactor SoC-specific configuration to new exynos_tmu_soc_config structure
Date: Sat, 14 Feb 2026 23:49:03 +0530
Message-ID: <20260214181930.238981-7-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260214181930.238981-1-linux.amoon@gmail.com>
References: <20260214181930.238981-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move SoC-specific parameters and function pointers from exynos_tmu_data
to a new exynos_tmu_soc_config structure.

Instead of manually assigning values in exynos_map_dt_data() using a
switch-case block, define static configuration structures for each
supported SoC and retrieve them via of_device_get_match_data().

This refactoring:
  - Reduces the complexity of the mapping function.
  - Makes the driver more extensible for future SoCs.
  - Cleanly separates static hardware descriptions from runtime state.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v8: New patch, With this refactoring of SoC callbacks it will simpilfy
    for new SoC to be integrated.
---
 drivers/thermal/samsung/exynos_tmu.c | 358 +++++++++++++++------------
 1 file changed, 199 insertions(+), 159 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 146f29fadea9..f77abdcdc62b 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -139,23 +139,43 @@ enum soc_type {
  * struct exynos_tmu_data : A structure to hold the private data of the TMU
  *			    driver
  * @base: base address of the single instance of the TMU controller.
+ * @soc_config: pointer to SoC-specific TMU configuration data.
  * @irq: irq number of the TMU controller.
- * @soc: id of the SOC type.
  * @lock: lock to implement synchronization.
  * @clk: pointer to the clock structure.
  * @clk_sec: pointer to the clock structure for accessing the gpu clk.
  * @sclk: pointer to the clock structure for accessing the tmu special clk.
  * @cal_type: calibration type for temperature
- * @efuse_value: SoC defined fuse value
- * @min_efuse_value: minimum valid trimming data
- * @max_efuse_value: maximum valid trimming data
  * @temp_error1: fused value of the first point trim.
  * @temp_error2: fused value of the second point trim.
+ * @enabled: current status of TMU device
+ */
+
+struct exynos_tmu_data {
+	void __iomem *base;
+	const struct exynos_tmu_soc_config *soc_config;
+	int irq;
+	/* protects access to TMU registers and shared state */
+	struct mutex lock;
+	struct clk *clk, *clk_sec, *sclk;
+	u32 cal_type;
+	u16 temp_error1, temp_error2;
+	struct thermal_zone_device *tzd;
+	bool enabled;
+};
+
+/**
+ * struct exynos_tmu_soc_config : Structure to hold SOC-specific TMU
+ *			configuration data.
+ * @soc: id of the SOC type.
  * @gain: gain of amplifier in the positive-TC generator block
  *	0 < gain <= 15
  * @reference_voltage: reference voltage of amplifier
  *	in the positive-TC generator block
  *	0 < reference_voltage <= 31
+ * @efuse_value: SoC defined fuse value
+ * @min_efuse_value: minimum valid trimming data
+ * @max_efuse_value: maximum valid trimming data
  * @tzd: pointer to thermal_zone_device structure
  * @enabled: current status of TMU device
  * @tmu_set_low_temp: SoC specific method to set trip (falling threshold)
@@ -168,23 +188,16 @@ enum soc_type {
  * @tmu_read: SoC specific TMU temperature read method
  * @tmu_set_emulation: SoC specific TMU emulation setting method
  * @tmu_clear_irqs: SoC specific TMU interrupts clearing method
+ * @tmu_ops: pointer to thermal_zone_device structure
  */
-struct exynos_tmu_data {
-	void __iomem *base;
-	int irq;
+
+struct exynos_tmu_soc_config {
 	enum soc_type soc;
-	struct mutex lock;
-	struct clk *clk, *clk_sec, *sclk;
-	u32 cal_type;
+	u8 gain;
+	u8 reference_voltage;
 	u32 efuse_value;
 	u32 min_efuse_value;
 	u32 max_efuse_value;
-	u16 temp_error1, temp_error2;
-	u8 gain;
-	u8 reference_voltage;
-	struct thermal_zone_device *tzd;
-	bool enabled;
-
 	void (*tmu_set_low_temp)(struct exynos_tmu_data *data, u8 temp);
 	void (*tmu_set_high_temp)(struct exynos_tmu_data *data, u8 temp);
 	void (*tmu_set_crit_temp)(struct exynos_tmu_data *data, u8 temp);
@@ -195,6 +208,7 @@ struct exynos_tmu_data {
 	int (*tmu_read)(struct exynos_tmu_data *data);
 	void (*tmu_set_emulation)(struct exynos_tmu_data *data, int temp);
 	void (*tmu_clear_irqs)(struct exynos_tmu_data *data);
+	const struct thermal_zone_device_ops *tmu_ops;
 };
 
 /*
@@ -230,7 +244,7 @@ static int code_to_temp(struct exynos_tmu_data *data, u16 temp_code)
 static void sanitize_temp_error(struct exynos_tmu_data *data, u32 trim_info)
 {
 	u16 tmu_temp_mask =
-		(data->soc == SOC_ARCH_EXYNOS7) ? EXYNOS7_TMU_TEMP_MASK
+		(data->soc_config->soc == SOC_ARCH_EXYNOS7) ? EXYNOS7_TMU_TEMP_MASK
 						: EXYNOS_TMU_TEMP_MASK;
 
 	data->temp_error1 = trim_info & tmu_temp_mask;
@@ -238,13 +252,13 @@ static void sanitize_temp_error(struct exynos_tmu_data *data, u32 trim_info)
 				EXYNOS_TMU_TEMP_MASK);
 
 	if (!data->temp_error1 ||
-	    (data->min_efuse_value > data->temp_error1) ||
-	    (data->temp_error1 > data->max_efuse_value))
-		data->temp_error1 = data->efuse_value & EXYNOS_TMU_TEMP_MASK;
+	    (data->soc_config->min_efuse_value > data->temp_error1) ||
+	    (data->temp_error1 > data->soc_config->max_efuse_value))
+		data->temp_error1 = data->soc_config->efuse_value & EXYNOS_TMU_TEMP_MASK;
 
 	if (!data->temp_error2)
 		data->temp_error2 =
-			(data->efuse_value >> EXYNOS_TRIMINFO_85_SHIFT) &
+			(data->soc_config->efuse_value >> EXYNOS_TRIMINFO_85_SHIFT) &
 			EXYNOS_TMU_TEMP_MASK;
 }
 
@@ -262,8 +276,8 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
 	if (!status) {
 		ret = -EBUSY;
 	} else {
-		data->tmu_initialize(pdev);
-		data->tmu_clear_irqs(data);
+		data->soc_config->tmu_initialize(pdev);
+		data->soc_config->tmu_clear_irqs(data);
 	}
 
 	clk_disable(data->clk_sec);
@@ -282,7 +296,7 @@ static int exynos_thermal_zone_configure(struct platform_device *pdev)
 	ret = thermal_zone_get_crit_temp(tzd, &temp);
 	if (ret) {
 		/* FIXME: Remove this special case */
-		if (data->soc == SOC_ARCH_EXYNOS5433)
+		if (data->soc_config->soc == SOC_ARCH_EXYNOS5433)
 			return 0;
 
 		dev_err(&pdev->dev,
@@ -293,7 +307,7 @@ static int exynos_thermal_zone_configure(struct platform_device *pdev)
 	mutex_lock(&data->lock);
 	clk_enable(data->clk);
 
-	data->tmu_set_crit_temp(data, temp / MCELSIUS);
+	data->soc_config->tmu_set_crit_temp(data, temp / MCELSIUS);
 
 	clk_disable(data->clk);
 	mutex_unlock(&data->lock);
@@ -303,15 +317,15 @@ static int exynos_thermal_zone_configure(struct platform_device *pdev)
 
 static u32 get_con_reg(struct exynos_tmu_data *data, u32 con)
 {
-	if (data->soc == SOC_ARCH_EXYNOS4412 ||
-	    data->soc == SOC_ARCH_EXYNOS3250)
+	if (data->soc_config->soc == SOC_ARCH_EXYNOS4412 ||
+	    data->soc_config->soc == SOC_ARCH_EXYNOS3250)
 		con |= (EXYNOS4412_MUX_ADDR_VALUE << EXYNOS4412_MUX_ADDR_SHIFT);
 
 	con &= ~(EXYNOS_TMU_REF_VOLTAGE_MASK << EXYNOS_TMU_REF_VOLTAGE_SHIFT);
-	con |= data->reference_voltage << EXYNOS_TMU_REF_VOLTAGE_SHIFT;
+	con |= data->soc_config->reference_voltage << EXYNOS_TMU_REF_VOLTAGE_SHIFT;
 
 	con &= ~(EXYNOS_TMU_BUF_SLOPE_SEL_MASK << EXYNOS_TMU_BUF_SLOPE_SEL_SHIFT);
-	con |= (data->gain << EXYNOS_TMU_BUF_SLOPE_SEL_SHIFT);
+	con |= (data->soc_config->gain << EXYNOS_TMU_BUF_SLOPE_SEL_SHIFT);
 
 	con &= ~(EXYNOS_TMU_TRIP_MODE_MASK << EXYNOS_TMU_TRIP_MODE_SHIFT);
 	con |= (EXYNOS_NOISE_CANCEL_MODE << EXYNOS_TMU_TRIP_MODE_SHIFT);
@@ -325,7 +339,7 @@ static void exynos_tmu_control(struct platform_device *pdev, bool on)
 
 	mutex_lock(&data->lock);
 	clk_enable(data->clk);
-	data->tmu_control(pdev, on);
+	data->soc_config->tmu_control(pdev, on);
 	data->enabled = on;
 	clk_disable(data->clk);
 	mutex_unlock(&data->lock);
@@ -351,7 +365,7 @@ static void exynos_tmu_update_temp(struct exynos_tmu_data *data, int reg_off,
 	u32 th;
 
 	tmu_temp_mask =
-		(data->soc == SOC_ARCH_EXYNOS7) ? EXYNOS7_TMU_TEMP_MASK
+		(data->soc_config->soc == SOC_ARCH_EXYNOS7) ? EXYNOS7_TMU_TEMP_MASK
 						: EXYNOS_TMU_TEMP_MASK;
 
 	th = readl(data->base + reg_off);
@@ -442,7 +456,7 @@ static void exynos4412_tmu_initialize(struct platform_device *pdev)
 	struct exynos_tmu_data *data = platform_get_drvdata(pdev);
 	unsigned int trim_info, ctrl;
 
-	if (data->soc == SOC_ARCH_EXYNOS3250) {
+	if (data->soc_config->soc == SOC_ARCH_EXYNOS3250) {
 		ctrl = readl(data->base + EXYNOS_TMU_TRIMINFO_CON1);
 		ctrl |= EXYNOS_TRIMINFO_RELOAD_ENABLE;
 		writel(ctrl, data->base + EXYNOS_TMU_TRIMINFO_CON1);
@@ -627,7 +641,7 @@ static int exynos_get_temp(struct thermal_zone_device *tz, int *temp)
 	struct exynos_tmu_data *data = thermal_zone_device_priv(tz);
 	int value, ret = 0;
 
-	if (!data || !data->tmu_read)
+	if (!data || !data->soc_config || !data->soc_config->tmu_read)
 		return -EINVAL;
 	else if (!data->enabled)
 		/*
@@ -639,7 +653,7 @@ static int exynos_get_temp(struct thermal_zone_device *tz, int *temp)
 	mutex_lock(&data->lock);
 	clk_enable(data->clk);
 
-	value = data->tmu_read(data);
+	value = data->soc_config->tmu_read(data);
 	if (value < 0)
 		ret = value;
 	else
@@ -660,7 +674,7 @@ static u32 get_emul_con_reg(struct exynos_tmu_data *data, unsigned int val,
 
 		val &= ~(EXYNOS_EMUL_TIME_MASK << EXYNOS_EMUL_TIME_SHIFT);
 		val |= (EXYNOS_EMUL_TIME << EXYNOS_EMUL_TIME_SHIFT);
-		if (data->soc == SOC_ARCH_EXYNOS7) {
+		if (data->soc_config->soc == SOC_ARCH_EXYNOS7) {
 			val &= ~(EXYNOS7_EMUL_DATA_MASK <<
 				EXYNOS7_EMUL_DATA_SHIFT);
 			val |= (temp_to_code(data, temp) <<
@@ -686,11 +700,11 @@ static void exynos4412_tmu_set_emulation(struct exynos_tmu_data *data,
 	unsigned int val;
 	u32 emul_con;
 
-	if (data->soc == SOC_ARCH_EXYNOS5260)
+	if (data->soc_config->soc == SOC_ARCH_EXYNOS5260)
 		emul_con = EXYNOS5260_EMUL_CON;
-	else if (data->soc == SOC_ARCH_EXYNOS5433)
+	else if (data->soc_config->soc == SOC_ARCH_EXYNOS5433)
 		emul_con = EXYNOS5433_TMU_EMUL_CON;
-	else if (data->soc == SOC_ARCH_EXYNOS7)
+	else if (data->soc_config->soc == SOC_ARCH_EXYNOS7)
 		emul_con = EXYNOS7_TMU_REG_EMUL_CON;
 	else
 		emul_con = EXYNOS_EMUL_CON;
@@ -705,7 +719,7 @@ static int exynos_tmu_set_emulation(struct thermal_zone_device *tz, int temp)
 	struct exynos_tmu_data *data = thermal_zone_device_priv(tz);
 	int ret = -EINVAL;
 
-	if (data->soc == SOC_ARCH_EXYNOS4210)
+	if (data->soc_config->soc == SOC_ARCH_EXYNOS4210)
 		goto out;
 
 	if (temp && temp < MCELSIUS)
@@ -713,7 +727,7 @@ static int exynos_tmu_set_emulation(struct thermal_zone_device *tz, int temp)
 
 	mutex_lock(&data->lock);
 	clk_enable(data->clk);
-	data->tmu_set_emulation(data, temp);
+	data->soc_config->tmu_set_emulation(data, temp);
 	clk_disable(data->clk);
 	mutex_unlock(&data->lock);
 	return 0;
@@ -755,7 +769,7 @@ static irqreturn_t exynos_tmu_threaded_irq(int irq, void *id)
 	clk_enable(data->clk);
 
 	/* TODO: take action based on particular interrupt */
-	data->tmu_clear_irqs(data);
+	data->soc_config->tmu_clear_irqs(data);
 
 	clk_disable(data->clk);
 	mutex_unlock(&data->lock);
@@ -768,13 +782,13 @@ static void exynos4210_tmu_clear_irqs(struct exynos_tmu_data *data)
 	unsigned int val_irq;
 	u32 tmu_intstat, tmu_intclear;
 
-	if (data->soc == SOC_ARCH_EXYNOS5260) {
+	if (data->soc_config->soc == SOC_ARCH_EXYNOS5260) {
 		tmu_intstat = EXYNOS5260_TMU_REG_INTSTAT;
 		tmu_intclear = EXYNOS5260_TMU_REG_INTCLEAR;
-	} else if (data->soc == SOC_ARCH_EXYNOS7) {
+	} else if (data->soc_config->soc == SOC_ARCH_EXYNOS7) {
 		tmu_intstat = EXYNOS7_TMU_REG_INTPEND;
 		tmu_intclear = EXYNOS7_TMU_REG_INTPEND;
-	} else if (data->soc == SOC_ARCH_EXYNOS5433) {
+	} else if (data->soc_config->soc == SOC_ARCH_EXYNOS5433) {
 		tmu_intstat = EXYNOS5433_TMU_REG_INTPEND;
 		tmu_intclear = EXYNOS5433_TMU_REG_INTPEND;
 	} else {
@@ -794,34 +808,153 @@ static void exynos4210_tmu_clear_irqs(struct exynos_tmu_data *data)
 	writel(val_irq, data->base + tmu_intclear);
 }
 
+static const struct exynos_tmu_soc_config exynos3250_data = {
+	.soc = SOC_ARCH_EXYNOS3250,
+	.tmu_set_low_temp = exynos4412_tmu_set_low_temp,
+	.tmu_set_high_temp = exynos4412_tmu_set_high_temp,
+	.tmu_disable_low = exynos4412_tmu_disable_low,
+	.tmu_disable_high = exynos4210_tmu_disable_high,
+	.tmu_set_crit_temp = exynos4412_tmu_set_crit_temp,
+	.tmu_initialize = exynos4412_tmu_initialize,
+	.tmu_control = exynos4210_tmu_control,
+	.tmu_read = exynos4412_tmu_read,
+	.tmu_set_emulation = exynos4412_tmu_set_emulation,
+	.tmu_clear_irqs = exynos4210_tmu_clear_irqs,
+	.gain = 8,
+	.reference_voltage = 16,
+	.efuse_value = 55,
+	.min_efuse_value = 40,
+	.max_efuse_value = 100,
+	.tmu_ops = &exynos_sensor_ops,
+};
+
+static const struct exynos_tmu_soc_config exynos4210_data = {
+	.soc = SOC_ARCH_EXYNOS4210,
+	.tmu_set_low_temp = exynos4210_tmu_set_low_temp,
+	.tmu_set_high_temp = exynos4210_tmu_set_high_temp,
+	.tmu_disable_low = exynos4210_tmu_disable_low,
+	.tmu_disable_high = exynos4210_tmu_disable_high,
+	.tmu_set_crit_temp = exynos4210_tmu_set_crit_temp,
+	.tmu_initialize = exynos4210_tmu_initialize,
+	.tmu_control = exynos4210_tmu_control,
+	.tmu_read = exynos4210_tmu_read,
+	.tmu_clear_irqs = exynos4210_tmu_clear_irqs,
+	.gain = 15,
+	.reference_voltage = 7,
+	.efuse_value = 55,
+	.min_efuse_value = 40,
+	.max_efuse_value = 100,
+	.tmu_ops = &exynos_sensor_ops,
+};
+
+static const struct exynos_tmu_soc_config exynos4412_data = {
+	.soc = SOC_ARCH_EXYNOS4412,
+	.tmu_set_low_temp = exynos4412_tmu_set_low_temp,
+	.tmu_set_high_temp = exynos4412_tmu_set_high_temp,
+	.tmu_disable_low = exynos4412_tmu_disable_low,
+	.tmu_disable_high = exynos4210_tmu_disable_high,
+	.tmu_set_crit_temp = exynos4412_tmu_set_crit_temp,
+	.tmu_initialize = exynos4412_tmu_initialize,
+	.tmu_control = exynos4210_tmu_control,
+	.tmu_read = exynos4412_tmu_read,
+	.tmu_set_emulation = exynos4412_tmu_set_emulation,
+	.tmu_clear_irqs = exynos4210_tmu_clear_irqs,
+	.gain = 8,
+	.reference_voltage = 16,
+	.efuse_value = 55,
+	.min_efuse_value = 40,
+	.max_efuse_value = 100,
+	.tmu_ops = &exynos_sensor_ops,
+};
+
+static const struct exynos_tmu_soc_config exynos5420_data = {
+	.soc = SOC_ARCH_EXYNOS5420,
+	.tmu_set_low_temp = exynos4412_tmu_set_low_temp,
+	.tmu_set_high_temp = exynos4412_tmu_set_high_temp,
+	.tmu_disable_low = exynos4412_tmu_disable_low,
+	.tmu_disable_high = exynos4210_tmu_disable_high,
+	.tmu_set_crit_temp = exynos4412_tmu_set_crit_temp,
+	.tmu_initialize = exynos4412_tmu_initialize,
+	.tmu_control = exynos4210_tmu_control,
+	.tmu_read = exynos4412_tmu_read,
+	.tmu_set_emulation = exynos4412_tmu_set_emulation,
+	.tmu_clear_irqs = exynos4210_tmu_clear_irqs,
+	.gain = 8,
+	.reference_voltage = 16,
+	.efuse_value = 55,
+	.min_efuse_value = 16,
+	.max_efuse_value = 76,
+	.tmu_ops = &exynos_sensor_ops,
+};
+
+static const struct exynos_tmu_soc_config exynos5433_data = {
+	.soc = SOC_ARCH_EXYNOS5433,
+	.tmu_set_low_temp = exynos5433_tmu_set_low_temp,
+	.tmu_set_high_temp = exynos5433_tmu_set_high_temp,
+	.tmu_disable_low = exynos5433_tmu_disable_low,
+	.tmu_disable_high = exynos5433_tmu_disable_high,
+	.tmu_set_crit_temp = exynos5433_tmu_set_crit_temp,
+	.tmu_initialize = exynos5433_tmu_initialize,
+	.tmu_control = exynos5433_tmu_control,
+	.tmu_read = exynos4412_tmu_read,
+	.tmu_set_emulation = exynos4412_tmu_set_emulation,
+	.tmu_clear_irqs = exynos4210_tmu_clear_irqs,
+	.gain = 8,
+	.reference_voltage = 16,
+	.efuse_value = 75,
+	.min_efuse_value = 40,
+	.max_efuse_value = 150,
+	.tmu_ops = &exynos_sensor_ops,
+};
+
+static const struct exynos_tmu_soc_config exynos7_data = {
+	.soc = SOC_ARCH_EXYNOS7,
+	.tmu_set_low_temp = exynos7_tmu_set_low_temp,
+	.tmu_set_high_temp = exynos7_tmu_set_high_temp,
+	.tmu_disable_low = exynos7_tmu_disable_low,
+	.tmu_disable_high = exynos7_tmu_disable_high,
+	.tmu_set_crit_temp = exynos7_tmu_set_crit_temp,
+	.tmu_initialize = exynos7_tmu_initialize,
+	.tmu_control = exynos7_tmu_control,
+	.tmu_read = exynos7_tmu_read,
+	.tmu_set_emulation = exynos4412_tmu_set_emulation,
+	.tmu_clear_irqs = exynos4210_tmu_clear_irqs,
+	.gain = 9,
+	.reference_voltage = 17,
+	.efuse_value = 75,
+	.min_efuse_value = 15,
+	.max_efuse_value = 100,
+	.tmu_ops = &exynos_sensor_ops,
+};
+
 static const struct of_device_id exynos_tmu_match[] = {
 	{
 		.compatible = "samsung,exynos3250-tmu",
-		.data = (const void *)SOC_ARCH_EXYNOS3250,
+		.data = &exynos3250_data,
 	}, {
 		.compatible = "samsung,exynos4210-tmu",
-		.data = (const void *)SOC_ARCH_EXYNOS4210,
+		.data = &exynos4210_data,
 	}, {
 		.compatible = "samsung,exynos4412-tmu",
-		.data = (const void *)SOC_ARCH_EXYNOS4412,
+		.data = &exynos4412_data,
 	}, {
 		.compatible = "samsung,exynos5250-tmu",
-		.data = (const void *)SOC_ARCH_EXYNOS5250,
+		.data = &exynos4412_data,
 	}, {
 		.compatible = "samsung,exynos5260-tmu",
-		.data = (const void *)SOC_ARCH_EXYNOS5260,
+		.data = &exynos4412_data,
 	}, {
 		.compatible = "samsung,exynos5420-tmu",
-		.data = (const void *)SOC_ARCH_EXYNOS5420,
+		.data = &exynos5420_data,
 	}, {
 		.compatible = "samsung,exynos5420-tmu-ext-triminfo",
-		.data = (const void *)SOC_ARCH_EXYNOS5420_TRIMINFO,
+		.data = &exynos5420_data,
 	}, {
 		.compatible = "samsung,exynos5433-tmu",
-		.data = (const void *)SOC_ARCH_EXYNOS5433,
+		.data = &exynos5433_data,
 	}, {
 		.compatible = "samsung,exynos7-tmu",
-		.data = (const void *)SOC_ARCH_EXYNOS7,
+		.data = &exynos7_data,
 	},
 	{ },
 };
@@ -852,104 +985,11 @@ static int exynos_map_dt_data(struct platform_device *pdev)
 		return -EADDRNOTAVAIL;
 	}
 
-	data->soc = (uintptr_t)of_device_get_match_data(&pdev->dev);
-
-	switch (data->soc) {
-	case SOC_ARCH_EXYNOS4210:
-		data->tmu_set_low_temp = exynos4210_tmu_set_low_temp;
-		data->tmu_set_high_temp = exynos4210_tmu_set_high_temp;
-		data->tmu_disable_low = exynos4210_tmu_disable_low;
-		data->tmu_disable_high = exynos4210_tmu_disable_high;
-		data->tmu_set_crit_temp = exynos4210_tmu_set_crit_temp;
-		data->tmu_initialize = exynos4210_tmu_initialize;
-		data->tmu_control = exynos4210_tmu_control;
-		data->tmu_read = exynos4210_tmu_read;
-		data->tmu_clear_irqs = exynos4210_tmu_clear_irqs;
-		data->gain = 15;
-		data->reference_voltage = 7;
-		data->efuse_value = 55;
-		data->min_efuse_value = 40;
-		data->max_efuse_value = 100;
-		break;
-	case SOC_ARCH_EXYNOS3250:
-	case SOC_ARCH_EXYNOS4412:
-	case SOC_ARCH_EXYNOS5250:
-	case SOC_ARCH_EXYNOS5260:
-		data->tmu_set_low_temp = exynos4412_tmu_set_low_temp;
-		data->tmu_set_high_temp = exynos4412_tmu_set_high_temp;
-		data->tmu_disable_low = exynos4412_tmu_disable_low;
-		data->tmu_disable_high = exynos4210_tmu_disable_high;
-		data->tmu_set_crit_temp = exynos4412_tmu_set_crit_temp;
-		data->tmu_initialize = exynos4412_tmu_initialize;
-		data->tmu_control = exynos4210_tmu_control;
-		data->tmu_read = exynos4412_tmu_read;
-		data->tmu_set_emulation = exynos4412_tmu_set_emulation;
-		data->tmu_clear_irqs = exynos4210_tmu_clear_irqs;
-		data->gain = 8;
-		data->reference_voltage = 16;
-		data->efuse_value = 55;
-		data->min_efuse_value = 0;
-		data->max_efuse_value = 100;
-		break;
-	case SOC_ARCH_EXYNOS5420:
-	case SOC_ARCH_EXYNOS5420_TRIMINFO:
-		data->tmu_set_low_temp = exynos4412_tmu_set_low_temp;
-		data->tmu_set_high_temp = exynos4412_tmu_set_high_temp;
-		data->tmu_disable_low = exynos4412_tmu_disable_low;
-		data->tmu_disable_high = exynos4210_tmu_disable_high;
-		data->tmu_set_crit_temp = exynos4412_tmu_set_crit_temp;
-		data->tmu_initialize = exynos4412_tmu_initialize;
-		data->tmu_control = exynos4210_tmu_control;
-		data->tmu_read = exynos4412_tmu_read;
-		data->tmu_set_emulation = exynos4412_tmu_set_emulation;
-		data->tmu_clear_irqs = exynos4210_tmu_clear_irqs;
-		data->gain = 8;
-		data->reference_voltage = 16;
-		data->efuse_value = 55;
-		data->min_efuse_value = 16;
-		data->max_efuse_value = 76;
-		break;
-	case SOC_ARCH_EXYNOS5433:
-		data->tmu_set_low_temp = exynos5433_tmu_set_low_temp;
-		data->tmu_set_high_temp = exynos5433_tmu_set_high_temp;
-		data->tmu_disable_low = exynos5433_tmu_disable_low;
-		data->tmu_disable_high = exynos5433_tmu_disable_high;
-		data->tmu_set_crit_temp = exynos5433_tmu_set_crit_temp;
-		data->tmu_initialize = exynos5433_tmu_initialize;
-		data->tmu_control = exynos5433_tmu_control;
-		data->tmu_read = exynos4412_tmu_read;
-		data->tmu_set_emulation = exynos4412_tmu_set_emulation;
-		data->tmu_clear_irqs = exynos4210_tmu_clear_irqs;
-		data->gain = 8;
-		if (res.start == EXYNOS5433_G3D_BASE)
-			data->reference_voltage = 23;
-		else
-			data->reference_voltage = 16;
-		data->efuse_value = 75;
-		data->min_efuse_value = 40;
-		data->max_efuse_value = 150;
-		break;
-	case SOC_ARCH_EXYNOS7:
-		data->tmu_set_low_temp = exynos7_tmu_set_low_temp;
-		data->tmu_set_high_temp = exynos7_tmu_set_high_temp;
-		data->tmu_disable_low = exynos7_tmu_disable_low;
-		data->tmu_disable_high = exynos7_tmu_disable_high;
-		data->tmu_set_crit_temp = exynos7_tmu_set_crit_temp;
-		data->tmu_initialize = exynos7_tmu_initialize;
-		data->tmu_control = exynos7_tmu_control;
-		data->tmu_read = exynos7_tmu_read;
-		data->tmu_set_emulation = exynos4412_tmu_set_emulation;
-		data->tmu_clear_irqs = exynos4210_tmu_clear_irqs;
-		data->gain = 9;
-		data->reference_voltage = 17;
-		data->efuse_value = 75;
-		data->min_efuse_value = 15;
-		data->max_efuse_value = 100;
-		break;
-	default:
-		dev_err(&pdev->dev, "Platform not supported\n");
+	data->soc_config = of_device_get_match_data(&pdev->dev);
+	if (!data->soc_config)
 		return -EINVAL;
-	}
+
+	dev_info(&pdev->dev, "Detected SoC: %d\n", data->soc_config->soc);
 
 	data->cal_type = TYPE_ONE_POINT_TRIMMING;
 
@@ -957,7 +997,7 @@ static int exynos_map_dt_data(struct platform_device *pdev)
 	 * Check if the TMU shares some registers and then try to map the
 	 * memory of common registers.
 	 */
-	if (data->soc != SOC_ARCH_EXYNOS5420_TRIMINFO)
+	if (data->soc_config->soc != SOC_ARCH_EXYNOS5420_TRIMINFO)
 		return 0;
 
 	if (of_address_to_resource(pdev->dev.of_node, 1, &res)) {
@@ -976,13 +1016,13 @@ static int exynos_set_trips(struct thermal_zone_device *tz, int low, int high)
 	clk_enable(data->clk);
 
 	if (low > INT_MIN)
-		data->tmu_set_low_temp(data, low / MCELSIUS);
+		data->soc_config->tmu_set_low_temp(data, low / MCELSIUS);
 	else
-		data->tmu_disable_low(data);
+		data->soc_config->tmu_disable_low(data);
 	if (high < INT_MAX)
-		data->tmu_set_high_temp(data, high / MCELSIUS);
+		data->soc_config->tmu_set_high_temp(data, high / MCELSIUS);
 	else
-		data->tmu_disable_high(data);
+		data->soc_config->tmu_disable_high(data);
 
 	clk_disable(data->clk);
 	mutex_unlock(&data->lock);
@@ -1035,13 +1075,13 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(data->clk),
 				     "Failed to get clock\n");
 
-	if (data->soc == SOC_ARCH_EXYNOS5420_TRIMINFO) {
+	if (data->soc_config->soc == SOC_ARCH_EXYNOS5420_TRIMINFO) {
 		data->clk_sec = devm_clk_get_enabled(dev, "tmu_triminfo_apbif");
 		if (IS_ERR(data->clk_sec))
 			return dev_err_probe(dev, PTR_ERR(data->clk_sec),
 					     "Failed to get clk_sec clock\n");
-	} else if (data->soc == SOC_ARCH_EXYNOS5433 ||
-		   data->soc == SOC_ARCH_EXYNOS7) {
+	} else if (data->soc_config->soc == SOC_ARCH_EXYNOS5433 ||
+		   data->soc_config->soc == SOC_ARCH_EXYNOS7) {
 		data->sclk = devm_clk_get_enabled(dev, "tmu_sclk");
 		if (IS_ERR(data->sclk))
 			return dev_err_probe(dev, PTR_ERR(data->sclk),
@@ -1055,7 +1095,7 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 	}
 
 	data->tzd = devm_thermal_of_zone_register(dev, 0, data,
-						  &exynos_sensor_ops);
+						  data->soc_config->tmu_ops);
 	if (IS_ERR(data->tzd)) {
 		return dev_err_probe(dev, PTR_ERR(data->tzd),
 				     "Failed to register sensor\n");
-- 
2.50.1

