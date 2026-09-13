Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC0A346FB3
	for <linux-samsung-soc@vger.kernel.org>; Sun, 13 Sep 2026 15:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789311611; cv=none; b=XydbCtY67oZZwgCGroh+dUMPgizOIDs3TTTF/rsJSP8bHPqEn4dg5sBWpKZUWkBM4Wq2xF1QecNjFaovifHnhJdvD10umOSHzs++yqafas1Rs51vmoCi7xm97/EfiIf+cUFF5RVLISSYM59wzsHonIGl/86HEKaInvdMqAdekc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789311611; c=relaxed/simple;
	bh=Fqx/Why65ntDuLsjE2Hge2Y5XJMOcjUmtfTFWTyd2qM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SazhoVn5jsZrQmI0C4MYuHVH7M2Kjn01vwX6p2rNzI4s0T+yCb2wTkLJW1zg2IL8VrSGhfG0klss8NQipFN5qv7Kar76qubGECB8bONGPGCJ3S2SZ/Xfig4FH7HhzV7vVO/cDY15XY7/8h3ZgO/+ix6HCWMVQ8060mx4ilUIy+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T1Q+V21p; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T1Q+V21p"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so2446603a91.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 13 Sep 2026 08:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789311608; x=1789916408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iWlrSuY01GdV11TIXI5P8cmkxAQSB0ZioYMZIiZx+uQ=;
        b=T1Q+V21pcmXZzoU6C+vSw5NgtiKbR9r0EQRa3QIjgDz0xgQmCoPrlElW2Pl9CQWcVN
         rsaaztIeXtNUYmOjH57198oX6pwt5nR7H5319G2YJGqOCsU/CyDpolUHGG/P0gQWC5+6
         jSqstcUQ8QZ0EciPpqgMIJxL1oHiW7tngODtjX5fuvEu2Beb+lDBYY1EsMJccDwegj8L
         cPDP1A7QIe98vZbSlyWw1HLzV36y3MtkcVuRayZOtw+LQKiGZXP7tjKZK083Jt2FmQae
         xdDe+qcPzhq/bXWj56DipjevQNPZLNRui5RvNOnWrWhK0JRskpdieZ42nljmFd95fuyJ
         PDRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789311608; x=1789916408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iWlrSuY01GdV11TIXI5P8cmkxAQSB0ZioYMZIiZx+uQ=;
        b=KOzjE3EalgKcRMgOUymqz0IozvPmfwL7KEMA1IY41cQI27aMFmXkfA8ZuKewQQUNfU
         qR8eLZMBRaya21RK+Ei7iVcoWl2eRWue5Tm5rMC49Q0kNSvUX9gTOlxCxL+O2crzcj9H
         vb0sgz/eqZ9Vmpmjrm2Y1ZFHByyPfKYKb1E1/Io0q06hosK0QVSV6QvgNsr9n+51oHBC
         T5y4XiEBasMiyKnaNBMAwgB0lAvERQwZGTUd1ZfKdiZMK4mHAY7eaelJojrtxXLMeEsO
         kClNnlrx/McdDEOSMe2uFI1HhnwZ5Nht0KNdxPl+sEkPr90m5H3daK4dMlQTwrNc6Xnd
         I80Q==
X-Forwarded-Encrypted: i=1; AKwUvBwD0nqAdA5klL4e/4g+MaT7r8m4UvvueNDWu1U2ib+6vyyhsm0bT1DA3zpQPEzCwasRPeEtH8UG3XpHf6BHR5q8vA==@vger.kernel.org
X-Gm-Message-State: AFuF++m7LmjXXZz1XU8DrG/oWjiHB1Uhm12UGcsk7oVbbAu3jQpHj8n7
	LH21ZqdrTnQZhXBEnhgdFe6xTGUvAoQ1SeDKJ9TkPe6Re3rkErJd41lF
X-Gm-Gg: AYBFou38KH8WFt0IKoDD/iOdl4Z0vVutgVXU0ykvJaHW91SS+qSdtPDTshuZKQVgm6z
	eN8blpsyW6fIzXy+MlMFzoch2nSdBIfprAMYZrTs+Dy5OM2/5WLcc2qN8S4TE6TtYNOnlGVe8LY
	ey9tv6mSf4KDhcSKssifdYDprSVJS5CBkc9nYAvMtybYWlvE1NDmq9K+0ffL+ZorrKEs/Y9h3mL
	eetLlIiQtpzAoaym9zw2WQT4AVy+t9idDwe5mm8xc+lGi0yOAxzBXeDbLoTtfifxwYbFAV2ZyNy
	0w8c76NnLQroCSdGaM2afBNHTQF5p07N0rQ5O67MMfWNr4ObjgdDdhm24WtOerbg2n4J6DPtMxX
	YKQlGLp2OPiRFOf18URDSk+dvkbV1/ZRDjmluoxXvVywHjkBvjO9VnGmpmlgQ8fKvOHwhTUzTxd
	zJu/av+C4o9K+xvqmbS7rOgNGzLm4N5UI7GmyUn7P9SGF6QM+ZzerXlfNhx0yi8oP6mCUx8CXa
