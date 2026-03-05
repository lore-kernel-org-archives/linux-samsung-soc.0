Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8C02D9EDC
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Mar 2026 06:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772691123; cv=none; b=rOMikb2V5FDjEvdA5edXHJVRXWdY06lcee0lL9ORPdL/bhZz+Mpf/n29mOsxebM1HyeN9uP9gd53QzZERosGjm0kaMZz/QVljUnLL8vZwO89n3qZ+9wJzCPuNaBHU7GDqf1z0jQKmNvjsiqmLOopfgPAqreobvHof6V7jvt/piI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772691123; c=relaxed/simple;
	bh=0U4HtqSeHlGrJn9AJ7ErQ0CtQcraLAhfSS8YefF1XM0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aSrbFOkN6AkTtBlntbV06QZpIjdXMSVPgcoPqIYTKMnnbpmIRg+dG/ojt4BEDqt3KQzjBnSWtn/Q9Xb/VNgYfyme79aEzj8B7cjQHmLLpmC19L0/QcSlWTUO7SHM+aHcOOFTt1hPrFFtBxarDY1qySZ6BwzYNv3Fdz2YzVwtw8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MumPSCyi; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MumPSCyi"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b9358dd7f79so217821766b.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Mar 2026 22:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772691120; x=1773295920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VJGr1pYRHm/J99djTiuPZ983bNSUstvUPO/CtwCwtA8=;
        b=MumPSCyiIIGFBv3kg1V87YDaCD1aff37dN1kN1S8195p2Xn4a+d88P1PpZq0tT9UXT
         1ZQvR+5qx61vBHI2iJf33z+UP999MH8Sv3EWepaoX4TcOoEj5+USVR2P7FKDfoKcGZ7h
         Q+QLftigKtQBCFH6/c6fT4zxc9zeXcPEeMlrUfCjiT9WQqbM59V1hs/tTkU/zujle8wy
         Qa9LQwxZvubO2mAYzrOa3po6l/7x/7SFyJKVimo4WTo6HmeZ4TH0bftrn0vnznIc6iK1
         0/8LmnrvehLILbFcMgjZgZFQYBIuruCG1JzXbZhChgCw/zjDM3iUP+Acya6BXf6lZN9g
         dRew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772691120; x=1773295920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VJGr1pYRHm/J99djTiuPZ983bNSUstvUPO/CtwCwtA8=;
        b=iekS74gvSU1Jv9plkByW5lHn5+cRevJcD966qkeJAkBsXFqfFl/Sb4MzUtnls3bC6P
         DsVW98r10EvjQzGbpAIXSMW+kBih848y+H1m1T15D6aV9ckuNE+xjXG06NiASzPAcxy1
         +p/p+8yxPLyXk/7fteMc395SQU9WK8ygQ0FAe69oB9eO4TPNnYUCwSdsoJ/RxmzORwPY
         5mOLJl9/0L3yhaT4lvZbH4DkYZ/in8s+H1Av0ZuZy1E/j38bU10Hms4bFn4znMW5NOGK
         yPaAKojpOihRRvPMNKdQnqGsvq0fCdgTJ6SSOrQj7Rt4oeqXf2Xwp3UO871AcUU+S3yx
         Dyxw==
X-Forwarded-Encrypted: i=1; AJvYcCUeYUp4o7ipfM4UPIxWbSerOwTQlf1qp7ELSuRu9G8CwHioIza9a+SLHnVLsyMaTe1XOihpYDGaaC5DGCRynigBlw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9D25fd/ua/bztpSEo53FstLvVr0AOUjECIBZal+k+MsovAYMn
	CTbZsskJfBQjM4f9EOs56A8lu0Q9y0nGDh4mV61J8xeFm15o5bk6UpxIl1OTRUTffoo=
X-Gm-Gg: ATEYQzzGWB5crfwoRKqine8Z1+zY5BoEmmH83wou2GZFf+6/G7qi+/0siG1txAqjPsN
	ZBkl/G46O3Ujg1s6jryHQBRO/I0qXTKt86UToBF9yUlu5i4wO8Vx4E9/+WhuoaekNxVpnU67YuE
	8NtoNkYNXG4fa5QAtyjlcx51bTRny12YiE3Xa5hEoW/2NFlg9IeYgGCXDaexf3j5XrsIBZUrg5G
	OzAMWcUWpKWe+t2+/JG1E80EM+Lg8rTfFts6I5ivoe5seQ9hn0uvICxWoThDb04IdZ7zGHRgUJl
	7ozjsHYrkHzz+gcc4hnYvO5KDIDPDSlufSW90/ZJfBSDpczWkAQlF8QVd098E1NLJpjIygNpjcE
	hiffJE3Oz69Ala9TvHU19EN5DpBZpEfqA9ZNc22Z14OM7aB3DSZqXKh7Yg2bxz+WUgmFTeqZaa1
	i3ZHwcMqIBwRKnGz5BCgnE+qItKNRc8DPaLKYf+/QhINCso6UfI6UszesUBZFO98Wm5IeYx799x
	nFCRJ03TtKUiaQ=
X-Received: by 2002:a17:907:2d87:b0:b88:5158:d106 with SMTP id a640c23a62f3a-b93f154b56dmr291262066b.52.1772691119766;
        Wed, 04 Mar 2026 22:11:59 -0800 (PST)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aec3243sm849355966b.53.2026.03.04.22.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 22:11:59 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Mar 2026 06:11:56 +0000
Subject: [PATCH v6 07/10] pmdomain: samsung: add support for
 google,gs101-pd
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260305-gs101-pd-v6-7-8cb953c1a723@linaro.org>
References: <20260305-gs101-pd-v6-0-8cb953c1a723@linaro.org>
In-Reply-To: <20260305-gs101-pd-v6-0-8cb953c1a723@linaro.org>
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
index 8df46b41f9bc..2214d9f32d59 100644
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
2.53.0.473.g4a7958ca14-goog

