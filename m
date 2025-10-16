Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B7636996C
	for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Oct 2025 15:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760630336; cv=none; b=DpRDyP2D/YX1O/JbfX2bwvGvpDs8589KI6wuLPGhrA1zGJP4wtaXLr/NlB45u72LMAEYURQ0Kn3FhiuqVsQVATe9UQCpYfc3bEwi9ez0HsvsCxKGX2UUh8bx5sYkJexSbvvyA1sQNhFEN7LAOncfbU5N6MuzoRNmpc2gnvX8eoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760630336; c=relaxed/simple;
	bh=/ffMxuodyntRU0TJwCLIfgdiy8tvJ3D6CLikLFYkO/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oMMOOY9CG3yTHO5Et2sGFpmmiY7ZnKo4yYWoZgIeZUAuN3Nk4Atep9eHGpymXZK7U1v+jmQoqWZaCnwg3g9yB0nKjJ108wMEcgNaDZHDdrgfiG1L8xUvXkwR5gHEevmc9RPqUPSCQou1cxXUVUG7YHE7LQOH76l5PTlgjTCOBnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iFtD4zJB; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iFtD4zJB"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b40f11a1027so171479366b.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Oct 2025 08:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760630332; x=1761235132; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4DqQ6MoGys1zapyNUJpLRuxdOB+fSzbQVKEkSbvrKC4=;
        b=iFtD4zJBDE4EjW+2cTWPAgc02LwhOH+o7DOSuK2VA0Xggja7MlzamKSyHLdTYKpzOO
         aP2Bn9LyadytRRPJuF4A4V4H0ZGWvBejqumysnUmiS2HzzlCHmK+sESOT6Vnp3rXu1Uz
         IZcjFY488xnl1pnlk0l8catogL2GurjI54+npd4BGqA5KFiNNDLSCpeZzSFPFXm5GSPB
         AkdXjmpWl1POriJb7nVQXJbHL7Tg/+HSqaTdjhyV8hJ6MFZRIJKFph+wrMByzWTGTAQa
         hqeraFg3D29mwI14enlQwRaD0BU2phbKKTSfvfzqPv3M9NPtzcJLVPz6bkbmvCgl2e18
         w/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760630332; x=1761235132;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4DqQ6MoGys1zapyNUJpLRuxdOB+fSzbQVKEkSbvrKC4=;
        b=pslD33Dq2Jxh9j51awrf3/zrPrRnWY/0bWA85fUXvF89wOQrdVHvRbKkVXJjqD8OnA
         C+tR4NiEmMb3Dv/5CRrFcAwQd+Ch8N1kD6meJf1Yfl8bTTbQAXAh1PwMbNTSznI/iQQb
         eggkSwW5Q/Wijy20Ce1xwmJkHCD1llJ+eO8ZHsPu63tfIR259PFQP6ScJav4OvjDix0W
         VBkFtCiPg9QLlzGdmtH5N/NNkNyXK4hz3MajGq0k7jO/9weHy6tXwj84q9ZJ4c3PpuDO
         L8G4RN0X65gWHyHSOaTDotJgulnrHNGF8r36EtyA07TeJJNzrJ2RItjTUlaObQE/WOh9
         DoPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfpnnSt0C5U42P4GwmBgzS5R/GFKXQNcvViaFrthEG3AuBE66nD5kkdHsk2KSWKya9hySt60GmUkmqoWYAkV3knw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOGyI4uLC6zKT8H0xG4WkZPzekHbFyp1EZ6xrO/bYDdX9cQGSQ
	O/eMtfkiUb8sRURsepU1PXqQzjQvb5vJIe3W2BJqx0EWVL5oQMFBpn4I07j/ZzO6ZhU=
X-Gm-Gg: ASbGnctkvVxJdssoaoFtW10gj1Ou9LRxSCM1oc8C4shVZDfvO0ir7V8Fp+Uc9b8ZUCu
	xokKxRiW6lZfqYhMlmh8t0XmSVdEhP1SLzXFuuFXm3fHEHZpZpdNWJ+jcXKbMi6/Od2mW8XisiS
	E0G0FJMsZZxPPxiHrm/ck118rNOKpAvSmu30firf8sqdAhwOpXGCW9LS7y8hpa7UmxNi7/ffCpB
	mZop1vI1VVfVzqTMKCtr3jWfJBUtw2TegMDpv+R44/vRVFuaPkGPcBBwi8gwjUrXoJYXig2hQfC
	KfQmUDItpmzjuGgiLBNnPmNYwr0zWIE1fOIxOH3HOdbEY60PCtEPbQJ6UKoZ+XQhc/zd0Yb96J2
	Ze66B+MNletCtPf4SGOmtWTRGirBi3r70uHA05/vEjWMeAuQR/ARer3TLApWAbBgUj+2d0H2EPJ
	Qw+qCoxG0PPcYaTsgbNFJe3E24SlyBkHJF4UZ0QKUiw4jvxyEoQQWPiuR/e+A6VJATaCLN6Anxq
	oj0Xt+3hQ==
