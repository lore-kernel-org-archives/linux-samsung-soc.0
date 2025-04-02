Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E1923BCF7
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Apr 2025 15:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743607064; cv=none; b=aYg2Ep4UOAOQFea/+ckG3Hzgkdxm3XG45qm5Nt9IP7pe97NoNCxYYPsWpkrXSYt74a/WfHD5rYtZdKuBIe/HJnpzO3huStAyiM3ZU+4PSEhXak4EcCCq3BuA33+GUVKUaGFMsFW9Yq1Bz5d9hVX+YMYM5A+rIFs/ZrR3ZZT97Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743607064; c=relaxed/simple;
	bh=9jYQ8qFG3TCrgXmTWSIUauoWLDB9OBDMIl5DHxr8JMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H2W+0RwlnGj/0pkR0UD/6HScOVo30clJvwOYm4c1cgHzpJwO/bMvZ/c0PvvS+WIDLJfqetp0gh5L6r/VgCWtFJYHOMF9hXjhIH5TETHc9q6fChFuZ41hTN606r23fgRjvNs3ymuaTsLHnyerkhT1cZKwT3JVPBr7Hsk08XQEkWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mg/tXNKx; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mg/tXNKx"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39727fe912cso2670143f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Apr 2025 08:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743607061; x=1744211861; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B8+Pe1U0LJW3ofzK+b01yHbnwSQmoedut47oQ7P2Cbs=;
        b=mg/tXNKxN5KKOK62NI4RQpku1tgXUx9ELSn/5XyInk+kkMyVsKU9eOQDF2ttgFSDJu
         /RCZoUa73+0+ubtEI2wzNo+875bfhkWd6H0iFaMD181qw8LlLVi2avNznP6vB1lelZ1X
         TcoJzJz+W86O0V9nBeWmvitd9NOxzPV23+sB2TFSpSSVVVOq7nOZ2AmmFDYHE/HJxnln
         SuYJbJi4Pz4fsas6OBVKEio9R7hEmf7olQgUA2EN6SAMyyFBE0KZA5To1KZTPoULEIOz
         TH8deZ0BzOMaxwJKbM0iWkhJhX6uqKxDcn2KvviCpA5GDM7Cu9M7fDP7+KGH4Pv3Lh2v
         mLUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743607061; x=1744211861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B8+Pe1U0LJW3ofzK+b01yHbnwSQmoedut47oQ7P2Cbs=;
        b=xHsqOWXaThQn8jhCcq14Rrwznnp5Yyld4fX3eM+SWfC2TfFNY6wqqQMGDlMkUc1vTO
         a8tHx5GwMPLXDySuPZ48nNYt0RS45Ee9APdB6Vg1CBcMASi8Org4lfA6TiN2a+VR0POk
         t1URN4AFpT8T6qPcjjGFQPgGmAUTpVr4V3QPUfyR0l1aFPZ9opNlwCQmFqc4TOYdUOrC
         qP6d0Wk3X1hbpWjkMOVWX9tf/hr33Zm04w42Z99EnpnNWOTWWezh1HTBYEb3u1Jxb0gq
         uDijDj+k3oFmXt+hcBkxh0CRVnpoH8pZoD45sUUwB8uNeHKNi7IVgKFCK7kdGWNAwZxb
         3MxA==
X-Forwarded-Encrypted: i=1; AJvYcCX28VHdp454y80Ga/M+/+LRVAOI0X9xGNjvoNzy762gewFiDIk2LBRkWewEmaLJ13beTGeMOUHe5dVuh1pogUB/yA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi5e1DRKTqa6rh2/NNBUEBsX9Qdc7ZhX7jGm+r07yoVpeJ8x1J
	UfZkDhprZAs78vxkfaFKnreMadocLBexZjL0RvVdPlSYmr8QYnEUWUwqsq+Q7uY=
X-Gm-Gg: ASbGnctTrtmtQAzY0Vr2wYRXXo2XuKiGVrMoDmGdCoEGGrhMt9t07Pq11sLJ6Rl7G5H
	1D7hqdM+g/AM8jWy5uj6/MuGnBlWjWkmRlt19Kxjj3VaVM/Rh/gHUEpEAA8M6nQgJBlEk0LJ1Rw
	YBS+1x1FQd5VuA3UmyuFM5WDEG+rB2aIjP3A51R2RTSUPybx3u36IKxK5TbBCKYARHQOPPknfg5
	QQN7JwhJ2YurjmbH0S0sLi0Y65iD7arPNWdybtHYpLrzJ5aiSU9n+fLX7BjR6ZnOkFbszFVukaS
	14pTUrO2FiGF+E1LKL/vxstdVeFPdT4cWbsSDcvNEaNlV/sA9qwCPrHqiuSbeV5HaHk3eDn8Dw=
	=
