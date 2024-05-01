Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2CC51021
	for <linux-samsung-soc@vger.kernel.org>; Wed,  1 May 2024 09:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714555185; cv=none; b=R7kiOdqL4V+jvGjZUa/atkoiE1kWgFIkk2cKHBg3gQ6LAuzTlW9oEOfhqqo5DbLlyiAT7NFWFNbXa7tAWqxIFcGTbFP6cSv9aEQhEcs4V/VBDKbGaTu2FhXsHKRY+Mc3QHu/26oVBThKLmZAskZtWroaJbruj0ceWCZmX5cpFvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714555185; c=relaxed/simple;
	bh=Zuk08dvjADNHTbIa6CzaaYkWsFD6XiEyakBgvGBCZx4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d6A5E6jKBT8fZt7bhaI+A/oPeRKRV42dMnl5FytvY8FGIeRadNE73cPP449Sh9sjyukNzsGF9F+jiOsyJ6f979gkV5C1c1ED7XdW/onmlB6LxrRgXywS5G8rhjPwo29PAnDG8h3U3I2Qj++Ff8ToBY6spY7pspVzSTR/rnrEKjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i9/uiZlG; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i9/uiZlG"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5727dc6d3edso3825909a12.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 May 2024 02:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714555180; x=1715159980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AUeLm56aXaKJ3j7lV7reH0G/1KMdXe/YGgnuhtOmcYA=;
        b=i9/uiZlGQR4LV0yZ1RKKgnztn16rl1lKSypqW4Ino1SuoQZvknoEYBJdhokkoSEtR9
         fSZEWQUzmPCidU5w3lGIqWRB3rHGWCgLIT/2Lws2KRLlJIB3DQMWCFPwkyIYfiVNCJ7C
         IB3eKmy7Kw2kfmfsjQs8EGyOHay7WhmF7cpkpewuqjx+R3nD3cT8iYBrdn89OrAwnPvV
         Q2IgYXb2xqEd940EfkT62kgrOV0zf4rGbw8RfmrcxxKwlpSAJ2C8M9CILOAP3um+muh6
         Mpl8Vy4A5hH+Kz2uV8JiEp33u9t52UESruMhqtNLMUjHdOxKIfPCLhWHcC73Qm1BoAHU
         QmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714555180; x=1715159980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AUeLm56aXaKJ3j7lV7reH0G/1KMdXe/YGgnuhtOmcYA=;
        b=KL3ceKdpcGG9nzOzlou+M7baBPQdH/ElqecWPZoNRdBTFqDgkzlCYCCHfz9qklImb3
         Jas6LQ4vwd2DF0kU6Ld2Uf6Yx5Dah/g+clRXCu31Oh/7mj26yIRCUv69MrGcG89B0Tv0
         elq3HHpMipbHUb28vL7YE6AjJ3nIzFtSeX9ZxON3dhVyJABMeI2uq1adVoswJ+QfQFMo
         WrX7sv4kYg96EBmlS5/y+NySZlxl6Vyoy+NMEHNa/XN1xtGU0xDOaSItz3soeg9p0SKC
         8mMGMQIe8MI2Llsd2Om8BNd4Ig7DHxHPGUsEcYHWvzQMRg+wHHpHkQi2BkuvFGmsWt4t
         MBLA==
X-Forwarded-Encrypted: i=1; AJvYcCVqnqJTrUfB7M3AgdPRYx37pjO+KV46COhW4Z/r7LTN0vZi1SfAVfJsydBv4cbpwYn3iNj53hKp77WExtm8GFlpbmbCH206qYcU6dsBI25FuZ4=
X-Gm-Message-State: AOJu0YyhL08blxrBx3mf9t0gPpBOGF7l9fsfNsfDrF5H1sEABVbNRQi8
	d8xoPiBAuQlMD9wCacweDuzxYbJBCuutpTBFKhDCBrPBsOiKINjNB8FFGvDHOnk=
X-Google-Smtp-Source: AGHT+IFtv+d0KYeiBc0zvVXr50XHiQxtl/aTHZVrGYJIG31OJxdDdNjjVQB2H56WV1MWD+r5jjzDrw==
X-Received: by 2002:a17:906:5603:b0:a58:a37d:7192 with SMTP id f3-20020a170906560300b00a58a37d7192mr1324135ejq.76.1714555179815;
        Wed, 01 May 2024 02:19:39 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id bw13-20020a170906c1cd00b00a58de09fd92sm5425674ejb.27.2024.05.01.02.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 02:19:39 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 01 May 2024 10:19:40 +0100
