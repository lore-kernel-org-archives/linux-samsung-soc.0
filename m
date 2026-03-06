Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E2B37D120
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Mar 2026 10:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772793004; cv=none; b=j9zYbqyBSUbiKItvmmKkPMp3slP9ykek7/Sp/5O8HqRBD1BZwWUFe1dVfuzoS8bZloX+V4mUFughwNN4RhU23b5lv6aFpLiQ1dMSluWMBk9t3dUNqIyGOpkhwHYspedQkSTId8nypIdOiBEw1qyOKQuKmbZqu4Kq/dwgJVtSBnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772793004; c=relaxed/simple;
	bh=F1S+e9a469QdSHta0n9ziXmHQDihxHrwcFmPJNecLNg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q4mLlg6PUoFppXviNZhCpwp6z7chvV8JRfjZPfRLUuKxJDyQpxBZ/aTum8sXt+JXmM+pnaMBoWU1vKN7UjkX62TZa8Vz3VPOcG6rjG0ZxNsC+wGBxyoPOAUGuQlPIzjSuKzdca2iNdeExnr9dfTkomHcuFDeMydl+hi18LTa714=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kzh62mRL; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kzh62mRL"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b935cd1c6f3so1397125666b.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Mar 2026 02:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772792998; x=1773397798; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aJ65cMxmtD9hm2QF0vSs9PHPLSm4kdpoTVF35SUjEBw=;
        b=kzh62mRLtj6dodZ1vZhlgSbPGX37bmVRJ9S4aJLf5OcY0XT/yIq0Zv7M7nZUkUeq9d
         oL55HcptLpcKXkXX8v+PKcYlcGUj8d4Jc32Vkp6RnE0pUdyK/ClDhQrTlqeCrlBnlg5k
         NGJ8mRJGgbD7kua/AVxRU/J2CiEK/bD9umXzc4qLT05YyZLOdI2b/vpFblpofpOb5ss7
         TzF8Yso2GYDwZvgJYBM//LWySOJJGJynHBVfzOEkko/l5gdQjsJWeXiOOBVu0iE0t3P2
         7WKDx57Xu3RrvfLL6JPRCiGexNdIkK3j/duNBN1Lk9xHr4278wtjz1mO+HX7bz7DbP6z
         0Saw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772792998; x=1773397798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aJ65cMxmtD9hm2QF0vSs9PHPLSm4kdpoTVF35SUjEBw=;
        b=Hf+z4JDRqQQIaqX4F9YJNY+sIIm2uppRif7s/P800PFw9uc0qK48uOAeiZyzhxh2Is
         Qea+v8Y4f+Yc0HOArfui5vOP2U48sfxv7TdmHS5UC/V8y3AZKPtO1YT73Gj2nt7x6GnW
         2JtNm61vkMUV/Yab/1FRwzmhSacmPeIsFeOksOAr+IDQqxdD7Plnjsv+x/qZ/eIg8VCW
         NgJ7eAOeMGMv6127/2WBOrxzrP/LRUA/olZzzeQ5QOtGf89zpeUt5b6BJD1PECoYHnte
         DrLxgheBaHCT69jofrH5VuKsSKVy5xXLDDveOh0Kr++GqE4AL5KdQB40r8xQoL91GEUC
         v08w==
X-Forwarded-Encrypted: i=1; AJvYcCUUyv41ZyH0bMtpA4o8BNR9tOd75LaydSJuvL2PPF3aX96xZP0VGFVk+UQhfindOTV0u9sVE0GbqQj/IyIjel8Uwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWKfM7SgiH3M3P09pA2OMVW+DXyNLHgewQIU1suwo3JHZVF6kR
	fd1Qrb8inTu6xpwf0Z4xkKFUC7owMoEhS3UohENDoZ8zHbI014/VZlcg5dTqdMa+3VW4A6JL/Lk
	aU8UWqafy1g==
