Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728FE16133B
	for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jun 2024 16:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718642718; cv=none; b=rj1umTOUMtHtlbNCGppByU7ETkX25SrhizZv7ATu0neoNIgytQmy7/eNRI0qxWeQmYmci4WLudFKo1iaD3XkDVyZopEDFizjKsbsnZ7HotOJ4/KJLVsiFX2WtlEbZAMCWGmKWtgBgnmU57tXRFaA2CNlx9tFKNiVVQnPZCoC/2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718642718; c=relaxed/simple;
	bh=Qk6feGHkRVeLnEkqYQfLBmesQKVLe/DXRQsuBJ1sb3M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=guXXXnchQ3OUenlqcOECpfYQ5rgb6ZB7BNPLp1OntMwsW2jVIyE8nfA02dYNC9I00Y8LhKraOL94X5xJVWUcETPlAg9y907YXZnaBBlfKjKIEhNeET5jckxwshqAxTnrYKN8qIgJTzjpg3xDKJvqPCNfr0kcRwEkacvgYXZVW14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rZqR4C8D; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rZqR4C8D"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a6e349c0f2bso588125966b.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jun 2024 09:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718642713; x=1719247513; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1iqem2TTUm0Io6iE50JUxcLVu6vIdSJQI7akG3Vt878=;
        b=rZqR4C8D06He5ntc7DiQje6m8C9bpC11I7PFutJyP97gYRVnMCda5cJF8eubFoQFmp
         guMo5I6oV7ZnwsDtLiryKy4PWvFd72/ZXVJVTodI/Au4ypHSFelsntgGPu+AMOI0ZSez
         RndaZagiwoJwvbM7WRegBKpMAzcFArGSFj8DeKqU1yBYWosJ84tP6kPD09D78gSO7LzW
         WQQLOhDj1SkHCVpEabwJheYLgxuXXKsZFILSWDVyG+bGaARIOqTjM/4PTGYU9ajHckB1
         9A5UJ1JenzteIN7TEriYIhRsshreh//r/mXL7UmUV9uamvB0+fJb6rMfbx1vkJ8sSBsa
         ry/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718642713; x=1719247513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1iqem2TTUm0Io6iE50JUxcLVu6vIdSJQI7akG3Vt878=;
        b=lLQBqfG600BozFWzKxhkzhaPpO2If0vYcPbXln9n/mXtCJ7Ie7g7r+k1+VBgXHLB8F
         fJkPCzM1hMoiUNEcylw+xTZjdGEgb6/WRM0djH2nbWlWZt92IOvny+6lJ9RhwvAhy+4+
         i8q44/ZeN12yx2SMrL6cXCKms+rpxkxPBhzGtfTA66EG9uQ17t/81QFD/w/nz9f42i7u
         5SvF89J2t0SJJbWuV8bnnZHeMSLPVvTKB+UWBcFMPzyB3iNp98dEbQJJCF85oDD+jdoH
         /F1DrOcgfMkXy7nALiiXnJQXLczLPYJEC9Rcel/iFzwkIP+/H4MiWfsZaLteqICwrVx8
         w/bQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNG8y+YSGrgxmzPM0Jwhewe+XYvpwY4n7artGhtwx8FvZnXptNZINMi2gvYUgxHNBZX+ITfyxIcXRo86XgP3XaTZw0zHvQmRfWtNTKKKz72lE=
X-Gm-Message-State: AOJu0YwoMucwKMMLxekxB6+iYI7tVeKkoobzXZf6EgPDsdlKpxMLYqgC
	Us9eEeAFOKsf0J3UA06xiKznKN4DCDtvqFT0daCfAHdB7FCeD+/XrfE9JlxMT1U=
X-Google-Smtp-Source: AGHT+IExQsl5L51QJEkILCWw/4EWi/X1ko1LnAIwMsBrVJigwlCKJAPhnITO1WSus9mGPJk5KWgHbQ==
X-Received: by 2002:a17:906:e251:b0:a6f:17a9:947a with SMTP id a640c23a62f3a-a6f60de6059mr682118766b.71.1718642713618;
        Mon, 17 Jun 2024 09:45:13 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f4170bsm527139966b.157.2024.06.17.09.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 09:45:13 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 17 Jun 2024 17:44:46 +0100
Subject: [PATCH v3 5/6] phy: exynos5-usbdrd: convert Vbus supplies to
 regulator_bulk
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-usb-phy-gs101-v3-5-b66de9ae7424@linaro.org>
References: <20240617-usb-phy-gs101-v3-0-b66de9ae7424@linaro.org>
In-Reply-To: <20240617-usb-phy-gs101-v3-0-b66de9ae7424@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

