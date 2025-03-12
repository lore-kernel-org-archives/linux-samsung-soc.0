Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955B51F03DE
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Mar 2025 21:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741816778; cv=none; b=ivVguED1ktYXqyY+bzgS3TiZzg9fL75nw/cazV37vaxjozK7x0LoGnAKbW4OsFnH7ozeI3b0YlD0StZvNxhTaVRyis5dnJJjZqjRYjT2+NescClrRrsGch++8LlFIpU0GDNlhyOnhy7Dw2iX8gnP/BpbXujYMJUW9sX1KHIcHU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741816778; c=relaxed/simple;
	bh=nFLX+azsoKrZAo60JVmaiBXnDm4Gr36W9dpQjUermMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n0nqIxDycxWxpO0jy5GVugzqVfvoLwHdzX7c6SVruY6+ic2NRKE1kfJKeAyp7AEAVDWQWTKMX8K0NBtlYUUwLZK6KQ6CILt52m4R/PfPVtqwnosGImzoHE6tnKgg8AcX6gEGiW6Tam7GMw7r8+HG81lEjuKC3jKMHR2POupc2J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NJWLy1xR; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NJWLy1xR"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso1766415e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Mar 2025 14:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741816774; x=1742421574; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ctLsZi5HF6Y8bS3uF/EKiCwF3N+zL0bWsukC+RJ8un4=;
        b=NJWLy1xRAyQTpCZ6gT9oqT5mtLjeMXf++5prdBlRtgFx3Ia+2Rk4giixn/L2yTmhr6
         DV7FKVngxAprASCMMxcfy92bWHxSgTo4xc3CuGQGba6TYeqw6YRaLJvgqhJEzg77Q+Q2
         cOtKH4sNc2wJAneafk2VLgRCtyaa04PyOh1bPMP11yvD+3mQJb7pUjx8XJTSSqn48W/3
         9Jw3nRt7XvwHEtCTyoRZzl84ZXhNp3Z246x0fv1jNaU5TlfdPMLb3OartpoYY93paUQy
         F+J2H1HYJhxDtUaImlU/getj1A8GhlvtnxEH9aZ/pW3PdGQy7lI4wSlKfS9tr+o5TUov
         Pkow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741816774; x=1742421574;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ctLsZi5HF6Y8bS3uF/EKiCwF3N+zL0bWsukC+RJ8un4=;
        b=sQ/a7xtBsDfrI3UG0yc5OuPfBO5XlgMjxUMeYJlXe8p7/DQF4rGDemEZwC9/2ZQMfj
         wGvMq2Bm3/WQTC90m6SgOvQDqOFvZgFWkwBI8VupG4hqPPbIDbCZyHaySA+DB1PcnA4i
         YugO28XRl8m5YaqDxChDbhOVI22FDeX1gjOi/PE9f7TBni7CinWh81mXIGwEyEI6QIn+
         A3QCO80fhCZThsBcoqw9l9Rp1hngbmlC8Bd9GWeHwv3g9I0XjahDVSB1WLjIBgk6yCHr
         vIYhvOvRpBsgy6uF/6webiEUBWWFbg4kwrtHUpHxyBxhx1NMeeqyNLrktfdi+3udKsyR
         h5Pw==
X-Forwarded-Encrypted: i=1; AJvYcCW1EEGbo/TPDJ9D/+M55I4ubLyXl6tFSFAnAiHwhaYsy6LpdsLYgAFooTzAt3ULl15tuvQqm9eWLzJCFnA3Gy2ZtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNsG6Yw+YeqQSIJMuvJHFz41jGeoAO1Kzdw6eXcwWI9iCAAu0G
	i4YLoE1zZ45bF6ydEFkz4oocFoQEfxfNl9Xg2immKadelQ6Fwfi2SJP81/cA9hs=
X-Gm-Gg: ASbGncvhRUnBhcyOk/DQPpD87KW2/leaEQT1BtG+AHQjPi4zgTUEc2Lc0bY3ThOuQAC
	xkgs++x2d/PSBwRHqv4vjjYAJ27viYEgg3AuN454imHq01verAZgA948tHRq7pI85svCdl1rlcc
	wBq6nHDNFZoCYiF8TCNVuVLG/C1d9fuvG0cqwNZnQLgU+zyPIMhEMxy/4BDfVfYKF01BQJTWP7r
	C5eCMR7lsoKq9R8QfCe/NPVDDccjuWmwbU8pgpkIP4P4z7P6WgNh2P+hxfE2zinYvUuNVFahcZo
	40NT9EiofXx3YCntZc4u9VTamTD72ikY4CVZ+PWuHUZHdeKFvXIcaYNDW3BwmG7RyfSpVvVUgOe
	f