X-Received: by 2002:a17:90b:4cc6:b0:381:10a3:8b10 with SMTP id 98e67ed59e1d1-39dd54eacd9mr3419850a91.14.1789311607909;
        Sun, 13 Sep 2026 08:00:07 -0700 (PDT)
Received: from archl-rock5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b8f1f7sm17536306c88.11.2026.09.13.08.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 08:00:07 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-pm@vger.kernel.org (open list:THERMAL),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v9 7/9] thermal/drivers/exynos: Move thermal zone ops to variant data
Date: Sun, 13 Sep 2026 20:28:35 +0530
Message-ID: <20260913145905.9404-8-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913145905.9404-1-linux.amoon@gmail.com>
References: <20260913145905.9404-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the thermal zone device operations into the SoC-specific variant
data and use the variant when registering the thermal zone.

Store a thermal_zone_device_ops pointer in struct exynos_tmu_variant
so that each supported SoC can provide its own thermal zone operations.

This allows thermal zone registration to be selected together with the
other SoC-specific TMU configuration through the device tree match data.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/thermal/samsung/exynos_tmu.c | 69 ++++++++++++++++------------
 1 file changed, 40 insertions(+), 29 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index a689c6a40b67..0e7b92035850 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -186,6 +186,7 @@ struct exynos_tmu_data {
  * @tmu_read: SoC-specific TMU temperature read method.
  * @tmu_set_emulation: SoC-specific TMU emulation setting method.
  * @tmu_clear_irqs: SoC-specific TMU interrupt clearing method.
+ * @tmu_ops: SoC-specific thermal zone device operations.
  */
 struct exynos_tmu_variant {
 	enum soc_type soc;
@@ -205,6 +206,7 @@ struct exynos_tmu_variant {
 	int (*tmu_read)(struct exynos_tmu_data *data);
 	void (*tmu_set_emulation)(struct exynos_tmu_data *data, int temp);
 	void (*tmu_clear_irqs)(struct exynos_tmu_data *data);
+	const struct thermal_zone_device_ops *tmu_ops;
 };
 
 /*
@@ -809,6 +811,34 @@ static void exynos4210_tmu_clear_irqs(struct exynos_tmu_data *data)
 	writel(val_irq, data->base + tmu_intclear);
 }
 
+static int exynos_set_trips(struct thermal_zone_device *tz, int low, int high)
+{
+	struct exynos_tmu_data *data = thermal_zone_device_priv(tz);
+
+	mutex_lock(&data->lock);
+	clk_enable(data->clk);
+
+	if (low > INT_MIN)
+		data->variant->tmu_set_low_temp(data, low / MCELSIUS);
+	else
+		data->variant->tmu_disable_low(data);
+	if (high < INT_MAX)
+		data->variant->tmu_set_high_temp(data, high / MCELSIUS);
+	else
+		data->variant->tmu_disable_high(data);
+
+	clk_disable(data->clk);
+	mutex_unlock(&data->lock);
+
+	return 0;
+}
+
+static const struct thermal_zone_device_ops exynos_sensor_ops = {
+	.get_temp = exynos_get_temp,
+	.set_emul_temp = exynos_tmu_set_emulation,
+	.set_trips = exynos_set_trips,
+};
+
 static const struct exynos_tmu_variant exynos3250_data = {
 	.soc = SOC_ARCH_EXYNOS3250,
 	.gain = 8,
@@ -826,6 +856,7 @@ static const struct exynos_tmu_variant exynos3250_data = {
 	.tmu_read = exynos4412_tmu_read,
 	.tmu_set_emulation = exynos4412_tmu_set_emulation,
 	.tmu_clear_irqs = exynos4210_tmu_clear_irqs,
+	.tmu_ops = &exynos_sensor_ops,
 };
 
 static const struct exynos_tmu_variant exynos4210_data = {
@@ -844,6 +875,7 @@ static const struct exynos_tmu_variant exynos4210_data = {
 	.tmu_control = exynos4210_tmu_control,
 	.tmu_read = exynos4210_tmu_read,
 	.tmu_clear_irqs = exynos4210_tmu_clear_irqs,
+	.tmu_ops = &exynos_sensor_ops,
 };
 
 static const struct exynos_tmu_variant exynos4412_data = {
@@ -863,6 +895,7 @@ static const struct exynos_tmu_variant exynos4412_data = {
 	.tmu_read = exynos4412_tmu_read,
 	.tmu_set_emulation = exynos4412_tmu_set_emulation,
 	.tmu_clear_irqs = exynos4210_tmu_clear_irqs,
+	.tmu_ops = &exynos_sensor_ops,
 };
 
 static const struct exynos_tmu_variant exynos5250_data = {
@@ -882,6 +915,7 @@ static const struct exynos_tmu_variant exynos5250_data = {
 	.tmu_read = exynos4412_tmu_read,
 	.tmu_set_emulation = exynos4412_tmu_set_emulation,
 	.tmu_clear_irqs = exynos4210_tmu_clear_irqs,
+	.tmu_ops = &exynos_sensor_ops,
 };
 
 static const struct exynos_tmu_variant exynos5260_data = {
@@ -901,6 +935,7 @@ static const struct exynos_tmu_variant exynos5260_data = {
 	.tmu_read = exynos4412_tmu_read,
 	.tmu_set_emulation = exynos4412_tmu_set_emulation,
 	.tmu_clear_irqs = exynos4210_tmu_clear_irqs,
+	.tmu_ops = &exynos_sensor_ops,
 };
 
 static const struct exynos_tmu_variant exynos5420_data = {
@@ -920,6 +955,7 @@ static const struct exynos_tmu_variant exynos5420_data = {
 	.tmu_read = exynos4412_tmu_read,
 	.tmu_set_emulation = exynos4412_tmu_set_emulation,
 	.tmu_clear_irqs = exynos4210_tmu_clear_irqs,
+	.tmu_ops = &exynos_sensor_ops,
 };
 
 static const struct exynos_tmu_variant exynos5420_triminfo_data = {
@@ -939,6 +975,7 @@ static const struct exynos_tmu_variant exynos5420_triminfo_data = {
 	.tmu_read = exynos4412_tmu_read,
 	.tmu_set_emulation = exynos4412_tmu_set_emulation,
 	.tmu_clear_irqs = exynos4210_tmu_clear_irqs,
+	.tmu_ops = &exynos_sensor_ops,
 };
 
 static const struct exynos_tmu_variant exynos5433_data = {
@@ -958,6 +995,7 @@ static const struct exynos_tmu_variant exynos5433_data = {
 	.tmu_read = exynos4412_tmu_read,
 	.tmu_set_emulation = exynos4412_tmu_set_emulation,
 	.tmu_clear_irqs = exynos4210_tmu_clear_irqs,
+	.tmu_ops = &exynos_sensor_ops,
 };
 
 static const struct exynos_tmu_variant exynos7_data = {
@@ -977,6 +1015,7 @@ static const struct exynos_tmu_variant exynos7_data = {
 	.tmu_read = exynos7_tmu_read,
 	.tmu_set_emulation = exynos4412_tmu_set_emulation,
 	.tmu_clear_irqs = exynos4210_tmu_clear_irqs,
+	.tmu_ops = &exynos_sensor_ops,
 };
 
 static const struct of_device_id exynos_tmu_match[] = {
@@ -1052,34 +1091,6 @@ static int exynos_map_dt_data(struct platform_device *pdev)
 	return 0;
 }
 
-static int exynos_set_trips(struct thermal_zone_device *tz, int low, int high)
-{
-	struct exynos_tmu_data *data = thermal_zone_device_priv(tz);
-
-	mutex_lock(&data->lock);
-	clk_enable(data->clk);
-
-	if (low > INT_MIN)
-		data->variant->tmu_set_low_temp(data, low / MCELSIUS);
-	else
-		data->variant->tmu_disable_low(data);
-	if (high < INT_MAX)
-		data->variant->tmu_set_high_temp(data, high / MCELSIUS);
-	else
-		data->variant->tmu_disable_high(data);
-
-	clk_disable(data->clk);
-	mutex_unlock(&data->lock);
-
-	return 0;
-}
-
-static const struct thermal_zone_device_ops exynos_sensor_ops = {
-	.get_temp = exynos_get_temp,
-	.set_emul_temp = exynos_tmu_set_emulation,
-	.set_trips = exynos_set_trips,
-};
-
 static int exynos_tmu_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1144,7 +1155,7 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 	}
 
 	data->tzd = devm_thermal_of_zone_register(dev, 0, data,
-						  &exynos_sensor_ops);
+						  data->variant->tmu_ops);
 	if (IS_ERR(data->tzd))
 		ret = dev_err_probe(dev, PTR_ERR(data->tzd), "Failed to register sensor\n");
 
-- 
2.55.0

