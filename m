Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76C91662FB
	for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jun 2024 16:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718642717; cv=none; b=qAC0iqPXhet/AnutO1Bb6fZB8Nsi//yl1/Nh1a1tdCmPK05fI3TGLMSWZ+1UwDoMZIMkKiniuCm50h6N7tuTL5XQLVKRMdTOnJgQ58AERUygCpe96x7EDRQr4qVmHuL3kA25mBhqlemp49ZgMwpaya//eBNS7/BNlTreL5UDrqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718642717; c=relaxed/simple;
	bh=ccz0hCcXkhmHSbVigTvyDMlitcNo6eYRerPiHfBjKIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ROug2chJhBppy1kv21+nMUy7zDC3nyZcU5nKUK3cBKe+e8HrkgYNoETqTcPcF1q+lsYFRLy3mhIUDjJ1Whi/5qkyGOHTVjSXR5wDIPrJ7bWWFh6wSwIEYXyuFqSYZKPcGmVPWYNFTTCoJXzGPHfPetWQIDVd3OQBLtAXF/Sfss8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jmE2mdwy; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jmE2mdwy"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a6f8ebbd268so111197666b.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jun 2024 09:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718642713; x=1719247513; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=775Rc3YSZJA9GkF9P0glZgOGiZ3l+SlVgXxf6vD2zUg=;
        b=jmE2mdwy5T/uWDp8s5cFegj8l+JAIMvSyac28D2wXQO4ZLSuAQvAMfyHsDNnlgSbYG
         h4EpvrSKVGrHS89eyK6W38+odwPkipZvT9A7ghcf8AeLPmu7eNWv2ZKSJnWLpLFjRsBt
         IJ5W/YXRB0jFKZ1RIgFYr+6pLpe5jH+Y/h0Ekyyn7Gsa5MwMirBCNEwbWSdofUJdYYch
         uno0KOywQMM+QByUER4T2d2goOhCGnZQhuJwM0aqVeziyr8boTSuPHJfAiEjNaQOuDZ6
         UNVFpX3VReVAuvgbawb8pxRKjsd0iExLaB8gpbWRbv2Ai7B+f3ENaRYWncLaB89ibIOW
         wUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718642713; x=1719247513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=775Rc3YSZJA9GkF9P0glZgOGiZ3l+SlVgXxf6vD2zUg=;
        b=SchQOGZn0e6Jc5PvOKlLWQhDHcVY4v5fwLVKtxLtCBrBK4OoLEVtPhKcoUAC9RVQAT
         +dJZxQg71Au6T75p9tyldSAR18Ct6d/c2zHHGtQ2EOW2g2ucgwwe4NyszryA7l25KhI3
         T9jTx3zDq+OkFlQAf9kLQgyIGlDjE/L7c5brhirvcZhke66wupgXdkoomkO3/0uCLzO8
         eKNo4KzYfgp+QKaWctTO9bA5zwHUV+VlDMEsp5XcRgRScnYOA64td6g0po8z+GF1aFkA
         WmbxGWjhMOjDK8FJN+Betj+djM8eNidy7sWM+Z/H7Kuy+p2A1MrUCDw6t0Ax4Omz1Gs8
         xYKw==
X-Forwarded-Encrypted: i=1; AJvYcCVclw0uaHglIun1eORYlStct+VMA4TGYWatgAC6AYUrlwfbSsHrQA7plU6e8Eo+P96CKcbPf/LkxuBndg+3FIirNYEZo3JTQihFxLdYfkCm9yM=
X-Gm-Message-State: AOJu0YyVyO36hC4pDrCLmAaCbaVtHyXkJ2q2I8rGcGa0Bae08J7Zdr0O
	ONGnTfd/csx1mWvMuNhM0xPzdMi/s4v6ELP0FyTmdqtFwzHA/Y6sWIcZ0bulJg8=
X-Google-Smtp-Source: AGHT+IGxghexs1XqxhT5potawbeFSAX16ipohQs+SrpdF0FJ0NKfLsTElkU4lhVhPvf7HZsnVf1r1Q==
X-Received: by 2002:a17:906:ba89:b0:a6f:6960:5e15 with SMTP id a640c23a62f3a-a6f94c13e0emr12835266b.7.1718642713131;
        Mon, 17 Jun 2024 09:45:13 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f4170bsm527139966b.157.2024.06.17.09.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 09:45:12 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 17 Jun 2024 17:44:45 +0100
Subject: [PATCH v3 4/6] phy: exynos5-usbdrd: convert (phy) register access
 clock to clk_bulk
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-usb-phy-gs101-v3-4-b66de9ae7424@linaro.org>
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

