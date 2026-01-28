Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554FF30E836
	for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Jan 2026 16:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769616662; cv=none; b=Lq8lTR8qT90H/9K0DnduqmOIXxi6LHlmqtWRhGPNHqfjECpQpdXzrvNaJAm6ktllyfmizq1y781EzaldWZhsR2UyrR9xJ+GAgQKzYO3/wR19hDpq510wVJvzw6+5EJ3BY116YfpetOsB0mfAArBbrkJlThSJ2//Rnqun0nheYVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769616662; c=relaxed/simple;
	bh=A57iIyprnVVgXhFe5kC51yr0jTxIdK2LZO5HdrKp1WA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OZNBS6VbdtrmEwEbSOsqMmQng0J9gEBsxD7Z1xDgnQoVLf1/3bpjJnBa76GWLdlv7AcnPs0bdB7aNQTch/Rx23I8ZOrWXi2ZB0IKD2YkeIjiBLWu/+MgQA5l0Thbyj/AFqRcZNaDZPylzLImjxnnSRooIxrQqoiXWE5L0npZ9JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MCmkrr8d; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MCmkrr8d"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b8710c9cddbso850184166b.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Jan 2026 08:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769616657; x=1770221457; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iN7RPaetGrCUTSxMSp2jttEhwD8uGc4/qT3ZtQUJgjk=;
        b=MCmkrr8djzNFnlcajREnK5/+2Uz/mFERo3i0dQDr6UMYz2mNtOx210O7IoaamFcPtz
         lPdPQ48sEQOVbC2l7KsbN/P5d8w8Erh4kYUmL9VMqfWxEQFMKs/A0LFPXPWyLptUZL6y
         utOh2H7mYeOxO3WgpKkmiDDwhNv1Np180OiSnUQaY0D76olHPoGgwmwYckvKkjJLXwMN
         FdFVnWyyHqK1XAWUnEhOXyDMLIv9lQLCQmOTw67bUbM/JxhUsPPXBXQ6ZMKUUkfz5unr
         MlQIz+IyJihIL4LA/j/P4St6tus1x8ElmbYlij4wNe2aE83GLbUxz+1xf7yVJCYz3tCf
         pqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769616657; x=1770221457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iN7RPaetGrCUTSxMSp2jttEhwD8uGc4/qT3ZtQUJgjk=;
        b=ovXlhMYf3oOhQy6gEn/pf9Shmy11JALPWRMjWKvnBJjKlusCBOr0nb21POYbNVZs6F
         7e768q5doRpddKfM1aYnyeHnC5oZXAjK5F03If6Vhw4mBtCRgOBe1Qe+THNllUoE79fL
         +KIS5bWlq0XtehxPdIgr3aLu7xtKauf6pxjtvqp/wFq7/AjSwQwOhuoveUDaGufI7ejW
         re68a27GY48SS62gbr9ZS1YHDnzYIbAAMT5oH5SDQ0n5tpIMa3CwMmHNv052Qlls/tqK
         qSY8Dx+B8ItKXd+SYbiOLP/vOMtyf0jXJIrQWbYFg/Emg0wNDIF9YLoXNs7/apXYrn1G
         uxDg==
X-Forwarded-Encrypted: i=1; AJvYcCU632RkDX82GIsfeb5aUuTXRE9Wl6TVlevvybhDqCuvIxCAPFA0pCMF6HUF4lxijKMHQMFRgiCOQVr4jlbS4KeeLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyutmpVaZUH39fsPEbWloSPNyxML7LFmF0EWoH2wPC+3ZJUYH9y
	cNSiwOl7IAabt5I3tpToEwl5KtsxKaHHFbD3tb2yZJJYc7RSamZULLi8yKuPTdXZE+I=
X-Gm-Gg: AZuq6aJKrfOBT9jUB7xkcyMqJnRZEzowAwtpLRgInOV2UntR/O58FPJbE/qxaf2Kebk
	Zfhymr97QJ2cqDdQlWJ5qzD/jWXS+mXlsxfqJwbkKTvhw9gYnc6v5ZZMU1jBfiqMtTqS0h76/g6
	VlWLDX/SO5+zDEsQ2dl08nsjIwdp/w8wSt+3SH/IsS5g0v0qTkJnj0vrv7LRF+4v8Yx5xL5chMp
	TzFklEWIlEMaGwu6XokMVb6/izZqkIVBNazzLRuuOnlVdQRliSZd110T5XOcsiunoyj4evJXT1h
	W2/QKU1mMXto2RE3S7Dx5iNrE7DjzC0xKEJ0fXkSBBJr4Q0Gn0/R0AtLdaAvQVi14nX718Se866
	4pyd+mFr+7Rl3EfRLruITVYThWqVAB+0sAhWlb03Dw7SYSS+W4VDecLJfCJgWctWusGKU0wsp+R
	GBNrMwKyv/Dutce9H0X+jdClQF/3UZ2GGaD5Gn6v0cQi2DqYtDRxc6pSnBph/zBc0ImF7OB7Fcb
	NuKd/y3FheureC5
X-Received: by 2002:a17:907:7289:b0:b88:5d85:47c with SMTP id a640c23a62f3a-b8dab1bc003mr399775066b.26.1769616656849;
        Wed, 28 Jan 2026 08:10:56 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1c021fsm148553366b.49.2026.01.28.08.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 08:10:56 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 28 Jan 2026 16:10:56 +0000
