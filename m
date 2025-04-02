Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E043623E25B
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Apr 2025 15:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743607068; cv=none; b=IlxYiebKhc7NGp9Hga3Tpnb9sNgfbdFUZArmFBahH5xbzIsY3Kj5Ev8fegUT7mnlaZM7MZ5963Fb5/5DzGhBWr36t+qg4ZxwcmuSANoip/RK2EtTM5t6zFcQfgqJzv3kNgK4jPe1gvNZzb2kcscer3wfj9A5SttrE+U1fKZA96A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743607068; c=relaxed/simple;
	bh=AujZQXa7GXfZ//2SBfjSJDuHvl2+ROHYQOi0tdHKgdk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mbBsbogMFXia65HiZHLD7ZKaOozT6M9AfqvNA+UBfX1S8JL98lU7NfyBc11oX6M/oMWGo6+RzLOQjzLEca2FDq8VxWmR2PoN7yzTM3p6A6/1gA4sssFX0hBDyZVxjlgla/UuKy2YR4CDYU5niSfv8l7wMZ48CIwaZxvwLDkz00Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QhL/Jryi; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QhL/Jryi"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3913958ebf2so5249030f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Apr 2025 08:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743607064; x=1744211864; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RT1SeGSA5GQ1fXoKXVvanXrAwd9U3trQ/c8CMPHycCA=;
        b=QhL/JryiWdxexqz0OF0SxY8XPkiJItikfvOwbZ8T8z0elLV1BJ3Glgm1ItIRPbXmV2
         QD/Dwu5lfAKXD7s5/Kf+hhH5lQB8JJ94v7MlCUze8caVfiG8lwr+/yPo9ZFomt6yXCXl
         95RSaDTlRlLTCrU4d8gbtVjPRF7Muux3nPLubGvqLX3BQ+zyNhMUtMj3ofSJNwsU967Y
         dIDDbAkXm1fi1JQpBPxklTA8S0hiMhj74LjA95UANXntrRBD7m3D7xsJmdY+3xylisu/
         h5tv6Y95ICEsUL2uPAE/rFq6iGeQ4DVd6o4+wgu7TuWpaywpylViL8RdyjNvxfu54zj7
         yK3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743607064; x=1744211864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RT1SeGSA5GQ1fXoKXVvanXrAwd9U3trQ/c8CMPHycCA=;
        b=YMvzcvG3mm8gSo4qDKrr8Y7U1/1Vo9S7+PWcuuMCJgQC8twpnm3REOl5hY0r1F3IzJ
         7QP8McphOnfN6UN9ZKSxKO0TXdUaKzY2AjF7TCD+l4gReXg+68RKmIXLfUqDcNW3Wl1K
         1EIAPo6FACTuHEzZJPfR8b0MQu1ULlUcGU+znfXhFYYbOIYeggJG7/+tuOQlT8xgLL+a
         IW1DZtO5YXPmZF8kFVblkiVEexzojJ2rBimc7vRX3ZFE/aBGu1VGEF4d0aLWuSmlGF3g
         o4esbA4mYR4DdTTSiS6ltilvu4dFHI8otleWAK33GY9/IrKgwFn3v95vnJSjhknOrF8w
         qn5w==
X-Forwarded-Encrypted: i=1; AJvYcCUinQwhZ+NrrPjEBD5PZqD1Ih307ydEiGe2nNYKk4JMSwkkeTPHaHTzv6J5FOODW9vsuUqR35E52TNhfZSBu3Rarg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3NSeoBkZH74F0eI7S+4kOu9JnmY1xseghoR4aBaug8HAEqhXK
	kz4c5Skui8Dc3iHW3SULtwER9XP1mCCVWBpIVqq55y8yI3icgbe+XHDFU3XAnuc=
