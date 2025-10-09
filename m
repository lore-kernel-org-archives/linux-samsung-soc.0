Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356F11EF363
	for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Oct 2025 15:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760023514; cv=none; b=ULecHJxhKbpBhqdnHO916n2rGe/CaaoJIsbLxsutEVGs629T6HO8B/KF0U6K+UsXe8+CsAzAiP4rUleYXrZKHNYPSlZrpXSOsK9YJhh4WMcBXzzWGP7VQvlodkkGZ7PgcWrOQ3s4q6Dw6hQai5VWzNW+/MyPHjtor0FunsySxW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760023514; c=relaxed/simple;
	bh=3FiSxcQQlSfwdcy42EspcUABD4qqt6ntMqcPQwZX/Lc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Um+tdMmXecuNbBWWrr5nDHXrbpW5sYqj9bYCRUIKLm8wFk3AHiQo3rUGucVzPyjG3ocKbOR5VpAKIpCx22+GzdZtfxHc/K7EE8XOz7jSKYMHg+qNNrbMPuNu2e8j9mxo9j82DM3ZkSMbfOU34pHjkKoM9U3RtUkLd2Y9aq5y13Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u42Fu7Mi; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u42Fu7Mi"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b48d8deaef9so193983366b.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Oct 2025 08:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760023508; x=1760628308; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6uQKQdQ1MYiF5juA60OL7pKbQX2emtwofvg1/NDrBMs=;
        b=u42Fu7MiXeXcwRP+fEqSGTt3m9u4bQL76/FGZOOOWPOFFM+StzXt+6Pa0yWpq01Aif
         +MKzIxQ1NXkTFgJEuHSomr8lghyTEXXoAajKUWGeVsRM+9OFRxkJSvbxexcDK9mT8dEC
         uaZp4N8KWCwVcFNDjvNNuizZ3KFf5VtLpJYZJfbFPRbKbjga+9s9ZS/ouY6w01zNHO2n
         EKq7NB8uoUuzYlo4hnm+q3PAw24eNF6qhapQLKSV5HEOxXVHI1L2UtHo0nl8czkMlYcF
         2oDMAaZVt7lyZUcpnPhWLbghB9jUIttxMCkODtJdEnsclPGb1JJpitsMuaw6UFW+8mb4
         yskg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760023508; x=1760628308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6uQKQdQ1MYiF5juA60OL7pKbQX2emtwofvg1/NDrBMs=;
        b=hhxSEI7b2az+2v7dwbORDv/XriOgqqReIyl9n+BCpj2l3LQucIZhUxeaRPyJa9jyiB
         kM1EypuHeCqrEaFqgGT512uVXSsuO1RDqPF9hEoC3Ei4HwKe5Uj0DtD3UkzhBgvIPBb1
         W10CC70xARgpnLIxC37IJCkIV5MQS5DfHHR4L6dIeMBMP2Og+/zOwZP97RNV9TL+vo9u
         d6cuBAbj6wUEps4XtyWfNxUc69PevUk6zuNK49USU3+s+RIK/kp5oHnV1VEP0axVuMDR
         7WDdkjbdZfy37Yc9QoB4glcOEiupcxvxMSVPdfW/pwe1tGJKloxEXmzjaxnVUG8gSo7V
         zl1g==
X-Forwarded-Encrypted: i=1; AJvYcCXgGRTCGxUZ7EfQy1kIz1xNGHzw6ahb4wAbqSLeyo5fx2OPpvxBVDRxG/6mQdFR+a7fgRzXwrI0vtaw1oltmuljBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdQ8WnGAETGM485rp+fXPpJN+75H+gdw9a34hboU1NgHQ1ehW0
	RGtSX9no3Ze/i0zt9zNtMyMNySupFXfJHga7RRjO982Kj+U394zW8kT59rwYDGYcK0c=
