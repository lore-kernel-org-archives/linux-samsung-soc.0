Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546E014B084
	for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jun 2024 23:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718925224; cv=none; b=NjEU6BzUKY6sMQlv7eB3K4tMgbFVVL99Bl27X3c2zwKwYeTvk32Pnxo+cyNEKGFUUIuYREUHsiTUhyBE2kzV98i3zTU8bSZKamYs8x/mMKd1qsDnuPlHYxnVuU1DcTb75lh6tIoen02ncVuqCE/3uTyaZ2KrSIRU8X7VYuTYYtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718925224; c=relaxed/simple;
	bh=XEqdsVE48Lph9B2nh3iuLDFkzRd3MmpOXZcupNT95pk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tcDGGbKamfWWNB88qvZe6UGeQm5pujHysQlcKpbDKu1qGDhRxyJTgboaPwXxwIwGhgwbYYfoKfQwEygEusawz6EPfLlYkyLzC1F7Cl1ofN8tNgBb2ZguD/pMZzT17dDGn1h0EW5RaeJfglY0bWJZ3OPkFwsQQCBm4okkRn+3V7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qwxekNTJ; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qwxekNTJ"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-25c95299166so765075fac.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jun 2024 16:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718925222; x=1719530022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xx9yiqfqGQhoL/OQzBJX0T4MbHx9pH2R2+We+nfV8yc=;
        b=qwxekNTJd0Q1PBUbF3u1bwPLHgotOIn4MXBzxsbe8mMIh05yuW5+6xzKvivl+gHPm6
         wxo21d9/5UqsgnQhYyyXRcTOxBtdt/bsEkabSNpZThOQ4JYmeT5CIeA/sAeysjs3yE+2
         F1gtmndQmHIKA4RMXYIKReKj0Cq2kB7nutm2XOo9A0uUlYrVD22Q7EUtIebYWu4NK0i6
         UMv5c7DKeaBxVn7l4PF7nPbYBXJ3OArcXUPb5/qczqo7HdUrCroGJ1mXLqRvGurVZkdk
         iyq1ZJGQI1Rw7FijTUfk0ybW7fvuEfiViv2s89xkjdtfZW/Jiu19CiCmkudELdDDDd1/
         lqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718925222; x=1719530022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xx9yiqfqGQhoL/OQzBJX0T4MbHx9pH2R2+We+nfV8yc=;
        b=NPiGbwdNbKgh9mIX5G5QSc08RJfUYc+HfeB/8HvYJpHND8MUPpABbvMWKstnRi8CN1
         XiFG8Sf9P6q8d8Na4maqWpmvmcDyoSXolerY68DEfm63jELQsLM9DPFRomdX9jUZK4iD
         WcZUglHO0ppEb5cBIlyn8kf68pEi4m+1iWUUVaxfhW+qZqT9W66yT+htpr5wOCy1eGCL
         7tvjhwwQJDOe5AC0a7mOdkEZ9uXp+uhBpL3P2eHkIlYkmZszeFrGU7HbCajJo2qSBA0G
         iv2uwsEDWxZ05fpnhKL7+QOIZovy3/1gbSbZ3H5GJ4k78pF8Bvo+ZKE+T3ZFfWWJwpaA
         G2Ow==
X-Forwarded-Encrypted: i=1; AJvYcCUyVZOnYN1AJ/7qrE6fAoQoxMY6qwHajlZA17HQPwt/bQ69T1F58N1C0UbCIOg/MR8ifx9u+scKNpn04N2aOEk8sKpzRUpgbm/CLhDR158ke1M=
X-Gm-Message-State: AOJu0YyaDlO7TmlkCFM4hGcbDg3QnC8TThLVmrN/8sATtHVmlelAxxGL
	JGJhMb9/pU8Q2kqtxhh2eWk8ZbuhCkIqRpj+qkq6bzzU9adiv6gI914tgdQCOJ0=
X-Google-Smtp-Source: AGHT+IG8lAKtWiSgYIqlkSt41d/qaNiahUHwFKBCRi2rphALIUFAjgt4BUmpmumuwrlgNLH0oGwTwA==
X-Received: by 2002:a05:6870:c111:b0:254:ada1:aa29 with SMTP id 586e51a60fabf-25c94a22a97mr8080798fac.27.1718925222389;
        Thu, 20 Jun 2024 16:13:42 -0700 (PDT)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25cd49d18absm131302fac.25.2024.06.20.16.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 16:13:42 -0700 (PDT)
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
Subject: [PATCH v3 3/6] hwrng: exynos: Use devm_clk_get_enabled() to get the clock
Date: Thu, 20 Jun 2024 18:13:36 -0500
Message-Id: <20240620231339.1574-4-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240620231339.1574-1-semen.protsenko@linaro.org>
References: <20240620231339.1574-1-semen.protsenko@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use devm_clk_get_enabled() helper instead of calling devm_clk_get() and
then clk_prepare_enable(). It simplifies the error handling and makes
the code more compact. Also use dev_err_probe() to handle possible
-EPROBE_DEFER errors if the clock is not available yet.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Anand Moon <linux.amoon@gmail.com>
---
Changes in v3:
  - Added missing '\n' in dev_err_probe()
  - Added R-b tag from Krzysztof
  - Added R-b tag from Anand

Changes in v2:
  - No changes (it's a new patch added in v2)

 drivers/char/hw_random/exynos-trng.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/char/hw_random/exynos-trng.c b/drivers/char/hw_random/exynos-trng.c
index 266bdad84f3c..997bd22f4498 100644
--- a/drivers/char/hw_random/exynos-trng.c
+++ b/drivers/char/hw_random/exynos-trng.c
@@ -134,32 +134,23 @@ static int exynos_trng_probe(struct platform_device *pdev)
 		goto err_pm_get;
 	}
 
-	trng->clk = devm_clk_get(&pdev->dev, "secss");
+	trng->clk = devm_clk_get_enabled(&pdev->dev, "secss");
 	if (IS_ERR(trng->clk)) {
-		ret = PTR_ERR(trng->clk);
-		dev_err(&pdev->dev, "Could not get clock.\n");
-		goto err_clock;
-	}
-
-	ret = clk_prepare_enable(trng->clk);
-	if (ret) {
-		dev_err(&pdev->dev, "Could not enable the clk.\n");
+		ret = dev_err_probe(&pdev->dev, PTR_ERR(trng->clk),
+				    "Could not get clock\n");
 		goto err_clock;
 	}
 
 	ret = devm_hwrng_register(&pdev->dev, &trng->rng);
 	if (ret) {
 		dev_err(&pdev->dev, "Could not register hwrng device.\n");
-		goto err_register;
+		goto err_clock;
 	}
 
 	dev_info(&pdev->dev, "Exynos True Random Number Generator.\n");
 
 	return 0;
 
-err_register:
-	clk_disable_unprepare(trng->clk);
-
 err_clock:
 	pm_runtime_put_noidle(&pdev->dev);
 
@@ -171,10 +162,6 @@ static int exynos_trng_probe(struct platform_device *pdev)
 
 static void exynos_trng_remove(struct platform_device *pdev)
 {
-	struct exynos_trng_dev *trng = platform_get_drvdata(pdev);
-
-	clk_disable_unprepare(trng->clk);
-
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.39.2

