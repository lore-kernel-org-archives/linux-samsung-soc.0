Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A04E1E1048
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Nov 2024 10:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732705100; cv=none; b=V8NUJSHgNk8C9tmiHCaybBIU3R5E5DHR6qtPix1jdCkMS7vGfmZ+UXuVLbsHFYKL56Nq0ladeAevX/4TuHBynpsPoPDz0mg/Anpow2Lu7IxFM/tV20ZAo6mtGGXAJfgsUU0RSiBYYlPeevqrGSbsF0gSClsKQuCj92d8f74oJWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732705100; c=relaxed/simple;
	bh=DEjXbk2ZL7RN6klD/z2w1DAkclajULASsORJFiQ9lKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fEmNWu/cKGjQa5Xd067wjIvI/PSZomw7VeergOXnfa8DjmB49AClKEWcUdq8UpsA3haaVLtEJUa/IyBjeAYej/QpkN8Kn8yOaFX5yTZA4UPmvVawQmAMiw64WIRh9ZFGmFQv5geIz1nr7qsL5gLWTpmOqB6KPL6xysQFQBXT20c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G6SEZ68F; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G6SEZ68F"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a9e8522445dso918113766b.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Nov 2024 02:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732705097; x=1733309897; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lqGYeTvXa+CcRrauQewHltxn0fZOtsvS5bEzws0xGp0=;
        b=G6SEZ68FWhwqE154WNWR4XmEMmHzJLSNNL4p2xDZTTPqI/2j48w3mpJlw2HVxjY6mm
         /qH/5JF86T+Diio/fV0XKhiap7w8trM/YQ/sdozacIqcT8J7IBz/wOhIarbYo1qUITxP
         FilVFRIvNmyp4LGdPelTj6u+cEEPWn5bGdfaylkoU9aFTgyLdNxQJFWPwRCPs0oLekE1
         ShBRDE0iJdd2aB5m8PpU6ByTgVbHzm9xFOQeZ9wqiMcLB2S83Z5EdAgCAxGiiF3+C7RB
         BHnS2jWYmLDiQuiJsNQqUE4lsOgnjn+PDq65M6YnE7wHmQ2FH5ygObqv20O0IJhdqaEs
         IkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732705097; x=1733309897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lqGYeTvXa+CcRrauQewHltxn0fZOtsvS5bEzws0xGp0=;
        b=pSV6aWQQI3m1nSzyiMl8ciB+B4UHN2d4fBxQpzMBMv3UFAteRjLsJOy+rsbFhvm4kU
         g08sWXEI84LzdV3G2lirQgXVvtInK0MuF1imZpI0yzPo3wQgv2WMiV587xM5idENyxul
         vHArS8tB1bhns6tCUqx9coCHrzJOu/zLY3Pjb2UBJoeaiiK6dZld5z0XVusXAff7N5Vt
         LUslKEbwEkVn+Ofg+M8EamkwAeR3HuI2RUAWHg5P9f5zgfKkrm767P4cC67URNQSMvPX
         5xQmfx4LcuvvKuMX7k29bzMRRLZ4l169H63lWPLM/YcsRnVlPgjevZRFSjgK6hbgsNQk
         9Fgw==
X-Forwarded-Encrypted: i=1; AJvYcCUyJvPYxcE4HMR1KKvWQDptwLYA7IHhmZaZ0q89U3wT9+dmYDOiZyQ3DE6bemQAtcbLPV6Hl7FtAhQXeZOvOlXobQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSm6b1wvl9cyCSKNPm1QuUmo4J5ks3NsVcQlXZyIuz8/zFnqRM
	ZPcfX1OOocPZ0SBxM7FkP2FBnmB+Uu9qao0LJbOl6Sm0bUk5wrWE3Tw+RFTKGhU=
X-Gm-Gg: ASbGncuaa20OH36euFm9xnG2WLjv/fW21MdlojAIablyf6uHSr9D1ds/eSOozlSnVwl
	eyx4uhQ4bI6ls7Udnem3wZgUwOGDEONVu/gmS80ac8K4O8iCtfNrRwxpWJz4am7lKd9L/zBwmE3
	THsectBNIHEZVm7u787k7Arex3LlTMemCyAEyrFRz0898jiIgQSWpkS3x6rWGtKrUXzFu4d/+y3
	XIZ/fZhURs9V8hpts9VOqDcGbIYMS8JiJLZGOcMmOphnfAfe/srRU2lj1BX6UrbBIv2VqbOcPo9
	Vc++gjPg3rFo8vBsLu7b9cda+vixk24xLw==
X-Google-Smtp-Source: AGHT+IGfxl8jje43Ziyzp10Eq1Sbw1hY/V6VsB8QGc/5pAdKJlSGGUSbGZ9QxG2adkSeh2QmDqCL0g==
X-Received: by 2002:a17:907:7637:b0:aa5:4adc:5a1f with SMTP id a640c23a62f3a-aa580f58e93mr163841166b.33.1732705096651;
        Wed, 27 Nov 2024 02:58:16 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa54a6db906sm412183566b.41.2024.11.27.02.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 02:58:16 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 27 Nov 2024 10:58:19 +0000