In preparation for support for additional platforms, convert the phy
register access clock to using the clk_bulk interfaces.

Newer SoCs like Google Tensor gs101 require additional clocks for
access to additional (different) register areas (PHY, PMA, PCS), and
converting to clk_bulk simplifies addition of those extra clocks.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v3:
* make the register access clock name(s) platform specific and avoid
  use of devm_clk_bulk_get_optional() as we want to be sure to have
  retrieved all required clocks
* fix a whitespace issue
* slightly rephrase commit message
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 54 +++++++++++++++++++++++---------
 1 file changed, 39 insertions(+), 15 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 35b307dad2ee..80a3891fd605 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -185,6 +185,8 @@ struct exynos5_usbdrd_phy_config {
 struct exynos5_usbdrd_phy_drvdata {
 	const struct exynos5_usbdrd_phy_config *phy_cfg;
 	const struct phy_ops *phy_ops;
+	const char * const *clk_names;
+	int n_clks;
 	const char * const *core_clk_names;
 	int n_core_clks;
 	u32 pmu_offset_usbdrd0_phy;
@@ -196,7 +198,7 @@ struct exynos5_usbdrd_phy_drvdata {
  * struct exynos5_usbdrd_phy - driver data for USB 3.0 PHY
  * @dev: pointer to device instance of this platform device
  * @reg_phy: usb phy controller register memory base
- * @clk: phy clock for register access
+ * @clks: clocks for register access
  * @core_clks: core clocks for phy (ref, pipe3, utmi+, ITP, etc. as required)
  * @drv_data: pointer to SoC level driver data structure
  * @phys: array for 'EXYNOS5_DRDPHYS_NUM' number of PHY
@@ -209,7 +211,7 @@ struct exynos5_usbdrd_phy_drvdata {
 struct exynos5_usbdrd_phy {
 	struct device *dev;
 	void __iomem *reg_phy;
-	struct clk *clk;
+	struct clk_bulk_data *clks;
 	struct clk_bulk_data *core_clks;
 	const struct exynos5_usbdrd_phy_drvdata *drv_data;
 	struct phy_usb_instance {
@@ -402,7 +404,7 @@ static int exynos5_usbdrd_phy_init(struct phy *phy)
 	struct phy_usb_instance *inst = phy_get_drvdata(phy);
 	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
 
-	ret = clk_prepare_enable(phy_drd->clk);
+	ret = clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd->clks);
 	if (ret)
 		return ret;
 
@@ -452,7 +454,7 @@ static int exynos5_usbdrd_phy_init(struct phy *phy)
 	reg &= ~PHYCLKRST_PORTRESET;
 	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYCLKRST);
 
-	clk_disable_unprepare(phy_drd->clk);
+	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
 
 	return 0;
 }
@@ -464,7 +466,7 @@ static int exynos5_usbdrd_phy_exit(struct phy *phy)
 	struct phy_usb_instance *inst = phy_get_drvdata(phy);
 	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
 
-	ret = clk_prepare_enable(phy_drd->clk);
+	ret = clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd->clks);
 	if (ret)
 		return ret;
 
@@ -486,7 +488,7 @@ static int exynos5_usbdrd_phy_exit(struct phy *phy)
 		PHYTEST_POWERDOWN_HSP;
 	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYTEST);
 
-	clk_disable_unprepare(phy_drd->clk);
+	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
 
 	return 0;
 }
@@ -811,14 +813,14 @@ static int exynos850_usbdrd_phy_init(struct phy *phy)
 	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
 	int ret;
 
-	ret = clk_prepare_enable(phy_drd->clk);
+	ret = clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd->clks);
 	if (ret)
 		return ret;
 
 	/* UTMI or PIPE3 specific init */
 	inst->phy_cfg->phy_init(phy_drd);
 
-	clk_disable_unprepare(phy_drd->clk);
+	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
 
 	return 0;
 }
@@ -831,7 +833,7 @@ static int exynos850_usbdrd_phy_exit(struct phy *phy)
 	u32 reg;
 	int ret;
 
-	ret = clk_prepare_enable(phy_drd->clk);
+	ret = clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd->clks);
 	if (ret)
 		return ret;
 
@@ -854,7 +856,7 @@ static int exynos850_usbdrd_phy_exit(struct phy *phy)
 	reg &= ~CLKRST_LINK_SW_RST;
 	writel(reg, regs_base + EXYNOS850_DRD_CLKRST);
 
-	clk_disable_unprepare(phy_drd->clk);
+	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
 
 	return 0;
 }
