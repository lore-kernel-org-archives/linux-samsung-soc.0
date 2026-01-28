Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A02313E03
	for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Jan 2026 16:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769616663; cv=none; b=OeSOFAMal3KkAuaRq2/3C0xuitNnmzyHXmlfD8PLMgrZe1BAQpKknpOKLVYIjjY/5w7NSy3W+FweKpLQ3Om3gA907Lnp14EQUYu8FQpdoKwrLgerAxFK6Guu42lXiABpNYOYTcG+xiieIiAYRjCx7aLoF+kt/ZiLKGlB3wBQ/qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769616663; c=relaxed/simple;
	bh=t2PVoqEhqZMJZC67I3W1iuIM3JwoW/UJ4k6IbMPc6/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZzfF9EyoFCQlhgao1hLszNKY79kG5nJScTcRSXOpKzgEdPDa5rm2M2cqSg3IP+vCcrrIixzqTC0Ltt6VdS4aPbQ9LOswWkHlPqZPnGmwM1uHd6l+I1UDcJ2X6xN8OIfnIRqLwr/F8lw3dFG5iN6mPUgycGOYTPHfi/acPB+9nGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i36qBX9Z; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i36qBX9Z"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-658381b28e8so76938a12.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Jan 2026 08:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769616658; x=1770221458; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mLy2uL/FtYE0GEpGfFAeMw9BLXBDMwcv0NDa1wsnuec=;
        b=i36qBX9ZCm4UYSDy3nAO1ZgaU8uTJhDvrQxW5TpHFRsK9BuzqjTx/sgAdym/2GmPrO
         VzigOhwMLa6AOQWvdBFA3sYCv9PYjOxgtmYF5ngPiyDRkbrmKQRQ24rUCrDr/67aqdfE
         E8GE9JSNLvJ6NNdAfvZPV3kys8pawHvTkBT+c+4y8zRPYuqwAQVFYFPhLoLUynkMtdR8
         pBONNAssteMPC/7tSHN3qxfNw1fvifxo7Jooj0JouXgLQkVDogccWZvJAslFbkIUnxAi
         uNa345TczAeNMn3zDYKYw3sDRIo4Jo2D+01wQZ2iD50zH/VAs9s3WVfaaG/KQoDUBSwl
         1DzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769616658; x=1770221458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mLy2uL/FtYE0GEpGfFAeMw9BLXBDMwcv0NDa1wsnuec=;
        b=KquXetZzCcZ0z+TV8FDMNLGZwu92DiVYvie2XwslluaM+hcR6RDvNEK+w1AqAHayWT
         fY0OshPhOQIs9sWvF/nfHUJb/jcr2j9CX8FLpa/GXPaup3T7Ao6ANJFiaGe5Ei46UXYy
         GQHz0L7CE0p8JLYrVQcWodD5zBpGgqgGzBe51EafMkYco9DmArUZuL6a4iVAIbANUr9j
         UELtrlPSVVaGzifrA5Gge9NSJ0KT9PpaBdrwl73DqYxAgzWfjqNwn5qY06tmDvvJhjSb
         mzT4RmQUYhBZOcUaTAAd1viO6uNh/9qDwc1BiuAkMyaOr6EY/aKSa/XGVJ2sDMao4j15
         RUEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsL37RVYLcrrT2kcc4NvfELn//ONPPMvxszaPCIH2jXSPCRXQ8yHK01s+263N30KpmTDpmraC4Gc0J1nPyktDV7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdW498jNax5fcG4+fspSYfw2JcxdZagjqHbfbW3Lzv3QVeXxsE
	2l+QPUo1OtWu6XUUpl8ABX7SYm4m8HnuVIeW4xsIg/T+qeOsPR7gNTKeXAGYEbq5woY=
X-Gm-Gg: AZuq6aLh6dIY3RHEYicAe+eJ2W+ubE4IRxE8prKd2brJ6l6kR6indDC62ZNYjn6JjBT
	r9YrQk3gl5Pzc62e6nI+5oZ+N/th2a2MQkLCsmOOgQ65H2eH6+He5J6H9SwBsZk1geG3Fh/tOXs
	LMMc5TfIN7ip38tcCMB9jByLvcE1KGMZ6Z5MBqVFSjqWJL8eAtr8PrulAgNN2DLaY37qLGzo1g9
	o0j0b66qVVWK+DhX8nIoPgpgq0oMv8Xmrga6iHeFsRjEDdMRs85vqpa9/B4MFl7choNHRkWjkz+
	RyFTaDcTRrDYJBQP1Y1unmh9bVIjX4T75ssWutWj3xXMGnrTC0b9Z9acB3Mjbd/G97YAQEcAPFB
	ZZiVfdGf08TOrE/LCJdoPz7B93qUPxOrMZVnm3g0IsEbstePi6e8NWayqij/QygAowe9sYWMFxT
	s2x5COjtEoAq/DLq3VEU/Pdv6DLTnE8fHg99+VY7SLSt9CQ5s6DjyLo6upv0LWHrkJmfBTg46Fm
	ZtiEw==