Using the regulator_bulk APIs, the handling of power supplies becomes
much simpler. There is no need anymore to check if regulators have been
acquired or not, the bulk APIs will do all the work for us. We can also
drop the various handles to the individual power supplies in the driver
runtime data and instead simply treat them all as one thing. Error
cleanup also becomes much simpler.

Converting to the regulator_bulk APIs also makes it easier to add
support for those SoCs that have additional power supplies for the PHY.
Google Tensor gs101 is one example of such a SoC. Otherwise we'd have
to add all additional supplies individually via individual calls to
regulator_get() and enable/disable handle them all individually,
including complicated error handling. That doesn't scale and clutters
the code.

Just update the code to use the regulator_bulk APIs.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 86 +++++++++++++++-----------------
 1 file changed, 39 insertions(+), 47 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 80a3891fd605..2d2ce06765c4 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -189,6 +189,8 @@ struct exynos5_usbdrd_phy_drvdata {
 	int n_clks;
 	const char * const *core_clk_names;
 	int n_core_clks;
+	const char * const *regulator_names;
+	int n_regulators;
 	u32 pmu_offset_usbdrd0_phy;
 	u32 pmu_offset_usbdrd0_phy_ss;
 	u32 pmu_offset_usbdrd1_phy;
@@ -205,8 +207,7 @@ struct exynos5_usbdrd_phy_drvdata {
  *	    instances each with its 'phy' and 'phy_cfg'.
  * @extrefclk: frequency select settings when using 'separate
  *	       reference clocks' for SS and HS operations
- * @vbus: VBUS regulator for phy
- * @vbus_boost: Boost regulator for VBUS present on few Exynos boards
+ * @regulators: regulators for phy
  */
 struct exynos5_usbdrd_phy {
 	struct device *dev;
@@ -222,8 +223,7 @@ struct exynos5_usbdrd_phy {
 		const struct exynos5_usbdrd_phy_config *phy_cfg;
 	} phys[EXYNOS5_DRDPHYS_NUM];
 	u32 extrefclk;
-	struct regulator *vbus;
-	struct regulator *vbus_boost;
+	struct regulator_bulk_data *regulators;
 };
 
 static inline
@@ -507,21 +507,11 @@ static int exynos5_usbdrd_phy_power_on(struct phy *phy)
 		return ret;
 
 	/* Enable VBUS supply */
-	if (phy_drd->vbus_boost) {
-		ret = regulator_enable(phy_drd->vbus_boost);
-		if (ret) {
-			dev_err(phy_drd->dev,
-				"Failed to enable VBUS boost supply\n");
-			goto fail_vbus;
-		}
-	}
-
-	if (phy_drd->vbus) {
-		ret = regulator_enable(phy_drd->vbus);
-		if (ret) {
-			dev_err(phy_drd->dev, "Failed to enable VBUS supply\n");
-			goto fail_vbus_boost;
-		}
+	ret = regulator_bulk_enable(phy_drd->drv_data->n_regulators,
+				    phy_drd->regulators);
+	if (ret) {
+		dev_err(phy_drd->dev, "Failed to enable PHY regulator(s)\n");
+		goto fail_vbus;
 	}
 
 	/* Power-on PHY */
@@ -529,10 +519,6 @@ static int exynos5_usbdrd_phy_power_on(struct phy *phy)
 
 	return 0;
 
-fail_vbus_boost:
-	if (phy_drd->vbus_boost)
-		regulator_disable(phy_drd->vbus_boost);
-
 fail_vbus:
 	clk_bulk_disable_unprepare(phy_drd->drv_data->n_core_clks,
 				   phy_drd->core_clks);
@@ -551,10 +537,8 @@ static int exynos5_usbdrd_phy_power_off(struct phy *phy)
 	inst->phy_cfg->phy_isol(inst, true);
 
 	/* Disable VBUS supply */
-	if (phy_drd->vbus)
-		regulator_disable(phy_drd->vbus);
-	if (phy_drd->vbus_boost)
-		regulator_disable(phy_drd->vbus_boost);
+	regulator_bulk_disable(phy_drd->drv_data->n_regulators,
+			       phy_drd->regulators);
 
 	clk_bulk_disable_unprepare(phy_drd->drv_data->n_core_clks,
 				   phy_drd->core_clks);
@@ -961,6 +945,10 @@ static const char * const exynos5433_core_clk_names[] = {
 	"ref", "phy_pipe", "phy_utmi", "itp",
 };
 
+static const char * const exynos5_regulator_names[] = {
+	"vbus", "vbus-boost",
+};
+
 static const struct exynos5_usbdrd_phy_drvdata exynos5420_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos5,
 	.phy_ops		= &exynos5_usbdrd_phy_ops,
@@ -970,6 +958,8 @@ static const struct exynos5_usbdrd_phy_drvdata exynos5420_usbdrd_phy = {
 	.n_clks			= ARRAY_SIZE(exynos5_clk_names),
 	.core_clk_names		= exynos5_core_clk_names,
 	.n_core_clks		= ARRAY_SIZE(exynos5_core_clk_names),
+	.regulator_names	= exynos5_regulator_names,
+	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
 };
 
 static const struct exynos5_usbdrd_phy_drvdata exynos5250_usbdrd_phy = {
@@ -980,6 +970,8 @@ static const struct exynos5_usbdrd_phy_drvdata exynos5250_usbdrd_phy = {
 	.n_clks			= ARRAY_SIZE(exynos5_clk_names),
 	.core_clk_names		= exynos5_core_clk_names,
 	.n_core_clks		= ARRAY_SIZE(exynos5_core_clk_names),
+	.regulator_names	= exynos5_regulator_names,
+	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
 };
 
 static const struct exynos5_usbdrd_phy_drvdata exynos5433_usbdrd_phy = {
@@ -991,6 +983,8 @@ static const struct exynos5_usbdrd_phy_drvdata exynos5433_usbdrd_phy = {
 	.n_clks			= ARRAY_SIZE(exynos5_clk_names),
 	.core_clk_names		= exynos5433_core_clk_names,
 	.n_core_clks		= ARRAY_SIZE(exynos5433_core_clk_names),
+	.regulator_names	= exynos5_regulator_names,
+	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
 };
 
 static const struct exynos5_usbdrd_phy_drvdata exynos7_usbdrd_phy = {
@@ -1001,6 +995,8 @@ static const struct exynos5_usbdrd_phy_drvdata exynos7_usbdrd_phy = {
 	.n_clks			= ARRAY_SIZE(exynos5_clk_names),
 	.core_clk_names		= exynos5433_core_clk_names,
 	.n_core_clks		= ARRAY_SIZE(exynos5433_core_clk_names),
+	.regulator_names	= exynos5_regulator_names,
+	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
 };
 
 static const struct exynos5_usbdrd_phy_drvdata exynos850_usbdrd_phy = {
@@ -1011,6 +1007,8 @@ static const struct exynos5_usbdrd_phy_drvdata exynos850_usbdrd_phy = {
 	.n_clks			= ARRAY_SIZE(exynos5_clk_names),
 	.core_clk_names		= exynos5_core_clk_names,
 	.n_core_clks		= ARRAY_SIZE(exynos5_core_clk_names),
+	.regulator_names	= exynos5_regulator_names,
+	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
 };
 
 static const struct of_device_id exynos5_usbdrd_phy_of_match[] = {
@@ -1083,26 +1081,20 @@ static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
 	if (channel < 0)
 		dev_dbg(dev, "Not a multi-controller usbdrd phy\n");
 
-	/* Get Vbus regulators */
-	phy_drd->vbus = devm_regulator_get(dev, "vbus");
-	if (IS_ERR(phy_drd->vbus)) {
-		ret = PTR_ERR(phy_drd->vbus);
-		if (ret == -EPROBE_DEFER)
-			return ret;
-
-		dev_warn(dev, "Failed to get VBUS supply regulator\n");
-		phy_drd->vbus = NULL;
-	}
-
-	phy_drd->vbus_boost = devm_regulator_get(dev, "vbus-boost");
-	if (IS_ERR(phy_drd->vbus_boost)) {
-		ret = PTR_ERR(phy_drd->vbus_boost);
-		if (ret == -EPROBE_DEFER)
-			return ret;
-
-		dev_warn(dev, "Failed to get VBUS boost supply regulator\n");
-		phy_drd->vbus_boost = NULL;
-	}
+	/* Get regulators */
+	phy_drd->regulators = devm_kcalloc(dev,
+					   drv_data->n_regulators,
+					   sizeof(*phy_drd->regulators),
+					   GFP_KERNEL);
+	if (!phy_drd->regulators)
+		return ENOMEM;
+	regulator_bulk_set_supply_names(phy_drd->regulators,
+					drv_data->regulator_names,
+					drv_data->n_regulators);
+	ret = devm_regulator_bulk_get(dev, drv_data->n_regulators,
+				      phy_drd->regulators);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get regulators\n");
 
 	dev_vdbg(dev, "Creating usbdrd_phy phy\n");
 

-- 
2.45.2.627.g7a2c4fd464-goog