X-Google-Smtp-Source: AGHT+IFUlkjb+6pmwC3hwu/QEKehCyfCGJTBeoL5Bc7k2lBOTwNe5smrPICYXECwU+NT/Q6tiOPVmw==
X-Received: by 2002:a05:600c:3c8c:b0:43b:ce36:7574 with SMTP id 5b1f17b1804b1-43cd169b363mr206908825e9.11.1741816773788;
        Wed, 12 Mar 2025 14:59:33 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([209.198.129.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d188bb34asm110175e9.18.2025.03.12.14.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 14:59:33 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 12 Mar 2025 21:59:00 +0000
Subject: [PATCH v5 3/5] pinctrl: samsung: add dedicated SoC eint
 suspend/resume callbacks
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250312-pinctrl-fltcon-suspend-v5-3-d98d5b271242@linaro.org>
References: <20250312-pinctrl-fltcon-suspend-v5-0-d98d5b271242@linaro.org>
In-Reply-To: <20250312-pinctrl-fltcon-suspend-v5-0-d98d5b271242@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, tudor.ambarus@linaro.org, willmcvicker@google.com, 
 semen.protsenko@linaro.org, kernel-team@android.com, 
 jaewon02.kim@samsung.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12876;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=nFLX+azsoKrZAo60JVmaiBXnDm4Gr36W9dpQjUermMI=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBn0gO+bIEQ3YLM7T637z4Y7i4cNtJUpuvryFASn
 sywvTUXXsqJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ9IDvgAKCRDO6LjWAjRy
 urOlD/9MHh6GSe1jgAaHf4IYdCyXUaa32ma5S4G9Ztq6jhfBV0hupZIZ8leDY0jahhYbJOXGm6I
 iwiL4rZPyi+geagcDwMNgdhOBipd3PAhZs7Y0JU+WZUjiU9f2XW500KcT3wUIJQyaVFp+NeBRft
 E13M+PjYxO6xxTAopKi6fEnJego4ars2GnpRjVX4expfbriVsyPLwZhvruEoVuPh5wt8pKfM66+
 aa9KQYAME9zFx/WVf8Exef6AdpbpJIy8FAQwduNph0XwFjvE1LpTmNRc50/QRpUxO9Ba5iNSAGL
 In8lWyVyxSih+TE/ycGg1C3dPVjNYopNZco+/FhyLHE5E64njk9qCJcSrrFWQnYkaNGHzjpoNFl
 rsxiE0xBsw26LyD/BdgqX4bmA0jUp5cKZljK0cNS4aXu7RxceN0A2gZyMjqNN10nqEgWeHwlaKG
 Z79cSX+Uo+2kLuCWCtfx9j+IVZxw7tuV1Y7fV3crlECqLcSBNus/eBO1bqryrERY9GiqicZaJCa
 ySAuTsCg+x7HSVGfI010o8mQ4Cl6S0WqqzVXqK0Oak+RoEhJLESIdFdDJIC0Hjm0bO5rxuAM6XQ
 L1gWjaY43Xv/an5I/sFX8NCML3ymM9QYr2rpS2N2CWcD/naJ2FiCNXl7D9nD+YhKMgj+MLEeL+Z
 2FBS928IFj1DvOw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Refactor the existing platform specific suspend/resume callback
so that each SoC variant has it's own callback containing the
SoC specific logic.

This allows exynosautov920 to have a dedicated function for using
eint_con_offset and eint_mask_offset. Also it is easily extendable
for gs101 which will need dedicated logic for handling the varying
register offset of fltcon0 via eint_fltcon_offset.

Reviewed-by: André Draszik <andre.draszik@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes since v4:
* split the clk_enable/clk_disable refactor parts into separate patch (Krzystof)

Changes since v3:
* save->eint_fltcon1 is an argument to pr_debug(), not readl()
  change alignment accordingly (Andre)

Changes since v2:
* Remove useless init (Andre)
* make it clear set_wakeup is conditional on bank->eint_type (Andre)

Changes since v1:
* Split code refactor & gs101 parts into separate patches (Andre)
---
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c |  28 ++---
 drivers/pinctrl/samsung/pinctrl-exynos.c       | 152 +++++++++++++------------
 drivers/pinctrl/samsung/pinctrl-exynos.h       |   2 +
 3 files changed, 97 insertions(+), 85 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index e28fe81776466b693417c66bb15752d609b79eb1..57c98d2451b54b00d50e0e948e272ed53d386c34 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -1112,8 +1112,8 @@ static const struct samsung_pin_ctrl exynosautov920_pin_ctrl[] = {
 		.pin_banks	= exynosautov920_pin_banks0,
 		.nr_banks	= ARRAY_SIZE(exynosautov920_pin_banks0),
 		.eint_wkup_init	= exynos_eint_wkup_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynosautov920_pinctrl_suspend,
+		.resume		= exynosautov920_pinctrl_resume,
 		.retention_data	= &exynosautov920_retention_data,
 	}, {
 		/* pin-controller instance 1 AUD data */
@@ -1124,43 +1124,43 @@ static const struct samsung_pin_ctrl exynosautov920_pin_ctrl[] = {
 		.pin_banks	= exynosautov920_pin_banks2,
 		.nr_banks	= ARRAY_SIZE(exynosautov920_pin_banks2),
 		.eint_gpio_init	= exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynosautov920_pinctrl_suspend,
+		.resume		= exynosautov920_pinctrl_resume,
 	}, {
 		/* pin-controller instance 3 HSI1 data */
 		.pin_banks	= exynosautov920_pin_banks3,
 		.nr_banks	= ARRAY_SIZE(exynosautov920_pin_banks3),
 		.eint_gpio_init	= exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynosautov920_pinctrl_suspend,
+		.resume		= exynosautov920_pinctrl_resume,
 	}, {
 		/* pin-controller instance 4 HSI2 data */
 		.pin_banks	= exynosautov920_pin_banks4,
 		.nr_banks	= ARRAY_SIZE(exynosautov920_pin_banks4),
 		.eint_gpio_init	= exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynosautov920_pinctrl_suspend,
+		.resume		= exynosautov920_pinctrl_resume,
 	}, {
 		/* pin-controller instance 5 HSI2UFS data */
 		.pin_banks	= exynosautov920_pin_banks5,
 		.nr_banks	= ARRAY_SIZE(exynosautov920_pin_banks5),
 		.eint_gpio_init	= exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynosautov920_pinctrl_suspend,
+		.resume		= exynosautov920_pinctrl_resume,
 	}, {
 		/* pin-controller instance 6 PERIC0 data */
 		.pin_banks	= exynosautov920_pin_banks6,
 		.nr_banks	= ARRAY_SIZE(exynosautov920_pin_banks6),
 		.eint_gpio_init	= exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynosautov920_pinctrl_suspend,
+		.resume		= exynosautov920_pinctrl_resume,
 	}, {
 		/* pin-controller instance 7 PERIC1 data */
 		.pin_banks	= exynosautov920_pin_banks7,
 		.nr_banks	= ARRAY_SIZE(exynosautov920_pin_banks7),
 		.eint_gpio_init	= exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynosautov920_pinctrl_suspend,
+		.resume		= exynosautov920_pinctrl_resume,
 	},
 };
 
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index 62c8d8d907545119c49a89d79b5dae63282467d5..af4fb1cde8de942707d932072bb237521e30c9c6 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -761,105 +761,115 @@ __init int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 	return 0;
 }
 
-static void exynos_pinctrl_suspend_bank(struct samsung_pin_bank *bank)
+static void exynos_set_wakeup(struct samsung_pin_bank *bank)
 {
-	struct exynos_eint_gpio_save *save = bank->soc_priv;
-	const void __iomem *regs = bank->eint_base;
+	struct exynos_irq_chip *irq_chip;
 
-	save->eint_con = readl(regs + EXYNOS_GPIO_ECON_OFFSET
-						+ bank->eint_offset);
-	save->eint_fltcon0 = readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
-						+ 2 * bank->eint_offset);
-	save->eint_fltcon1 = readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
-						+ 2 * bank->eint_offset + 4);
-	save->eint_mask = readl(regs + bank->irq_chip->eint_mask
-						+ bank->eint_offset);
-
-	pr_debug("%s: save     con %#010x\n", bank->name, save->eint_con);
-	pr_debug("%s: save fltcon0 %#010x\n", bank->name, save->eint_fltcon0);
-	pr_debug("%s: save fltcon1 %#010x\n", bank->name, save->eint_fltcon1);
-	pr_debug("%s: save    mask %#010x\n", bank->name, save->eint_mask);
+	if (bank->irq_chip) {
+		irq_chip = bank->irq_chip;
+		irq_chip->set_eint_wakeup_mask(bank->drvdata, irq_chip);
+	}
 }
 