X-Gm-Gg: ASbGncv32A9ex3JR81VRoY113NWS44rGKdzb4JnIFLju0Tg8jxM89LzmvZ71L3F3I3z
	BeK0IADzmNEQO7pltdcpTbN+X/qZkFf8zSvTZJ+sM/z3arnN27MlxksUJjD4lmgqJw+PttUTmkd
	21n79ftoZFZCD6xiRasiLdnvtaB1mPbhjQzym8hmVNBLJsCv0lseBrcdyKauzzGZAldAD7/ZYkh
	vCdGAvcy2H4nsVACQsfJBPdFLUDd8g25Few0RdmmHK12zf2JxatqvNyVT8SK5E1eYIs7mmuM2g2
	ovdXKOYSHFxE9XSuTdWUQ9uL/9PxzKc0QXXJ0HkOobCvJity78lPZw/dKE71X7hXJBb0vSwQC4w
	jZ0XkGpCf
X-Google-Smtp-Source: AGHT+IHFo1V7olRxYCuDmHeY5rzVFfk8a7h1ctHGDdUeLAMnTEwORauybS7JaON5yanV/uSmOQw9DQ==
X-Received: by 2002:a5d:5c84:0:b0:390:f9a5:bd79 with SMTP id ffacd0b85a97d-39c29767c8emr2464302f8f.26.1743607064139;
        Wed, 02 Apr 2025 08:17:44 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.66.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b663860sm17469190f8f.39.2025.04.02.08.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:17:43 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 02 Apr 2025 16:17:33 +0100
Subject: [PATCH v6 4/4] pinctrl: samsung: Add filter selection support for
 alive bank on gs101
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250402-pinctrl-fltcon-suspend-v6-4-78ce0d4eb30c@linaro.org>
References: <20250402-pinctrl-fltcon-suspend-v6-0-78ce0d4eb30c@linaro.org>
In-Reply-To: <20250402-pinctrl-fltcon-suspend-v6-0-78ce0d4eb30c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5531;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=AujZQXa7GXfZ//2SBfjSJDuHvl2+ROHYQOi0tdHKgdk=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBn7VUQGniN8W+uLmpOtptdW5cgPSdCqV6b5hk7D
 Qw8dbFgKwaJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ+1VEAAKCRDO6LjWAjRy
 unn/D/48Ey3dk5oqJw+GiAHkYpQd+iXupMawkzqXjhGuwM4Mz8zWN+54tcnACYE7hgoKZ5abTiq
 nA14otuXvKKgePX9szClRgF2SoNUFp6xjIjOwDj5XAzhG+4WCizAukoYhnlIoQQ5Ba1Fhp9dfw6
 sQbTaFQqrL1zmOBNxQsnQbv/YrrwTpLZPa8OnbA5TBXR6TLW9AtFpFhp4zDReRc8azFWt5uyR7R
 wgXwRv2POp9OLMH2fzZy/HRYdIyxmeJ+A2gAdSffkGdmz6LBJfaXamtOhB+52bPpcV1+8Sl8+3J
 V5YL91z2loW58fjLMQ3RO4qOwRkLGeDSAtZwecyNRzOk4qrGlxJ1FKfbSuabG3O9E5MxUXyUTKV
 q6a0XReTnUfABBG0Ibn0hkg7npOy//eo2D9H1EtTR3qfCqmKIFZmA0SL5DU3qLI4VnnP2YnFAbN
 XCwm60t/1w+soWbj+wxp3+NUCnOaX3ts2/SKgn8KjWinHQeI/UlrbVtJgFMSWHGXkZ6hmD87h3K
 b2Aif+soPFiqmbgaZ1pSTkjysSjfAVxilYUT6Oxbynu6s9yJgeQJlWtbxdp7VCXnhPEKPyDfxww
 Q6S++vCHolnvVQdzmmN0XbQz4M6dXRYZ7fyRVB/wRCYCGvhg1ca+OjuNwlX7DuvYfJiwjWS2Ydi
 eKtcJUvaeNpNrcw==
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

Reviewed-by: André Draszik <andre.draszik@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---

Changes since v2:
* Ensure EXYNOS_FLTCON_DIGITAL bit is cleared (Andre)
* Make it obvious that exynos_eint_set_filter() is conditional on bank type (Andre)

