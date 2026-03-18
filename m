Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA8D3DFC9D
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Mar 2026 15:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773847692; cv=none; b=h7Ezd2OLMLGyLHD1BLXc7ov//2HRUy77/6uvbtbS5JQDl/sbwQdNtChhWTzppKKVavHbtty3lVxn4onLXej5xrL3eSTfuAfERE9NJIfYb5LfIGrBtSGFtsHO9MOzO9jKbCwiQ1i2k3cY0ruLT98fLY5JOC3fjJkycmmsNLRPccE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773847692; c=relaxed/simple;
	bh=8T9/It5ApHDHnYD1q78TZh74X9foQBKZZLIC9h+az00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SPXmlqPdVCdKmA2jghvLAV/wXnACoKOM1grWMuHKDs7SJHm42dwZojc+UCAC/iMGXVTYgXRR6ceftH/SgBSGiZGJlI4pGCFINv0vpIjbmeqn5dfBkNVMbp9xLFf/flXtW6ofVYQgBQ6dIGtLjww0ZhU0Jm2KWby9TfbbmdCHObY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zaZmBis3; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zaZmBis3"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b97b1012d14so207400566b.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Mar 2026 08:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773847682; x=1774452482; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FzTEmVg0E5h4X/7Ugq7xS1ujjrPpCimVnXzUPgyNm9M=;
        b=zaZmBis3OIvWv8Z/cmUga6MKezr9hCDKifTL7RAouUD9eApYwG2JrRpA2nr/P1RA64
         4poxjeQy0lZKo0Jo5NTNabTVG9RA6xvA9oc/qu2oAgrMah+ESz4rykw8Aa34nZWQaRR9
         3YS38tnv4Owg0Y6vT4bc/fEEJ5XabDqeO2YpV4s25y3Y6QaVZ8LOeOz9FJ4J3ZZ+AnEN
         XtGqt7moT3/WsVkD0KZR04g/ZtHIQEnlYxpoKzmvZKlWuDewJs7NYl93VxRJ+XENbShf
         ikhMM9pmrRzzKbS2EfSJvx5SprAedEqRxGIFAi5eizabPCDZRd6dVeJYQAsvqZTqIyVq
         GwCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773847682; x=1774452482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FzTEmVg0E5h4X/7Ugq7xS1ujjrPpCimVnXzUPgyNm9M=;
        b=mBLZ49gt0cGQiG6exeTwIIk634gcx4qBWTXhy9HoRlLcQUO8CelxeSi+0xJNL/aeiA
         w8/esJ5OApGgm0FD6aikQwjTS0QolTi5yd/j8EK7O3PWHARxxWjNJb1lH8lofooKMcBH
         flBWZ9ipGHUuGf9SQ0ZuhrvTlUpARvCZ53VVe4tMXehg+UtdPG+QAiBq5DZYBSdWY2YN
         NAx6Ie+jNCpFVZXl/V1FWxc/SIxxfVmvQSULl8dyV1rqW6lM1IV8OHfHwXP6qTC5uEP8
         0uqGm5zM/GtNU5Qc1wUIVHDk26a3kRxnyh3ZpZraEkd6OZQ+zNaZc+NwwtpckHmYfmtX
         LtDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKdtgbo0RTVHUzHvEJZi7raIl3bA5Qo6ROEYoDh8rW7ZXtZ3aES9HcplSJ4XcRb2qwQl5F6b3PaiNxfomwzQM/Vg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe7vJrt356hGXl/UIjUt2ys4R/16HjiQ9NR15/9quhSVgYLHPa
	ENU8KbVgQg9uvv2yfEYTkhqcdNd5jd6RaOPiukSX62Wof2iVAnEjoRRbYie1ptza6QE=
