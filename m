Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA8D13E020
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Apr 2024 17:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713891989; cv=none; b=KRAimvm7d1lajaO7DC70aFQqY6Q6UmfObQHfvii0zzAlIVBoETSoisGVk0AdL+kdDVZxZD9iasnR+N9Gwb9NhhczdbApWot8id1O84coleNXkTruIGw9RCn+5ivT1TENw18IrTPLj9y7kXq/IBbXJQkP7n9eVDQapH3JLzXbWAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713891989; c=relaxed/simple;
	bh=lEQL4JvbQIS8+IoUWQG/7yIMLEyuerLO3fV1yFnwKN8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c9Pe/WX/kx8gok0HlLdHPp0XS2OZOBoFHCoa1rB2mHEwUhfzoKpDV0gLp/Xbh3tM6yH/5qIyuSn5DWgkELqBwqJbRd8vBfcadNgPSz7MT8Trh3NXrUebjynl/hXIVOCe3yeE49rTX0zJoqTfAqQXQCHRb4SHW9p0nZHt5w7Hhw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J1+LVHHG; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J1+LVHHG"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a5878caeb9eso150891666b.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Apr 2024 10:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713891986; x=1714496786; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vTeJ++F/mnm19eqXVShab+zLQp1WnhObbyrG4T/vDvk=;
        b=J1+LVHHGU4fc/kJiwUkIocQCh3g6oYCGubGzapdWl277CvX3AHHCab0XHPO48nb0rV
         a/y85XwKDxsn0dJ3smjAtFj0KRCC0eGloLvJfI2OL0YduBLKDIOir0rNYmBsbEu5MsxH
         HClZQako+P0Dye1RWj0EfN0DgS9zw1LxE+J1jFt/FIGpZaZS8Lf9UfQfCDR4P8GhnsO3
         QNyt/xt5gsCsUAbO+M60veQCIR2tW5FE9ho/grpyY+EDeXES/sprO+RsBTpbsuXb9dqh
         GXev4y7W7s4LxEDCs/TyCLuuvymSAlRMaw+mI/OprgO7QLyR44SndGXsAX5z6Sh2DEdr
         Ls4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713891986; x=1714496786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vTeJ++F/mnm19eqXVShab+zLQp1WnhObbyrG4T/vDvk=;
        b=Tr57AoxWFOjv2r+mThzun6cM29v2OfST1PWwBSlsEnVEhQeLkIUCUx3omyHbXoH07/
         Zqc1fkQUH/fxXFISasEYF4sCWpivYCHC+LZWlEmZ8Q3gdD9iCXLvLuLs2R//rJVxyXa6
         IV8a+6eWKeNMnlulj9pPMGikj4spUAWyEWbnqbHOsigXu5PQrbYtvZ+6ikyGqQIlEH1m
         GqoH55vBQPaJaQ3/hKkIfHBeW435bJ579V0Lk+rOuJSYBbvf0+clxLT+vowutW5Osg+5
         FRVWpwsRO9pAkcctV56giD188nuX5Xf5sv+equ80U0xaVMAzNfnabnonfWWhv1B+T02+
         X3tg==
X-Forwarded-Encrypted: i=1; AJvYcCWk9Zkf1Iag7rhLeSVILgfoP9NRLNZ62PhCjr5EBLuS6THq+rEOZv36w7/KwiaoI35CFIhaUphXnG9iyZox7TEVFyX+Q1phOCpih+eo+cdLxkY=
X-Gm-Message-State: AOJu0YxPi4JApLT/DobETfg4hfYDMXfIEMiS2GGPshj0VRbbrHqJUkIp
	mheFGjoOEl5eCzjb9HMN/uAp2I6ymovAi9IMY3Ha20rQ2xIEGQB9EGo3q00Yzx8=
X-Google-Smtp-Source: AGHT+IGmX8/L0/I9Xfi/12RjpvA/XDSBEjDv0Ba0q/FGDoMM5t1bQJxoQFANCyEahhfvXPMRwfCN7A==
X-Received: by 2002:a17:907:bb92:b0:a58:7505:1968 with SMTP id xo18-20020a170907bb9200b00a5875051968mr2076701ejc.43.1713891986224;
        Tue, 23 Apr 2024 10:06:26 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id t22-20020a1709063e5600b00a5209dc79c1sm7351624eji.146.2024.04.23.10.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 10:06:25 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 23 Apr 2024 18:06:05 +0100
Subject: [PATCH 3/7] phy: exynos5-usbdrd: support isolating HS and SS ports
 independently
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240423-usb-phy-gs101-v1-3-ebdcb3ac174d@linaro.org>
References: <20240423-usb-phy-gs101-v1-0-ebdcb3ac174d@linaro.org>
In-Reply-To: <20240423-usb-phy-gs101-v1-0-ebdcb3ac174d@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.12.4

Some versions of this IP have been integrated using separate PMU power
control registers for the HS and SS parts. One example is the Google
Tensor gs101 SoC.

Such SoCs can now set pmu_offset_usbdrd0_phy_ss in their
exynos5_usbdrd_phy_drvdata for the SS phy to the appropriate value.

The existing 'usbdrdphy' alias can not be used in this case because
that is meant for determining the correct PMU offset if multiple
distinct PHYs exist in the system (as opposed to one PHY with multiple
isolators).

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index ac208b89f5a6..d69187c22613 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -196,6 +196,7 @@ struct exynos5_usbdrd_phy_drvdata {
 	const struct exynos5_usbdrd_phy_config *phy_cfg;
 	const struct phy_ops *phy_ops;
 	u32 pmu_offset_usbdrd0_phy;
+	u32 pmu_offset_usbdrd0_phy_ss;
 	u32 pmu_offset_usbdrd1_phy;
 	bool has_common_clk_gate;
 };
@@ -1050,16 +1051,6 @@ static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
 	if (channel < 0)
 		dev_dbg(dev, "Not a multi-controller usbdrd phy\n");
 
-	switch (channel) {
-	case 1:
-		pmu_offset = phy_drd->drv_data->pmu_offset_usbdrd1_phy;
-		break;
-	case 0:
-	default:
-		pmu_offset = phy_drd->drv_data->pmu_offset_usbdrd0_phy;
-		break;
-	}
-
 	/* Get Vbus regulators */
 	phy_drd->vbus = devm_regulator_get(dev, "vbus");
 	if (IS_ERR(phy_drd->vbus)) {
@@ -1094,6 +1085,19 @@ static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
 		phy_drd->phys[i].phy = phy;
 		phy_drd->phys[i].index = i;
 		phy_drd->phys[i].reg_pmu = reg_pmu;
+		switch (channel) {
+		case 1:
+			pmu_offset = phy_drd->drv_data->pmu_offset_usbdrd1_phy;
+			break;
+		case 0:
+		default:
+			pmu_offset = phy_drd->drv_data->pmu_offset_usbdrd0_phy;
+			if (i == EXYNOS5_DRDPHY_PIPE3
+			    && phy_drd->drv_data->pmu_offset_usbdrd0_phy_ss)
+				pmu_offset = phy_drd->drv_data
+						->pmu_offset_usbdrd0_phy_ss;
+			break;
+		}
 		phy_drd->phys[i].pmu_offset = pmu_offset;
 		phy_drd->phys[i].phy_cfg = &drv_data->phy_cfg[i];
 		phy_set_drvdata(phy, &phy_drd->phys[i]);

-- 
2.44.0.769.g3c40516874-goog

