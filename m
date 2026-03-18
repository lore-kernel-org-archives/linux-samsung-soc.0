Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB653E51D7
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Mar 2026 15:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773847693; cv=none; b=kHNf7gKs/GbOqyl1sWnCwFp9M/29sxKLU62nVE1CwPMxAwIbecUcfJ4rt1M3PI1pRlIvzNtyydCypnyyze6LcveY4QlU1bz5/dVinKjuXOMfBG651WNjETxVhx+hw/aigAnJ6fmm4PBaezEyz85ZMgRqrebKuTg3bptQ6S6x78I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773847693; c=relaxed/simple;
	bh=UkTCfc6XZM2Ar1gydVKi5SOEwg4Ph7SOC1EYcnOcfC4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IubbgnCs1AIK1emhoe9WGoqh8AVtyECPmot07UYjDTcqbUDqIgRefV+j8VOHO3Pr8OKpO8O8pUUGPLll2oG3/KRQB9NnRHqbc/bb0Jv3ZesEtRCSPamA/CCFjDPp+jH763qitkcdQdOD9Z8pDiFiVSMrJRSjlTCO4prfzwGncVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zttRsLUH; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zttRsLUH"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b9793fa5371so569662366b.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Mar 2026 08:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773847684; x=1774452484; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cLahL8mmAQrPbIGTcTRAY4s4CIuPNd3v6Qz0S44aYi4=;
        b=zttRsLUH3tXyV2A5jd/Pl9ynVZ+cY7dd1FefnrmywgllXYqyRp2CCDCNXg/ddhQ1jr
         h3axC8miEzCn0uPaoAt7kfGrUppvHBDGzF78/X+5Iyd3R3RDWPWoWvgL3jQ4tx/eYrSl
         /3IInzOygclkCsgw9wVHqSAlZS6MPnr5fNdxnuq4VU6XWztuG0JJrc7Xj9ZlQFfYFlcb
         C+9c9VXbtjhLcmzWxzpB7+Mgk8P/ceSLTPkjiKq1oE8HZd7aZwHVWIvbBljpdJUATl72
         iAAHpVxMop6ThxQHYgbNLAxNryl8a0zqhqBka6qiBU64wo1RUHUdXujh5f2sDLl5sTmw
         oJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773847684; x=1774452484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cLahL8mmAQrPbIGTcTRAY4s4CIuPNd3v6Qz0S44aYi4=;
        b=a3c+lcbirCJlsV/ztQLgSZcpo7SDzIJ66a3RQfEdByA0iyda8RtfnwJD1inpEbWb0f
         rEomnH5Og0emcZsE6DA6pt9h0/Pav1KVY/LGuOceirYQlZVEpd6GUxgR+t3R+W1sRelE
         moQuhxcjFSHjwfyeIClbPmxCeh9WPdESIyZpfGlgg+CRwrKdVkAjQGZ3oaD7AYx7iJ0N
         eGRPFiLiR6D8uwdpyDRa/7NMZt7nd6B0zsQo6TNue+2OGVBsT+RCOhawRZ/22gPX0XWv
         uUp3aWe0WeoTlBje2DNZv1W6dhRtssJBpGFnqGm26JuDQu1fzt1I3FQp6UUy04qmhq45
         3unw==
X-Forwarded-Encrypted: i=1; AJvYcCX7iNR7rxRv/gh7QQmO/OVgG0DjBURGsx66fxffzvv+GKUFbF88W42/j33uYuQ+TzI2g5PQpRRd+8HwhF9gYny4bg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yywgdjm6787dnyrpzYhv2tqE9JP6S1dFQXBu2RJbYyounZnVRRC
	IWL3JcRepeHx1pMECZh4/7t0j3Qt25nqu09+hSG0nyphQpldyinHYAFKoBQgqQaRqWQ=
