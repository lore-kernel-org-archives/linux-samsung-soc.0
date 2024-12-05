Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B841AF0D1
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Dec 2024 07:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733383999; cv=none; b=D0gjD2/6dpR/2E/W17V81z+zeUWYN6qLU07emtcQpoiBqJEQdR44AWzev9/ZoU3hNkelu/Yzx8DpGbPLyKDPWVTQeFnZj7dtiI0dpTBfFJKgAS6HfJTYdqXUs6FjBllo88ololtg5x5xgJmOl8BFaPQMD/z2SxW8Fje69Yr9RPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733383999; c=relaxed/simple;
	bh=fD1l+jNkgnfWuXI1bHIvbywED4CP+GtggJNFPuFqDcw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xe7+WHdookf9MIKwF69xrmh7fAWaa+jMS56Yq1ZoBNVaMXCLwUnmEpQ6FDslLwYLhUwdHDiXMtBSNMe2wVGOliVjieP+FwLPc99tu4jsVjh+0wazArIPLBd/lAE2qqjol1r/Ifl4Doq7fSY6tiZEFf43xc8y+fGPJ1OaMLs1RAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rG0WUIyQ; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rG0WUIyQ"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d1265ba5a8so572670a12.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Dec 2024 23:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733383995; x=1733988795; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H11rnIjZ/6A+y0BhElAhFFU5gZO2NZydl8Xc9FZjLpY=;
        b=rG0WUIyQDQeNd1ZuOO5Sr3yGjWCe5ZnDzCDr5MeUR9Z4UFVYNysZshpqxVAo1KDKa/
         Lbd8pfk8CP9+bOt9hVPPpku3JZPEnqgNhCFEfdqVBKoaimlzE1P7hhDLmEoV6+um7ha+
         BoOhgP5CPaCMHBLLFA8iKSKalH/71UdzELQGs6/HJnZx8NfFdyhF4xhyEkruFHlAWMj3
         qWIluB6+Vz5Dx2Gho35rzpJVCPdvCYyAdw1fPY8/WLznucrvf0AvJ+0lv3Hjcs1SbglC
         vmj/Sf183xE37hfexVq7WXhCkneIK0MCvsdC8+hNBUPmR9Z7Z65QkEBBkvADPG1MBgmI
         +DlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733383995; x=1733988795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H11rnIjZ/6A+y0BhElAhFFU5gZO2NZydl8Xc9FZjLpY=;
        b=NCZ4/N8vEmgIRbdnAmezH0xXCojm3iEmDCpPhZi7SXA9DiE0gRvB1TNvFYvwu9xGHr
         OY+7MSeGtPppQV8Dvb38jW57D8WC33DdM2vAKhmX6ptnt1RT+ufnTUDVsJaLQxzA9xKm
         y8vN/2IPDHwJ6iN2fpzw3SEEL6M04AVOSFeSlr5b3Z7+j9mLOVQhXZcTDEkYiEVbjGk6
         LwyB3ygAX7NajrAXeFhZqne4oRraTu3Y+AJ3BmvnW1Yb8TbjasMndzqJYuBkYZLXw+b1
         re8a9hLqvypgdqHWhR0mnCGBvn/xrHaQvDO0Qi0oO2jGxQ0BibPpo+n+MCa8E3lSXIHi
         yufQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzLlQkLGu8+pEbABF1O+3+okIIGqUfUNWXXcybaHm5C7pjJXCeZ51NLB3qkKnnFpDpRq3+E3LLkAsdRPrDSG0QXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaBgLUq6K2BL4WjttPs+k6kTHxNRWQm+8k4ZgsYIxEWcZOO2UA
	1wpPE2j18Qwl/frVH/FjRfy9UuxwKNGnlyM2bhlNKbawk+L99m5FAn3m9vipq0Q=
X-Gm-Gg: ASbGncv7pRrDy0hN5ZWuLhdkXBC3oBPOfX++KO4wixxjeRvCQ/Uez9V8ErZyIg4GU5A
	zazghFIcBZYcWKq+IsyDZqmqVirzsclMQ/7lPONmrLCEMi0pBWg5hiymGAzZlrAdchCOoDxc4aW
	BMaJJ7yuCLAPqvkvXZQ8hEgQ7TlDtL4H7i6QQSouZnORNBBJTdidXCY4jDaBva+Z6aJUxqMc24A
	T+6OJQDddBBGsiNaYIDailC9YnqLUN7SWtP/XNsSoUeuj26Odv604D/tL8hg1MNDDoTLREstvFK
	s7joIB6GF9jVO/8K9diMGYRWkHrzz9+pkA==
X-Google-Smtp-Source: AGHT+IFYsJycA4yASAH+sZjUsdut4D7esnBNe4R4ApeFxO8IGWZZ/0bN1Z5Vd1ltD4MxKYmMzQqjIw==
X-Received: by 2002:a17:906:31c7:b0:a9a:bbcc:508c with SMTP id a640c23a62f3a-aa5f7ca9f9emr722031966b.2.1733383995058;
        Wed, 04 Dec 2024 23:33:15 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260888casm53371766b.133.2024.12.04.23.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 23:33:14 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Dec 2024 07:33:14 +0000
Subject: [PATCH v3 3/8] phy: exynos5-usbdrd: convert to dev_err_probe
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241205-gs101-phy-lanes-orientation-phy-v3-3-32f721bed219@linaro.org>
References: <20241205-gs101-phy-lanes-orientation-phy-v3-0-32f721bed219@linaro.org>
In-Reply-To: <20241205-gs101-phy-lanes-orientation-phy-v3-0-32f721bed219@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0

dev_err_probe() exists to simplify code.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
* collect tags
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

