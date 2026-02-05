Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2923385A9
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Feb 2026 21:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770327763; cv=none; b=qDRmZfKVT+LuDiRv+mHh1+LE3KPkcxelBjrwTOByGkR210/kYJRyiGPM9eKxsupLwLIyZZN5wJFYQ2F7cr7+C9rFoD+/4rE0U7xevRDEBdnR1xKDBRVgHpWQnKS9kq4DBjYAhgLRDYFFzHTsVvuaLThKT+Un7/iDx5ea8VsVUgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770327763; c=relaxed/simple;
	bh=u4sg0GJwh6e+BEq1gu8SNmu5JD78FxHznumDbt705qY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kBRib+enapVdfFmJN1xpOeiSyzveKqJDhT3SgWvmddcZiRT6ZoPFrsL+TeTUGkFxxT8ilWzwpXqmR/E+o7SUi59N1dz0cE+ZQQCietFiRqtMTuOULh0xaC8IkvF4+HlauX6s3DBUZVE33PLMx0e1Q52wV68gyLTYxYLWeWFJj5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xs7mYAxe; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xs7mYAxe"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b8eafb515aeso169222766b.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Feb 2026 13:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770327760; x=1770932560; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=khuzBcy7Hz6jo0S9i03alRelHLigzIL+h0sUh48v3Z4=;
        b=xs7mYAxerbmg5OfOg6zqJEFq+eQGrBgS0dwnvnxoxt+TUkZrGA9dak4soSHA9/YvF6
         wJo6PXQD6gK0MWcdkwBauNEAoUczScw9yXy3UCYRKppnVZoP4jr+JDUCBntMEhUg3SWM
         Qg/0BOH2ghJyS1mpKxNK52rQmk1iq6Uz8zj39T2f0rrE9v5gBTBQ5LgKGwmY0K/CbE/o
         JS8CFHWEZqDHkT70uAt9T6+FM3qE4U1u7XOdHsxjGXsYZ7P7JUxARPOZ91RpAaukxGeW
         OcI7IdTTGuHMDosWF5++KOfeitJtrI5d2TX31NlJkJgonjd2xsyZk1BSoXmnDqpIge/e
         tPuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770327760; x=1770932560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=khuzBcy7Hz6jo0S9i03alRelHLigzIL+h0sUh48v3Z4=;
        b=Yw5nTs42raGTsgHdfQmkHiRbcmfgJHKZx12p/adNNYBSJSEBp8AZ58KANOSDMkNECs
         kQDL1BX6u0aRMmR1FDUYeBV60cnl3c7K0qgE+2cAp46idO0xBqaB1BDbUzB4lTb39LWZ
         YZJbLcPctbCgjjKzrSsZosQnqMaqKB30CqC5ui7MUw0NWSmdzzzWg/qYWsF3lv86sIWK
         9Up+0m7LZ29jM2AQM8ixBbE5KEhAEiCVe19G2q01RWPcNHx7haE0uTg7tqApHh7gxUYy
         npICb8KtGvZaM5DM+mOj1g5fNY3BzrkmtjopB34duvSx3afpKFEIvKMP+KB/GIzyuZSK
         vRbw==
X-Forwarded-Encrypted: i=1; AJvYcCWyvEGoe4+OV4LyU773kAaaTqiui2848GRpdBDaA9fG5sKT9S2CkIuZn4tZQlAJddvlazB3oijAMZqeEoK/C9Y5dg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy0fwF6cSqR/MiC77Vbw+UKJ0Tcg+VHpMsiex0PZ+LsC7O3iL/
	/dHy2Oi6ly+iC+7//hpkS0Y5Xf98JOflGpr01NjAQwWCmz8Loymy6u6kLKqSIQG3dBk=
X-Gm-Gg: AZuq6aIpljMuo0vygY5CbEqCupkR2zh1zM0vby4rsGpWNYJAJ4S+8fhPYIJvBfEJ1cF
	48SPad5sd88AMN4Npalj71PqyhBcEhqnxf/sKlahgiVgmfE+EYT4QptMcbLrUTZcT7T4R2wEfpZ
	oufiWjddiX8Z0WKoqQ4sCLi8uqvP8c0QX24knxrDIzhz0EmManr3Gw78CRJluHmmudRTO5kkpqY
	ujk3MegMqJyGa2soTRHYORM95uEITl++jZZbLk3u2zCBcBOFZjJwWlEkgdkQkGSkmrYQYmL0l/L
	rQdzKg1d4uU3RcEmdi+fnsuZT/boTJvALNEGdrO9tX2MXVcKOUlJizejOr6cDHjSYjJEghxrUyt
	Obuz0JZveROpP3s+EbZRb9xCSih1BeDiO6AkQ3VnTE/kRBiKdNjS6Eb3/gwW6CtGoqj/8lilqin
	ShggS+1QD9ma77yKUJzpeGBJxSIpxCcXPntUbuDnPhkvJoPW8tA3alkk60idnPFikz7lxin9LcP
	fkHdQ==
