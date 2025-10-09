Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD59F1F4176
	for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Oct 2025 15:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760023514; cv=none; b=X/+rpIR+hRYoKTX0EmB2FsdYBTNc90sTI5fod12zxulPlEEMeVRX0GWQHQiVMhS9+lee6IXTbzmyPb7+RJQVqdZrGtsvLzWM4WsQwmxhv75Gt8rG6QxbpoFX4OW5ta18KuKB1FHbm2PNMndEn/e4Vvl11+Y7hKp/836dxabMg9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760023514; c=relaxed/simple;
	bh=i1nOHrUCe5k8EnZKJDt7L0OKYnEuaY/Gf2nz0HIUrG0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VWr9O2rkpGBTJG1kAHzTtl0YmW2XrNxwSDI9PTYApMtmYt94t0lwvvBMxnUCzmfUotw6vWGXhCvkCNZd5Oz66RykCGi/t2665gJRtXbejvnI0zyk/yrJOoRK3ZE7YIdzTnDiur1jHvpBvvhaV83CcP0rA9dldZsT4bhknBHRZY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nXLgTyXI; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nXLgTyXI"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b3f5e0e2bf7so188055266b.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Oct 2025 08:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760023508; x=1760628308; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BpnrETzk7C6oZhvz4jEn6YRTv70n/RyEUTvN5Rj5ca4=;
        b=nXLgTyXIaewA1g87ifGGL5YXxWWTnpc0gkldBuM7oj8eEF0hA7sAhJ2wlPeWcOo4+q
         kf9k2a/lLT+f9prpx7JYOoxQ/zhATJhzK0r6n11TfjZ5QZi8u3Il86s8oQtTsbGfUA09
         G6ECoZlWLvmSmiDWV6isPcwz0CQgtgfTkGDa4oNQYe5Xw1IusAWYUA5hf6+t/hxNJPHj
         cyxRPj1RySgnlZ0gEm6E6zD/w9DWie/kK9WK3JmSht2nOvW514Uz4wGhxBGeHLOvVpYc
         kjlli18ZUNt8xv07FP9t5WTdUECd2qn04P48WH2TTvJQOGs19xcUBvSdaP9BwhmNYVg7
         SzrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760023508; x=1760628308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BpnrETzk7C6oZhvz4jEn6YRTv70n/RyEUTvN5Rj5ca4=;
        b=TBmRJ+vv3XcqiK6FR3ekMFdNEfPexagH9zGuwgm2p5FB9Ul2fq4qzT9l1L+ckPBWjU
         JhXtIkZ4UGPE1k4V/TFCOZKPMjqIw8Zfup+jrfDEeovNLcqbjUD5QlzfWSZb73l4I1vq
         P7F+Lyn/pkyWctXMY1cXfIS5+O0o7IH2sRIHX25hcV1uxOpHi3pqIwrXZkSkfG4XYBrH
         fm44LZRFDy29y/TEoPvgo8g3XdjBLacPgEYx0+650zZoVu5h9S/F+m64zs4YJh4rMyjI
         ByRmNZhhlfRe9C3ApuHpQ8geXVX7Kzc0jUCuMlThzvl21nQmZRHoXtHNeAgj4dIxyqaw
         C74A==
X-Forwarded-Encrypted: i=1; AJvYcCXsg1oXvWtXfSoCXqaWjfw8Sefx5IzhiVgobH0ge+LTj+6tLh60UR2dCgq4ecb1aCx6uiUZUTS1ocSQav65fdYrDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXci8quU2JsA4b7hL6+EMdSUFrT1A3wqNHLp1w1ZT/uCNZCrrj
	cbkixr78LHL/eG1ZD5dA2pOPyZAYGFN96MqR4aia+Plqv1ELgJ94mGtDL8qtSMXOH9Q=
X-Gm-Gg: ASbGncsKK3pLOhrDc6Ng+4bPlJE62djOqbEJDNZAmboEmWxUgNSGXfgEgPJUfuttu5Q
	ccnxu9iOcxKywbtfQepSCnbJXsfyQjJ/CH9DvQBwwPQUDkFVRxm9ULiCVirYUWiDzFDx5HvJANi
	BfLrM/fq94BNrpKMXr9YHWGFuaHxDeShi3NCeDQcYTzFexSetU6UViZbJFniDeUgsSmOlzNFbmT
	MQIfwCKHO615chnNmwCtjv0LuGwe11BRuUMXfkS9GR8jzVojfakvcRcV4MT2OGToJY8ikD3piD6
	agaMsdXvsS5D4iZncqosoVCv07QqWQ0NgrA9/utM9+R6JBgQpu+RRbxHPHnoslT57+eyrqbyirh
	i6R87mQU0kM0uMcx4HsmtVnszC1WkET1uz/j7pcv1Zwa8fkWKQmqfHLtCb6PIhEkXDO+6wKw8F8
	z9r/nhG6cIjgAdJh/WGTXg16ri3r/XUiSQ+rYSNTkx46lGxJStnws=
X-Google-Smtp-Source: AGHT+IFvQJQZp5hIxcQ/kGfkBnVxpXqrxsrxpjhwZEJjbYHGciKRJL502yUl2gppViGVoCmsbV0c/w==
X-Received: by 2002:a17:907:1c15:b0:b40:e46e:3e0d with SMTP id a640c23a62f3a-b50abfd6af4mr953221766b.46.1760023508552;
        Thu, 09 Oct 2025 08:25:08 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b36fsm1908967566b.62.2025.10.09.08.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 08:25:08 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 09 Oct 2025 16:25:08 +0100
Subject: [PATCH v2 06/10] pmdomain: samsung: convert to
 regmap_read_poll_timeout()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251009-gs101-pd-v2-6-3f4a6db2af39@linaro.org>
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

Replace the open-coded PD status polling with
regmap_read_poll_timeout(). This change simplifies the code without
altering functionality.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 29 ++++++++--------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index 383126245811cb8e4dbae3b99ced3f06d3093f35..431548ad9a7e40c0a77ac6672081b600c90ddd4e 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -13,7 +13,6 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/pm_domain.h>
-#include <linux/delay.h>
 #include <linux/of.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
@@ -35,7 +34,8 @@ struct exynos_pm_domain {
 static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 {
 	struct exynos_pm_domain *pd;
-	u32 timeout, pwr;
+	unsigned int val;
+	u32 pwr;
 	int err;
 
 	pd = container_of(domain, struct exynos_pm_domain, pd);
@@ -45,25 +45,12 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 	if (err)
 		return err;
 
-	/* Wait max 1ms */
-	timeout = 10;
-	while (timeout-- > 0) {
-		unsigned int val;
-
-		err = regmap_read(pd->regmap, 0x4, &val);
-		if (err || ((val & pd->local_pwr_cfg) != pwr)) {
-			cpu_relax();
-			usleep_range(80, 100);
-			continue;
-		}
-
-		return 0;
-	}
-
-	if (!err)
-		err = -ETIMEDOUT;
-	pr_err("Power domain %s %sable failed: %d\n", domain->name,
-	       power_on ? "en" : "dis", err);
+	err = regmap_read_poll_timeout(pd->regmap, 0x4, val,
+				       (val & pd->local_pwr_cfg) == pwr,
+				       100, 1 * USEC_PER_MSEC);
+	if (err)
+		pr_err("Power domain %s %sable failed: %d (%#.2x)\n",
+		       domain->name, power_on ? "en" : "dis", err, val);
 
 	return err;
 }

-- 
2.51.0.710.ga91ca5db03-goog

