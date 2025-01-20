Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0443E1F0E23
	for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jan 2025 22:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737412526; cv=none; b=i8nKFEYpkLA0+dwAe5k78z/g/RwQq/6s+h8XcSPPqa+13kPjLte+uBIoqPM7+gQmwKsKK1IS97swEZRDx3k4vJKiehxlu8l9khe4qvcYK5a/J6l8xlWRUMK1ekVl6AXqULHfMHKMdw9FNdomCfPWKM3F4fG2NCsPF5D67cJhPvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737412526; c=relaxed/simple;
	bh=NhXjpES8Z5hdrpW+nlOyuT4UYqTF84NLAAT7twcKDZk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J59eDCRBdUnpZVgYiqEqfhGH9LGnKLLwgrl5CpfUkfgQRapiNBRElHBO/r+EPB4QHxJKzpswC/It5t5R5trU367pzhtNvqJb4In+gnazpd0Vw/bd3x4XlMYrgy9Yz3g3pq3yeHt5VWXm5Fp7mFRCObRa9bCxzq22LCm+wGew6c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r0fjemE/; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r0fjemE/"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-385e3621518so2272367f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jan 2025 14:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737412522; x=1738017322; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F7SubEn/qdCs7P7fBfXJCsJIYFn9kCf3AkNhzt44AmQ=;
        b=r0fjemE/kDACgt/oI4YyHTLaWwGmCkpIuuyOxG09WLhCjcoQcrxT1SKyL2ADrbelnz
         fU2VvTOQiNxh0tfXQBONM3dk9CVahD6LhppEbHRC3pKFVinjq252alyswFmfNVSNkO1U
         osTbVfXd/7X58Fsfo2yqwDbZIYKXffA5HEwRIh+8fz02/1rsHHcjn3fw353aVuzwhpjL
         PjuiOtR0TzHiV8KouxVZdVhL4OA5mRuWLNpWo1qH8EZ4ZX4h4xMTSW5IinqpcfmZJOeW
         koiCR3ISh3A2vBl/6B0xCWkE3YOxmgqv2ZVPJB/fhKgpPT3JS6VU2/BpSlEFfMVQAchI
         RX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737412522; x=1738017322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F7SubEn/qdCs7P7fBfXJCsJIYFn9kCf3AkNhzt44AmQ=;
        b=NZ0eatTVqRKBwTVq4illJIRqZFb/L84bjC8CEkGVYDobnlc9h/kpXMKc3543sx84rG
         GT21HSfe92SzvEK7bOIXCTD2ogGXjFpX5Q/cbgei1o6HGu4tb3wiO8iZAzZJ7uv23nIY
         RQJ0kSxDM8m0rXUkLW2kd5ovejYp3HIWIL1Q9hF+nR6L/5fZ7Gz9hL2kFExnQK7N4Xeu
         NLMapnG6VZeMp46dfNvMmnWJINMobAmPkjnOV0dkEy3ls9Aslq/gQ807wlYrYuDKgXNl
         Xxg2qd1UBDMa3MDewk3vJjWwet/4dq64j9g+UQxY34QMyLaMJA+Zn9HfPcYOX4QA7nCZ
         7g9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWK+sCg89aElwR/On2pgdQIiUy3E12oRi0g6GgjmuUDOmEl0nM7HLO7Hi6wi/Fcdp9OHQuGuwr82A5GRU3d+VWezg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yygmo+x5nez3jjpU85Y4buFRB0/oQ8mjMghICYEiFCxoF72tesh
	9UTXpoGxdDIkDt3+RdUyMpSs3pFjJMsytrYgaBRj03/W/+QEIFcxxSLpQnvRvtxPVHip6mPgjPP
	W
X-Gm-Gg: ASbGncuExS0WvUcC+hTGnA/HMDNVePBWZ/ZXNIC3QCHpGljjyKFyvvx0U7TWZ9eo6L4
	11ZT0mqWYGrhlL+sv5shjxQwqnqZZSpi/HRCc1sVN64g83Ge6Npd0Ysw1UKvszSa2IKrTlxs7L/
	S5EXbkaBda1ulTGlWdAsPKC0S0P/416PwtGyiYMZFjHXRp0M3cd+PUJnz5OCuCIk5ciga+IuVIC
	omw9oNUMe26PxtqkZcg3jUnWrUxYcCmikdU8sl9kMNh5XVWAcOOQCv/hB7s/7V3UZ+HLqoYmYbg
	4AxFM5ei4jiQxAgi1PRy57Q=
