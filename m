Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902F7310774
	for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Jan 2026 16:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769616662; cv=none; b=O86/UvsOM700cSoZzDTMLmZGUq5qBNEr2VtKWR43M4Divj4c3FNroyfRl1/oDBLYXdLetpFz8zMCfEdQzxQcnmmh7XrsiUQfXZ6+DZba5HRWRTLnhehHBFBwDbp4sdxf6qYPkcqI1YBqOJLRlTl1QLG7sw5eN0niNalSrc0qxjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769616662; c=relaxed/simple;
	bh=ZYxzBg9tkVWzCzaxuPaae5TIGD91nZXT5GPxtR4tPNQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tQmPIpomv/U6zXjKXgVWfgDiecy6CIDAnimdNg8pJiIKUaaClDlny5NCxkEUcOEqLBoa7SrnulXDMKhfXUthzjHqKygaPXihU1INQmUrYiEPjTBVatx+2x8SLrrRWIloXTvFTZSBEo4MDYicpEaf8B0Oriq5xwLuzFmFCGy5sxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aOwci1JH; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aOwci1JH"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b886fc047d5so890327966b.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Jan 2026 08:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769616656; x=1770221456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9J9mAVn8R3b4lSWOfrbKrodX1tmUBpKSiHbvrB/eirA=;
        b=aOwci1JHIkQcJgyHu9Y1mf2aJ3de79GIiCo4W27OV7FX/DAPhEPUF14G1MfhlPyx9u
         EjpXgHy2y2d3sqzYCemE835xJKRA+XllCN2WMtrqi4ViqpA5ArmZkFaUaLkN1/2RrjGb
         oj5bTs7rWnv/UWtOT01HtTcES/4p/ZATxkkQFKH5+Xq8dhBBbiMv2nOl8UJTdDg90Mmy
         2MpfTFKhDIODwAx7w/P+iGb81mCNtCTbFdloi49fjMPNnUOnKjToL2PXwGrZ/eu1wsin
         9qNSJ1pJXPZL4WP9ETPS3J5E/memQx6n4prPrWK5XHyBmsSwZUdYHPeD4OvvXuzR1rAb
         yDiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769616656; x=1770221456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9J9mAVn8R3b4lSWOfrbKrodX1tmUBpKSiHbvrB/eirA=;
        b=OadBg+emfrBvc8MY4YWsbVQkd9WkD9leVYzu7506SEDr4kguhDJx40zjomZsw4mTXo
         vykD6/azMzv45M0UeQnL9TvF1kL6j7e288eXeMo0fCu7O0MWGAdhkwriF87QwsQt3/zc
         Rd86wjlwV4Bu2p9jG8XxzTkSF/hYNHJrfWlWG2uUyKMoiycUeSjR7MwZyhhRBpWLU4uy
         as4N+wj6HFKTcGq9j7bEiwsypcHaMcd0Q4CqctkIkFzJT4rHSzw0TRFBqQiKHjjqFB3e
         1Ls+hVdsR3IxzvqtLG5tG/m5/zZcv19cQ4HYT+G6GCyblJRvBhL+OUO8ZBHjUbi0O+mF
         SExg==
X-Forwarded-Encrypted: i=1; AJvYcCX4AKQNo28HldjIKe7MJSyGZHn8G6NDiOx/IkfM9FbUrUlt67SxprFaPDNAuiQHavIDMTBa17CQIXv3sf4KP6Br5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyotEoueWiA1I7q25ars69q02KrYTkGbD47BXRMQaFxbi9TzgxR
	VQLDI0YHNfwJWS/alajrcExjSVGGZARPU8K6Dvjljb9Hk9QMb33/Z7LfzumI4muEjJY=
X-Gm-Gg: AZuq6aKWfStlcbl5Bjts0Fiix9MTz8ZbMgeNisvdk0KpO6od39jcEsEanhYjPE0KNrC
	X1WX9XNj+iOVvPao4hPZ26RjXlev1DvdBFpeGtqnD2CKSXxMefSFc7NR/L46P+51yMftrKv6VBW
	CXt8Rbm3fuZpJ/B7fWpy1pg52C+WvPZR5dDkCpLl25ML2tzlK/vQliUiVfUJQhKKTamAXaL0ICJ
	d7XcrExHV8oelNr+04XZ2KOue19CT7yG2uqRBaJO5fMIh7P4A1WaMVzS7qIPxVVsTdjtTuV9j6s
	MkW1Aq9XYNL9nRacio0tqj0OqJFiyw5IKwtkJ9gk8Eged2PjN9stTmIc9G8wgwkW5HWtovGFJu0
	86l/YHjJUtYC2ASU/xyep1JO2nSkEgzWqoRIfkWQ4IpvStHqLNJhujZgr9FkPltL8F/Q2wRIWcc
	M9tO4zUm7u70mRmOOB16LRAA3JVmksGA9zDZa3/ukUQmo7nGqQ4ZPJGksEY/wq1GhDnNL/13yXe
	X9cv1xKT+vS2wwd
X-Received: by 2002:a17:907:3f93:b0:b87:892:f43b with SMTP id a640c23a62f3a-b8dab4455a7mr396560766b.42.1769616656353;
        Wed, 28 Jan 2026 08:10:56 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1c021fsm148553366b.49.2026.01.28.08.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 08:10:56 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 28 Jan 2026 16:10:55 +0000
Subject: [PATCH v4 06/10] pmdomain: samsung: don't hard-code offset for
 registers to 0 and 4
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260128-gs101-pd-v4-6-cbe7bd5a4060@linaro.org>
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
index 3bcba7d38ac1572ef4bc2f4052c904dd6c4a7bfd..8df46b41f9bc8f0b2a03300169a4b52457faaf4d 100644
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
2.52.0.457.g6b5491de43-goog