-static void exynosauto_pinctrl_suspend_bank(struct samsung_pin_bank *bank)
+void exynos_pinctrl_suspend(struct samsung_pin_bank *bank)
 {
 	struct exynos_eint_gpio_save *save = bank->soc_priv;
 	const void __iomem *regs = bank->eint_base;
 
-	save->eint_con = readl(regs + bank->pctl_offset + bank->eint_con_offset);
-	save->eint_mask = readl(regs + bank->pctl_offset + bank->eint_mask_offset);
-
-	pr_debug("%s: save     con %#010x\n", bank->name, save->eint_con);
-	pr_debug("%s: save    mask %#010x\n", bank->name, save->eint_mask);
+	if (bank->eint_type == EINT_TYPE_GPIO) {
+		save->eint_con = readl(regs + EXYNOS_GPIO_ECON_OFFSET
+				       + bank->eint_offset);
+		save->eint_fltcon0 = readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
+					   + 2 * bank->eint_offset);
+		save->eint_fltcon1 = readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
+					   + 2 * bank->eint_offset + 4);
+		save->eint_mask = readl(regs + bank->irq_chip->eint_mask
+					+ bank->eint_offset);
+
+		pr_debug("%s: save     con %#010x\n",
+			 bank->name, save->eint_con);
+		pr_debug("%s: save fltcon0 %#010x\n",
+			 bank->name, save->eint_fltcon0);
+		pr_debug("%s: save fltcon1 %#010x\n",
+			 bank->name, save->eint_fltcon1);
+		pr_debug("%s: save    mask %#010x\n",
+			 bank->name, save->eint_mask);
+	} else if (bank->eint_type == EINT_TYPE_WKUP) {
+		exynos_set_wakeup(bank);
+	}
 }
 