X-Gm-Gg: ATEYQzxw692AHFEfzND/bdcWmmoHt4bNZgxWxiW71OkofKrFz1zkMa+NjANTN+kJvkC
	NUhqXH3d9ik2cxplkTpS8keFMxh4E+3rK88nsGxhQPkpZEoMWgnCTXyBd+KNmezQz2Hc9zruwNy
	oX9V2SpNT4NTPJHiwyOr9wfVRsxThaoC22fN4m3B1AbKfnrS8+NZHfzQc6T6xXMW3aDHLtd1zp3
	IFwYRwcKXJW37I7bC+p/BKWXpGqAJc8AJb5/1SLyJDzQdltkfFnUt2LeQvTOTTU6k6hlVc1bmBc
	crGI4XN8HEjVVfz1pr8p+sa3yX51DpF/rpQ/FAcCqsw7lizXGc+xDcPY4Y1k6hD6c3VRWA5/jiS
	fE3J3jLiwOPlj37rp9QXvHlIfou+dFqfjDnGq1/RTHswduaerVeSK3DPp2veF7x6rylv3DyDrz/
	704zXonDtLciRNqur8QpqzNDBgwUE+bpsm9M0UuVhGtTVA8Jau4/BoOMpSss7LzKC+aVfzIaAf5
	aoqFr95jUnxH6X+Irq2FQk5JA==
X-Received: by 2002:a17:907:6ea6:b0:b86:fca7:3dc2 with SMTP id a640c23a62f3a-b942da71fb2mr86532966b.10.1772792997560;
        Fri, 06 Mar 2026 02:29:57 -0800 (PST)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef8c95csm42907266b.21.2026.03.06.02.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 02:29:57 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Mar 2026 10:29:56 +0000
Subject: [PATCH v7 05/10] pmdomain: samsung: convert to using regmap
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260306-gs101-pd-v7-5-03f7c7965ba5@linaro.org>
References: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org>
In-Reply-To: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org>
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

On platforms such as Google gs101, direct mmio register access to the
PMU registers doesn't necessarily work and access must happen via a
regmap created by the PMU driver instead.

In preparation for supporting such SoCs convert the existing mmio
accesses to using a regmap wrapper.

With this change in place, a follow-up patch can update the driver to
optionally acquire the PMU-created regmap without having to change the
rest of the code.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
There is one checkpatch warning, relating to the non-const
regmap_config. It can not easily be made const at this stage, but a
follow-up patch allows us to make it const and the warning will go away
anyway.

v4:
- rework the loop in exynos_pd_power() slightly, to not return 0 early
  to allow more code to be run after pd on/off register write without
  changing the loop again, required for gs101.
- add error message in case first regmap write in exynos_pd_power() fails
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 83 +++++++++++++++++++++-------
 1 file changed, 62 insertions(+), 21 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index 5c3aa8983087..3bcba7d38ac1 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -9,15 +9,14 @@
 // conjunction with runtime-pm. Support for both device-tree and non-device-tree
 // based power domain support is included.
 
-#include <linux/io.h>
 #include <linux/err.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/pm_domain.h>
 #include <linux/delay.h>
 #include <linux/of.h>
-#include <linux/of_address.h>
 #include <linux/pm_runtime.h>