Changes since v1:
* Remove eint_flt_selectable bool as it can be deduced from EINT_TYPE_WKUP (Peter)
* Move filter config comment to header (Andre)
* Rename EXYNOS_FLTCON_DELAY to EXYNOS_FLTCON_ANALOG (Andre)
* Remove misleading old comment (Andre)
* Refactor exynos_eint_update_flt_reg() into a loop (Andre)

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
 drivers/pinctrl/samsung/pinctrl-exynos.c | 34 ++++++++++++++++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-exynos.h | 20 +++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index 0879684338c772e484174a94ac2c274cc7d932ed..f3e1c11abe55032ee4ed7eb4db861dbb1e60c2bf 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -370,6 +370,37 @@ struct exynos_eint_gpio_save {
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
+		val &= ~(EXYNOS_FLTCON_DIGITAL << shift);
+		val |= con << shift;
+	}
+	writel(val, reg);
+}
+
+/*
+ * Set the desired filter (digital or analog delay) and enable it to
+ * every pin in the bank. Note the filter selection bitfield is only
+ * found on alive banks. The filter determines to what extent signal
+ * fluctuations received through the pad are considered glitches.
+ */
+static void exynos_eint_set_filter(struct samsung_pin_bank *bank, int filter)
+{
+	unsigned int off = EXYNOS_GPIO_EFLTCON_OFFSET + bank->eint_fltcon_offset;
+	void __iomem *reg = bank->drvdata->virt_base + off;
+	unsigned int con = EXYNOS_FLTCON_EN | filter;
+
+	for (int n = 0; n < bank->nr_pins; n += 4)
+		exynos_eint_update_flt_reg(reg + n,
+					   min(bank->nr_pins - n, 4), con);
+}
+
 /*
  * exynos_eint_gpio_init() - setup handling of external gpio interrupts.
  * @d: driver data of samsung pinctrl driver.
@@ -832,6 +863,7 @@ void gs101_pinctrl_suspend(struct samsung_pin_bank *bank)
 			 bank->name, save->eint_mask);
 	} else if (bank->eint_type == EINT_TYPE_WKUP) {
 		exynos_set_wakeup(bank);
+		exynos_eint_set_filter(bank, EXYNOS_FLTCON_ANALOG);
 	}
 }
 
@@ -887,6 +919,8 @@ void gs101_pinctrl_resume(struct samsung_pin_bank *bank)
 			writel(save->eint_fltcon1, eint_fltcfg0 + 4);
 		writel(save->eint_mask, regs + bank->irq_chip->eint_mask
 		       + bank->eint_offset);
+	} else if (bank->eint_type == EINT_TYPE_WKUP) {
+		exynos_eint_set_filter(bank, EXYNOS_FLTCON_DIGITAL);
 	}
 }
 
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
index 2bee52b61b9317ff79c618c1dc53e98242805087..362dc533186fb4ab9926b38b8d34af07690f783d 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.h
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
@@ -52,6 +52,26 @@
 #define EXYNOS_EINT_MAX_PER_BANK	8
 #define EXYNOS_EINT_NR_WKUP_EINT
 
+/*
+ * EINT filter configuration register (on alive banks) has
+ * the following layout.
+ *
+ * BitfieldName[PinNum][Bit:Bit]
+ * FLT_EN[3][31] FLT_SEL[3][30] FLT_WIDTH[3][29:24]
+ * FLT_EN[2][23] FLT_SEL[2][22] FLT_WIDTH[2][21:16]
+ * FLT_EN[1][15] FLT_SEL[1][14] FLT_WIDTH[1][13:8]
+ * FLT_EN[0][7]  FLT_SEL[0][6]  FLT_WIDTH[0][5:0]
+ *
+ * FLT_EN	0x0 = Disable, 0x1=Enable
+ * FLT_SEL	0x0 = Analog delay filter, 0x1 Digital filter (clock count)
+ * FLT_WIDTH	Filtering width. Valid when FLT_SEL is 0x1
+ */
+
+#define EXYNOS_FLTCON_EN		BIT(7)
+#define EXYNOS_FLTCON_DIGITAL		BIT(6)
+#define EXYNOS_FLTCON_ANALOG		(0 << 6)
+#define EXYNOS_FLTCON_LEN		8
+
 #define EXYNOS_PIN_BANK_EINTN(pins, reg, id)		\
 	{						\
 		.type		= &bank_type_off,	\

-- 
2.49.0.504.g3bcea36a83-goog