Subject: [PATCH v2 5/7] phy: exynos5-usbdrd: uniform order of register bit
 macros
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240501-usb-phy-gs101-v2-5-ed9f14a1bd6d@linaro.org>
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

Most of the macros are ordered high -> low, but there are some
outliers.

Order them all uniformly from high to low. This will allow adding
additional register (field) definitions in a consistent way.

While at it, also remove some extra empty lines to group register bit
field definitions together with the relevant register. This makes the
registers easier to distinguish visually.

No functional change.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 44 +++++++++++---------------------
 1 file changed, 15 insertions(+), 29 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 4f30ced439b9..200285fa823b 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -36,13 +36,11 @@
 
 /* Exynos5: USB 3.0 DRD PHY registers */
 #define EXYNOS5_DRD_LINKSYSTEM			0x04
-
+#define LINKSYSTEM_XHCI_VERSION_CONTROL		BIT(27)
 #define LINKSYSTEM_FLADJ_MASK			(0x3f << 1)
 #define LINKSYSTEM_FLADJ(_x)			((_x) << 1)
-#define LINKSYSTEM_XHCI_VERSION_CONTROL		BIT(27)
 
 #define EXYNOS5_DRD_PHYUTMI			0x08
-
 #define PHYUTMI_OTGDISABLE			BIT(6)
 #define PHYUTMI_FORCESUSPEND			BIT(1)
 #define PHYUTMI_FORCESLEEP			BIT(0)
@@ -50,40 +48,31 @@
 #define EXYNOS5_DRD_PHYPIPE			0x0c
 
 #define EXYNOS5_DRD_PHYCLKRST			0x10
-
 #define PHYCLKRST_EN_UTMISUSPEND		BIT(31)
-
 #define PHYCLKRST_SSC_REFCLKSEL_MASK		(0xff << 23)
 #define PHYCLKRST_SSC_REFCLKSEL(_x)		((_x) << 23)
-
 #define PHYCLKRST_SSC_RANGE_MASK		(0x03 << 21)
 #define PHYCLKRST_SSC_RANGE(_x)			((_x) << 21)
-
 #define PHYCLKRST_SSC_EN			BIT(20)
 #define PHYCLKRST_REF_SSP_EN			BIT(19)
 #define PHYCLKRST_REF_CLKDIV2			BIT(18)
-
 #define PHYCLKRST_MPLL_MULTIPLIER_MASK		(0x7f << 11)
 #define PHYCLKRST_MPLL_MULTIPLIER_100MHZ_REF	(0x19 << 11)
 #define PHYCLKRST_MPLL_MULTIPLIER_50M_REF	(0x32 << 11)
 #define PHYCLKRST_MPLL_MULTIPLIER_24MHZ_REF	(0x68 << 11)
 #define PHYCLKRST_MPLL_MULTIPLIER_20MHZ_REF	(0x7d << 11)
 #define PHYCLKRST_MPLL_MULTIPLIER_19200KHZ_REF	(0x02 << 11)
-
-#define PHYCLKRST_FSEL_UTMI_MASK		(0x7 << 5)
 #define PHYCLKRST_FSEL_PIPE_MASK		(0x7 << 8)
+#define PHYCLKRST_FSEL_UTMI_MASK		(0x7 << 5)
 #define PHYCLKRST_FSEL(_x)			((_x) << 5)
 #define PHYCLKRST_FSEL_PAD_100MHZ		(0x27 << 5)
 #define PHYCLKRST_FSEL_PAD_24MHZ		(0x2a << 5)
 #define PHYCLKRST_FSEL_PAD_20MHZ		(0x31 << 5)
 #define PHYCLKRST_FSEL_PAD_19_2MHZ		(0x38 << 5)
-
 #define PHYCLKRST_RETENABLEN			BIT(4)
-
 #define PHYCLKRST_REFCLKSEL_MASK		(0x03 << 2)
 #define PHYCLKRST_REFCLKSEL_PAD_REFCLK		(0x2 << 2)
 #define PHYCLKRST_REFCLKSEL_EXT_REFCLK		(0x3 << 2)