Subject: [PATCH v4 07/10] pmdomain: samsung: add support for
 google,gs101-pd
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260128-gs101-pd-v4-7-cbe7bd5a4060@linaro.org>
References: <20260128-gs101-pd-v4-0-cbe7bd5a4060@linaro.org>
In-Reply-To: <20260128-gs101-pd-v4-0-cbe7bd5a4060@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
X-Mailer: b4 0.14.2

On Google gs101, direct mmio register access to the PMU registers
doesn't work and access must happen via a regmap created by the PMU
driver instead.

Add a flag to the device match data to denote this case, and obtain
the regmap using the parent node in DT if true, while keeping to use
the traditional direct mmio regmap otherwise.

Additionally, the status is just one bit on gs101.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v4:
- add 'use_parent_regmap' flag instead of going by 'syscon' compatible
  in parent, as it's not a given that the parent provides a syscon-
  compatible regmap (it actually doesn't anymore after recent changes
  on gs101)

I've still kept Marek's Tested-by from v3, as legacy Exynos code
doesn't change.
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 66 +++++++++++++++++++---------
 1 file changed, 46 insertions(+), 20 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index 8df46b41f9bc8f0b2a03300169a4b52457faaf4d..2214d9f32d5967b60e84f68f4e99a725d66a39eb 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -12,6 +12,7 @@
 #include <linux/err.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/mfd/syscon.h>
 #include <linux/pm_domain.h>
 #include <linux/delay.h>
 #include <linux/of.h>
@@ -21,6 +22,7 @@
 struct exynos_pm_domain_config {
 	/* Value for LOCAL_PWR_CFG and STATUS fields for each domain */
 	u32 local_pwr_cfg;
+	bool use_parent_regmap;
 };
 
 /*
@@ -93,8 +95,16 @@ static const struct exynos_pm_domain_config exynos5433_cfg = {
 	.local_pwr_cfg		= 0xf,
 };
 
+static const struct exynos_pm_domain_config gs101_cfg = {
+	.local_pwr_cfg		= BIT(0),
+	.use_parent_regmap	= true,
+};
+
 static const struct of_device_id exynos_pm_domain_of_match[] = {
 	{
+		.compatible = "google,gs101-pd",
+		.data = &gs101_cfg,
+	}, {
 		.compatible = "samsung,exynos4210-pd",
 		.data = &exynos4210_cfg,
 	}, {
@@ -122,17 +132,9 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	struct of_phandle_args child, parent;
 	struct exynos_pm_domain *pd;
 	struct resource *res;
-	void __iomem *base;
 	unsigned int val;
 	int on, ret;
 
-	struct regmap_config reg_config = {
-		.reg_bits = 32,
-		.val_bits = 32,
-		.reg_stride = 4,
-		.use_relaxed_mmio = true,
-	};
-
 	pm_domain_cfg = of_device_get_match_data(dev);
 	pd = devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
 	if (!pd)
@@ -143,25 +145,49 @@ static int exynos_pd_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	/*
-	 * The resource typically points into the address space of the PMU.
+	 * The resource typically points into the address space of the PMU and
+	 * we have to consider two cases:
+	 *   1) some implementations require a custom regmap (from PMU parent)
+	 *   2) this driver might map the same addresses as the PMU driver
 	 * Therefore, avoid using devm_platform_get_and_ioremap_resource() and
-	 * instead use platform_get_resource() and devm_ioremap() to avoid
+	 * instead use platform_get_resource() here, and below for case 1) use
+	 * syscon_node_to_regmap() while for case 2) use devm_ioremap() to avoid
 	 * conflicts due to address space overlap.
 	 */
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res)
 		return dev_err_probe(dev, -ENXIO, "missing IO resources");
 
-	base = devm_ioremap(dev, res->start, resource_size(res));
-	if (!base)
-		return dev_err_probe(dev, -ENOMEM,
-				     "failed to ioremap PMU registers");
-
-	reg_config.max_register = resource_size(res) - reg_config.reg_stride;
-	pd->regmap = devm_regmap_init_mmio(dev, base, &reg_config);
-	if (IS_ERR(pd->regmap))
-		return dev_err_probe(dev, PTR_ERR(base),
-				     "failed to init regmap");
+	if (pm_domain_cfg->use_parent_regmap) {
+		pd->regmap = syscon_node_to_regmap(dev->parent->of_node);
+		if (IS_ERR(pd->regmap))
+			return dev_err_probe(dev, PTR_ERR(pd->regmap),
+					     "failed to acquire PMU regmap");
+
+		pd->configuration_reg = res->start;
+		pd->status_reg = res->start;
+	} else {
+		void __iomem *base;
+
+		const struct regmap_config reg_config = {
+			.reg_bits = 32,
+			.val_bits = 32,
+			.reg_stride = 4,
+			.use_relaxed_mmio = true,
+			.max_register = (resource_size(res)
+					 - reg_config.reg_stride),
+		};
+
+		base = devm_ioremap(dev, res->start, resource_size(res));
+		if (!base)
+			return dev_err_probe(dev, -ENOMEM,
+					     "failed to ioremap PMU registers");
+
+		pd->regmap = devm_regmap_init_mmio(dev, base, &reg_config);
+		if (IS_ERR(pd->regmap))
+			return dev_err_probe(dev, PTR_ERR(base),
+					     "failed to init regmap");
+	}
 
 	pd->pd.power_off = exynos_pd_power_off;
 	pd->pd.power_on = exynos_pd_power_on;

-- 
2.52.0.457.g6b5491de43-goog

