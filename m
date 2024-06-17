Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DF81662E8
	for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jun 2024 16:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718642717; cv=none; b=tVQ4HAeGDQhXfrNgR61/FtXzUp4vldoU3k/W14tvbzXV6RBl8n+I9FCzy5BPDRYL5nFxYoUdNekiq1DMJoIHDZQDX73492QH6ElhsdY1oCVfi6B+4b/8nIKHh7GMkjKUsqKE/yTLQyQvRA9hqZ7QzErnJjA6WWmRSm39iUq7Z6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718642717; c=relaxed/simple;
	bh=qiXW9STxZi5hxiki6UUMOlRWrR+SQKxMjGn3sIyYrtc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l84cLTsJDDskQ7Lqwdpfkri87/E5XRr/aBaHaUj4kLdnTblA/KrhshMTzNvJMib28tHVtO8Rl6VbdZ/ca0YvdyaBKbDg7jHiYZ5kW2dLywYgkshhywdVdfCs8f4h6/l1f+niCN+OZ2G9G+4iXgvFvFAATb/yk8W0M9yZY5yeV8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gLQI1Oss; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gLQI1Oss"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-57cc1c00ba6so3743180a12.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jun 2024 09:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718642713; x=1719247513; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZfbBcvTWg9v7Bbg+JkZfv+jRFiGBg9MQxpTsL00jJxg=;
        b=gLQI1OssXOAXknp3rFXxABV9tjORBV08b8A1uvBkRmUrKrUKFqe6bc1GOmr/gbhXUT
         KlrLbuzGBmw2LeZ2DLSLapAXi6pcAVBjiDRRr8tujtJotAD375ROABj8J5vQeHy2bn/3
         1XYoC1aoo4nnURDQWfhS+ARige/wFZvqLuu1/ZlAl8ugIh9RPcXgsl8n+HkRZXJE4Qev
         bNi6RhqqIvCmG5kCkKWz8Db0v4FiG9P44Q9INJdRTKr8/wYY6JfESg3c0rnnL7k39Exm
         tJk39xxB+mFBK6EJsn5X/Hb3eeCA4yQEfwZnR3jucYbfHP1oJul/i+3ZeIuEpsEDqau7
         iIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718642713; x=1719247513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZfbBcvTWg9v7Bbg+JkZfv+jRFiGBg9MQxpTsL00jJxg=;
        b=cF1NVPrG/ikoY7NXlYTvw8LaNS4kXrRxI7Vy2fPE1PKq37BqSkKIDBdVvIIYgwtrcI
         XlG6Dk45qrntYpMhg/cCfZUv8p0KfCdZjYZ7ILoH31/hk+MBn/sLJX6B/O41Eg4Osiek
         pKw00cnXZStdXoaD5JEPJhpsC+hl/RiRT8voG4zRZvREAuPX8FKJyNgjnH4DFrQ0bGBz
         jAkizvKzH/NyTw3UxX2U8NuZ+s0CzcN4nbQD/7pfI/h4H5CHOLPyBANzh02W5lqs7avC
         gqjeNAy7MdKNAzQ42Ujl/EAkxo9j4Iily88Fdar1UPeYG91aZ5hoL9CcujIEypHrRkb6
         +5cw==
X-Forwarded-Encrypted: i=1; AJvYcCXIG1GWYSU1yvczkxCEvkqE7R0GHyjbO6VJA7DstR2KR0tSOMO6vIQniD/lvwWKzhdkLmdobiX+NR2h8DnEu3TaIusce4POXXgGGbSN27sTsJk=
X-Gm-Message-State: AOJu0Yztvcr2/EVaV6AAElsXHqL+Jn3fpWM9VcsQ2kGa8cleKmmO0dR7
	Bo86pL4Zd0iPDODEXC7VUe7HAo4XzQRqruhKQcirJr/4ZYFPrYJqeP66vo1IbmQ=
X-Google-Smtp-Source: AGHT+IFwqHuL/AFdrKJ5yS1y9SrBtKhrGrSio/O9IDSp5AUqAYl4zRsXzu5G8/8K7KBD2vk6PlyL9A==
X-Received: by 2002:a17:906:d18f:b0:a6f:7c8:4fd6 with SMTP id a640c23a62f3a-a6f60bcbaadmr750030066b.0.1718642712613;
        Mon, 17 Jun 2024 09:45:12 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f4170bsm527139966b.157.2024.06.17.09.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 09:45:12 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 17 Jun 2024 17:44:44 +0100
