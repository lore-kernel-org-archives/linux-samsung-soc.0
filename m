Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E341B30F950
	for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Jan 2026 16:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769616662; cv=none; b=oqekAcPn0EbLIRD/B12pQgVADhoF8Wi41FuBDwBJG/N3tP74AhyXisS8fID14Te2SSAWt7QJbJQ2ArPLOmnmIahKfMWxwL21Rj2KxjbrG5sP+FKnR7Kt3p6RGyjveNfp0h+EFjSsH10aHQ9dJXHFQtlWLlBmHqyLVcWXnIneG/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769616662; c=relaxed/simple;
	bh=1cbyw29+xdi8VXIGles1S+s4A3CgVUMNo3a+m/ox1qA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lrh+D7Bo7O00+PWf7iDv7tZPkgK9xMfU0Z+kAVROh+VkUFJey54u+VpWPymOci2aKwBGhwVWGzelP7uaR+YDiJhKC8hVGXGpfMpiSNwXFVxL64FqwU3vl3XpB0agoVMOVpCOSvdr0YzK4osEtEpCXQqFmseLhBPJXk8+qPxrCqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MQF3g+JB; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MQF3g+JB"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6505d141d02so53767a12.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Jan 2026 08:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769616656; x=1770221456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hrnmD1pfTiX6z7osCVBlK0GrbNSN19fk3oj2Jxgvus8=;
        b=MQF3g+JBp6VjcnE4HMLsJN7dD1HTRVVUvzKaIiNw6nxWtQMcxlc6e+hoVf7MPOaz42
         Cn9gr+6b6POJSD2CDTNnHh1sNKCSv0sNJIECFegrpHvlw69OW2ZW8NUwZnOF6uu+X5IM
         0iPDlTodmsAsO1KMo5fdkv0upNHgLT/MF1OLswBWwbRdsaTZw8pIvIJPm6/PWXkaZYMU
         OPIcFIRxQAK3EdrwAmkZ+YpzFZrVyQTs9/WV/2HCVX48ZTx8uXccA0nle6UzldmA1VPT
         9/GYcth90FSZ6kYPQi/mOh0wgNqZIqpuc+wiNvOr0QqZUxk39FqbmJWIaXYquHeG5P+r
         xPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769616656; x=1770221456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hrnmD1pfTiX6z7osCVBlK0GrbNSN19fk3oj2Jxgvus8=;
        b=LULIaiY2VVpOwZZhqDX2B77vWyWdbbxzjMHiJQU6ysbAGyGkvHu+GphhtCI+srDNfq
         j6DxMlSve7wCVf4wSc8D0IXMQXBIyyS+9sGXJRmB/Qb59Dbvvu6OFFnTkohmQx6oRKs/
         1XK+xwlh21Mkds/Vki/so/yFHhnTlxvYbjEolgQDugu0OMEMq72hKcZQSCXCCXSb3663
         H1Z0nvXPkH5MAQfYDF5Cvh5iUSLgvbcKXFgNhRPqFgAVkLuWjSb65FTfegS/s3mZAP4e
         drfQEa7Q4m3xDYTagYGZtUkrAjvzezNVpou6SpxzcOo8+mRtkxcZiTJsoM9ZmoA+Sk16
         DkjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjtRe9m7MP1kjQshcXDktgcGYGvjSWQlt0NgPH6+PN9teOTt5LHKTSVSvSc88Gpr2nf6tZCy0g66dqWv7iYeEtQw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6UZG+LrjUiyR1o9J1NN3kDWE5y7NFmZkuqv76YCeSTNqOY6+w
	X7EyTLMpGHjtOaJsMwzMdwmM5RrLQczeUKvYhsO705tuCVT+p8Ir+f69tPcS34iFJmw=
X-Gm-Gg: AZuq6aLCLx9vLx+asA8AcG0CNX8gesf8qHCEl7E6upKnZPwX1JxNKFtt9EMmE16ILRR
	3zjRSGz3EAKNy1YSdzrWJBRqYXXsfqT4Ajr1R1RZxKZIL09NLLSLWpS2aCvLwG7Ex0ecvT6A4er
	eIF0oYsTZw/GOf1Dnqal5agxt0fkahS/8XqgvW6c46HmXIjLXS9SNH1IPR+O96pPh7KzYUWs6hI
	MJoC8GaM6rV5wbF3Gi6rHB0U5/bezJ86qxINMGmqc4mWwHmLS27DQ8/OzV23gg8MXghCJnhz+6u
	q+7WjXL2PbPVs7lU/ioBwPMDqLSreTbfDmcTAYc7b4O+pumD4DKpTmQk3ep0swhQULKZdJG15cJ
	P6U3rNr0sPjcanqBclgD7RsJ+d3FUgp6+89IsbeZayB/mrb9w1NGIwt1bbvBlxhGnhDyiXAHUwv
	rlvgHO+QvAYcsYh5WvWPnZdX2kOhg97h8hSvHaE1JmAjK3m7nxp8mu43XkUVx05+j8vfw0P2itf
	NljdA==
X-Received: by 2002:a17:907:7207:b0:b72:a899:169f with SMTP id a640c23a62f3a-b8dab10cba8mr453205966b.4.1769616655855;
        Wed, 28 Jan 2026 08:10:55 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1c021fsm148553366b.49.2026.01.28.08.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 08:10:55 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 28 Jan 2026 16:10:54 +0000
Subject: [PATCH v4 05/10] pmdomain: samsung: convert to using regmap
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260128-gs101-pd-v4-5-cbe7bd5a4060@linaro.org>
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
index 5c3aa898308793d424fb761c58ca01ba2580aeb5..3bcba7d38ac1572ef4bc2f4052c904dd6c4a7bfd 100644
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
2.52.0.457.g6b5491de43-goog