X-Google-Smtp-Source: AGHT+IEoJLFqFrev6E8QtserMQdEKdNoBi79UrRl+zVZrFuu6w7Qke+siykrAgnlR88HLWSg8JWQrA==
X-Received: by 2002:a05:6000:1a85:b0:38b:ef22:d8c3 with SMTP id ffacd0b85a97d-38bf57a69b4mr13896298f8f.35.1737412522094;
        Mon, 20 Jan 2025 14:35:22 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.66.48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf327e19fsm11889267f8f.93.2025.01.20.14.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 14:35:21 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 20 Jan 2025 22:34:55 +0000
Subject: [PATCH 3/3] pinctrl: samsung: Add filter selection support for
 alive bank on gs101
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-pinctrl-fltcon-suspend-v1-3-e77900b2a854@linaro.org>
References: <20250120-pinctrl-fltcon-suspend-v1-0-e77900b2a854@linaro.org>
In-Reply-To: <20250120-pinctrl-fltcon-suspend-v1-0-e77900b2a854@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, tudor.ambarus@linaro.org, willmcvicker@google.com, 
 semen.protsenko@linaro.org, kernel-team@android.com, 
 jaewon02.kim@samsung.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8208;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=NhXjpES8Z5hdrpW+nlOyuT4UYqTF84NLAAT7twcKDZk=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBnjs+kQ4BvhNNbOWa6e63O60uLsWOFBgnKxAcc2
 oVx6dJuGIaJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ47PpAAKCRDO6LjWAjRy
 uhLyD/sE8WE0/YKYf2WxH12zYOHgnRt+0sxKSqTbhgvKsH9aMfbInGIA7gZcT/qROMeyX0eE5Rk
 0DTzZ623a37ZadQcgr7VqV+ykQoTL27fgxJaZkDjQisa3eG73STAIKuBfM7CtyiAcyFdAunb/jE
 LCkSxxH4pKcgKchOPINCY4+GhQEeOuno6pEuLoOzv7qKTOEZTkS2gG3FFo+7xN2k35MpLgXCKlY
 RN8GkH6x6Q5xMaX/gSSF/Lojgaq3aLupsM+sq5VaIgWZTrsdnghiW9NS3OQZiByHl6pAc2Xu4zH
 syuriId9Ac+ZqfJa9peBAyl8Vs+lsFvPta2UEQH0RLqQnNpYA4Wk6YrbI5Ok9Rriz5jyNwxQZAD
 1qc4G5e4gME5gt6mhViomhHO+Y5C5Evw46llmUFD8cUX8Aj2tbULnP9brIefvhmS176lgJUDFvo
 7tEETdnCC2mjFczM3mycYqlOLVfoOR3UA6TZ48I3J/7z1NmxlE9CsWGrX4l0LZrgOdEypJMjafs
 Z2tRNG7zNroeAIBGKnPT1+/PAx/iPASOXGeZAWrfs9bHKU0HPRL0sQMO+CzojC1AEZ511DUTqCH
 KrGeXiU/QI0qiEFVxBdan/78TirMgFqA0dNtHniq5yFR7AoBRkWP2sn0jaRWSk80ozKRZUj2WHA
 U0Ipk98jtXRmsUg==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Newer Exynos based SoCs have a filter selection bitfield in the filter
configuration registers on alive bank pins. This allows the selection of
a digital or analog delay filter for each pin. Add support for selecting
and enabling the filter.

On suspend we set the analog filter to all pins in the bank (as the
digital filter relies on a clock). On resume the digital filter is
reapplied to all pins in the bank. The digital filter is working via
a clock and has an adjustable filter delay flt_width bitfield, whereas
the analog filter uses a fixed delay.

The filter determines to what extent signal fluctuations received through
the pad are considered glitches.

The code path can be exercised using
echo mem > /sys/power/state
And then wake the device using a eint gpio

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---

Note: this patch was previously sent as part of the initial gs101/ Pixel 6
series and was dropped in v6. This new version incorporates the review
feedback from Sam Protsenko here in v5.

Link: https://lore.kernel.org/all/20231201160925.3136868-1-peter.griffin@linaro.org/T/#m79ced98939e895c840d812c8b4c2b3f33ce604c8