X-Received: by 2002:a17:907:d88:b0:b88:587f:f594 with SMTP id a640c23a62f3a-b8dab1b526bmr445917666b.18.1769616657919;
        Wed, 28 Jan 2026 08:10:57 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1c021fsm148553366b.49.2026.01.28.08.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 08:10:57 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 28 Jan 2026 16:10:58 +0000
Subject: [PATCH v4 09/10] pmdomain: samsung: implement SMC to save /
 restore TZ config
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260128-gs101-pd-v4-9-cbe7bd5a4060@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Newer Exynos platforms have a Distributed Trust Zone Protection Control
(DTZPC) linked to each power domain. It controls the access permissions
to various registers from secure and non-secure world. An SMC call is
required to instruct the firmware that the power domain is about to be
turned off and again once it was turned on. This allows the firmware to
save and restore the DTZPC configuration. Without, register access to
various registers becomes impossible from Linux (causing SError), as
the PoR configuration doesn't allow access.

Neither the requirement for the SMC call, nor its arguments appear to
be specific to gs101, as at least Exynos E850 also uses the same as can
be seen in [1], hence prefix the new macros simply with EXYNOS_.

At least on gs101, this SMC call isn't implemented for all power
domains (e.g. it's missing for HSI2 (UFS)), therefore we issue a test
SMC to store the configuration during probe, and if it fails we mark a
domain as always-on to avoid the SErrors and to avoid unnecessarily
retrying for each domain on/off.

Link: https://lore.kernel.org/all/20230308233822.31180-4-semen.protsenko@linaro.org/ [1]
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 96 ++++++++++++++++++++++++++--
 1 file changed, 90 insertions(+), 6 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index 41a232b3cdaf0f4be413b25d9373b99c6a3db602..f59986b56213dfcc470d9cccc61a36a81954bdcc 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -9,6 +9,7 @@
 // conjunction with runtime-pm. Support for both device-tree and non-device-tree
 // based power domain support is included.
 
+#include <linux/arm-smccc.h>
 #include <linux/err.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
@@ -16,12 +17,19 @@
 #include <linux/pm_domain.h>
 #include <linux/delay.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
+#define EXYNOS_SMC_CMD_PREPARE_PD_ONOFF		0x82000410
+#define EXYNOS_GET_IN_PD_DOWN			0
+#define EXYNOS_WAKEUP_PD_DOWN			1
+#define EXYNOS_RUNTIME_PM_TZPC_GROUP		2
+
 struct exynos_pm_domain_config {
 	/* Value for LOCAL_PWR_CFG and STATUS fields for each domain */
 	u32 local_pwr_cfg;
+	u32 smc_offset;
 	bool use_parent_regmap;
 };
 
@@ -32,11 +40,28 @@ struct exynos_pm_domain {
 	struct regmap *regmap;
 	struct device *dev;
 	struct generic_pm_domain pd;
-	u32 local_pwr_cfg;
+	const struct exynos_pm_domain_config *cfg;
 	u32 configuration_reg;
 	u32 status_reg;
+	phys_addr_t ac_pa;
 };
 
+static int exynos_pd_access_controller_power(struct exynos_pm_domain *pd,
+					     bool power_on)
+{
+	struct arm_smccc_res res;
+
+	if (!pd->ac_pa || !pd->cfg->smc_offset)
+		return 0;
+
+	arm_smccc_smc(EXYNOS_SMC_CMD_PREPARE_PD_ONOFF,
+		      power_on ? EXYNOS_WAKEUP_PD_DOWN : EXYNOS_GET_IN_PD_DOWN,
+		      pd->ac_pa + pd->cfg->smc_offset,
+		      EXYNOS_RUNTIME_PM_TZPC_GROUP, 0, 0, 0, 0, &res);
+
+	return res.a0;
+}
+
 static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 {
 	struct exynos_pm_domain *pd;
@@ -45,7 +70,17 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 
 	pd = container_of(domain, struct exynos_pm_domain, pd);
 
-	pwr = power_on ? pd->local_pwr_cfg : 0;
+	if (!power_on) {
+		err = exynos_pd_access_controller_power(pd, power_on);
+		if (err) {
+			dev_err(pd->dev,
+				"SMC for power domain %s %sable failed: %d\n",
+				domain->name, power_on ? "en" : "dis", err);
+			return err;
+		}
+	}
+
+	pwr = power_on ? pd->cfg->local_pwr_cfg : 0;
 	err = regmap_write(pd->regmap, pd->configuration_reg, pwr);
 	if (err) {
 		dev_err(pd->dev,
@@ -60,7 +95,7 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 		unsigned int val;
 
 		err = regmap_read(pd->regmap, pd->status_reg, &val);
-		if (err || ((val & pd->local_pwr_cfg) != pwr)) {
+		if (err || ((val & pd->cfg->local_pwr_cfg) != pwr)) {
 			cpu_relax();
 			usleep_range(80, 100);
 			continue;
@@ -72,9 +107,21 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 	if (!timeout && !err)
 		/* Only return timeout if no other error also occurred. */
 		err = -ETIMEDOUT;
-	if (err)
+	if (err) {
 		dev_err(pd->dev, "Power domain %s %sable failed: %d\n",
 			domain->name, power_on ? "en" : "dis", err);
+		return err;
+	}
+
+	if (power_on) {
+		err = exynos_pd_access_controller_power(pd, power_on);
+		if (err) {
+			dev_err(pd->dev,
+				"SMC for power domain %s %sable failed: %d\n",
+				domain->name, power_on ? "en" : "dis", err);
+			return err;
+		}
+	}
 
 	return err;
 }
@@ -99,6 +146,7 @@ static const struct exynos_pm_domain_config exynos5433_cfg = {
 
 static const struct exynos_pm_domain_config gs101_cfg = {
 	.local_pwr_cfg		= BIT(0),
+	.smc_offset		= 0x0204,
 	.use_parent_regmap	= true,
 };
 
@@ -126,6 +174,38 @@ static const char *exynos_get_domain_name(struct device *dev,
 	return devm_kstrdup_const(dev, name, GFP_KERNEL);
 }
 
+static int exynos_pd_get_access_controller(struct exynos_pm_domain *pd)
+{
+	struct device_node *ac_np;
+	struct resource ac_res;
+	int ret;
+
+	ac_np = of_parse_phandle(pd->dev->of_node, "samsung,dtzpc", 0);
+	if (!ac_np)
+		return 0;
+
+	ret = of_address_to_resource(ac_np, 0, &ac_res);
+	of_node_put(ac_np);
+	if (ret)
+		return dev_err_probe(pd->dev, ret,
+				     "failed to get access controller\n");
+
+	pd->ac_pa = ac_res.start;
+
+	/*
+	 * For some domains, TZ save/restore might not be implemented. If that
+	 * is the case, simply mark it as always on, as otherwise a power cycle
+	 * will lead to lost TZ configuration, making it impossible to access
+	 * registers from Linux afterwards.
+	 */
+	if (exynos_pd_access_controller_power(pd, false) == -ENOENT) {
+		pd->ac_pa = 0;
+		pd->pd.flags |= GENPD_FLAG_ALWAYS_ON;
+	}
+
+	return 0;
+}
+
 static int exynos_pd_probe(struct platform_device *pdev)
 {
 	const struct exynos_pm_domain_config *pm_domain_cfg;
@@ -195,10 +275,14 @@ static int exynos_pd_probe(struct platform_device *pdev)
 
 	pd->pd.power_off = exynos_pd_power_off;
 	pd->pd.power_on = exynos_pd_power_on;
-	pd->local_pwr_cfg = pm_domain_cfg->local_pwr_cfg;
+	pd->cfg = pm_domain_cfg;
 	pd->configuration_reg += 0;
 	pd->status_reg += 4;
 
+	ret = exynos_pd_get_access_controller(pd);
+	if (ret)
+		return ret;
+
 	/*
 	 * Some Samsung platforms with bootloaders turning on the splash-screen
 	 * and handing it over to the kernel, requires the power-domains to be
@@ -212,7 +296,7 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to read status");
 
-	on = val & pd->local_pwr_cfg;
+	on = val & pd->cfg->local_pwr_cfg;
 
 	pm_genpd_init(&pd->pd, NULL, !on);
 	ret = of_genpd_add_provider_simple(np, &pd->pd);

-- 
2.52.0.457.g6b5491de43-goog