@@ -873,11 +875,19 @@ static int exynos5_usbdrd_phy_clk_handle(struct exynos5_usbdrd_phy *phy_drd)
 	struct clk *ref_clk;
 	unsigned long ref_rate;
 
-	phy_drd->clk = devm_clk_get(phy_drd->dev, "phy");
-	if (IS_ERR(phy_drd->clk)) {
-		dev_err(phy_drd->dev, "Failed to get phy clock\n");
-		return PTR_ERR(phy_drd->clk);
-	}
+	phy_drd->clks = devm_kcalloc(phy_drd->dev, phy_drd->drv_data->n_clks,
+				     sizeof(*phy_drd->clks), GFP_KERNEL);
+	if (!phy_drd->clks)
+		return -ENOMEM;
+
+	for (int i = 0; i < phy_drd->drv_data->n_clks; ++i)
+		phy_drd->clks[i].id = phy_drd->drv_data->clk_names[i];
+
+	ret = devm_clk_bulk_get(phy_drd->dev, phy_drd->drv_data->n_clks,
+				phy_drd->clks);
+	if (ret)
+		return dev_err_probe(phy_drd->dev, ret,
+				     "failed to get phy clock(s)\n");
 
 	phy_drd->core_clks = devm_kcalloc(phy_drd->dev,
 					  phy_drd->drv_data->n_core_clks,
@@ -939,6 +949,10 @@ static const struct exynos5_usbdrd_phy_config phy_cfg_exynos850[] = {
 	},
 };
 
+static const char * const exynos5_clk_names[] = {
+	"phy",
+};
+
 static const char * const exynos5_core_clk_names[] = {
 	"ref",
 };
@@ -952,6 +966,8 @@ static const struct exynos5_usbdrd_phy_drvdata exynos5420_usbdrd_phy = {
 	.phy_ops		= &exynos5_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOS5_USBDRD_PHY_CONTROL,
 	.pmu_offset_usbdrd1_phy	= EXYNOS5420_USBDRD1_PHY_CONTROL,
+	.clk_names		= exynos5_clk_names,
+	.n_clks			= ARRAY_SIZE(exynos5_clk_names),
 	.core_clk_names		= exynos5_core_clk_names,
 	.n_core_clks		= ARRAY_SIZE(exynos5_core_clk_names),
 };
@@ -960,6 +976,8 @@ static const struct exynos5_usbdrd_phy_drvdata exynos5250_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos5,
 	.phy_ops		= &exynos5_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOS5_USBDRD_PHY_CONTROL,
+	.clk_names		= exynos5_clk_names,
+	.n_clks			= ARRAY_SIZE(exynos5_clk_names),
 	.core_clk_names		= exynos5_core_clk_names,
 	.n_core_clks		= ARRAY_SIZE(exynos5_core_clk_names),
 };
@@ -969,6 +987,8 @@ static const struct exynos5_usbdrd_phy_drvdata exynos5433_usbdrd_phy = {
 	.phy_ops		= &exynos5_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOS5_USBDRD_PHY_CONTROL,
 	.pmu_offset_usbdrd1_phy	= EXYNOS5433_USBHOST30_PHY_CONTROL,
+	.clk_names		= exynos5_clk_names,
+	.n_clks			= ARRAY_SIZE(exynos5_clk_names),
 	.core_clk_names		= exynos5433_core_clk_names,
 	.n_core_clks		= ARRAY_SIZE(exynos5433_core_clk_names),
 };
@@ -977,6 +997,8 @@ static const struct exynos5_usbdrd_phy_drvdata exynos7_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos5,
 	.phy_ops		= &exynos5_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOS5_USBDRD_PHY_CONTROL,
+	.clk_names		= exynos5_clk_names,
+	.n_clks			= ARRAY_SIZE(exynos5_clk_names),
 	.core_clk_names		= exynos5433_core_clk_names,
 	.n_core_clks		= ARRAY_SIZE(exynos5433_core_clk_names),
 };
@@ -985,6 +1007,8 @@ static const struct exynos5_usbdrd_phy_drvdata exynos850_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos850,
 	.phy_ops		= &exynos850_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOS5_USBDRD_PHY_CONTROL,
+	.clk_names		= exynos5_clk_names,
+	.n_clks			= ARRAY_SIZE(exynos5_clk_names),
 	.core_clk_names		= exynos5_core_clk_names,
 	.n_core_clks		= ARRAY_SIZE(exynos5_core_clk_names),
 };

-- 
2.45.2.627.g7a2c4fd464-goog