Changes since previous version
* Drop fltcon_type enum and use bool eint_flt_selectable (Sam)
* Refactor and add exynos_eint_update_flt_reg() (Sam)
* Rename function to exynos_eint_set_filter() for easier readability (Sam)
* Remove comments and `if bank->fltcon_type != FLT_DEFAULT)` checks and indentation (Sam)
---
 drivers/pinctrl/samsung/pinctrl-exynos.c  | 60 ++++++++++++++++++++++++++++++-
 drivers/pinctrl/samsung/pinctrl-exynos.h  |  9 +++++
 drivers/pinctrl/samsung/pinctrl-samsung.c |  1 +
 drivers/pinctrl/samsung/pinctrl-samsung.h |  4 +++
 4 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index ddc7245ec2e5..a0256715f8f6 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -369,6 +369,60 @@ struct exynos_eint_gpio_save {
 	u32 eint_mask;
 };
 
+static void exynos_eint_update_flt_reg(void __iomem *reg, int cnt, int con)
+{
+	unsigned int val, shift;
+	int i;
+
+	val = readl(reg);
+	for (i = 0; i < cnt; i++) {
+		shift = i * EXYNOS_FLTCON_LEN;
+		val &= ~(EXYNOS_FLTCON_MASK << shift);
+		val |= con << shift;
+	}
+	writel(val, reg);
+}
+
+/*
+ * Set the desired filter (digital or analog delay) to every pin in
+ * the bank. Note the filter selection bitfield is only found on alive
+ * banks. The filter determines to what extent signal fluctuations
+ * received through the pad are considered glitches.
+ *
+  The FLTCON register (on alive banks) has the following layout
+ *
+ * BitfieldName[PinNum][Bit:Bit]
+ * FLT_EN[3][31] FLT_SEL[3][30] FLT_WIDTH[3][29:24]
+ * FLT_EN[2][23] FLT_SEL[2][22] FLT_WIDTH[2][21:16]
+ * FLT_EN[1][15] FLT_SEL[1][14] FLT_WIDTH[1][13:8]
+ * FLT_EN[0][7]  FLT_SEL[0][6]  FLT_WIDTH[0][5:0]
+ *
+ * FLT_EN	0x0 = Disable, 0x1=Enable
+ * FLT_SEL	0x0 = Delay filter, 0x1 Digital filter
+ * FLT_WIDTH	Filtering width. Valid when FLT_SEL is 0x1
+ */
+static void exynos_eint_set_filter(struct samsung_pin_bank *bank, int filter)
+{
+	unsigned int off = EXYNOS_GPIO_EFLTCON_OFFSET + bank->eint_fltcon_offset;
+	void __iomem *reg = bank->drvdata->virt_base + off;
+	unsigned int con = EXYNOS_FLTCON_EN | filter;
+	u8 n = bank->nr_pins;
+
+	if (!bank->eint_flt_selectable)
+		return;
+
+	/*
+	 * If nr_pins > 4, we should set FLTCON0 register fully (pin0~3).
+	 * So loop 4 times in case of FLTCON0. Loop for FLTCON1 pin4~7.
+	 */
+	if (n <= 4) {
+		exynos_eint_update_flt_reg(reg, n, con);
+	} else {
+		exynos_eint_update_flt_reg(reg, 4, con);
+		exynos_eint_update_flt_reg(reg + 0x4, n - 4, con);
+	}
+}
+
 /*
  * exynos_eint_gpio_init() - setup handling of external gpio interrupts.
  * @d: driver data of samsung pinctrl driver.
@@ -420,7 +474,7 @@ __init int exynos_eint_gpio_init(struct samsung_pinctrl_drv_data *d)
 			ret = -ENOMEM;
 			goto err_domains;
 		}
-
+		exynos_eint_set_filter(bank, EXYNOS_FLTCON_DELAY);
 	}
 
 	return 0;
@@ -833,6 +887,8 @@ void gs101_pinctrl_suspend(struct samsung_pin_bank *bank)
 				 bank->name, save->eint_fltcon1);
 		pr_debug("%s: save    mask %#010x\n",
 			 bank->name, save->eint_mask);
+	} else if (bank->eint_type == EINT_TYPE_WKUP) {
+		exynos_eint_set_filter(bank, EXYNOS_FLTCON_DELAY);
 	}
 }
 
@@ -888,6 +944,8 @@ void gs101_pinctrl_resume(struct samsung_pin_bank *bank)
 			writel(save->eint_fltcon1, eint_fltcfg0 + 4);
 		writel(save->eint_mask, regs + bank->irq_chip->eint_mask
 		       + bank->eint_offset);
+	} else if (bank->eint_type == EINT_TYPE_WKUP) {
+		exynos_eint_set_filter(bank, EXYNOS_FLTCON_DIGITAL);
 	}
 }
 
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
index 773f161a82a3..4f2dc6a2e5c7 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.h
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
@@ -52,6 +52,13 @@
 #define EXYNOS_EINT_MAX_PER_BANK	8
 #define EXYNOS_EINT_NR_WKUP_EINT
 
+/* EINT filter configuration */
+#define EXYNOS_FLTCON_EN		BIT(7)
+#define EXYNOS_FLTCON_DIGITAL		BIT(6)
+#define EXYNOS_FLTCON_DELAY		(0 << 6)
+#define EXYNOS_FLTCON_MASK		GENMASK(7, 0)
+#define EXYNOS_FLTCON_LEN		8
+
 #define EXYNOS_PIN_BANK_EINTN(pins, reg, id)		\
 	{						\
 		.type		= &bank_type_off,	\
@@ -183,6 +190,7 @@
 		.eint_type		= EINT_TYPE_GPIO,	\
 		.eint_offset		= offs,			\
 		.eint_fltcon_offset	= fltcon_offs,		\
+		.eint_flt_selectable	= false,		\
 		.name			= id			\
 	}
 
