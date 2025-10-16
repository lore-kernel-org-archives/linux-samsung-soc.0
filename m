Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87AB242D78
	for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Oct 2025 15:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760630328; cv=none; b=rlqCmRAxvYz/434lUO+R3LB0MBhWks7WrCTUTP5NB1SfRip67aWU8Vml0brIszL5gqj6on/NuTz2OypMFB7L9VAWhPgIQ4hT1Rr+HAqez3NDvsHPzsqCSz4P4Rwdye6snVY0MCxBzFdSrBRW6blZnbRL+EfcHR7VsFmdinANJqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760630328; c=relaxed/simple;
	bh=EEsquKkEeBg70sExu6NBhMPgtI1d6LaAxzWYM2RtBsM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NKRJUEXxAH9Gw6JzpGrW2fMhNxCPbmDc/tWDrfT6JDMpkYYlXOdMRskAx13eQBQWatcrEP+GL/KYr407nFnemucUaN9/x0FLlFYLyU7fPRtJ8OcoUocSNBqo2yUM92BkMGmEw6GVM/PmSTJAw8XG7o9e8VKv9l2Pzzhzvk/cUGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y8BF5JLG; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y8BF5JLG"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-63c1413dbeeso942105a12.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Oct 2025 08:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760630325; x=1761235125; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fsw3nGMrSykhH7OS6v0fNa6J+UTT3lDdTIT4s5cDl2M=;
        b=Y8BF5JLGQdy2JlNx7sQH4tIZzRe4qTu/9sUTMSESdWKcTWhhpBxpWNpL7yuB4vlPEN
         RzsfEDLLgWjb8zZTK4hvvIO+nrZGGYz2WXTKCIbMEtyYKxSuPHh+X8l+CBJyGidcJoWV
         pDtQ4YxaYyy5zq5sSpoz/j6PWIXTSWNPxhMfnNNPb4S0v99l+jugV53p3RKzbRa+hf6z
         kw9msFoWi7CfiFU7IyB8wL4CEQ9SXeWWc4lmb+J/ri4F/tUcl1e6S7ow1c6YOXKc4vvF
         Gf7NrK+p9WJJTMCRlMeBRcA4jRrtIwhftVJ2tmjqgfVdAJPS/2tKryeQA4q34zD2nDf0
         NmTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760630325; x=1761235125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fsw3nGMrSykhH7OS6v0fNa6J+UTT3lDdTIT4s5cDl2M=;
        b=u0ubi1vt5AciCthAYbx62jSRHSFoJDTCSMd2WncIzbsr6SJELuXTZvFQ0iK8tj1SXg
         RR4opKEgExbnsLpZeYSxy7bwrzkpSmyKfSyjwAblQNwSnOaK/K5n3zh68el5iLvD8niz
         e/4oAUwniVf6X1EYsoxEusrlxBbActRFwH0PULpfhH6tkGTCyK3lWO3JUZ+O/DDa+G77
         ly1TsqXGVLzbypZPzNqDb77Bg74XjsWdBKjzCuZu/qybXYj7NKJc6tcQhG3c3heKqeVx
         6SVuNSrvINPxUF7/tfJ/U/7AP4M5XfmUymUGzeLtmpPvFxB2RvsufL+w92WNKTsET1Rz
         L5+Q==
X-Forwarded-Encrypted: i=1; AJvYcCX5xcO21nqzEbWUWv7NUoBeL0nMEw4p5+awGOXQFeNVzoPcLsnpAkKcOJP6PPymFooF7LiEOvkG4iNieS+8r/aRoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiJG9oFY5RemWcnFfxMrxPOC0DVl9m+tFUIVbyg0bc66Lcl/So
	SgcWosCUp/zb6a+xGLCCwBKN9W3Ywnb6bCB6K7GV5Hz7pX0WPk1eSb+5I60ugatk2pI=