+#include <linux/regmap.h>
 
 struct exynos_pm_domain_config {
 	/* Value for LOCAL_PWR_CFG and STATUS fields for each domain */
@@ -28,7 +27,7 @@ struct exynos_pm_domain_config {
  * Exynos specific wrapper around the generic power domain
  */
 struct exynos_pm_domain {
-	void __iomem *base;
+	struct regmap *regmap;
 	struct generic_pm_domain pd;
 	u32 local_pwr_cfg;
 };
@@ -36,31 +35,42 @@ struct exynos_pm_domain {
 static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 {
 	struct exynos_pm_domain *pd;
-	void __iomem *base;
 	u32 timeout, pwr;
-	char *op;
+	int err;
 
 	pd = container_of(domain, struct exynos_pm_domain, pd);
-	base = pd->base;
 
 	pwr = power_on ? pd->local_pwr_cfg : 0;
-	writel_relaxed(pwr, base);
+	err = regmap_write(pd->regmap, 0, pwr);
+	if (err) {
+		pr_err("Regmap write for power domain %s %sable failed: %d\n",
+		       domain->name, power_on ? "en" : "dis", err);
+		return err;
+	}
 
 	/* Wait max 1ms */
 	timeout = 10;
-
-	while ((readl_relaxed(base + 0x4) & pd->local_pwr_cfg) != pwr) {
-		if (!timeout) {
-			op = (power_on) ? "enable" : "disable";
-			pr_err("Power domain %s %s failed\n", domain->name, op);
-			return -ETIMEDOUT;
+	while (timeout-- > 0) {
+		unsigned int val;
+
+		err = regmap_read(pd->regmap, 0x4, &val);
+		if (err || ((val & pd->local_pwr_cfg) != pwr)) {
+			cpu_relax();
+			usleep_range(80, 100);
+			continue;
 		}
-		timeout--;
-		cpu_relax();
-		usleep_range(80, 100);
+
+		break;
 	}
 
-	return 0;
+	if (!timeout && !err)
+		/* Only return timeout if no other error also occurred. */
+		err = -ETIMEDOUT;
+	if (err)
+		pr_err("Power domain %s %sable failed: %d\n", domain->name,
+		       power_on ? "en" : "dis", err);
+
+	return err;
 }
 
 static int exynos_pd_power_on(struct generic_pm_domain *domain)
@@ -109,8 +119,18 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	struct device_node *np = dev->of_node;
 	struct of_phandle_args child, parent;
 	struct exynos_pm_domain *pd;
+	struct resource *res;
+	void __iomem *base;
+	unsigned int val;
 	int on, ret;
 
+	struct regmap_config reg_config = {
+		.reg_bits = 32,
+		.val_bits = 32,
+		.reg_stride = 4,
+		.use_relaxed_mmio = true,
+	};
+
 	pm_domain_cfg = of_device_get_match_data(dev);
 	pd = devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
 	if (!pd)
@@ -120,9 +140,26 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	if (!pd->pd.name)
 		return -ENOMEM;
 
-	pd->base = of_iomap(np, 0);
-	if (!pd->base)
-		return -ENODEV;
+	/*
+	 * The resource typically points into the address space of the PMU.
+	 * Therefore, avoid using devm_platform_get_and_ioremap_resource() and
+	 * instead use platform_get_resource() and devm_ioremap() to avoid
+	 * conflicts due to address space overlap.
+	 */
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return dev_err_probe(dev, -ENXIO, "missing IO resources");
+
+	base = devm_ioremap(dev, res->start, resource_size(res));
+	if (!base)
+		return dev_err_probe(dev, -ENOMEM,
+				     "failed to ioremap PMU registers");
+
+	reg_config.max_register = resource_size(res) - reg_config.reg_stride;
+	pd->regmap = devm_regmap_init_mmio(dev, base, &reg_config);
+	if (IS_ERR(pd->regmap))
+		return dev_err_probe(dev, PTR_ERR(base),
+				     "failed to init regmap");
 
 	pd->pd.power_off = exynos_pd_power_off;
 	pd->pd.power_on = exynos_pd_power_on;
@@ -137,7 +174,11 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	    of_device_is_compatible(np, "samsung,exynos4210-pd"))
 		exynos_pd_power_off(&pd->pd);
 
-	on = readl_relaxed(pd->base + 0x4) & pd->local_pwr_cfg;
+	ret = regmap_read(pd->regmap, 0x4, &val);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to read status");
+
+	on = val & pd->local_pwr_cfg;
 
 	pm_genpd_init(&pd->pd, NULL, !on);
 	ret = of_genpd_add_provider_simple(np, &pd->pd);

-- 
2.53.0.473.g4a7958ca14-goog