-void exynos_pinctrl_suspend(struct samsung_pin_bank *bank)
+void exynosautov920_pinctrl_suspend(struct samsung_pin_bank *bank)
 {
-	struct exynos_irq_chip *irq_chip = NULL;
+	struct exynos_eint_gpio_save *save = bank->soc_priv;
+	const void __iomem *regs = bank->eint_base;
 
 	if (bank->eint_type == EINT_TYPE_GPIO) {
-		if (bank->eint_con_offset)
-			exynosauto_pinctrl_suspend_bank(bank);
-		else
-			exynos_pinctrl_suspend_bank(bank);
+		save->eint_con = readl(regs + bank->pctl_offset +
+				       bank->eint_con_offset);
+		save->eint_mask = readl(regs + bank->pctl_offset +
+					bank->eint_mask_offset);
+		pr_debug("%s: save     con %#010x\n",
+			 bank->name, save->eint_con);
+		pr_debug("%s: save    mask %#010x\n",
+			 bank->name, save->eint_mask);
 	} else if (bank->eint_type == EINT_TYPE_WKUP) {
-		if (!irq_chip) {
-			irq_chip = bank->irq_chip;
-			irq_chip->set_eint_wakeup_mask(bank->drvdata, irq_chip);
-		}
+		exynos_set_wakeup(bank);
 	}
 }
 