X-Gm-Gg: ASbGnctt9YCkvHa9jbPtLEk/TiKyNodYfK5qDOuZVdFHpzvjRzN0B+d6fLqV7nc2D9L
	KEXeDjQsdrurIJG8fLPA8wZ07WZsQ80u6SZUjcZYZhPG+InRttocbHXI++K+9VS4qko3m/Bj7/M
	nCHpd/S5aTfGpMwGh9sREV1Q524ARDlG9S7y+osfLCvDxpaFNEpOIWKs+jkXq+7thmkmKY8Gruc
	aE5fndtxz6MGrfMyTu32Fz9FYFiVkrLjGf1PEpe4dEMrKxhF5lVjcOATw058rWeWVHCk96oytsC
	gGcjhZU1dk58KeLjtuwfmSyeR0psNM3WqowJ41VD4EJ5p+AdEwLQlzw0r23II4/Bg40oDEQKF0V
	YA9SrWGYtNyZoWM2GBXmBbgg8Jd5N2VCpfy+Q66nG5/lnmW7lrQjgtlesf40nWQYd5ZEClSR14W
	YSS7DfM4dF56YnpzuiS+FYBmpXpsNI4pN2N9vA0EjLJCaiW/wGhmtSC20Xudhgt23UQbzfIuo=
X-Google-Smtp-Source: AGHT+IGMnDfjfOzAoSs5yqEhzRvyTEgvB4V8vlEt+WcTbrwh6jjeesT23Hol4E5oowOHUJe3KnWaFA==
X-Received: by 2002:a17:907:1b21:b0:b3f:c562:fae9 with SMTP id a640c23a62f3a-b6475703a96mr48316366b.53.1760630325277;
        Thu, 16 Oct 2025 08:58:45 -0700 (PDT)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccccb4811sm549021666b.56.2025.10.16.08.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 08:58:44 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 16 Oct 2025 16:58:37 +0100
Subject: [PATCH v3 04/10] pmdomain: samsung: plug potential memleak during
 probe
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251016-gs101-pd-v3-4-7b30797396e7@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 stable@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

of_genpd_add_provider_simple() could fail, in which case this code
leaks the domain name, pd->pd.name.

Use devm_kstrdup_const() to plug this leak. As a side-effect, we can
simplify existing error handling.

Fixes: c09a3e6c97f0 ("soc: samsung: pm_domains: Convert to regular platform driver")
Cc: stable@vger.kernel.org
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v2:
mark as fix, as this isn't a pure simplification
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index 5d478bb37ad68afc7aed7c6ae19b5fefc94a9035..f53e1bd2479807988f969774b4b7b4c5739c1aba 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -92,13 +92,14 @@ static const struct of_device_id exynos_pm_domain_of_match[] = {
 	{ },
 };
 
-static const char *exynos_get_domain_name(struct device_node *node)
+static const char *exynos_get_domain_name(struct device *dev,
+					  struct device_node *node)
 {
 	const char *name;
 
 	if (of_property_read_string(node, "label", &name) < 0)
 		name = kbasename(node->full_name);
-	return kstrdup_const(name, GFP_KERNEL);
+	return devm_kstrdup_const(dev, name, GFP_KERNEL);
 }
 
 static int exynos_pd_probe(struct platform_device *pdev)
@@ -115,15 +116,13 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	if (!pd)
 		return -ENOMEM;
 
-	pd->pd.name = exynos_get_domain_name(np);
+	pd->pd.name = exynos_get_domain_name(dev, np);
 	if (!pd->pd.name)
 		return -ENOMEM;
 
 	pd->base = of_iomap(np, 0);
-	if (!pd->base) {
-		kfree_const(pd->pd.name);
+	if (!pd->base)
 		return -ENODEV;
-	}
 
 	pd->pd.power_off = exynos_pd_power_off;
 	pd->pd.power_on = exynos_pd_power_on;

-- 
2.51.0.788.g6d19910ace-goog