@@ -194,6 +202,7 @@
 		.eint_type		= EINT_TYPE_WKUP,		\
 		.eint_offset		= offs,				\
 		.eint_fltcon_offset	= fltcon_offs,			\
+		.eint_flt_selectable	= true,			\
 		.name			= id				\
 	}
 
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 375634d8cc79..9b874ab2c89b 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1231,6 +1231,7 @@ samsung_pinctrl_get_soc_data(struct samsung_pinctrl_drv_data *d,
 		bank->eint_mask_offset = bdata->eint_mask_offset;
 		bank->eint_pend_offset = bdata->eint_pend_offset;
 		bank->eint_fltcon_offset = bdata->eint_fltcon_offset;
+		bank->eint_flt_selectable = bdata->eint_flt_selectable;
 		bank->name = bdata->name;
 
 		raw_spin_lock_init(&bank->slock);
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index e939e5bb0347..22f3c1e15e6a 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -145,6 +145,7 @@ struct samsung_pin_bank_type {
  * @eint_mask_offset: ExynosAuto SoC-specific EINT mask register offset of bank.
  * @eint_pend_offset: ExynosAuto SoC-specific EINT pend register offset of bank.
  * @eint_fltcon_offset: GS101 SoC-specific EINT filter config register offset.
+ * @eint_flt_selectable: whether the filter (delay/digital) is selectable.
  * @name: name to be prefixed for each pin in this pin bank.
  */
 struct samsung_pin_bank_data {
@@ -160,6 +161,7 @@ struct samsung_pin_bank_data {
 	u32		eint_mask_offset;
 	u32		eint_pend_offset;
 	u32		eint_fltcon_offset;
+	bool		eint_flt_selectable;
 	const char	*name;
 };
 
@@ -178,6 +180,7 @@ struct samsung_pin_bank_data {
  * @eint_mask_offset: ExynosAuto SoC-specific EINT mask register offset of bank.
  * @eint_pend_offset: ExynosAuto SoC-specific EINT pend register offset of bank.
  * @eint_fltcon_offset: GS101 SoC-specific EINT filter config register offset.
+ * @eint_flt_selectable: whether the filter (delay/digital) is selectable
  * @name: name to be prefixed for each pin in this pin bank.
  * @id: id of the bank, propagated to the pin range.
  * @pin_base: starting pin number of the bank.
@@ -205,6 +208,7 @@ struct samsung_pin_bank {
 	u32		eint_mask_offset;
 	u32		eint_pend_offset;
 	u32		eint_fltcon_offset;
+	bool		eint_flt_selectable;
 	const char	*name;
 	u32		id;
 

-- 
2.48.0.rc2.279.g1de40edade-goog

