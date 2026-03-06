Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83EF37EFFB
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Mar 2026 10:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772793011; cv=none; b=dgF0aR5jHwzp3dbdKJjZtih7e6z5N8aGBWzPnvudkTyuadU3IvUqbEJNlF2dC1goXN60hqWtKU7ySCilWLZki+JcG6r+Xg8H+LG5pNb8nIyQZrkTM9xGcew1R1cTSlI7A71F/OXBCoHz81zpF5iKbQ5zAYBvmKJz7pIv6bLp1Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772793011; c=relaxed/simple;
	bh=NS+1Od4aVlTq9Wx7bCSooHKRSz+R9G4t7LsBp+nXiI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TNqreO1o5wDrJu3UpnAJRZFKzL0CGKSqO4HyYkSiRxALkxQ9Q/swc1hPsiPZsMbU/3N6E/celWWbSqO76asajIPwZlsLf6EKQiwVccqkDkrPunsNd3VEovXbnOCvIESr6r1NOMr+9I5WbkFq4W0rRBbOb1XuoBhnzUIVp+RwKU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kd3VvyYW; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kd3VvyYW"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b9431300833so63369966b.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Mar 2026 02:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772793000; x=1773397800; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z+RpBQOuQW07kF7dgJNXDXfeT4g3XJJZS09GBpqTzzg=;
        b=kd3VvyYWfgTIZljFCayYYyW27MR5lMv1Y9tXR/l0Y22CxXXBuiiuhKWVsYJ5UgKgkn
         2PyZV7X/8pOzdzZEVX+m99zJL/l+l7zJ3rTS8mh8hUFog/a4xTp9gWTj9kNUH0KfoNWs
         SX8DrchN2PeZTtICDSiVFKufVGNiBLk8V+Kvz9A2Gl0x6K361REAh0zikTVZUHZ9KgB7
         QhuXdF+iZ5V3/4rzBRomQgPfus9RTFGj5R18nrkbC2YF7Ycj5r/iRCzbfOPtZ4Y1b5d/
         DgyQwb/B0+mcojCD1JrLbqmzNxjANPKsn6b35jCoIwl/C+GUwsdBRZJ232ClR+Y2bCIL
         zi0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772793000; x=1773397800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z+RpBQOuQW07kF7dgJNXDXfeT4g3XJJZS09GBpqTzzg=;
        b=ljw8WQQxCl2B6razu2rp+CGYqs6F6dR1f0Iep5kxObgYzobPLb9ToyDCKYeAsBr6Tg
         R8uZCeBLmOltvvaEvCIOiqh+jFWMH6tFehRjo1qP8M7XqEn9vQVaYndiWYj+liSFQ01h
         4wHv99nP32vFlBgQ6IeMfdSXg7gGVidYzp5pU7CB1bwzqTUwwX1DPjijuupDds0tE3Eq
         CIJpCtZJzfpadt69MySagX2slJdT6s0sJCpNMOFKtXZSQsUPw8TmDGfc4yVmSbfu5b8q
         r0DKPThC++CjP45sfJusfqmTqPp1IgipWrpY/TFioXaDQyHRdIaZ+X8u//+Bhi+Un02F
         WUJg==
X-Forwarded-Encrypted: i=1; AJvYcCWCKIWbtQm0evQkalhf12i8bqgDETgRhdAfJS3uKDWUXzc7Y9nlylWQy8hQ5TM3OK5/m5+B9+Bed8ehtVj7wEtagw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6iGYnOlQ1p2/9aOxSOfLATTppWx8XUOYa0K6dhh9EUvQN3Sdl
	w9J7bPP7Cc2IiyQd1/bZNK7G8HF130PGXV4SX9QVOZZOAUnFmaBT1Bh+dH/ogqSbxRsSE/zjL0W
	gKCG5CqYngQ==
X-Gm-Gg: ATEYQzxKFX8YRY34pJz6IBSkSJ/ngzX3jvwEyMjcHlIDkB2ykmYYPkPrUg2yj8ZhmbT
	0Y5kmZgdBSUHeG0uqEHunVk9NGOmPP/J/U4I//d1lo4nKHJVgH+13iZoAd5kOKwxCaQNVhFKnBA
	C9A+sdd844MBau51Lk23mSPEDD02LiKtg74sljl2crBbIynfc0uiela6cEAcVVJjLrucwR5y4CE
	Ba7Dp1qd1s1lTtcPL2k7FiLBf0tMWE8INOMO5hfZvoPkqhCq8ffvP04SWwJjYB1HMCGIyREbILE
	8nwy3kMOsuWqn9b9aOtPwOeeQOW2E/eo4sVl3zteHNxNivthi7uX4pmSjX4yEOzCBWQ5jMYYznS
	+EaweCNIHVfqHR8HusRiquUE/2Ja48ZEL0HzweCNGTy2HyBgzeN0yL/cbzE1a13bCBGqrUt7xnY
	VHAn8StBRR4ImRsmOskAXe4spWOFl4NLmUNgBlOjDZfIbTIyrW6mVsh9Bbfo5mNHL9lnwMb72oO
	U39jMpIY0PW0LU=
X-Received: by 2002:a17:906:f59a:b0:b93:4d73:e8af with SMTP id a640c23a62f3a-b942e0315e5mr100179566b.58.1772793000481;
        Fri, 06 Mar 2026 02:30:00 -0800 (PST)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef8c95csm42907266b.21.2026.03.06.02.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 02:30:00 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Mar 2026 10:30:01 +0000
Subject: [PATCH v7 10/10] pmdomain: samsung: implement domain-supply
 regulator
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260306-gs101-pd-v7-10-03f7c7965ba5@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3

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
index f59986b56213..ed7a5807555b 100644
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
2.53.0.473.g4a7958ca14-goog