-
 #define PHYCLKRST_PORTRESET			BIT(1)
 #define PHYCLKRST_COMMONONN			BIT(0)
 
@@ -101,30 +90,27 @@
 #define PHYREG1_CR_ACK				BIT(0)
 
 #define EXYNOS5_DRD_PHYPARAM0			0x1c
-
 #define PHYPARAM0_REF_USE_PAD			BIT(31)
 #define PHYPARAM0_REF_LOSLEVEL_MASK		(0x1f << 26)
 #define PHYPARAM0_REF_LOSLEVEL			(0x9 << 26)
 
 #define EXYNOS5_DRD_PHYPARAM1			0x20
-
 #define PHYPARAM1_PCS_TXDEEMPH_MASK		(0x1f << 0)
 #define PHYPARAM1_PCS_TXDEEMPH			(0x1c)
 
 #define EXYNOS5_DRD_PHYTERM			0x24
 
 #define EXYNOS5_DRD_PHYTEST			0x28
-
 #define PHYTEST_POWERDOWN_SSP			BIT(3)
 #define PHYTEST_POWERDOWN_HSP			BIT(2)
 
 #define EXYNOS5_DRD_PHYADP			0x2c
 
 #define EXYNOS5_DRD_PHYUTMICLKSEL		0x30
-
 #define PHYUTMICLKSEL_UTMI_CLKSEL		BIT(2)
 
 #define EXYNOS5_DRD_PHYRESUME			0x34
+
 #define EXYNOS5_DRD_LINKPORT			0x44
 
 /* USB 3.0 DRD PHY SS Function Control Reg; accessed by CR_PORT */
@@ -148,31 +134,31 @@
 
 /* Exynos850: USB DRD PHY registers */
 #define EXYNOS850_DRD_LINKCTRL			0x04
-#define LINKCTRL_BUS_FILTER_BYPASS(_x)		((_x) << 4)
 #define LINKCTRL_FORCE_QACT			BIT(8)
+#define LINKCTRL_BUS_FILTER_BYPASS(_x)		((_x) << 4)
 
 #define EXYNOS850_DRD_CLKRST			0x20
-#define CLKRST_LINK_SW_RST			BIT(0)
-#define CLKRST_PORT_RST				BIT(1)
 #define CLKRST_PHY_SW_RST			BIT(3)
+#define CLKRST_PORT_RST				BIT(1)
+#define CLKRST_LINK_SW_RST			BIT(0)
 
 #define EXYNOS850_DRD_SSPPLLCTL			0x30
 #define SSPPLLCTL_FSEL				GENMASK(2, 0)
 
 #define EXYNOS850_DRD_UTMI			0x50
-#define UTMI_FORCE_SLEEP			BIT(0)
-#define UTMI_FORCE_SUSPEND			BIT(1)
-#define UTMI_DM_PULLDOWN			BIT(2)
-#define UTMI_DP_PULLDOWN			BIT(3)
-#define UTMI_FORCE_BVALID			BIT(4)
 #define UTMI_FORCE_VBUSVALID			BIT(5)
+#define UTMI_FORCE_BVALID			BIT(4)
+#define UTMI_DP_PULLDOWN			BIT(3)
+#define UTMI_DM_PULLDOWN			BIT(2)
+#define UTMI_FORCE_SUSPEND			BIT(1)
+#define UTMI_FORCE_SLEEP			BIT(0)
 
 #define EXYNOS850_DRD_HSP			0x54
-#define HSP_COMMONONN				BIT(8)
-#define HSP_EN_UTMISUSPEND			BIT(9)
-#define HSP_VBUSVLDEXT				BIT(12)
-#define HSP_VBUSVLDEXTSEL			BIT(13)
 #define HSP_FSV_OUT_EN				BIT(24)
+#define HSP_VBUSVLDEXTSEL			BIT(13)
+#define HSP_VBUSVLDEXT				BIT(12)
+#define HSP_EN_UTMISUSPEND			BIT(9)
+#define HSP_COMMONONN				BIT(8)
 
 #define EXYNOS850_DRD_HSP_TEST			0x5c
 #define HSP_TEST_SIDDQ				BIT(24)

-- 
2.45.0.rc0.197.gbae5840b3b-goog

