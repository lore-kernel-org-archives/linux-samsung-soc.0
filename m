Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF07513E88B
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Apr 2024 17:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713891992; cv=none; b=r/cz8P6dcSZirMVV3rUciu6OpxNT8aqsAianVzL2/A9N7AYbQcZRVRK6N9OXjvhfMprLsnXNQq2YoR8WPvES7jN5tMDqviyJb1P2SN/NheFho4ZtBSLtJgPyUcrRDYiQRDdYfO2KzyKZvMVMbhsxwhwIxa2ka81ihb2PqUwzxzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713891992; c=relaxed/simple;
	bh=8+rczal/sT60nSRIxsRrhBYeetsV3rWc5ulhIp7cx2g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CWtqfc6ZbMN4tMvjQkrSgtNkLDhELuBzsryO5kVyqdcyY7kVEPUAjnIGkxp6Zs2vGIERJqItjGmKf/ZgfFzV/a4d52TYq6R9zGn+CjM0fbLPfWfzm//Vij74e2dukh8/UqduLheoql196/oetrkdNjqUup/GKw/KXqEXe8uYbCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YPIRTj25; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YPIRTj25"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a55b93f5540so294418066b.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Apr 2024 10:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713891988; x=1714496788; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xi3l/qnNzfAd3sS4G7vPiu1NNsMSYHi+3xLBC/g45dE=;
        b=YPIRTj254W66IO7MTtBNF+PThsYCACuq1714qpwXXIazbD0GYL9OJjwYCUXKLimSf8
         tLedFj3AR8lOddi9OSoUxcQfZlUXxbsnS2jPDEC+0XlivT1twixgN2Rl8+8ggJtpPXCe
         FVnyoudeSW08mj2emS9BtnjouFNAT2pfNTjQS0LsuL4wj5aHbpNXriwFS4mOIHwfdkDQ
         kZeErhgY9B4Md0qd7+suIcphOvjlzMGqmNfALh3oi4fSy+a1zW7FxJXnfB/ICl5dvsKR
         MsWtHSyXDgh2qXw9BfjsZBLCJc34GJNn6umhxOabmLO4t7wU+r0Gqe8A41kiZweuBQ4m
         reVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713891988; x=1714496788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xi3l/qnNzfAd3sS4G7vPiu1NNsMSYHi+3xLBC/g45dE=;
        b=D/HIYSR1d9T/DsQa8uygoHbXkHsM3vAjizNtb4g/94jdUCqp/MOSGFNrr7m/K+AC8v
         qlk8e9/C29vRivGXXMMlSK1ST1f/CMgbAgEFiofn+nM2gao9PfQL0u2ss7wjG70saHmj
         Uzyfcl7yC0GP0Aq/crgd0L4E4wOPSd68cWcNETVsHRnGO3Etf9ePUr+nNBS/6AnwE+8G
         AK3Dgkt+cYtctRcajBgI6PvT7TXKz1vHoR9O/7ll+4lyQUnKuwRCp0s/2ikH4p/abs+M
         yBxIFc9fgalpTxJAzZDzK8AWq5DXraSfkjwBJVvVei/eCtm+wvsHW+BIdy2LaLGD7E4b
         iJoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXPEQzde/5Vo56xz9xT0Yz59fNoyYA4UqV8rCHi75DDtC830SOgGKY3uy+coNDEesYFReTqrqpklsgRR9hLM9YG9rsLQgjDhXrrfcRKbvqgQ4=
X-Gm-Message-State: AOJu0YxtMw0MLDBiIh2LRgep/N0w31JrPmibq6nRTT2Fun1KyW7298DZ
	2r8C/oW4bUfGFUGKsGoZWRYBE83br3G6joPflUR3spX3P7xsqflVhYUURXJEyus=
X-Google-Smtp-Source: AGHT+IHhLeM9lHMwkusT37/REYAgRbABvWv57rJm56e9cAIvQ07N72wljQoRCkpcZiNKp7aTTXrFmg==
X-Received: by 2002:a17:907:7215:b0:a55:8609:1c34 with SMTP id dr21-20020a170907721500b00a5586091c34mr10584896ejc.28.1713891988171;
        Tue, 23 Apr 2024 10:06:28 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id t22-20020a1709063e5600b00a5209dc79c1sm7351624eji.146.2024.04.23.10.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 10:06:27 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 23 Apr 2024 18:06:08 +0100
Subject: [PATCH 6/7] phy: exynos5-usbdrd: convert to clk_bulk for phy
 (register) access
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240423-usb-phy-gs101-v1-6-ebdcb3ac174d@linaro.org>
References: <20240423-usb-phy-gs101-v1-0-ebdcb3ac174d@linaro.org>
In-Reply-To: <20240423-usb-phy-gs101-v1-0-ebdcb3ac174d@linaro.org>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.12.4

In preparation for support for additional platforms, convert the phy
register access clock to using the clk_bulk interfaces.

Newer SoCs like Google Tensor gs101 require more clocks for register
access, and converting to clk_bulk simplifies addition of those extra
clocks.