Subject: [PATCH v3 3/6] phy: exynos5-usbdrd: convert core clocks to
 clk_bulk
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-usb-phy-gs101-v3-3-b66de9ae7424@linaro.org>
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

Using the clk_bulk APIs, the clock handling for the core clocks becomes
much simpler. No need to check any flags whether or not certain clocks
exist or not. Further, we can drop the various handles to the
individual clocks in the driver data and instead simply treat them all
as one thing.

So far, this driver assumes that all platforms have a clock "ref". It
also assumes that the clocks "phy_pipe", "phy_utmi", and "itp" exist if
the platform data "has_common_clk_gate" is set to true. It then goes
and individually tries to acquire and enable and disable all the
individual clocks one by one. Rather than relying on these implicit
clocks and open-coding the clock handling, we can just explicitly spell
out the clock names in the different device data and use that
information to populate clk_bulk_data, allowing us to use the clk_bulk
APIs for managing the clocks.

As a side-effect, this change highlighted the fact that
exynos5_usbdrd_phy_power_on() forgot to check the result of the clock
enable calls. Using the clk_bulk APIs, the compiler now warns when
return values are not checked - therefore add the necessary check
instead of silently ignoring failures and continuing as if all is OK
when it isn't.

For consistency, also change a related dev_err() to dev_err_probe() in
exynos5_usbdrd_phy_clk_handle() to get consistent error message
formatting.

