Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460A23382C0
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Feb 2026 21:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770327760; cv=none; b=qCpyNzB8s7zzlPCjT0G0aOEI53qI23zf9wtGb498smBpCu9T4jUvyZPho51h133+W7ARFTVHg8zDZ5pmPPwh9UT8m5moyDHLfeTHRP4J5TWmTDAo9KEK8G6fcDDmhj9T81DDpwq4DRwA+NbcrDI2h093Ln+jkFbizalgrBusNQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770327760; c=relaxed/simple;
	bh=jXkGYVSXRYzVNLKTp6IqXxnquXxIdr4z/VDG1x0ZADM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ib+4F0cgykUKoI+zj8x5SuMWnSpOQ2IowLtwMCsIBTqdxKkb+8j1nX50Qaji1wxbqDZG/Hc1L07elvl73XdmuevRVR6fMNYRw9bEExJc+bcP2EwukKZ95CoGhLvSFT00yMfCCj7O1+CJp2J57whqeNPm/W7wOxnKmPWv70kABJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gUcr/VkK; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gUcr/VkK"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b885e8c6700so258674966b.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Feb 2026 13:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770327759; x=1770932559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gtN6jc9h6sN3C2/z3TIutmLFJBrc9UMMYm4XTm15s9g=;
        b=gUcr/VkKbHL3lGVB7lRCqxftE8Lz0D0ip1YkGagxmZax+cjl1r1BFEOANvMqCJUFai
         sDamPx8Oued5mT8nqbHP4VLZTj6ubPkP8KIxPv3IU1FljJS75VloU3764n0D7ibMArWB
         TBlctqu+nPZi6ns5norEDmgKwwFE7SiIFzPu26NEB+TpRU8ysmob02VD3ag46rXRL1J1
         kNelgFiPiYEypV7BMCw4s35sm3NL80nfIdxhlPlgxiKeuFBJBSRhmDl8x8B2hD65v341
         vU2OzK7ZnGCM4UEP4RfpOH74Wl9xrxt7SO+u6N25H+lddMOT2aFsK80Fgev+o0hTTSPx
         MjwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770327759; x=1770932559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gtN6jc9h6sN3C2/z3TIutmLFJBrc9UMMYm4XTm15s9g=;
        b=LyLladHupRJ76Bd1IAjpLFw1+4XoGTyWUcGxlH8Q2/AnGN/bQg0e4dHfWZdq8m4RO4
         KkgbGHcxrpR5DZzP5NIQomNjrZwaqS086AruA/iaP30bL7LmfuLYz2YMW31LB2PB8ybU
         wdUB0EcCgvKmdyp8JYcG6AzMG/DnPgBm+OBN++kKGpMbu1AqLNlt+M+n2aYzEAwPiz97
         o5sGQGXN+j28kRsp0QLawWLrtWGfhpHcruE9JWxQN1w3cyN/iK3F+237D9ZJsOUUtyIw
         duBEkLF2XCSX91mw6VYH2PYFY6Vv3iliVck0ZYRlQfl22MzkJWfwLxMP+xgOojwIO30z
         L+Ag==
X-Forwarded-Encrypted: i=1; AJvYcCWJqshxEl6VRQX75j5plt8FN28tBsbenQOXsGp9eOB3N/NMN4CGQiMr2lAv0i0ysF14U8HlHNTlCUO/WTGtlHQK7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNYM+W03S1SWq2CzdUc/KJXj5d77QpgBwfdUeBERXKGx1h3KgF
	ejVA3v7CRJbVaP08AcFRrH/qfWIdxBXtNLMO1CLzbD//Tb+bBI8Gvx1KLimhESb9JUI=
X-Gm-Gg: AZuq6aKNjsilSmEOaNNkKHH5HAtbtt7LBWQdnY9aotS1j4ARmw9Eg6V9vAMVxpZ3nb1
	1EmoMw4QZFhRTPkQnjqCrspRI5Xk/n3zNwXYySj0ruMsNFmf4Y93tb1CWMxjnH+3iY3MX0XCR7h
	+zTs/mx092bBPx87wQuCTIDKvzu47P0cJZMyS5qx0z/OEtKl1UQhxvEwOC+cIA8kD2oe37Vk8+O
	OBrLPCdiUYeAU4MxElVQO7hPzCjFeUrMBBPn/pss2D1xVpcQLcI1dxhvmMnY3S7R5wIjCGvemjS
	ELJKkAhN9lRGKNjEgHDcyoCkc+XZJ9wgfpAxWP5DpTj76Lk88x/4oQ3VAEixnhEPqNNNroeUbH7
	Vgqj1g1P8x4Zsrcql6kSD+JBxPUGzHx+TOn3yDWs+VTX+8AtcmSrTTZCFYaVJ9cB0tmndAqjKBS
	HH9xnH5CIsykXm/grAfWiN8A/wlBSuIPBFlRs1VGUwlwf1yJs9yjq11bQzGVt7GpaDlLp+YX3td
	BbrYA==
X-Received: by 2002:a17:906:f594:b0:b88:4b1f:5aff with SMTP id a640c23a62f3a-b8edf34e9d1mr24378566b.44.1770327758570;
        Thu, 05 Feb 2026 13:42:38 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda7a0074sm21859966b.18.2026.02.05.13.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:42:38 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Feb 2026 21:42:37 +0000
Subject: [PATCH v5 09/10] pmdomain: samsung: implement SMC to save /
 restore TZ config
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260205-gs101-pd-v5-9-ede49cdb57a6@linaro.org>
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
2.53.0.rc2.204.g2597b5adb4-goog

