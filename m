Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57569332914
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Feb 2026 21:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770327758; cv=none; b=F/AYnR3xKybWXzHLG+l78CnwE+wMsfzZBLMUD0bfH4IILbTFAypJ2dHmLW6MIheCyQjsdDCgxCNafgBSkpmQM4DUWvDnLP2tB4q2Q/VBbibb05B9SRzavwqg9f3M+DP/jjgdXqWgH+Awjrf1pKuLJYdZxaYL6LKpI5uxc2IpQ94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770327758; c=relaxed/simple;
	bh=Gh7wNCcyhCNv3CePFSJgIk8GG1EwmMyjPmTewvDCbUk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fELPA0ueFSv0awaM3QRl3zB5HupnIhCcP3K7hBr7jb3mLtOwepSOS8qOmHK3+Jwr5cL9e40cbdVZ8dFask5ElDwaJm7/YLXDwGpidPSqzlsEmNT7z99Bz11+V5K28D+nWowjSIScYNAAICBuFM6BhVffcfr0PSkPQKeSIs7Rfw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T/dh08di; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T/dh08di"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b885a18f620so225968766b.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Feb 2026 13:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770327757; x=1770932557; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9l8kLhxgu+f7eSuFAPa71vI1PB55KyeTUUj2gGy7pqY=;
        b=T/dh08di8Ui7niVytZhGBi6n4He4wmaXUVd4MGBHZQqIAvhjLRwYY0puQiCYbdIGYJ
         Kz1YHCq4DBSq6XbM6BOG+hZBOsN72F2uxlE5xK0vJBcwij+msZYCgtOPy2NxKktrbX38
         Fz6q7SLWWy3ulBer/FGgAT73bScj+fgV0coZx9NFe4DQlXihpQW6YLHg49qQIdhX8LU2
         VAxXN+mwr0Ruot+Wa4stlf9yCD13dgZ3V2q/BH2y9LxjC4J9ufmemKahVxtbpt3N6uwp
         UXlC3OkkLFVpr5pOPYv/DOSJSk+2UJHQiD8ARnUitmllpXEPMVmxwpvab8ZJ7Q4lTUBP
         X5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770327757; x=1770932557;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9l8kLhxgu+f7eSuFAPa71vI1PB55KyeTUUj2gGy7pqY=;
        b=RXwZHDGPS4/0MHkSxUj3hYBaQ5uwC5doWAS/xi8FUCBzMYhI1YrQEy/t2i37GA+PBZ
         Vwc6Aacqtd2EoaSeai+PWLpD69a3HYU3QI98q8yL9AU16wnHrHbDOhtX0QnAgDpJdW7n
         m5XnixnWLK2eydaKbNe4g9+adIDhmok3qgadinEPhVeYOW9VOzElvkAYXCXJCb+ijkfI
         0Q6xS3S5NWPjNzHdMnK7PX9hSUPBCPYbrUjru5vVM7D4tH/hFjmE4IyZwB+TByg91Eh7
         2l8l/SSSRCqe9O33T6BRwGRt1DWu1o/YWQq7ozeYw/i+KYVlAhs/Klf6H2mRtn/npO2g
         cbPw==
X-Forwarded-Encrypted: i=1; AJvYcCXPhAp5Cs1yhzpmhlEDPMvWyBegHC8tKPhFmKjBJu/znVRg7UER7Nti8XXTmZofYpwoeEcT7MzoWxupRKoIqhMGPA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbvcp6JwBB+3/6Bjbp7Rg94y9Ib+CHFuSLTy3rv2wlpNsKAbfN
	TKcrcGhv8QIKXluBUgIcNLlzsvJxUQmO1NUnh0Jzk+hYklq4NLmd4AVJmKdW58oXcsM=
X-Gm-Gg: AZuq6aLg3VYeiTHbn5Kj8Wh1vNsbLGclVdFY/HNpXowA7k6ZIDFPo12whP/nCkE0Y0u
	iZGmHXvUaeN/c+998ffslz492DxR5rdV4v7HAEdru1gggx9qCh/zOOvfdDTUrwE7/xy0ro+4WGT
	033L2UcL0sXPBudrmJ4HUd7f5Vgzwy1Se9OiR7k1fmYvk7rTCx93Gmm1MWdFKNgLQ4pMmJjQUSH
	ApX6NUUyf7vFxqQNpOLgCmC9fiYG7wGaB4JUrWIBENiQF8dS/XgEFZHwF/evm0/TcxXUX5DJ8DJ
	Di/nCwIcna2jnGMNs2JdQwIE56iZylwsT0RyA85FP/jw3U7wWetb4yTUjnulB2FuhyIntfazpHp
	qwVfobdJjaAJ0KB+wPWXso3vckF5tX2Qf2hQViFZxkT52hud0Jh88q92KWlrwy4wTfoXzyoRPzs
	e+hxQbN4xpt6EX7oJkdAh9zyR1GSlUi0g241rJ+rAfY643oLtNSpHAJR7gNVjqMPVEd/Wc3xm09
	7bYzg==
X-Received: by 2002:a17:907:868f:b0:b88:6542:868e with SMTP id a640c23a62f3a-b8edf11f3ecmr24389666b.8.1770327756743;
        Thu, 05 Feb 2026 13:42:36 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda7a0074sm21859966b.18.2026.02.05.13.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:42:36 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Feb 2026 21:42:35 +0000
Subject: [PATCH v5 07/10] pmdomain: samsung: add support for
 google,gs101-pd
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260205-gs101-pd-v5-7-ede49cdb57a6@linaro.org>
References: <20260205-gs101-pd-v5-0-ede49cdb57a6@linaro.org>
In-Reply-To: <20260205-gs101-pd-v5-0-ede49cdb57a6@linaro.org>
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
2.53.0.rc2.204.g2597b5adb4-goog

