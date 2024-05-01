Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60874502BA
	for <linux-samsung-soc@vger.kernel.org>; Wed,  1 May 2024 09:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714555182; cv=none; b=mDFmoH7ityfOlQGiUuHwDwtH2OhNUJ39oJxS39HoEsSu4hVHFcWNDbpkRgT6E/m5pfZHkqursDQBec+noR5Ql7U0MhUXP7esYj/ylSj85o18FtSiT/uwEP94Q6jpXCJB0G4M90U5LzrtZyp7C2MgN9lkuDj+DwFm7M0TwCP3TgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714555182; c=relaxed/simple;
	bh=KpfDv8T8GPdkTM/o5AVXMKtY/HGMxXQrxrLNHuTsEG4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kh5unqckz3j10UZ4ZK+fbffS0qjuSLdkls8rzlpVBtOSl1wHD0PUkqOINgjQ7pmwAOJgN7RfCW7LfeAo+4Kbc3PEPKIqj4Rem4bMx/Ok3TPyhNpvtHhR/vJQqf7uF6EUTwvrkXgAC8cYai9rM2x4QifIulLKkcNoxrhoRoRuc+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZYsX4ZNo; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZYsX4ZNo"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-56e6acb39d4so8142814a12.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 May 2024 02:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714555179; x=1715159979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ge1XBY1iFiQ1LgGiL0ReMY1iuzn74SrGJNOcVuZ28A8=;
        b=ZYsX4ZNo5QlGVtv6PuVNbTSBDTSPHYqAWjsde3+ilJsrh6GXPnisE/CghMNMX9Avv2
         hVcNchqUBWoKC2cxE0P8fyBUq1qwyjFuWv11CFvLuY7F98Y/OvWvs7x/mTklAPiWZjS+
         DOJneedmnRRpEnujjs5Z8CzmMLINgc9OYy2mdTKCkd6joUaI5Byv2vipQJEcZqOMSMry
         GpdDKpkOPRVHFJd8JaIEBNuLq1rrKyTgyyrWh7K6B7unC3m2DPMZt3jhdzhiuc9UafP0
         y4Qc+k+wl25KPTYUgwngg2ywlXtdER4lBFtZBH9Pk40sjoeVpgenD1jax5E+tuIu0yCx
         RfWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714555179; x=1715159979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ge1XBY1iFiQ1LgGiL0ReMY1iuzn74SrGJNOcVuZ28A8=;
        b=N5vXB8Vxm7Rrggfb6SHhh2BAFcbjjZHGyUFo1QqRNsraZQ7W1LQD0S8YexWsuZY0q1
         OFMc5/7qfH2s4V7g6k/JKbHV6VLbtbu+LTzQ5FuSD80jXeIkyzV0BfkJRCJQjhpghip9
         wT3g6Y6hWzETQFw3nNRESmVGuOIIC1fza2fY1qN9uWdP3R9pHOcVJw0VQYSyOdQzUyjM
         TwslvcwYvyXlqwwgHuDjZVCfrM/WD0vluWo/XV6d9jtVd53WXrs6xkJVZL0g5eQRg6mR
         3fsKK+uQGz10/ZxIdE24daXs165hCsQ34ICtZEyZYX3T5o/QY9jaOkMSnmW6xtAnlUgh
         k56Q==
X-Forwarded-Encrypted: i=1; AJvYcCUQLcVIFpd5IOq5mvl3Av1lIijdGC6aBp4LaO/WrSccGIhmoY5mTI3Ix3DRUeW9PdD8aPbn/KIv6qcp6WrDZ9hOQefPrrqBIqIlQlf4p2Tvhdk=
X-Gm-Message-State: AOJu0YxaPQEBROnD6EDaBycRAC61aD/9IMEv54YS3EfiqzBki6l7E72P
	dPLjaEILlQDEqZikcZq5ktMm14WKL8wkZoGJPvU5nnu9MCrWZ2iaaUCYgL9Fhao=
X-Google-Smtp-Source: AGHT+IFXnHDIFgKbGwf/ndb2lV/dTNtH4A6FDxdi7dAgY/FQO/V4J/B3Cjb0Xx5+y8cR0YlXsanYKw==
X-Received: by 2002:a17:906:da04:b0:a52:62a2:d727 with SMTP id fi4-20020a170906da0400b00a5262a2d727mr1540329ejb.52.1714555178841;
        Wed, 01 May 2024 02:19:38 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id bw13-20020a170906c1cd00b00a58de09fd92sm5425674ejb.27.2024.05.01.02.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 02:19:38 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 01 May 2024 10:19:38 +0100
Subject: [PATCH v2 3/7] phy: exynos5-usbdrd: support isolating HS and SS
 ports independently
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240501-usb-phy-gs101-v2-3-ed9f14a1bd6d@linaro.org>
References: <20240501-usb-phy-gs101-v2-0-ed9f14a1bd6d@linaro.org>
In-Reply-To: <20240501-usb-phy-gs101-v2-0-ed9f14a1bd6d@linaro.org>
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
 Arnd Bergmann <arnd@arndb.de>, lee@kernel.org, 
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
2.45.0.rc0.197.gbae5840b3b-goog

