Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3661A176FAC
	for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2024 20:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718743529; cv=none; b=TQTCSB/7OZogFU8dNf31ZObDQpAwGaEzXsBnWnHeLKQM9x+whHIVQWlTQE0DWA/+Q6Gr3zEat+UHZkMMqz5frs7DYsUSNM9CSgLMxj0abilvKA4a1O0GMVgHqiFEArewotlVcqHlqGmlLq3wMfi3pA0Ldl9+U9ctkMipoVQyk4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718743529; c=relaxed/simple;
	bh=o3eOG1LnpJmTG9KLHgnK43QtqvIq3WSopLjA7R+Hozs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qc2f6jI9xUujyNzUIVCA5pS0hwKFmcwcgYXKzedPbSgjTkP5f+11etp3FCCnvPmvTPmj56qTyvA5aQE5JyvlXfbVGRrBv81g61eFid8BGLtBXa2gJipxQIo3Q3YPALtp74nLD56gAcbuPOqzVjyUFUjNfgcJRzy2eZ2YR3NmA8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F65tdRX1; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F65tdRX1"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-25982aa59efso403644fac.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2024 13:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718743527; x=1719348327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N5PSLoK5277DwTxre0IUhy89MhV1sfVHkT9GD1kskOA=;
        b=F65tdRX12CZvBh/aL3651rs/OvEn/1FazE8eHzQMvFPHdVmHHZp7VW7WWG19ewIiVO
         WFC61EbwUb/txN8ZoSaFkfcyrqOE4ANqGtULk/2IjudV6Ky5eQeEzU4bi7vCNLwbwwS6
         MW/OCJwnhe1kUKli3I4nL7OGSoBo25S1mieh4EHvTAcC4moz2aYCSXoleb8e4ENY7sbI
         gFp+lLyzwBWM/HGB/vdDpZNzKGK2t321madq8tvtDyC4Lbv8OQPqjBSVsrTeXezlqAfE
         K8j9cQGHsOro13y2kh1QxUny86b3CCj56xMVzrqid8CU6S25P8s46R7ksG9kZoIFzmfr
         nLYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718743527; x=1719348327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N5PSLoK5277DwTxre0IUhy89MhV1sfVHkT9GD1kskOA=;
        b=b3e3hDZHgpmKWRuO0/yVFqnyrCrrbST3PNw22VO2cfvGZKuLV7CKy1yENeeLQ9F+bQ
         ccTgNnaxlYw6j62jlFdlDte+DxHzFSOdx7vaN8BF3yS39TUsA8b9WUevUWAh359qmdvu
         u57pRen54mrtuVOZF2vKltmnPxoJLjafl/SI4RR/TCSYFdz7nDRPFmPDpjg3Y4cJtUcJ
         nLmSYEgQO/cTKRMLmq93CY2lDX4oqn0odgjbIUp9hLQzTsymxihj0aY3GfE24d2qjBcm
         C+6upMD21op0fIiFXtHLy4OaSVrHymRIuZIVXFDdReIEh4MK9b0S2xBjWBvVEGPcgZPu
         eqIA==
X-Forwarded-Encrypted: i=1; AJvYcCUHPJgXN1Xx7k8zc3BpKxX3UEEKcN8GEqImGA4yqUoIOdAHzcvJ2DnH4vPvob14IAFwb61NtoEPvN5eqdT4AlQlrwF8I+L/Lgog/j6RNAEdIR8=
X-Gm-Message-State: AOJu0Yz2sjng3P16hiI/2zgpej5DbmaBXHhRFqeGX2ZSSdofYmVEc56Z
	bElsTyW38d8ocIfkPm55YhIqarnfnOgYfgG4M5mTGSulU5m2PUEj9ONBR06aIGY=
X-Google-Smtp-Source: AGHT+IFDRAFXeFBv7i8uwvM6wavaDuobxVfToXwipE3qzms4/u2yGTluz+/UFCszPXir6zQE6J0cyg==
X-Received: by 2002:a05:6871:5209:b0:254:b3cc:a6d8 with SMTP id 586e51a60fabf-25c94a200famr1057219fac.32.1718743527261;
        Tue, 18 Jun 2024 13:45:27 -0700 (PDT)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25a6d0fd5a6sm231281fac.56.2024.06.18.13.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 13:45:27 -0700 (PDT)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Anand Moon <linux.amoon@gmail.com>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/7] hwrng: exynos: Implement bus clock control
Date: Tue, 18 Jun 2024 15:45:20 -0500
Message-Id: <20240618204523.9563-5-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240618204523.9563-1-semen.protsenko@linaro.org>
References: <20240618204523.9563-1-semen.protsenko@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some SoCs like Exynos850 might require the SSS bus clock (PCLK) to be
enabled in order to access TRNG registers. Add and handle the optional
PCLK clock accordingly to make it possible.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - Used devm_clk_get_optional_enabled() to avoid calling
    clk_prepare_enable() for PCLK

 drivers/char/hw_random/exynos-trng.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/char/hw_random/exynos-trng.c b/drivers/char/hw_random/exynos-trng.c
index 91c210d80a3d..99a0b271ffb7 100644
--- a/drivers/char/hw_random/exynos-trng.c
+++ b/drivers/char/hw_random/exynos-trng.c
@@ -47,7 +47,8 @@
 struct exynos_trng_dev {
 	struct device	*dev;
 	void __iomem	*mem;
-	struct clk	*clk;
+	struct clk	*clk;	/* operating clock */
+	struct clk	*pclk;	/* bus clock */
 	struct hwrng	rng;
 };
 
@@ -141,6 +142,13 @@ static int exynos_trng_probe(struct platform_device *pdev)
 		goto err_clock;
 	}
 
+	trng->pclk = devm_clk_get_optional_enabled(&pdev->dev, "pclk");
+	if (IS_ERR(trng->pclk)) {
+		ret = dev_err_probe(&pdev->dev, PTR_ERR(trng->pclk),
+				    "Could not get pclk");
+		goto err_clock;
+	}
+
 	ret = devm_hwrng_register(&pdev->dev, &trng->rng);
 	if (ret) {
 		dev_err(&pdev->dev, "Could not register hwrng device.\n");
-- 
2.39.2

