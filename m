Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B2913E04D
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Apr 2024 17:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713891990; cv=none; b=Gt1dCgjKLroZ4b/TFB9PNOooyUIUf2H84EppjKskpcuCJcO4Ihwn2+6J8k1bweptfgV+A1ePNxhIJMKEd5xdcUy4oCccex8AP2eaC+I74ot7MdbqlhzAxijy5DIIUP5HQam7QGeniYA0qeQ2oUU7oDE2imjt0fbsJMtsodCkDIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713891990; c=relaxed/simple;
	bh=1BGjDVhru+5/yOFEbbagkzyjgP7K72hcwEVM+kRJzS0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=STFTW4woucYPvaTxi4hcKPS6FEAs9nJylvep5enEeo9kzX51ooOnO+2+JxRrCvjanxLQ/JemTzN3rNuLbWfGkB8dpIYiGYEaZvzSB1j1b7BIi6mVhU7iXeYWuVybRZA2Kd8Dl4iz5WTS/ipxC46P8NmiV0PaWRe4wdXI4n+lIkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UAqppM+c; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UAqppM+c"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a556d22fa93so663394766b.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Apr 2024 10:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713891987; x=1714496787; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7PAyFdu9H0sY3Lt54kr3wrNBIQI45vetjxyjmFr1cOo=;
        b=UAqppM+chKH61EnIriaFT5as5fVionuFjUPlqsXg2Rq9sX5XOusjfwrgw6UF8puq5i
         RGVe+p4t2j4t+Vec8GJJNgva3//nTLEV62ZxLgZfnehH1QzP8QnHGA+qbU/v2K6IDjxH
         TtyM2Eraufg+dSNsGSmpLIYSUJjvdCOc7GmQ3S3q8ZV8NgPL5gsenop2VjtqxkXfaE8r
         oM6CEhfPfT+zQEV0Af/y0ddFV5D+uM9kExv9Gib56UDK3/kiFvV6ZUUe+AfsSVj0GyPl
         nQiZjDIus5VG41JZhqcuGZZ9ku15n0lVN8nuBc0KNWU1JAkfgPQ53DXG+DWXIHWhadPj
         BdRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713891987; x=1714496787;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7PAyFdu9H0sY3Lt54kr3wrNBIQI45vetjxyjmFr1cOo=;
        b=gP/YTxeVWkKmHaAKNvTQy4e2U2tMPseDOV+xDan9Z0rYlySAyK4clRUEdYVaCep4Qe
         ODpXFGrAr2fo2vuqGFxOPFJKKvJCzDWEoF73RdCdb1bIlMNfz/1QaeJf2FgopNLkxZJh
         Su0PVL/EMEzG1SD1hs2n+1zAAP6FZb0bBRie8heriAsCNKg2b0FNVJo7OkotVdrA2f7A
         040trzKwGUHt/5ayV4K9fmhGIXTiEpSzUZ2EGBPbiH9n3I/E1v+2mkWDQ5v81ss3WkBf
         IvcJ8B2bGT2/4Q6gXqAVrDo6kiNfQXSvAwN9mGg9P9Ov/k7Om9NOIVkZNgIkAZ3BhO6y
         JsRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXc0kuW862iKdp25yMtdDWBHjDEmNbyucL+0VmuDcdVIFAeuaRUKSMPvLJSnzr1KAXb3TD3uBmWNOmVOthbHBPiqCyEaqby2WWhmP2I2I1lgfY=
X-Gm-Message-State: AOJu0Yyjj402+xEVxjYgWzFmlY7F2n+rqBtvEilvQAO1WSG9brXNfoxb
	Iht5ovCJJK+JJaA3Fmu9hGgLHvz7/bVq7qRFc9vGx7z0SoftRK8x9i5JBA8g5mQ=
X-Google-Smtp-Source: AGHT+IEY3fEkZYym5AetXKUhc3n7D5n6/HgpY9y7SZRytgjmS2FxWFGvhQdXsj4H4Kyog2WyOktaKw==
X-Received: by 2002:a17:906:578d:b0:a58:734d:f111 with SMTP id k13-20020a170906578d00b00a58734df111mr2664615ejq.11.1713891986669;
        Tue, 23 Apr 2024 10:06:26 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id t22-20020a1709063e5600b00a5209dc79c1sm7351624eji.146.2024.04.23.10.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 10:06:26 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 23 Apr 2024 18:06:06 +0100
Subject: [PATCH 4/7] phy: exynos5-usbdrd: set ref clk freq in
 exynos850_usbdrd_utmi_init()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240423-usb-phy-gs101-v1-4-ebdcb3ac174d@linaro.org>
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

While commit 255ec3879dd4 ("phy: exynos5-usbdrd: Add 26MHz ref clk
support") correctly states that CLKRSTCTRL[7:5] doesn't need to be set
on modern Exynos platforms, SSPPLLCTL[2:0] should be programmed with
the frequency of the reference clock for the USB2.0 phy.

Do so.

Fixes: 691525074db9 ("phy: exynos5-usbdrd: Add Exynos850 support")
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
Feel free to drop the Fixes: if you think that is unwarranted here.
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index d69187c22613..0f9078689856 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -155,6 +155,9 @@
 #define CLKRST_PORT_RST				BIT(1)
 #define CLKRST_PHY_SW_RST			BIT(3)
 
+#define EXYNOS850_DRD_SSPPLLCTL			0x30
+#define SSPPLLCTL_FSEL				GENMASK(2, 0)
+
 #define EXYNOS850_DRD_UTMI			0x50
 #define UTMI_FORCE_SLEEP			BIT(0)
 #define UTMI_FORCE_SUSPEND			BIT(1)
@@ -788,6 +791,31 @@ static void exynos850_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 	reg |= HSP_VBUSVLDEXT | HSP_VBUSVLDEXTSEL;
 	writel(reg, regs_base + EXYNOS850_DRD_HSP);
 
+	reg = readl(regs_base + EXYNOS850_DRD_SSPPLLCTL);
+	reg &= ~SSPPLLCTL_FSEL;
+	switch (phy_drd->extrefclk) {
+	case EXYNOS5_FSEL_50MHZ:
+		reg |= FIELD_PREP_CONST(SSPPLLCTL_FSEL, 7);
+		break;
+	case EXYNOS5_FSEL_26MHZ:
+		reg |= FIELD_PREP_CONST(SSPPLLCTL_FSEL, 6);
+		break;
+	case EXYNOS5_FSEL_24MHZ:
+		reg |= FIELD_PREP_CONST(SSPPLLCTL_FSEL, 2);
+		break;
+	case EXYNOS5_FSEL_20MHZ:
+		reg |= FIELD_PREP_CONST(SSPPLLCTL_FSEL, 1);
+		break;
+	case EXYNOS5_FSEL_19MHZ2:
+		reg |= FIELD_PREP_CONST(SSPPLLCTL_FSEL, 0);
+		break;
+	default:
+		dev_warn(phy_drd->dev, "unsupported ref clk: %#.2x\n",
+			 phy_drd->extrefclk);
+		break;
+	}
+	writel(reg, regs_base + EXYNOS850_DRD_SSPPLLCTL);
+
 	/* Power up PHY analog blocks */
 	reg = readl(regs_base + EXYNOS850_DRD_HSP_TEST);
 	reg &= ~HSP_TEST_SIDDQ;

-- 
2.44.0.769.g3c40516874-goog