Finally, exynos5_usbdrd_phy_clk_handle() prints an error message in all
cases as necessary (except for -ENOMEM). There is no need to print
another message in its caller (the probe() function), and printing
errors during OOM conditions is usually discouraged. Drop the
duplicated message in exynos5_usbdrd_phy_probe().

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 129 +++++++++++++++----------------
 1 file changed, 61 insertions(+), 68 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index b7e2526f4c06..35b307dad2ee 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -185,10 +185,11 @@ struct exynos5_usbdrd_phy_config {
 struct exynos5_usbdrd_phy_drvdata {
 	const struct exynos5_usbdrd_phy_config *phy_cfg;
 	const struct phy_ops *phy_ops;
+	const char * const *core_clk_names;
+	int n_core_clks;
 	u32 pmu_offset_usbdrd0_phy;
 	u32 pmu_offset_usbdrd0_phy_ss;
 	u32 pmu_offset_usbdrd1_phy;
-	bool has_common_clk_gate;
 };
 
 /**
@@ -196,16 +197,12 @@ struct exynos5_usbdrd_phy_drvdata {
  * @dev: pointer to device instance of this platform device
  * @reg_phy: usb phy controller register memory base
  * @clk: phy clock for register access
- * @pipeclk: clock for pipe3 phy
- * @utmiclk: clock for utmi+ phy
- * @itpclk: clock for ITP generation
+ * @core_clks: core clocks for phy (ref, pipe3, utmi+, ITP, etc. as required)
  * @drv_data: pointer to SoC level driver data structure
  * @phys: array for 'EXYNOS5_DRDPHYS_NUM' number of PHY
  *	    instances each with its 'phy' and 'phy_cfg'.
  * @extrefclk: frequency select settings when using 'separate
  *	       reference clocks' for SS and HS operations
- * @ref_clk: reference clock to PHY block from which PHY's
- *	     operational clocks are derived
  * @vbus: VBUS regulator for phy
  * @vbus_boost: Boost regulator for VBUS present on few Exynos boards
  */
@@ -213,9 +210,7 @@ struct exynos5_usbdrd_phy {
 	struct device *dev;
 	void __iomem *reg_phy;
 	struct clk *clk;
-	struct clk *pipeclk;
-	struct clk *utmiclk;
-	struct clk *itpclk;
+	struct clk_bulk_data *core_clks;
 	const struct exynos5_usbdrd_phy_drvdata *drv_data;
 	struct phy_usb_instance {
 		struct phy *phy;
@@ -225,7 +220,6 @@ struct exynos5_usbdrd_phy {
 		const struct exynos5_usbdrd_phy_config *phy_cfg;
 	} phys[EXYNOS5_DRDPHYS_NUM];
 	u32 extrefclk;
-	struct clk *ref_clk;
 	struct regulator *vbus;
 	struct regulator *vbus_boost;
 };
@@ -505,12 +499,10 @@ static int exynos5_usbdrd_phy_power_on(struct phy *phy)
 
 	dev_dbg(phy_drd->dev, "Request to power_on usbdrd_phy phy\n");
 
-	clk_prepare_enable(phy_drd->ref_clk);
-	if (!phy_drd->drv_data->has_common_clk_gate) {
-		clk_prepare_enable(phy_drd->pipeclk);
-		clk_prepare_enable(phy_drd->utmiclk);
-		clk_prepare_enable(phy_drd->itpclk);
-	}
+	ret = clk_bulk_prepare_enable(phy_drd->drv_data->n_core_clks,
+				      phy_drd->core_clks);
+	if (ret)
+		return ret;
 
 	/* Enable VBUS supply */
 	if (phy_drd->vbus_boost) {
@@ -540,12 +532,8 @@ static int exynos5_usbdrd_phy_power_on(struct phy *phy)
 		regulator_disable(phy_drd->vbus_boost);
 
 fail_vbus:
-	clk_disable_unprepare(phy_drd->ref_clk);
-	if (!phy_drd->drv_data->has_common_clk_gate) {
-		clk_disable_unprepare(phy_drd->itpclk);
-		clk_disable_unprepare(phy_drd->utmiclk);
-		clk_disable_unprepare(phy_drd->pipeclk);
-	}
+	clk_bulk_disable_unprepare(phy_drd->drv_data->n_core_clks,
+				   phy_drd->core_clks);
 
 	return ret;
 }
@@ -566,12 +554,8 @@ static int exynos5_usbdrd_phy_power_off(struct phy *phy)
 	if (phy_drd->vbus_boost)
 		regulator_disable(phy_drd->vbus_boost);
 
-	clk_disable_unprepare(phy_drd->ref_clk);
-	if (!phy_drd->drv_data->has_common_clk_gate) {
-		clk_disable_unprepare(phy_drd->itpclk);
-		clk_disable_unprepare(phy_drd->pipeclk);
-		clk_disable_unprepare(phy_drd->utmiclk);
-	}
+	clk_bulk_disable_unprepare(phy_drd->drv_data->n_core_clks,
+				   phy_drd->core_clks);
 
 	return 0;
 }
@@ -885,8 +869,9 @@ static const struct phy_ops exynos850_usbdrd_phy_ops = {
 
 static int exynos5_usbdrd_phy_clk_handle(struct exynos5_usbdrd_phy *phy_drd)
 {
-	unsigned long ref_rate;
 	int ret;
+	struct clk *ref_clk;
+	unsigned long ref_rate;
 
 	phy_drd->clk = devm_clk_get(phy_drd->dev, "phy");
 	if (IS_ERR(phy_drd->clk)) {
@@ -894,42 +879,39 @@ static int exynos5_usbdrd_phy_clk_handle(struct exynos5_usbdrd_phy *phy_drd)
 		return PTR_ERR(phy_drd->clk);
 	}
 
-	phy_drd->ref_clk = devm_clk_get(phy_drd->dev, "ref");
-	if (IS_ERR(phy_drd->ref_clk)) {
-		dev_err(phy_drd->dev, "Failed to get phy reference clock\n");
-		return PTR_ERR(phy_drd->ref_clk);
-	}
-	ref_rate = clk_get_rate(phy_drd->ref_clk);
-
-	ret = exynos5_rate_to_clk(ref_rate, &phy_drd->extrefclk);
-	if (ret) {
-		dev_err(phy_drd->dev, "Clock rate (%ld) not supported\n",
-			ref_rate);
-		return ret;
-	}
+	phy_drd->core_clks = devm_kcalloc(phy_drd->dev,
+					  phy_drd->drv_data->n_core_clks,
+					  sizeof(*phy_drd->core_clks),
+					  GFP_KERNEL);
+	if (!phy_drd->core_clks)
+		return -ENOMEM;
 
-	if (!phy_drd->drv_data->has_common_clk_gate) {
-		phy_drd->pipeclk = devm_clk_get(phy_drd->dev, "phy_pipe");
-		if (IS_ERR(phy_drd->pipeclk)) {
-			dev_info(phy_drd->dev,
-				 "PIPE3 phy operational clock not specified\n");
-			phy_drd->pipeclk = NULL;
-		}
+	for (int i = 0; i < phy_drd->drv_data->n_core_clks; ++i)
+		phy_drd->core_clks[i].id = phy_drd->drv_data->core_clk_names[i];
 
-		phy_drd->utmiclk = devm_clk_get(phy_drd->dev, "phy_utmi");
-		if (IS_ERR(phy_drd->utmiclk)) {
-			dev_info(phy_drd->dev,
-				 "UTMI phy operational clock not specified\n");
-			phy_drd->utmiclk = NULL;
-		}
+	ret = devm_clk_bulk_get(phy_drd->dev, phy_drd->drv_data->n_core_clks,
+				phy_drd->core_clks);
+	if (ret)
+		return dev_err_probe(phy_drd->dev, ret,
+				     "failed to get phy core clock(s)\n");
 
-		phy_drd->itpclk = devm_clk_get(phy_drd->dev, "itp");
-		if (IS_ERR(phy_drd->itpclk)) {
-			dev_info(phy_drd->dev,
-				 "ITP clock from main OSC not specified\n");
-			phy_drd->itpclk = NULL;
+	ref_clk = NULL;
+	for (int i = 0; i < phy_drd->drv_data->n_core_clks; ++i) {
+		if (!strcmp(phy_drd->core_clks[i].id, "ref")) {
+			ref_clk = phy_drd->core_clks[i].clk;
+			break;
 		}
 	}
+	if (!ref_clk)
+		return dev_err_probe(phy_drd->dev, -ENODEV,
+				     "failed to find phy reference clock\n");
+
+	ref_rate = clk_get_rate(ref_clk);
+	ret = exynos5_rate_to_clk(ref_rate, &phy_drd->extrefclk);
+	if (ret)
+		return dev_err_probe(phy_drd->dev, ret,
+				     "clock rate (%ld) not supported\n",
+				     ref_rate);
 
 	return 0;
 }
@@ -957,19 +939,29 @@ static const struct exynos5_usbdrd_phy_config phy_cfg_exynos850[] = {
 	},
 };
 
+static const char * const exynos5_core_clk_names[] = {
+	"ref",
+};
+
+static const char * const exynos5433_core_clk_names[] = {
+	"ref", "phy_pipe", "phy_utmi", "itp",
+};
+
 static const struct exynos5_usbdrd_phy_drvdata exynos5420_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos5,
 	.phy_ops		= &exynos5_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOS5_USBDRD_PHY_CONTROL,
 	.pmu_offset_usbdrd1_phy	= EXYNOS5420_USBDRD1_PHY_CONTROL,
-	.has_common_clk_gate	= true,
+	.core_clk_names		= exynos5_core_clk_names,
+	.n_core_clks		= ARRAY_SIZE(exynos5_core_clk_names),
 };
 
 static const struct exynos5_usbdrd_phy_drvdata exynos5250_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos5,
 	.phy_ops		= &exynos5_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOS5_USBDRD_PHY_CONTROL,
-	.has_common_clk_gate	= true,
+	.core_clk_names		= exynos5_core_clk_names,
+	.n_core_clks		= ARRAY_SIZE(exynos5_core_clk_names),
 };
 
 static const struct exynos5_usbdrd_phy_drvdata exynos5433_usbdrd_phy = {
@@ -977,21 +969,24 @@ static const struct exynos5_usbdrd_phy_drvdata exynos5433_usbdrd_phy = {
 	.phy_ops		= &exynos5_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOS5_USBDRD_PHY_CONTROL,
 	.pmu_offset_usbdrd1_phy	= EXYNOS5433_USBHOST30_PHY_CONTROL,
-	.has_common_clk_gate	= false,
+	.core_clk_names		= exynos5433_core_clk_names,
+	.n_core_clks		= ARRAY_SIZE(exynos5433_core_clk_names),
 };
 
 static const struct exynos5_usbdrd_phy_drvdata exynos7_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos5,
 	.phy_ops		= &exynos5_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOS5_USBDRD_PHY_CONTROL,
-	.has_common_clk_gate	= false,
+	.core_clk_names		= exynos5433_core_clk_names,
+	.n_core_clks		= ARRAY_SIZE(exynos5433_core_clk_names),
 };
 
 static const struct exynos5_usbdrd_phy_drvdata exynos850_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos850,
 	.phy_ops		= &exynos850_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOS5_USBDRD_PHY_CONTROL,
-	.has_common_clk_gate	= true,
+	.core_clk_names		= exynos5_core_clk_names,
+	.n_core_clks		= ARRAY_SIZE(exynos5_core_clk_names),
 };
 
 static const struct of_device_id exynos5_usbdrd_phy_of_match[] = {
@@ -1045,10 +1040,8 @@ static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
 	phy_drd->drv_data = drv_data;
 
 	ret = exynos5_usbdrd_phy_clk_handle(phy_drd);
-	if (ret) {
-		dev_err(dev, "Failed to initialize clocks\n");
+	if (ret)
 		return ret;
-	}
 
 	reg_pmu = syscon_regmap_lookup_by_phandle(dev->of_node,
 						   "samsung,pmu-syscon");

-- 
2.45.2.627.g7a2c4fd464-goog

