Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A581E0DF2
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Nov 2024 10:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732705098; cv=none; b=q80jfpaVAqea0jx19TKXaOTk6OV5Z5fBORvFOfkqYdCBpqi4dcdTkTywvEMcvPmOIYYcDcwPLHKQ1OX5QKDvV0uFvzzQAIHI/QUPVofm927eKAN++vyBGDAE5cuQps1Llz0AOTczGRPSwjdifqNfxFTgtIFS5PDFWQat6TdOkiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732705098; c=relaxed/simple;
	bh=56S6FPhiczc/qLI1wqqGxrJUgzjsmjSd5EAzkBeA1wI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rnN18oeUoEbxCxiLD6k8V2lLlWwCgS6c/ALgNv+EFyBT6sSPPBBt4L5VMMs0ESSyfpDiEc+4WWmr2Fn9tqBPIYYbkU2BjG6TpbHtb5So5PJH/xZT12zZtQzUvaaJ7orpcdUqyUCP782bbGZQiJ5rE9jSLQ7F7BCakAOopg2Xapg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bJ0L2mqQ; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bJ0L2mqQ"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aa5366d3b47so543460466b.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Nov 2024 02:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732705094; x=1733309894; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/xK1rXO8tid7sxZflvw8Sl0BR2j7teaHPSp5KtJr+3E=;
        b=bJ0L2mqQQbMtT1P/XBzdguApdhpViNXjwt/8e9Arfw678Al5oIULF6vMKm/TOK27pa
         owCIAriwrGj6kXkvKr7eeLPZt7Qiy3hKiO7dJc/s7D29bBqnJOu3hBpwNHXDC5y9nP+y
         Cbvyr/dMf/t42s2qJp8j1xOAzjWMd0lzImcgpvqBykis4jb3UpGrleMoBKGFQAPqcdjr
         OskiNa6J+o+PJIz+t0ESs9j2s32xvFjrObnbb65kypoyW0Ik5J2R+W1e3K3GF481x/9i
         FfeAs1cozf71pbQQVN4M+YjYvRHEDOJ/Bscrx4h0phklxg0Uiq2b6hqrz9RgjAlYr4/6
         0VUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732705094; x=1733309894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/xK1rXO8tid7sxZflvw8Sl0BR2j7teaHPSp5KtJr+3E=;
        b=lcTFdp4DhH5uaYsbmeFevDcdKjcs6QL7CYb7n7/t6VwpfL0rxA955KDjMf7gIMsQVI
         OnsU38j90y47ccReMfFjfHDTKibsZmoSMFtkzCReGC0X55uWegW/GdV3RMS45peP598M
         KhnV5jG771ZPHpz6V41iWQC4oL3X8tCcqq1tMY0Vsdq0KiJbN4qi3clrfbqSFfjYyGXV
         R6uMu9vnKJN9Ceg7xmBdxYm6lTpyMk3IdJXbevDEHaOnJApduUiI+a9IPvTh/R2ww5G9
         5bmuFmgJctZkXb6NKn0SfhnKBYgbIT96MmJyYgF+zmUgRE6iv0t+VZEvwUo/Vjmi1SZ2
         fbuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWW3/g49yzAfXeab84Wgr7lKumotXMJTHiHABSfED+BymxwukZ1mQGZZii7hoNQV1I+PQKjBXwB7moFeww+uk+FOg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs0AaHZXL0UpBWHMHnBfzZuekt4vBmNt61YkLXiAyV9KDztJ3D
	P0c07yVWDndhJ212xoWHEfXfzmbMTPPPfCer0cVUKfDhMh3YlYOpOIPbmQ7hRU4=
X-Gm-Gg: ASbGncsnYJhMZFrvHcZXN04as41ug1GZCSfODiMTfUkU2pjeP8GxgYc3CHH8nCuFdj+
	kf0nJ+qK5jOLBBvjk5gkPCgk2BHLD9YBweSmXdDEHXljsoiql04zfxDwHy/Ks8k4PEEceV6S15s
	NrutL47t+Fy6oo3NXm30E/QWrh6aAprno8+EWQJMTmOFximnBmPulsgkQhzCM6Rw0pKzAQXZqkA
	TuIFKMZznS4r/VXYQy6nWZ3PywQ4fnZw+kKdvOgBg7woyfv0w88EZKw9vl+HDITbw5GEDNdQ64F
	ThJr9nk0OdsObQmkRnKOyjVbqXSzM5NqMA==
X-Google-Smtp-Source: AGHT+IFg+ahvle9uWHq2KZqsvbKtQxnkarL+5juw3kuxAh2lY4VSQel9JXoaUYp7iW98tOctHLx83w==
X-Received: by 2002:a17:906:31c1:b0:aa5:31f5:922a with SMTP id a640c23a62f3a-aa580f1e0d4mr204197766b.19.1732705094209;
        Wed, 27 Nov 2024 02:58:14 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa54a6db906sm412183566b.41.2024.11.27.02.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 02:58:13 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 27 Nov 2024 10:58:14 +0000
Subject: [PATCH 4/9] phy: exynos5-usbdrd: convert to dev_err_probe
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241127-gs101-phy-lanes-orientation-phy-v1-4-1b7fce24960b@linaro.org>
References: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
In-Reply-To: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

dev_err_probe() exists to simplify code.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index c421b495eb0f..ceae4b47cece 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1725,10 +1725,9 @@ static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
 
 	reg_pmu = syscon_regmap_lookup_by_phandle(dev->of_node,
 						   "samsung,pmu-syscon");
-	if (IS_ERR(reg_pmu)) {
-		dev_err(dev, "Failed to lookup PMU regmap\n");
-		return PTR_ERR(reg_pmu);
-	}
+	if (IS_ERR(reg_pmu))
+		return dev_err_probe(dev, PTR_ERR(reg_pmu),
+				     "Failed to lookup PMU regmap\n");
 
 	/*
 	 * Exynos5420 SoC has multiple channels for USB 3.0 PHY, with
@@ -1759,10 +1758,9 @@ static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
 	for (i = 0; i < EXYNOS5_DRDPHYS_NUM; i++) {
 		struct phy *phy = devm_phy_create(dev, NULL, drv_data->phy_ops);
 
-		if (IS_ERR(phy)) {
-			dev_err(dev, "Failed to create usbdrd_phy phy\n");
-			return PTR_ERR(phy);
-		}
+		if (IS_ERR(phy))
+			return dev_err_probe(dev, PTR_ERR(phy),
+					     "Failed to create usbdrd_phy phy\n");
 
 		phy_drd->phys[i].phy = phy;
 		phy_drd->phys[i].index = i;
@@ -1786,10 +1784,9 @@ static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
 
 	phy_provider = devm_of_phy_provider_register(dev,
 						     exynos5_usbdrd_phy_xlate);
-	if (IS_ERR(phy_provider)) {
-		dev_err(phy_drd->dev, "Failed to register phy provider\n");
-		return PTR_ERR(phy_provider);
-	}
+	if (IS_ERR(phy_provider))
+		return dev_err_probe(phy_drd->dev, PTR_ERR(phy_provider),
+				     "Failed to register phy provider\n");
 
 	return 0;
 }

-- 
2.47.0.338.g60cca15819-goog