X-Gm-Gg: ATEYQzzErW1Zjm+WXhDAZWuUiKYhxaQKfaJ+fPU2zlAZ+SyoQLN6ZHsvFEuhtWC/2Dr
	1wHnn74jMulMoDMvEyqcZfX//908W9lidXO3Uy9STOinas7NR3NqPcDxYCCn0VmQ27vM1SGiXGy
	pAUFBd5d9HrwgBMq/HIRaleEQW9koXGhHcW8TJDn/chASo4RNnFCbSx7nqo0o1RR0B80t64uasV
	jSwqoshwzN2cRqKm1gIgMmx5wqcKOY5hxQm5gox8rrgPNqFunSfeANFx0k1uhKxloiacEzyR/9A
	bCQYPCs2A33DYIwJuzj1WOSaM6J5SbcFD87pKcNx1Y45EXJTiqVIT+o8yWlqq/r58MU7CibzYFl
	aH2y8w3e8EuRovdTloJlaD+0S2zxrvQ4meHMsT69c09pF+H9hCEolpmhMit0PtpiXtDjEZsMkPn
	qQqyJVkSob521qTqAD8f/dzmyfseJgN4jQ6FMpr2sFbeajh5IYL5feLYRnj/s6v2HGw0b91XAHf
	B5vMb3IQYXlzH4=
X-Received: by 2002:a17:906:7f13:b0:b97:f12a:3f8c with SMTP id a640c23a62f3a-b97f493e995mr155819266b.20.1773847682553;
        Wed, 18 Mar 2026 08:28:02 -0700 (PDT)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f173a3e3sm226989566b.61.2026.03.18.08.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:28:02 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 18 Mar 2026 15:27:52 +0000
Subject: [PATCH v8 07/10] pmdomain: samsung: add support for
 google,gs101-pd
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260318-gs101-pd-v8-7-241523460b10@linaro.org>
References: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
In-Reply-To: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
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
X-Mailer: b4 0.14.3

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
v8:
- Update offset calculation into parent regmap. DT's ranges property
  now properly denotes PD address space to be an offset into parent
  node. Change code to account for that and subtract parent start
  address to get the offset back.

v4:
- add 'use_parent_regmap' flag instead of going by 'syscon' compatible
  in parent, as it's not a given that the parent provides a syscon-
  compatible regmap (it actually doesn't anymore after recent changes
  on gs101)

I've still kept Marek's Tested-by from v3, as legacy Exynos code
doesn't change.

We need the offset as we use the parent's regmap.
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 74 ++++++++++++++++++++--------
 1 file changed, 54 insertions(+), 20 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index 3aba00b9ddef..f8c0d11e9b33 100644
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
@@ -143,25 +145,57 @@ static int exynos_pd_probe(struct platform_device *pdev)
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
 		return dev_err_probe(dev, -ENXIO, "missing IO resources\n");
 
-	base = devm_ioremap(dev, res->start, resource_size(res));
-	if (!base)
-		return dev_err_probe(dev, -ENOMEM,
-				     "failed to ioremap PMU regs\n");
-
-	reg_config.max_register = resource_size(res) - reg_config.reg_stride;
-	pd->regmap = devm_regmap_init_mmio(dev, base, &reg_config);
-	if (IS_ERR(pd->regmap))
-		return dev_err_probe(dev, PTR_ERR(base),
-				     "failed to init regmap\n");
+	if (pm_domain_cfg->use_parent_regmap) {
+		const struct resource *pres;
+
+		pres = platform_get_resource(to_platform_device(dev->parent),
+					     IORESOURCE_MEM, 0);
+		if (!pres)
+			return dev_err_probe(dev, -ENXIO,
+					     "missing parent IO resources\n");
+
+		pd->regmap = syscon_node_to_regmap(dev->parent->of_node);
+		if (IS_ERR(pd->regmap))
+			return dev_err_probe(dev, PTR_ERR(pd->regmap),
+					     "failed to acquire PMU regmap\n");
+
+		pd->configuration_reg = res->start - pres->start;
+		pd->status_reg = res->start - pres->start;
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
+					     "failed to ioremap PMU regs\n");
+
+		pd->regmap = devm_regmap_init_mmio(dev, base, &reg_config);
+		if (IS_ERR(pd->regmap))
+			return dev_err_probe(dev, PTR_ERR(base),
+					     "failed to init regmap\n");
+	}
 
 	pd->pd.power_off = exynos_pd_power_off;
 	pd->pd.power_on = exynos_pd_power_on;

-- 
2.53.0.851.ga537e3e6e9-goog