-static void exynos_pinctrl_resume_bank(struct samsung_pin_bank *bank)
+void exynos_pinctrl_resume(struct samsung_pin_bank *bank)
 {
 	struct exynos_eint_gpio_save *save = bank->soc_priv;
 	void __iomem *regs = bank->eint_base;
 
-	pr_debug("%s:     con %#010x => %#010x\n", bank->name,
-			readl(regs + EXYNOS_GPIO_ECON_OFFSET
-			+ bank->eint_offset), save->eint_con);
-	pr_debug("%s: fltcon0 %#010x => %#010x\n", bank->name,
-			readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
-			+ 2 * bank->eint_offset), save->eint_fltcon0);
-	pr_debug("%s: fltcon1 %#010x => %#010x\n", bank->name,
-			readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
-			+ 2 * bank->eint_offset + 4), save->eint_fltcon1);
-	pr_debug("%s:    mask %#010x => %#010x\n", bank->name,
-			readl(regs + bank->irq_chip->eint_mask
-			+ bank->eint_offset), save->eint_mask);
-
-	writel(save->eint_con, regs + EXYNOS_GPIO_ECON_OFFSET
-						+ bank->eint_offset);
-	writel(save->eint_fltcon0, regs + EXYNOS_GPIO_EFLTCON_OFFSET
-						+ 2 * bank->eint_offset);
-	writel(save->eint_fltcon1, regs + EXYNOS_GPIO_EFLTCON_OFFSET
-						+ 2 * bank->eint_offset + 4);
-	writel(save->eint_mask, regs + bank->irq_chip->eint_mask
-						+ bank->eint_offset);
+	if (bank->eint_type == EINT_TYPE_GPIO) {
+		pr_debug("%s:     con %#010x => %#010x\n", bank->name,
+			 readl(regs + EXYNOS_GPIO_ECON_OFFSET
+			       + bank->eint_offset), save->eint_con);
+		pr_debug("%s: fltcon0 %#010x => %#010x\n", bank->name,
+			 readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
+			       + 2 * bank->eint_offset), save->eint_fltcon0);
+		pr_debug("%s: fltcon1 %#010x => %#010x\n", bank->name,
+			 readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
+			       + 2 * bank->eint_offset + 4),
+			 save->eint_fltcon1);
+		pr_debug("%s:    mask %#010x => %#010x\n", bank->name,
+			 readl(regs + bank->irq_chip->eint_mask
+			       + bank->eint_offset), save->eint_mask);
+
+		writel(save->eint_con, regs + EXYNOS_GPIO_ECON_OFFSET
+		       + bank->eint_offset);
+		writel(save->eint_fltcon0, regs + EXYNOS_GPIO_EFLTCON_OFFSET
+		       + 2 * bank->eint_offset);
+		writel(save->eint_fltcon1, regs + EXYNOS_GPIO_EFLTCON_OFFSET
+		       + 2 * bank->eint_offset + 4);
+		writel(save->eint_mask, regs + bank->irq_chip->eint_mask
+		       + bank->eint_offset);
+	}
 }
 
-static void exynosauto_pinctrl_resume_bank(struct samsung_pin_bank *bank)
+void exynosautov920_pinctrl_resume(struct samsung_pin_bank *bank)
 {
 	struct exynos_eint_gpio_save *save = bank->soc_priv;
 	void __iomem *regs = bank->eint_base;
 
-	pr_debug("%s:     con %#010x => %#010x\n", bank->name,
-		 readl(regs + bank->pctl_offset + bank->eint_con_offset), save->eint_con);
-	pr_debug("%s:    mask %#010x => %#010x\n", bank->name,
-		 readl(regs + bank->pctl_offset + bank->eint_mask_offset), save->eint_mask);
-
-	writel(save->eint_con, regs + bank->pctl_offset + bank->eint_con_offset);
-	writel(save->eint_mask, regs + bank->pctl_offset + bank->eint_mask_offset);
-
-}
-
-void exynos_pinctrl_resume(struct samsung_pin_bank *bank)
-{
 	if (bank->eint_type == EINT_TYPE_GPIO) {
-		if (bank->eint_con_offset)
-			exynosauto_pinctrl_resume_bank(bank);
-		else
-			exynos_pinctrl_resume_bank(bank);
+		/* exynosautov920 has eint_con_offset for all but one bank */
+		if (!bank->eint_con_offset)
+			exynos_pinctrl_resume(bank);
+
+		pr_debug("%s:     con %#010x => %#010x\n", bank->name,
+			 readl(regs + bank->pctl_offset + bank->eint_con_offset),
+			 save->eint_con);
+		pr_debug("%s:    mask %#010x => %#010x\n", bank->name,
+			 readl(regs + bank->pctl_offset +
+			       bank->eint_mask_offset), save->eint_mask);
+
+		writel(save->eint_con,
+		       regs + bank->pctl_offset + bank->eint_con_offset);
+		writel(save->eint_mask,
+		       regs + bank->pctl_offset + bank->eint_mask_offset);
 	}
 }
 
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
index 69be0746e29d9714a33f4aa49df0e8d7257b4220..35c2bc4ea488bda600ebfbda1492f5f49dbd9849 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.h
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
@@ -221,6 +221,8 @@ struct exynos_muxed_weint_data {
 
 int exynos_eint_gpio_init(struct samsung_pinctrl_drv_data *d);
 int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d);
+void exynosautov920_pinctrl_resume(struct samsung_pin_bank *bank);
+void exynosautov920_pinctrl_suspend(struct samsung_pin_bank *bank);
 void exynos_pinctrl_suspend(struct samsung_pin_bank *bank);
 void exynos_pinctrl_resume(struct samsung_pin_bank *bank);
 struct samsung_retention_ctrl *

-- 
2.49.0.rc1.451.g8f38331e32-goog

