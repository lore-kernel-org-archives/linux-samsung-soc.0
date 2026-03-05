Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FD22D541B
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Mar 2026 06:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772691122; cv=none; b=Le5j3gCih9v7eRQg2OASw0ZkZq6o3ameNkqSWZgZ0FsPu3yUgTfQoR4HGBkfPeyz1P/537xdvaMxnjuCq0/milQ7q1c23sAlWAKhXLDI5W0XV2CHTRksMLxeViTa1LHoRpzB6/4/eZAs/i4h+Kx5O9B57ZWnR2nfyMGISqBvC90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772691122; c=relaxed/simple;
	bh=dHULg4KAQ86aduIcQuHp4BhJ2Nb07EP6bPz5fIOQLSc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rJsGg3WGA5U2BhCMjm8Ru2+pl+Xu2cvyGnHXrUgT2vgzu6oVYBmvENqzT0uJBK4SrYQRt5CWLHeq13qdNB3muMmvYgYdDBDEcCPyOgaXNPcDKduw1OW8/lHMtO5A/8Z3Bb0F0Py5kgPJDXo5RNxKYYRK33DZiwj5cQjgPPKgEZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pyx2Hrd+; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pyx2Hrd+"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b93698bb57aso661586366b.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Mar 2026 22:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772691119; x=1773295919; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aes9Ymy2SVK6T0USFDpwiCwEp+iOTQGnFHuH7w4M/To=;
        b=Pyx2Hrd+Z9OhjTWh6aRW9jXcmXxotjMhT/zSlyRrBLCM1+R6XGMEZNToJDcsfQSmtL
         7bEK4Hck/tKNR157Kz9gjJuyHyvMwrZWiF0N2joiD6Mbr/fLGjDv1wJZ6zMR/HbAAFex
         +h4klHQrJ5WPOI1xwNA2xGgY8cC/ixn90nIgxDK/n3iKQYE7sx8KgC+0FZeZ1CVcRBXl
         W+uEolZ0gJ36EPW3nzmPxqCcKqObS5n7YcePFuoYytpgLGDuKYGvorjHHWgcFBGQBxvq
         uQ0O8Ga7DsIYZRIgaAlaleGk1Bru3jy9c31Vf34hTy3bH9SqtB/pLK8b9D7Sm7i3gY45
         PHIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772691119; x=1773295919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aes9Ymy2SVK6T0USFDpwiCwEp+iOTQGnFHuH7w4M/To=;
        b=S3BBovRaGrEg3YuXUhBMWCfWgKzc7Q+qfPDQL8qykFtCe7rAywLDxHHqgQEpoh6D75
         6Z4/um4XuiIRSBwsXhQz6Snezjsacei1cR2rSASXrKJll+FyFUTr05d2LRYUlpNGu3h9
         oIsxQSboc4OJHw3cu54eVsP9q6cPGuZRCrMFGSCoCkJzvQewt7QI9Zj1t4dQlbmKacbj
         dDF60T5fIrXSmLcD5i8WTwva0S1eSk2wR+Wqj3Z2Z/XWAbdd9bM4jhEKC/5mvLtMkX58
         rUNPnI/r/9xGHxR7LBHYcbvXF9jemKVP9N8lylR+ZFrJVBwbQQiX5WpFdQSn7tZLbqyW
         6ShQ==
X-Forwarded-Encrypted: i=1; AJvYcCUr44i7ZWtA6xj1yqMjeWaviXYo9zwgPyF4pPwlUXmfwRCP9zOHC+hQkkJJNUwbe2TVJeyYK7jRLMpqZjQpzFE/EQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuqXbs5emcUcAwippsgj27s07CyOA1AugfpjRZQRTXiX5mZzOx
	Wnnamt3Tcn4cSl8dJhkR9uahjAlOQOdQFTkHUbohzvXDo2FIUYvVoq0aSTrfu2BbNO8=
X-Gm-Gg: ATEYQzwxS4wMWvhCakpriKEvGMF7gWTUgGWYhTobd3FmX1i3W2zEPvkrRt1kQAwE03j
	xo0IzBYGp5H/wr9pOI/6AETUYSu7SQaTtLPRkxSyuGCY7Xq1HIsMhuYyzcDMbMrF/sluJJypOAs
	xrLMbgis8OPrktmnz5s8dw9m2EbFcEnq824R2LTpj/tBB9C+Pcyv3t3Eg2XnJ39Fb/Y3ZqftJMO
	D73MGLTsm2F283PHZD1UjivR+Pc4GDd6LfBwm8KAZ120ZPJUGubo0lxHB5VIisCnSOtd4U4sKzD
	2tvgbNez3hlSns5gkSPzs4FP2bkOzuVoCEhep7uIXBVuRwsedeQrGiGYNKpZDtZVfMgF3whZiQH
	74+f1vRw0UTeRvZ3wIO3plV7DHnwrFLf8ApuIzuOD6DbGGlw85wZ9R1VOBCg25rmGG0wCyNJGOs
	JYX64b6MKShsx1d9cmJZ3WIlfrUjbU3Dbd5qwDV09xW48EZti+McjG3vhJDQ5IiWRD1fOlVssQh
	j5o7vRbioJyKbs=
X-Received: by 2002:a17:907:d20:b0:b94:827:c561 with SMTP id a640c23a62f3a-b940885921dmr63080666b.4.1772691118046;
        Wed, 04 Mar 2026 22:11:58 -0800 (PST)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aec3243sm849355966b.53.2026.03.04.22.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 22:11:57 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Mar 2026 06:11:55 +0000
Subject: [PATCH v6 06/10] pmdomain: samsung: don't hard-code offset for
 registers to 0 and 4
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260305-gs101-pd-v6-6-8cb953c1a723@linaro.org>
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
index 3bcba7d38ac1..8df46b41f9bc 100644
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
 		return dev_err_probe(dev, ret, "failed to read status");
 

-- 
2.53.0.473.g4a7958ca14-goog