Given the list of phy register clocks is requested as optional, I
haven't made it platform specific, as only those clocks that are
actually declared (in the DT) will be retrieved and the code behaves as
before this change. Nevertheless, this piece of the code is easy to
change in the future if the need arises.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 45 +++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 15 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 88b03bb67fff..63933029ffa7 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -194,7 +194,8 @@ struct exynos5_usbdrd_phy_drvdata {
  * struct exynos5_usbdrd_phy - driver data for USB 3.0 PHY
  * @dev: pointer to device instance of this platform device
  * @reg_phy: usb phy controller register memory base
- * @clk: phy clock for register access
+ * @phy_clks: phy clocks for register access
+ * @n_phy_clks: number of phy clocks for register access
  * @pipeclk: clock for pipe3 phy
  * @utmiclk: clock for utmi+ phy
  * @itpclk: clock for ITP generation
@@ -211,7 +212,8 @@ struct exynos5_usbdrd_phy_drvdata {
 struct exynos5_usbdrd_phy {
 	struct device *dev;
 	void __iomem *reg_phy;
-	struct clk *clk;
+	struct clk_bulk_data  *phy_clks;
+	size_t n_phy_clks;
 	struct clk *pipeclk;
 	struct clk *utmiclk;
 	struct clk *itpclk;
@@ -407,7 +409,7 @@ static int exynos5_usbdrd_phy_init(struct phy *phy)
 	struct phy_usb_instance *inst = phy_get_drvdata(phy);
 	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
 
-	ret = clk_prepare_enable(phy_drd->clk);
+	ret = clk_bulk_prepare_enable(phy_drd->n_phy_clks, phy_drd->phy_clks);
 	if (ret)
 		return ret;
 
@@ -457,7 +459,7 @@ static int exynos5_usbdrd_phy_init(struct phy *phy)
 	reg &= ~PHYCLKRST_PORTRESET;
 	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYCLKRST);
 
-	clk_disable_unprepare(phy_drd->clk);
+	clk_bulk_disable_unprepare(phy_drd->n_phy_clks, phy_drd->phy_clks);
 
 	return 0;
 }
@@ -469,7 +471,7 @@ static int exynos5_usbdrd_phy_exit(struct phy *phy)
 	struct phy_usb_instance *inst = phy_get_drvdata(phy);
 	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
 
-	ret = clk_prepare_enable(phy_drd->clk);
+	ret = clk_bulk_prepare_enable(phy_drd->n_phy_clks, phy_drd->phy_clks);
 	if (ret)
 		return ret;
 
@@ -491,7 +493,7 @@ static int exynos5_usbdrd_phy_exit(struct phy *phy)
 		PHYTEST_POWERDOWN_HSP;
 	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYTEST);
 
-	clk_disable_unprepare(phy_drd->clk);
+	clk_bulk_disable_unprepare(phy_drd->n_phy_clks, phy_drd->phy_clks);
 
 	return 0;
 }
@@ -826,14 +828,14 @@ static int exynos850_usbdrd_phy_init(struct phy *phy)
 	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
 	int ret;
 
-	ret = clk_prepare_enable(phy_drd->clk);
+	ret = clk_bulk_prepare_enable(phy_drd->n_phy_clks, phy_drd->phy_clks);
 	if (ret)
 		return ret;
 
 	/* UTMI or PIPE3 specific init */
 	inst->phy_cfg->phy_init(phy_drd);
 
-	clk_disable_unprepare(phy_drd->clk);
+	clk_bulk_disable_unprepare(phy_drd->n_phy_clks, phy_drd->phy_clks);
 
 	return 0;
 }
@@ -846,7 +848,7 @@ static int exynos850_usbdrd_phy_exit(struct phy *phy)
 	u32 reg;
 	int ret;
 
-	ret = clk_prepare_enable(phy_drd->clk);
+	ret = clk_bulk_prepare_enable(phy_drd->n_phy_clks, phy_drd->phy_clks);
 	if (ret)
 		return ret;
 
@@ -869,7 +871,7 @@ static int exynos850_usbdrd_phy_exit(struct phy *phy)
 	reg &= ~CLKRST_LINK_SW_RST;
 	writel(reg, regs_base + EXYNOS850_DRD_CLKRST);
 
-	clk_disable_unprepare(phy_drd->clk);
+	clk_bulk_disable_unprepare(phy_drd->n_phy_clks, phy_drd->phy_clks);
 
 	return 0;
 }
@@ -882,16 +884,29 @@ static const struct phy_ops exynos850_usbdrd_phy_ops = {
 	.owner		= THIS_MODULE,
 };
 
+static const char * const phy_clk_list[] = {
+	"phy",
+};
+
 static int exynos5_usbdrd_phy_clk_handle(struct exynos5_usbdrd_phy *phy_drd)
 {
 	unsigned long ref_rate;
 	int ret;
 
-	phy_drd->clk = devm_clk_get(phy_drd->dev, "phy");
-	if (IS_ERR(phy_drd->clk)) {
-		dev_err(phy_drd->dev, "Failed to get phy clock\n");
-		return PTR_ERR(phy_drd->clk);
-	}
+	phy_drd->n_phy_clks = ARRAY_SIZE(phy_clk_list);
+	phy_drd->phy_clks = devm_kcalloc(phy_drd->dev, phy_drd->n_phy_clks,
+					 sizeof(*phy_drd->phy_clks),
+					 GFP_KERNEL);
+	if (!phy_drd->phy_clks)
+		return -ENOMEM;
+
+	for (int i = 0; i < phy_drd->n_phy_clks; ++i)
+		phy_drd->phy_clks[i].id = phy_clk_list[i];
+
+	ret = devm_clk_bulk_get_optional(phy_drd->dev, phy_drd->n_phy_clks,
+					 phy_drd->phy_clks);
+	if (ret < 0)
+		return ret;
 
 	phy_drd->ref_clk = devm_clk_get(phy_drd->dev, "ref");
 	if (IS_ERR(phy_drd->ref_clk)) {

-- 
2.44.0.769.g3c40516874-goog

