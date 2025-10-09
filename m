Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8600B1E0E1F
	for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Oct 2025 15:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760023512; cv=none; b=g1H8RgD/Eg9nch+q3RrL8sYGEiQdQt/8Z3ztTozqnC1JHqt6eKGj2MM/LXr94vzH78JroMZSoPnSU8PMhm0V3OX2pdsddLTmnGYUy39hB7Ez7ms8K7ZPw2cWa1p1slCnuGjsm+dJbS9s2YFOaRwPpf76VBPPJn0H8/2pcJjauAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760023512; c=relaxed/simple;
	bh=8Ji8C7SpUzRnr4uMcWokKZW8lUvYX6JJLUSo4lu5Nb0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dyiK7nXASpfTAzlG31YJcpsPfSgAGv4Sf75fD/zoeoAQEZhJTw6KjQUlTHoY/WQ7p953J9yrU42LkuvirWGxgeim73TSSM/Z0XDnIxTU3ax6yYEx0/sIN5QXVhonCI3RQZOluw6B11k5ffn32JvwRL9OVtDdLInLYmodT/hhZAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=txHzJWNF; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="txHzJWNF"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-afcb78ead12so193372466b.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Oct 2025 08:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760023507; x=1760628307; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ousPsrsRzOuJ9D//mwlWhy/3PCTfUESlugicNK8z87Q=;
        b=txHzJWNFiTE2JcnC5bG/2BCoGJAALc13E+ze6lvCIdC1ko4/4SY5l9qMQr+GBNDgxN
         OiS3lN1EMVH7eWdRPwPz221avsGZuWhF3rSzIOa3r0h+y1MB9O8572mwfHkSHosz8g6L
         aG7MIrvX1bqhP993pyHFq7zAm1Ied0ThMOpJixADrCRzhlvfXpBumRVYeq6N4p6gkVZm
         W8Ug8Q6nnSeqe5yTT2EI+/MvO/dYrkS4muRChBf0FcPXauk4yQRCDxiz05BzBOe0MUgG
         ucdD2Y9lj+pnpDeE6GDhA6ZoSZ6+RUYAWEx3rSfsh/28C1VwAsAOLXHprOGCj78ERZDU
         F0gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760023507; x=1760628307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ousPsrsRzOuJ9D//mwlWhy/3PCTfUESlugicNK8z87Q=;
        b=B9jheoj+zY44QlLk52scMI1D4y6YpZ+mS3b7lLGZQ/VfFTWTdI7RyWuvsdXTmf0llw
         wDGlC/3oG6X18pV84GE5XGpZ4yAwYCE7JoWhCIgBQfWvd96M8p+Q8/xMF87eNZ6/W4Xv
         h2UUVrVImsIdSGDwJC1ZcSeyzyzm6xko+l6VxVQuXPhfOT5SOsqgjrYxHlKv4I3/MKDD
         fzB3POCU530kY03LUnyjPHyllfPMnFBFzU5e1qUfp5aGI4BfYHt7F3M2z8F5wd/vG0ql
         Fl+7+9trvja/qYBh8oOTk7ZBOCtAm5xhAyUsKZ8wplQHoahIKDCToUYTC0amCundKSpY
         JODg==
X-Forwarded-Encrypted: i=1; AJvYcCUFyxmAj0Xv4qJ23IwLujK4o/j32RIlbVCVHRxDLR3XMoflpdEMxeW8zdsTfmAxSlYVUy77lyJ0VWf85DI/q9L5Qg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrWDWM8clB9cwx0uyxZ9yZiWTQ4wHCS/W9alKGT6dpZhJGRlEW
	ZX/nxRmr9HHyPq3FdPzGj+FGLhF0wMHP9lV4fIIXqtnZfCHOR+hqMTM+dJz/DPUf+j4=
X-Gm-Gg: ASbGncsd3j87zZGa0dEEsn0D9Qq+WJuU0FLg3yxEpjlAccjO1dUGT+y0M/OnIz4CeeI
	A2PNw8PzYY1xye8DIMklmYKR8azBM0EWNuepEZpNg5DqCrph+gNPJzAKvvJXsX8VewT+DyVwdVh
	Z8gg6UG3xToYFt4gn6WqeWU2XRFzYGEsFA5KT6J8tZwkguKG/pgwrcaGPBIslB4ofSOrLZxD07K
	1XbGUIwtoWXLms+mpQIDfci/SNQ9RWTqb/M9gwSgLLPPCHPbDXhpG1d2XyG2BmRhBttXd8I+2ju
	uYVLh7j0hItt/1L0UkTNSiCIFCbHTjJweqQWoVLlW0bp6YCr6HjD8XbPYtHEyuz8Qkfa0RNYjLh
	qdrl0yWQGWspPP7v/obt+12HXxtC4lgtHP37WagVkWjnJjp7fuN9jic4EuVClqysDiuGRfJ9Wn9
	4F45CE8pb9GQ2tXuUZt+gIX9vFjb942hR+QDJ0osGZQKN9Hc1lnAc=
X-Google-Smtp-Source: AGHT+IGU5YJiQEOLDla4H1yxJNOxda/6iu+/j1tDENPR+jWfagJHuOHAMVeCVTX+CKrhpEHAyCcJqQ==
X-Received: by 2002:a17:907:934a:b0:b48:730:dbb3 with SMTP id a640c23a62f3a-b50ac1cc3eemr881096366b.32.1760023507336;
        Thu, 09 Oct 2025 08:25:07 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b36fsm1908967566b.62.2025.10.09.08.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 08:25:06 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 09 Oct 2025 16:25:06 +0100
Subject: [PATCH v2 04/10] pmdomain: samsung: plug potential memleak during
 probe
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251009-gs101-pd-v2-4-3f4a6db2af39@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2

of_genpd_add_provider_simple() could fail, in which case this code
leaks the domain name, pd->pd.name.

Use devm_kstrdup_const() to plug this leak. As a side-effect, we can
simplify existing error handling.

Fixes: c09a3e6c97f0 ("soc: samsung: pm_domains: Convert to regular platform driver")
Cc: stable@vger.kernel.org
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
reword commit message, as this isn't a pure simplification
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
2.51.0.710.ga91ca5db03-goog