X-Google-Smtp-Source: AGHT+IFQcBVw5nc/Df59dJyECsuyovtt7ap7m1YZVO+GW+Nv/8l+dQJgnqQsw10qPVZcvSWyxcgxIw==
X-Received: by 2002:a05:6000:1449:b0:390:e48a:3869 with SMTP id ffacd0b85a97d-39c29737d42mr2785591f8f.11.1743607060627;
        Wed, 02 Apr 2025 08:17:40 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.66.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b663860sm17469190f8f.39.2025.04.02.08.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:17:40 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 02 Apr 2025 16:17:31 +0100
Subject: [PATCH v6 2/4] pinctrl: samsung: add dedicated SoC eint
 suspend/resume callbacks
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250402-pinctrl-fltcon-suspend-v6-2-78ce0d4eb30c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12872;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=9jYQ8qFG3TCrgXmTWSIUauoWLDB9OBDMIl5DHxr8JMk=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBn7VUPYDTKw48WdMIpk0jhkhzMlUwV3+KWfMBNm
 BMltT/syYaJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ+1VDwAKCRDO6LjWAjRy
 utdrEACIvcQSZ3gChmJ7hRlkDz2FGZzv8V6u8EMEDod8h8ydKU4wljiktur2odFDoX2h9A+tQh/
 MPgebTu2IwTmoLpVYAK+Z0KWNtJxyrYABVBmjYPCcL7tZZpSQC8SdPNKYsTSTnLiDEV/10g/P5f
 I2tG6oJAYbX8HAgpJhKWOitzh3YdHCWkVjyaGbKeGfT67LfA45QmfyeSg9u3cPdlh6tN4RDNPyH
 zSsuSEftlHFzAZgASN62dIZWk5G/uj6kBSX/c3nPHndMXqM5ipGS1xAA3+jM+/6VT4PFtFZATOs
 3XBNoDMpiqknmqjV3k52bEGs9GtNXiFtxz4HjORc263jVF99Xe7lqstvVJwRzPBfE2ey3smNHgp
 cdqBgLwfthWPL7ZlKNR0AhcuIo/1qjoFKBlTqdy4DkFG0MhLtvbzy71PIJh/+5HHFhaP3JjqqsD
 09cYDFmhfKFv1saeOgJeWTBW+Zl8J3F1qZwp6q7f9eEisx9bo+w7D62hNzkv4O+rIGKmxbHa3io
 6a3GjddZc8qVHu6dXgmRIicBs1HqmhtOg9jW1K57sH70wBCBao+cl+dSxvuDTrW7v4X3/fXoi3X
 JvAx3aPuWnXgeOPAd3woWhKXvYY/dRU7sQu9R4NAMMgc7P4GiZRf8t16ZvVx3KX2CkMKqOQ1YL9
 DUGGvO3IqJHgIVw==
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
index dd07720e32cc09ea1d5a20c8d1cbea3bcff79204..4b5d4e436a337ff13dee6ef740a1500eaf86cc12 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -1419,8 +1419,8 @@ static const struct samsung_pin_ctrl exynosautov920_pin_ctrl[] = {
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
@@ -1431,43 +1431,43 @@ static const struct samsung_pin_ctrl exynosautov920_pin_ctrl[] = {
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
index ae82f42be83cf0a294452d7f44cd744295bb0408..18c327f7e313355c4aba72f49a79b1697244f1ba 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -762,105 +762,115 @@ __init int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
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
index 341155c1abd153eb3efec5212b268ccfa535bd8e..3a771862b4b1762b32f9e067b011e80cfebb99d2 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.h
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
@@ -240,6 +240,8 @@ struct exynos_muxed_weint_data {
 
 int exynos_eint_gpio_init(struct samsung_pinctrl_drv_data *d);
 int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d);
+void exynosautov920_pinctrl_resume(struct samsung_pin_bank *bank);
+void exynosautov920_pinctrl_suspend(struct samsung_pin_bank *bank);
 void exynos_pinctrl_suspend(struct samsung_pin_bank *bank);
 void exynos_pinctrl_resume(struct samsung_pin_bank *bank);
 struct samsung_retention_ctrl *

-- 
2.49.0.504.g3bcea36a83-goog

