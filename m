Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90E813FE2
	for <linux-samsung-soc@vger.kernel.org>; Sat, 23 Dec 2023 19:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gH582sO3"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-55485e45ef9so630945a12.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 23 Dec 2023 11:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703359145; x=1703963945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dl+++DRdm00PXx9jJ+9cB6WjPEZdIF4coFJBY+INy5g=;
        b=gH582sO3vvVGnFqahMl7hOz6g6iud0pu0gXIXakkJCQbwX+oXD/uuKt6ZmokPVpTaX
         Vkp44aWlEGPwPrhQ8VavKUaDZ7vRMExPSLIDU2CSBa5mGFZ4bbaVOxvZ1BOybHUtxLbP
         c4JIyU/Ev+JK0RDmWmw6iVRo8xUfk9uWugxlSR+2gbGV4LdLo9TkOJM2nD5KP2ibZcdA
         Sr5Yspfcr69UxE607bDNJuL7UAG0VhFTqe6Ry0FeodVyk03tluTQjj9YfTay363BXrPc
         ebbsgM8k9j1F0GBvLHjdHNwumYjMlVKXBZbyUA7b8cr3oZlX3fED95vpZhQIc8Ln2Pga
         psKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703359145; x=1703963945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dl+++DRdm00PXx9jJ+9cB6WjPEZdIF4coFJBY+INy5g=;
        b=pqSDS3qZ9uWzNUH1I/jjgl0QalS6YaxYZ8tbejSwAlex0uj1QNQGoO0+WLn2CrtCbh
         rI8VPnnkzRclx3hhj4TLrAeluCKeNpeHSD+WJs4qRH6rdOWmfVPiTnodBQsRDxhBhEci
         Zt9LKaQrEXWR6pRThlYb638r0WS0dyVwc1jiyvH4tj444b+SUVTJNDr6RVUGbDRbfzB8
         qTWTOQXA23X7prXLwJWa3ei1UVZgWJzwllMVwQaGJWqSxfQTQJapbwDdeYcY53+pCawM
         h/jH2PVs38X3mMEhHFSs0/Le7OTKRaUoS76839xf2sXFBhGoT311oJcV9EJ0HSipW+Pn
         dSuw==
X-Gm-Message-State: AOJu0Yxjv+bHFtgQryyp6CH2QnddXvOo4nQppTC4KnbJLlHWlJLQrAcZ
	hVYPy6rZRIt9RLjTtjwzSj1phtDx5op5pQ==
X-Google-Smtp-Source: AGHT+IFTnnh0k8o1Ulu+wZ6pXsn6Fbgloq5p6tPXvLGXwAjvJ/OEjsTKUixyPvU+j9hVX44R89PSzw==
X-Received: by 2002:a17:906:364d:b0:a23:3399:31c4 with SMTP id r13-20020a170906364d00b00a23339931c4mr1621067ejb.120.1703359145101;
        Sat, 23 Dec 2023 11:19:05 -0800 (PST)
Received: from krzk-bin.. ([78.10.206.178])
        by smtp.gmail.com with ESMTPSA id cl2-20020a170906c4c200b00a19afc16d23sm3278613ejb.104.2023.12.23.11.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Dec 2023 11:19:04 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Tomasz Figa <tomasz.figa@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: samsung: constify iomem pointers
Date: Sat, 23 Dec 2023 20:19:02 +0100
Message-Id: <20231223191902.22857-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Constify few pointers to iomem, where the destination memory is not
modified, for code safety and readability.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/samsung/pinctrl-exynos.c  | 4 ++--
 drivers/pinctrl/samsung/pinctrl-samsung.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index d3d4b5d036c8..871c1eb46ddf 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -693,7 +693,7 @@ static void exynos_pinctrl_suspend_bank(
 				struct samsung_pin_bank *bank)
 {
 	struct exynos_eint_gpio_save *save = bank->soc_priv;
-	void __iomem *regs = bank->eint_base;
+	const void __iomem *regs = bank->eint_base;
 
 	save->eint_con = readl(regs + EXYNOS_GPIO_ECON_OFFSET
 						+ bank->eint_offset);
@@ -714,7 +714,7 @@ static void exynosauto_pinctrl_suspend_bank(struct samsung_pinctrl_drv_data *drv
 					    struct samsung_pin_bank *bank)
 {
 	struct exynos_eint_gpio_save *save = bank->soc_priv;
-	void __iomem *regs = bank->eint_base;
+	const void __iomem *regs = bank->eint_base;
 
 	save->eint_con = readl(regs + bank->pctl_offset + bank->eint_con_offset);
 	save->eint_mask = readl(regs + bank->pctl_offset + bank->eint_mask_offset);
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index dbf38767f15f..ed07e23e0912 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -565,7 +565,7 @@ static void samsung_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
 /* gpiolib gpio_get callback function */
 static int samsung_gpio_get(struct gpio_chip *gc, unsigned offset)
 {
-	void __iomem *reg;
+	const void __iomem *reg;
 	u32 data;
 	struct samsung_pin_bank *bank = gpiochip_get_data(gc);
 	const struct samsung_pin_bank_type *type = bank->type;
@@ -1204,7 +1204,7 @@ static int __maybe_unused samsung_pinctrl_suspend(struct device *dev)
 
 	for (i = 0; i < drvdata->nr_banks; i++) {
 		struct samsung_pin_bank *bank = &drvdata->pin_banks[i];
-		void __iomem *reg = bank->pctl_base + bank->pctl_offset;
+		const void __iomem *reg = bank->pctl_base + bank->pctl_offset;
 		const u8 *offs = bank->type->reg_offset;
 		const u8 *widths = bank->type->fld_width;
 		enum pincfg_type type;
-- 
2.34.1

