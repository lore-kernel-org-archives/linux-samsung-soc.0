Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461262C21F4
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Mar 2026 06:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772691121; cv=none; b=H+qMAwtHL4o6DgZ+ASpkm9aPlaIXCmV9dBv8dZHljOIzujEGvt3Ah3ogWYbwIQ/1YxR4V91pHzQ9EgvJUc86ocaMrTWyx+stsDnnCEPm+sQ3IJfzcgoV3c0j5KBhiO+E61F2onzxq1ci3V/X8n2SQOpmUmHA87NaL80gf1JONQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772691121; c=relaxed/simple;
	bh=F1S+e9a469QdSHta0n9ziXmHQDihxHrwcFmPJNecLNg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=elT2W5YztXs7JERuJ1ptm1iO8enzC6vG9Fd2S71omn9qoGY5ijn0mSVZPpKW2Qev5DXGI8e4duPiBnw7sKpmrRTklKYApbEGJNOYjcGmesWRRapRg3Q1/H5w37YyhHr5+EjSGgWidxvT6DE2H91QdU/jOGuu5qUqA7uAjQ8Qobo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y2ayCt3J; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y2ayCt3J"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b936505e7a0so571137266b.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Mar 2026 22:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772691118; x=1773295918; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aJ65cMxmtD9hm2QF0vSs9PHPLSm4kdpoTVF35SUjEBw=;
        b=y2ayCt3JPfFX3wD2lcldptVQLlwd1cWpEDqtJQXWh9TZ44Sve3nVHsNKwCIOMe02Lo
         pu19GLxU6g+Ipkf0nfcmF1rLq+Xl+1Fvfvb5ssagOdY/QQnk2+2SUek0jYbq/on7Goxf
         fk5nUFFuh2e9fSof6lN4hD9m4md0V9qabEQJwLpALBQVOhNb2WqWWwJtr4/IjyaAF3ZZ
         we3nsfR9nZpKJP79Y0/NpR8Tt3SteBRnaQW/0UInSzug5WgCB/txTljsoBc699nmFApr
         FbazG049pmTaZYNTz9Fu3YtkBmptJ5d49Yd4Y0sP2EP0nZ3xBqmlfoWo1qUFxmUDxt5o
         wd9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772691118; x=1773295918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aJ65cMxmtD9hm2QF0vSs9PHPLSm4kdpoTVF35SUjEBw=;
        b=Em+GtJLTQGOc3K/Jwq37n24W3ltPtJ2h7V3hG7uyFMU+ELskpcE+auUCMjvqbzT7rJ
         uPx4nwXaazQs0oP0N6bnj7dQS3Vr+voDft57xeUoUoCG6HO5vK+2/bDNcVcfkqslIWwR
         S3FeQ1UhHIJqDRXZPuWfFwfo+0TH2TMm7A+6zaU1iExJL2rRol5uDJ1ImM47VHy8GyRb
         HBoLREXCYOvhd5/UKQI9j5t1GQ++5OmpM367ALTaEtkG0nFRpQWTWP/176yCDw2/TDzL
         JkAeUxGxC9VHoBK4ys1uf5r2egJlSu2YnRK0RfcWF85ooYKzxOTYTNuiBlgIcc29lByu
         ynLg==
X-Forwarded-Encrypted: i=1; AJvYcCU7rw3xCFAEeKGO/tsu+ezJs2RUxWV+Milhl+UIn+nUIcJ4i2abeCQmEfY67at4HY+1JD/tVktZ6MBUxln1Isgilw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiDNOWs5KDTNY7CWCz4zZOKGpkncT5iEJlhNIG0OQQZIQVogtv
	iSIFKLaKdZCy+JTK9TaFEL9/ceYyyltTJVeBDjw3fQxqpDuuDbUBVWYQlkvKS95Z8jQ=
X-Gm-Gg: ATEYQzyQgSdRa05viVWyMiCjug+FYnk2Ovn+5C/pQPyT5hi3NM+IeygWnO6T9N/LWsz
	XvnoH7+8EeBJJGF88+T+OsYNzS3dZZ0nSX++xh8UhyzthR9TK+MGOhMK8t3Gzk5Y/ejn5dSEM63
	tbp/MppcMbFtDiqyYeJ7SERraSUflJ3HxvKV28EwHZIotEiwqWL+JudvxcApSue2w881NCj042K
	SXFpf9taHbttwcea3Fd5yvhLMyBaTU95xISfNmVLbR6r7Avl6qlMmLpBO6X6yRS6Qj+CMNa77MW
	YB3y6K9PEK58FT2CLsXhlBKg0VrFfQ584JuggwhgWG2oPsa59q1uk9/SY4+GLZgyxrknPSoIBvS
	XLG9XLJRvqwjZ16/1BLfngl8Fq7lPiSgMhIJui498cjzkFrOv42uExAelryklS1deOY98Iq32/H
	4336fmLk81Zz2XdXPJwsm63oQ2xlSr409kOabwHDFvV2CgRTAelMvyrS+yzAsvFXP+9duiVuqox
	yQwdKC3pVntbLM=
X-Received: by 2002:a17:906:730a:b0:b93:80f3:b35b with SMTP id a640c23a62f3a-b9409e510c0mr64413966b.19.1772691117541;
        Wed, 04 Mar 2026 22:11:57 -0800 (PST)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aec3243sm849355966b.53.2026.03.04.22.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 22:11:57 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Mar 2026 06:11:54 +0000
Subject: [PATCH v6 05/10] pmdomain: samsung: convert to using regmap
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260305-gs101-pd-v6-5-8cb953c1a723@linaro.org>
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