X-Received: by 2002:a17:907:9810:b0:b87:39d:2bb4 with SMTP id a640c23a62f3a-b8edf45a619mr26687766b.59.1770327759827;
        Thu, 05 Feb 2026 13:42:39 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda7a0074sm21859966b.18.2026.02.05.13.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:42:39 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Feb 2026 21:42:38 +0000
Subject: [PATCH v5 10/10] pmdomain: samsung: implement domain-supply
 regulator
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260205-gs101-pd-v5-10-ede49cdb57a6@linaro.org>
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

Some power domains on Exynos are fed by a regulator rail and therefore
regulator control needs be implemented for Exynos power domains.

On Google gs101, HSI0 (USB) is one example of such a power domain.

While at it, add a to_exynos_pd() to avoid direct use of
container_of() in various additional places, and update existing code
to use it.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 53 +++++++++++++++++++++++++---
 1 file changed, 48 insertions(+), 5 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index f59986b56213dfcc470d9cccc61a36a81954bdcc..ed7a5807555bcf86e4ec88166bfd5f6c06c9322c 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -20,12 +20,15 @@
 #include <linux/of_address.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 
 #define EXYNOS_SMC_CMD_PREPARE_PD_ONOFF		0x82000410
 #define EXYNOS_GET_IN_PD_DOWN			0
 #define EXYNOS_WAKEUP_PD_DOWN			1
 #define EXYNOS_RUNTIME_PM_TZPC_GROUP		2
 
+#define to_exynos_pd(gpd) container_of_const(gpd, struct exynos_pm_domain, pd)
+
 struct exynos_pm_domain_config {
 	/* Value for LOCAL_PWR_CFG and STATUS fields for each domain */
 	u32 local_pwr_cfg;
@@ -39,6 +42,7 @@ struct exynos_pm_domain_config {
 struct exynos_pm_domain {
 	struct regmap *regmap;
 	struct device *dev;
+	struct regulator *supply;
 	struct generic_pm_domain pd;
 	const struct exynos_pm_domain_config *cfg;
 	u32 configuration_reg;
@@ -64,12 +68,10 @@ static int exynos_pd_access_controller_power(struct exynos_pm_domain *pd,
 
 static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 {
-	struct exynos_pm_domain *pd;
+	struct exynos_pm_domain *pd = to_exynos_pd(domain);
 	u32 timeout, pwr;
 	int err;
 
-	pd = container_of(domain, struct exynos_pm_domain, pd);
-
 	if (!power_on) {
 		err = exynos_pd_access_controller_power(pd, power_on);
 		if (err) {
@@ -126,14 +128,45 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 	return err;
 }
 
+static int exynos_pd_regulator_enable(struct regulator *supply)
+{
+	return supply ? regulator_enable(supply) : 0;
+}
+
+static int exynos_pd_regulator_disable(struct regulator *supply)
+{
+	return supply ? regulator_disable(supply) : 0;
+}
+
 static int exynos_pd_power_on(struct generic_pm_domain *domain)
 {
-	return exynos_pd_power(domain, true);
+	struct exynos_pm_domain *pd = to_exynos_pd(domain);
+	int ret;
+
+	ret = exynos_pd_regulator_enable(pd->supply);
+	if (ret)
+		return ret;
+
+	ret = exynos_pd_power(domain, true);
+	if (ret)
+		exynos_pd_regulator_disable(pd->supply);
+
+	return ret;
 }
 
 static int exynos_pd_power_off(struct generic_pm_domain *domain)
 {
-	return exynos_pd_power(domain, false);
+	struct exynos_pm_domain *pd = to_exynos_pd(domain);
+	int ret;
+
+	ret = exynos_pd_power(domain, false);
+	if (ret)
+		return ret;
+
+	/* Ignore regulator errors - the domain was disabled after all. */
+	exynos_pd_regulator_disable(pd->supply);
+
+	return 0;
 }
 
 static const struct exynos_pm_domain_config exynos4210_cfg = {
@@ -283,6 +316,16 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	/* get the domain power supply if required */
+	pd->supply = devm_regulator_get_optional(dev, "domain");
+	if (IS_ERR(pd->supply)) {
+		if (PTR_ERR(pd->supply) != -ENODEV)
+			return dev_err_probe(dev, PTR_ERR(pd->supply),
+					     "failed to get domain supply");
+
+		pd->supply = NULL;
+	}
+
 	/*
 	 * Some Samsung platforms with bootloaders turning on the splash-screen
 	 * and handing it over to the kernel, requires the power-domains to be

-- 
2.53.0.rc2.204.g2597b5adb4-goog