Subject: [PATCH 9/9] phy: exynos5-usbdrd: allow DWC3 runtime suspend with
 UDC bound (E850+)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241127-gs101-phy-lanes-orientation-phy-v1-9-1b7fce24960b@linaro.org>
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

To make USB runtime suspend work when a UDC has been bound, the phy
needs to inform the USBDRD controller (DWC3) that Vbus and bvalid are
gone, so that it can in turn raise the respective gadget interrupt with
event == DWC3_DEVICE_EVENT_DISCONNECT, which will cause the USB stack
to clean up, allowing DWC3 to enter runtime suspend.

On e850 and gs101 this isn't working, as the respective signals are not
directly connected, and instead this driver uses override bits in the
PHY IP to set those signals. It currently forcefully sets them to 'on',
so the above mentioned interrupt will not be raised, preventing runtime
suspend.

To detect that state, update this driver to act on the TCPC's
orientation signal - when orientation == NONE, Vbus is gone and we can
clear the respective bits. Similarly, for other orientation values we
re-enable them.

This makes runtime suspend work on platforms with a TCPC (like Pixel6),
while keeping compatibility with platforms without (e850-96).

With runtime suspend working, USB-C cable orientation detection now
also fully works on such platforms, and the link comes up as Superspeed
as expected irrespective of the cable orientation and whether UDC /
gadget are configured and active.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 53 +++++++++++++++++++++++++++-----
 1 file changed, 45 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 2010d25ee817..4882158df1a5 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1136,13 +1136,15 @@ static void exynos850_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 	reg |= LINKCTRL_BUS_FILTER_BYPASS(0xf);
 	writel(reg, regs_base + EXYNOS850_DRD_LINKCTRL);
 
-	reg = readl(regs_base + EXYNOS850_DRD_UTMI);
-	reg |= UTMI_FORCE_BVALID | UTMI_FORCE_VBUSVALID;
-	writel(reg, regs_base + EXYNOS850_DRD_UTMI);
-
-	reg = readl(regs_base + EXYNOS850_DRD_HSP);
-	reg |= HSP_VBUSVLDEXT | HSP_VBUSVLDEXTSEL;
-	writel(reg, regs_base + EXYNOS850_DRD_HSP);
+	if (!phy_drd->sw) {
+		reg = readl(regs_base + EXYNOS850_DRD_UTMI);
+		reg |= UTMI_FORCE_BVALID | UTMI_FORCE_VBUSVALID;
+		writel(reg, regs_base + EXYNOS850_DRD_UTMI);
+
+		reg = readl(regs_base + EXYNOS850_DRD_HSP);
+		reg |= HSP_VBUSVLDEXT | HSP_VBUSVLDEXTSEL;
+		writel(reg, regs_base + EXYNOS850_DRD_HSP);
+	}
 
 	reg = readl(regs_base + EXYNOS850_DRD_SSPPLLCTL);
 	reg &= ~SSPPLLCTL_FSEL;
@@ -1407,9 +1409,44 @@ static int exynos5_usbdrd_orien_sw_set(struct typec_switch_dev *sw,
 				       enum typec_orientation orientation)
 {
 	struct exynos5_usbdrd_phy *phy_drd = typec_switch_get_drvdata(sw);
+	int ret;
+
+	if (phy_drd->orientation == orientation)
+		return 0;
+
+	ret = clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd->clks);
+	if (ret) {
+		dev_err(phy_drd->dev, "Failed to enable PHY clocks(s)\n");
+		return ret;
+	}
+
+	scoped_guard(mutex, &phy_drd->phy_mutex) {
+		void __iomem * const regs_base = phy_drd->reg_phy;
+		unsigned int reg;
+
+		if (orientation == TYPEC_ORIENTATION_NONE) {
+			reg = readl(regs_base + EXYNOS850_DRD_UTMI);
+			reg &= ~(UTMI_FORCE_VBUSVALID | UTMI_FORCE_BVALID);
+			writel(reg, regs_base +  EXYNOS850_DRD_UTMI);
+
+			reg = readl(regs_base + EXYNOS850_DRD_HSP);
+			reg |= HSP_VBUSVLDEXTSEL;
+			reg &= ~HSP_VBUSVLDEXT;
+			writel(reg, regs_base + EXYNOS850_DRD_HSP);
+		} else {
+			reg = readl(regs_base + EXYNOS850_DRD_UTMI);
+			reg |= UTMI_FORCE_VBUSVALID | UTMI_FORCE_BVALID;
+			writel(reg, regs_base +  EXYNOS850_DRD_UTMI);
+
+			reg = readl(regs_base + EXYNOS850_DRD_HSP);
+			reg |= HSP_VBUSVLDEXTSEL | HSP_VBUSVLDEXT;
+			writel(reg, regs_base + EXYNOS850_DRD_HSP);
+		}
 
-	scoped_guard(mutex, &phy_drd->phy_mutex)
 		phy_drd->orientation = orientation;
+	}
+
+	clk_bulk_disable(phy_drd->drv_data->n_clks, phy_drd->clks);
 
 	return 0;
 }

-- 
2.47.0.338.g60cca15819-goog