X-Gm-Gg: ATEYQzx1m2fKw29qDzaP3cprEX3RkZquczgZBBc4wSzbizh3fL7bEQlbO4Pi9PvGQH4
	bmzhkDQHkp4ATXzprqXZ9C6arsqnM8kU2aIfJ7MC1HETFeufibVTVHtMb6ASgqFx6hQ4jcQx2ru
	iN9XFCY1hGI2ChytBGPP9WPssPUhwVLqg6WdvyUbMAWvwzMSUwKQBNlV/2P5Pu8lLUtAzPkG/gR
	uIVYT7Z2vnpAbXzqO6B9GqBYFem1h8GsQGJB6c4tgrrt1FPh6wrU7aei+c1nQ5V4PaqhQxBwySt
	19IFZ9ACwwCH4KjDV1ukpzP5FhRjxWbqiV1kXXhyHncoo8kjwQAgbVNxV29ZFBXYex4c85oL88E
	ltUKpSfvmvpSGSI1IrPhdDi/dTxbSXnW7gDnjKQd3AEVTjpn6F0DILYhizdP9Nu5hyaXPiqp8WP
	gW8cuGQ5jksMrURt69egBzUyykdGdtM4AkQPQ3gs+BWO8oAK0oFwkon5QOvNuNG079rH4tub6kY
	X1pAVaNIz6JCks=
X-Received: by 2002:a17:907:e11c:b0:b97:73ae:e2e with SMTP id a640c23a62f3a-b980f9e248amr256966b.18.1773847682061;
        Wed, 18 Mar 2026 08:28:02 -0700 (PDT)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f173a3e3sm226989566b.61.2026.03.18.08.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:28:01 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 18 Mar 2026 15:27:51 +0000
Subject: [PATCH v8 06/10] pmdomain: samsung: don't hard-code offset for
 registers to 0 and 4
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260318-gs101-pd-v8-6-241523460b10@linaro.org>
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

On platforms such as Google gs101, direct mmio register access to the
PMU registers doesn't necessarily work and access must happen via a
regmap created by the PMU driver instead.

When such a regmap is used it will cover the complete PMU memory region
rather than individual power domains. This means the register offsets
for the configuration and status registers will have to take the power
domain offsets into account, rather than unconditionally hard-coding 0
and 4 respectively.

Update the code to allow that.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index 68b1e7ba8729..3aba00b9ddef 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -30,6 +30,8 @@ struct exynos_pm_domain {
 	struct regmap *regmap;
 	struct generic_pm_domain pd;
 	u32 local_pwr_cfg;
+	u32 configuration_reg;
+	u32 status_reg;
 };
 
 static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
@@ -41,7 +43,7 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 	pd = container_of(domain, struct exynos_pm_domain, pd);
 
 	pwr = power_on ? pd->local_pwr_cfg : 0;
-	err = regmap_write(pd->regmap, 0, pwr);
+	err = regmap_write(pd->regmap, pd->configuration_reg, pwr);
 	if (err) {
 		pr_err("Regmap write for power domain %s %sable failed: %d\n",
 		       domain->name, power_on ? "en" : "dis", err);
@@ -53,7 +55,7 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 	while (timeout-- > 0) {
 		unsigned int val;
 
-		err = regmap_read(pd->regmap, 0x4, &val);
+		err = regmap_read(pd->regmap, pd->status_reg, &val);
 		if (err || ((val & pd->local_pwr_cfg) != pwr)) {
 			cpu_relax();
 			usleep_range(80, 100);
@@ -164,6 +166,8 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	pd->pd.power_off = exynos_pd_power_off;
 	pd->pd.power_on = exynos_pd_power_on;
 	pd->local_pwr_cfg = pm_domain_cfg->local_pwr_cfg;
+	pd->configuration_reg += 0;
+	pd->status_reg += 4;
 
 	/*
 	 * Some Samsung platforms with bootloaders turning on the splash-screen
@@ -174,7 +178,7 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	    of_device_is_compatible(np, "samsung,exynos4210-pd"))
 		exynos_pd_power_off(&pd->pd);
 
-	ret = regmap_read(pd->regmap, 0x4, &val);
+	ret = regmap_read(pd->regmap, pd->status_reg, &val);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to read status\n");
 

-- 
2.53.0.851.ga537e3e6e9-goog