X-Gm-Gg: ASbGncsqKDNg9vOoB89oNMcj6xb7UhUoTaFM6NJ73r0Qi6v64OhbR9+7hfzabLkkJDZ
	U8Dvyt/mD+fQz3fDCdTAQy9MCR8Eza7unj/DHGVH6F5D/nPtQa3gbsEmnZcp+7hYfQ0qCJd8fU1
	EKoKj0p0b077/PXMINyk30AZ5+VytrKcmkNljgTAuoB8vx5th1aC86Uss9fNcoQFE1mm9vt32qf
	pTPdis13pNth2bDPxZ1vHHTUGTbXI06+yK/pQputjLqrsyzNH1iaj7nPE88zFcXLPmshm7ZQKpI
	R7d+6vaG3dTSF7GvUaX1abk45asFwo3qgTOqbQikizlKSYMGwuR217wxS7GA82nt5mLKx5gA3YX
	11nGoZjHu1LKw3qTBHQTDuvpiL+RiXme/TW3OxqwiCEINpC5iafxY15h4ix86wpKZfCi/Qrrj/i
	QzOOuge7I1ALA2Ud3NyS32RML+rda0NYu8PACK2+4M
X-Google-Smtp-Source: AGHT+IGnZBRhQiVL3K77bERhMVDqgbMpxbRqX6c+qjhP8qmTDZBZaNH/mZYsCBi4KHpMR5tC0seqCQ==
X-Received: by 2002:a17:907:7290:b0:b45:a03f:d172 with SMTP id a640c23a62f3a-b50acc2f5bemr911916266b.57.1760023507942;
        Thu, 09 Oct 2025 08:25:07 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b36fsm1908967566b.62.2025.10.09.08.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 08:25:07 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 09 Oct 2025 16:25:07 +0100
Subject: [PATCH v2 05/10] pmdomain: samsung: convert to using regmap
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251009-gs101-pd-v2-5-3f4a6db2af39@linaro.org>
References: <20251009-gs101-pd-v2-0-3f4a6db2af39@linaro.org>
In-Reply-To: <20251009-gs101-pd-v2-0-3f4a6db2af39@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

On platforms such as Google gs101, direct mmio register access to the
PMU registers doesn't necessarily work and access must happen via a
(syscon) regmap created by the PMU driver instead.

In preparation for supporting such SoCs convert the existing mmio
accesses to using a regmap wrapper.

With this change in place, a follow-up patch can update the driver to
optionally acquire the PMU-created regmap without having to change the
rest of the code.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
There is one checkpatch warning, relating to the non-const
regmap_config. It can a) not be made const without resorting to having
two copies and copying, and b) will go away in a follow-up patch
anyway.
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 78 ++++++++++++++++++++--------
 1 file changed, 57 insertions(+), 21 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index f53e1bd2479807988f969774b4b7b4c5739c1aba..383126245811cb8e4dbae3b99ced3f06d3093f35 100644
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
@@ -36,31 +35,37 @@ struct exynos_pm_domain {
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
+	if (err)
+		return err;
 
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
+		return 0;
 	}
 
-	return 0;
+	if (!err)
+		err = -ETIMEDOUT;
+	pr_err("Power domain %s %sable failed: %d\n", domain->name,
+	       power_on ? "en" : "dis", err);
+
+	return err;
 }
 
 static int exynos_pd_power_on(struct generic_pm_domain *domain)
@@ -109,8 +114,18 @@ static int exynos_pd_probe(struct platform_device *pdev)
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
@@ -120,15 +135,36 @@ static int exynos_pd_probe(struct platform_device *pdev)
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
 	pd->local_pwr_cfg = pm_domain_cfg->local_pwr_cfg;
 
-	on = readl_relaxed(pd->base + 0x4) & pd->local_pwr_cfg;
+	ret = regmap_read(pd->regmap, 0x4, &val);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to read status");
+
+	on = val & pd->local_pwr_cfg;
 
 	pm_genpd_init(&pd->pd, NULL, !on);
 	ret = of_genpd_add_provider_simple(np, &pd->pd);

-- 
2.51.0.710.ga91ca5db03-goog

