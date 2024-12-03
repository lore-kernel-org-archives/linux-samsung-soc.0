Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBDB1E5015
	for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Dec 2024 12:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733228036; cv=none; b=IexOfcWYy5iiVh5NdvSLKACGWTrnloJKSwIewydd5YDjeFBl1BWbs9k3hB+SA9yjjg656RMzT6mduITeGS4KbsJrDHWHcYkETitS4Rmg9FKicYeKl/jLrYoe9TV+NnuJCjQYvt2+mCwu40uX+oVtZw3uA/ngv/gXXc1L44R3cFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733228036; c=relaxed/simple;
	bh=fD1l+jNkgnfWuXI1bHIvbywED4CP+GtggJNFPuFqDcw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=unwm59g2+StQA8Uh/+O88sgHcJenuL5Yd5xLNrufUudpISMqDMuopUJHVHKuekUQhxNIv3n1S/zuW/pFPMOx6RDpgG/Re9uu49PyaEdoq308DA+g77128W9n+fLe7mrCzU1iYu4L2iVcSvjGCjBmJ2RDtSEmRJ8Ga8lPB6u9r3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eI3Zl68j; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eI3Zl68j"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53de92be287so8049330e87.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Dec 2024 04:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733228032; x=1733832832; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H11rnIjZ/6A+y0BhElAhFFU5gZO2NZydl8Xc9FZjLpY=;
        b=eI3Zl68jO5zkexoKA1dkZzSiAZzTArRN5XYllEFXuptdxZScRwi4wiREP+BSE+iQ7r
         YesYcJVSSR59NfFHLSbOtUZV/slUh/4/XMXISe2fzufLzHM/43RquO4MTn0dfTryA4FY
         DQJA27+VVgoZ2XaCKTWtCnj9QECbRVRj9tGFvNeUqpMw8yDyr2ubLuUujCR7moZ+t28Q
         QkDc7WEC3H0ffLMTJjncKfpKYEI4nsL8C/1xMpEmdBtXY/4B3f6Hi7V/PHOXMQPf+4WU
         52Wo2PR2QYEWJVVwjDATsZ4S6qM8zxzJorqaI5XOoKITyWaLqnux9aX+Be2hvUPCEfH6
         P7sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733228032; x=1733832832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H11rnIjZ/6A+y0BhElAhFFU5gZO2NZydl8Xc9FZjLpY=;
        b=rdz48370liia0ee8K40Kpoyxdj8FXr1uDsJWF4GOnHb9Vyq32Ro9n56d135xNQvW1L
         TA8dXXl0+/+uIaqW5F6UXCYzW9yahf6nAY3CpZNXwlmdQJiMnZUB3zoovFahAaNWQ2vz
         6gAs6oKCLb3itRTzJeuYSTm+ncduIlUR0abthd80zubtM2+aVKgT+n/K3BYwir9AqsNO
         89uOsU86ORHxNLgyHgALdwkIeLDOIVghTvFAF1uxJ/VKQRTGdjHBrDbAZZLp4O0PI3KC
         C/P0j3NYJwG436Gp6SAGD1atzZQS/01srzOoOPFSTG4/mZRGgER9Wyttrj2ybhbiDmh3
         TW5g==
X-Forwarded-Encrypted: i=1; AJvYcCWbq1lu4ueRhNZjZCAz8+Lou4gwCGfAgcLsPR+myvo8/WhTyTTFyTPf9GfEzB7aoVD6yp7DT+DTRwmLhTc6CWGNxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YygBO48QOGil+Gwi1BtAOz4Kuf/6QEQysQXhEFq0950CZJgcOUe
	W3kkcbKbxNV7vc5vkblaAgMUiEmJc0PrishFPtFAdydencyXIb6kYO6tMy4cWmI=
X-Gm-Gg: ASbGnctEXEZnrNZ1ZNHJKI/zoT0TGDgnv2FXjibp2D+NyazoTEUw2LKYHoykOwuelhh
	N0I47nnIIEeUZCzQkc2SIcyCQu+GrscJwFBUsc/shybdHRtfCwEsgLCxKNeFYFwRTAajWUqq0Tl
	HndpfOE+vEuaFenn6Wy7GwMCPqN8beEH8qWWzHAmge2bhAf20+1oLGJLzIhxfLM737bFINfrr1K
	ojOEiUPeG/ubXIyVHqHG2hBuhrTjUT9/4urDrYJFCFX3L45r2xApZnTI3b8o7lUgcQacwdgOBx6
	8zetk04x/aw7sKfpXUpVcqXXiMX7/eET6w==
X-Google-Smtp-Source: AGHT+IHQdMSg8Woe8SDIrFAGgEbEvNlb4MTQhoB4mrSWw8iZG9ODfRvK6W0FE8ok+EwQTy/draIGwg==
X-Received: by 2002:a05:6512:32c9:b0:53d:e592:5415 with SMTP id 2adb3069b0e04-53e12a07a6amr2081271e87.34.1733228032380;
        Tue, 03 Dec 2024 04:13:52 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996c245bsm607603766b.8.2024.12.03.04.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 04:13:52 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 03 Dec 2024 12:13:51 +0000
Subject: [PATCH v2 3/8] phy: exynos5-usbdrd: convert to dev_err_probe
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241203-gs101-phy-lanes-orientation-phy-v2-3-40dcf1b7670d@linaro.org>
References: <20241203-gs101-phy-lanes-orientation-phy-v2-0-40dcf1b7670d@linaro.org>
In-Reply-To: <20241203-gs101-phy-lanes-orientation-phy-v2-0-40dcf1b7670d@linaro.org>
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