X-Google-Smtp-Source: AGHT+IGbtiixleiqyswoz3qLTql2jI01A11bbfMUkIlJUu938gTSGbLcf+e3VcOx41cjcQhTYXkCpw==
X-Received: by 2002:a17:907:3daa:b0:b5c:6a00:f8da with SMTP id a640c23a62f3a-b6472d5bbf5mr53175666b.1.1760630331578;
        Thu, 16 Oct 2025 08:58:51 -0700 (PDT)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccccb4811sm549021666b.56.2025.10.16.08.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 08:58:51 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 16 Oct 2025 16:58:42 +0100
Subject: [PATCH v3 09/10] pmdomain: samsung: add support for
 google,gs101-pd
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251016-gs101-pd-v3-9-7b30797396e7@linaro.org>
References: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org>
In-Reply-To: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org>
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

On Google gs101, direct mmio register access to the PMU registers
doesn't work and access must happen via a (syscon) regmap created by
the PMU driver instead.

Try to obtain this regmap using the parent node in DT in case this PD
is a child of the PMU and fall back to the traditional direct mmio
regmap otherwise.

Additionally, the status is just one bit on gs101.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 65 +++++++++++++++++++---------
 1 file changed, 45 insertions(+), 20 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index 15a1582aa92103a07335eb681600d9415369fefd..a7e55624728a62545eac049c9a51012a229f44c2 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -12,6 +12,7 @@
 #include <linux/err.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/mfd/syscon.h>
 #include <linux/pm_domain.h>
 #include <linux/of.h>
 #include <linux/pm_runtime.h>
@@ -78,8 +79,15 @@ static const struct exynos_pm_domain_config exynos5433_cfg = {
 	.need_early_sync_state	= true,
 };
 
+static const struct exynos_pm_domain_config gs101_cfg = {
+	.local_pwr_cfg		= BIT(0),
+};
+
 static const struct of_device_id exynos_pm_domain_of_match[] = {
 	{
+		.compatible = "google,gs101-pd",
+		.data = &gs101_cfg,
+	}, {
 		.compatible = "samsung,exynos4210-pd",
 		.data = &exynos4210_cfg,
 	}, {
@@ -107,17 +115,9 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	struct of_phandle_args child, parent;
 	struct exynos_pm_domain *pd;
 	struct resource *res;
-	void __iomem *base;
 	unsigned int val;
 	int on, ret;
 
-	struct regmap_config reg_config = {
-		.reg_bits = 32,
-		.val_bits = 32,
-		.reg_stride = 4,
-		.use_relaxed_mmio = true,
-	};
-
 	pm_domain_cfg = of_device_get_match_data(dev);
 	pd = devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
 	if (!pd)
@@ -128,25 +128,50 @@ static int exynos_pd_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	/*
-	 * The resource typically points into the address space of the PMU.
+	 * The resource typically points into the address space of the PMU and
+	 * we have to consider two cases:
+	 *   1) some implementations require a custom syscon regmap
+	 *   2) this driver might map the same addresses as the PMU driver
 	 * Therefore, avoid using devm_platform_get_and_ioremap_resource() and
-	 * instead use platform_get_resource() and devm_ioremap() to avoid
+	 * instead use platform_get_resource() here, and below for case 1) use
+	 * syscon_node_to_regmap() while for case 2) use devm_ioremap() to avoid
 	 * conflicts due to address space overlap.
 	 */
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res)
 		return dev_err_probe(dev, -ENXIO, "missing IO resources");
 
-	base = devm_ioremap(dev, res->start, resource_size(res));
-	if (!base)
-		return dev_err_probe(dev, -ENOMEM,
-				     "failed to ioremap PMU registers");
-
-	reg_config.max_register = resource_size(res) - reg_config.reg_stride;
-	pd->regmap = devm_regmap_init_mmio(dev, base, &reg_config);
-	if (IS_ERR(pd->regmap))
-		return dev_err_probe(dev, PTR_ERR(base),
-				     "failed to init regmap");
+	if (dev->parent &&
+	    of_device_is_compatible(dev->parent->of_node, "syscon")) {
+		pd->regmap = syscon_node_to_regmap(dev->parent->of_node);
+		if (IS_ERR(pd->regmap))
+			return dev_err_probe(dev, PTR_ERR(pd->regmap),
+					     "failed to acquire PMU regmap");
+
+		pd->configuration_reg = res->start;
+		pd->status_reg = res->start;
+	} else {
+		void __iomem *base;
+
+		const struct regmap_config reg_config = {
+			.reg_bits = 32,
+			.val_bits = 32,
+			.reg_stride = 4,
+			.use_relaxed_mmio = true,
+			.max_register = (resource_size(res)
+					 - reg_config.reg_stride),
+		};
+
+		base = devm_ioremap(dev, res->start, resource_size(res));
+		if (!base)
+			return dev_err_probe(dev, -ENOMEM,
+					     "failed to ioremap PMU registers");
+
+		pd->regmap = devm_regmap_init_mmio(dev, base, &reg_config);
+		if (IS_ERR(pd->regmap))
+			return dev_err_probe(dev, PTR_ERR(base),
+					     "failed to init regmap");
+	}
 
 	pd->pd.power_off = exynos_pd_power_off;
 	pd->pd.power_on = exynos_pd_power_on;

-- 
2.51.0.788.g6d19910ace-goog

