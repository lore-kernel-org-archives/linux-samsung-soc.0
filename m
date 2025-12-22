Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE78E331A79
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Dec 2025 16:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766421040; cv=none; b=ptrwFhyVJj1Q/S7PFyVax0JCkU8/sCLsuozZpf//Sonsoc8Xdk68dv7WCetm8YWrIP4uTbXfXdu8u4uPWQTXjTy0BW0bANRc0DgUfkgjzOl9BlLM1roe7cxIyaFIiy4cnneBcWxipQqtifE2fi+edAoC91U/e0kck1khIQQslfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766421040; c=relaxed/simple;
	bh=M/Ht02RXnwpyI8/d82bw2pNNTOH9KcOIpttNOEpsz50=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yz7iqCmnBqLArdfpBrF1xHYpVhIWIjlQp3+fvGrDej5mynoJnN3HYa5vioPYU55D+2iPg0hfMNtQnJ31l7FBmq/2XX4mCC/vNmwXx1lF+InSxR+rv7YSydgybecnmW90Sj5mXRCTh60D3C/WuVn6HIafkNcCamtXEWmzQUbTAy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N80xDzGN; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N80xDzGN"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47bdbc90dcaso27654155e9.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Dec 2025 08:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766421036; x=1767025836; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OdZvrS1dE5qeSW0XzFKBJXtmzMM/4cC+vHFcMxasvWQ=;
        b=N80xDzGNXBLPzr952CwRB5mid4zJhYXE99Cl7wThVS+TOY4NzohzHLeyu2dndgiphO
         Hdx0FkU2kmqi654GRmUc0dCn7WvsXLIRd9MlVE5pmtmw1MJKsbX0M3QI2XkiSFaoIpHj
         kY+m+6/ROr7+IjJhc505YdJ8lYQLW6tggBLlk7ZnHQtXVUrtSv1CTLmdx/zOGAML6Y1I
         2yScXoegVvgDdW6JcxbiXl6dwVixbhjIO0jWJ3jd81I6QYHKkem97sGWGfGbUwvzp+0w
         GmdZqZiBifBU3b7mra4LBViXnDY/BPJxGGMmxw39zQVlwtaULcqsNakhI0DVR55P1AU2
         gWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766421036; x=1767025836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OdZvrS1dE5qeSW0XzFKBJXtmzMM/4cC+vHFcMxasvWQ=;
        b=OkbdYTdV8tGdCmBENk/OFJ0N69GegeuT6W2HdRSqTMeOqs3CkMb1npif2Da+5+kmLB
         dBISEvo61wnxIzku9+osE8gcJqkqNNff5B5YsRfJRqwcLC0Jty5iEgaA2X4Ld6J2hPC9
         sTjOIqazW2nlfdjxcMBQGOYtO43Gdp1a3OTC8SBbT+/hsbgv1TPgO0VwXFiaf+QXtEFa
         v1R0ZDnAHSNbeiYq0FtEfnvoO9Q2wxXvZPs4IzYWpeOcVaovw6B6H9W+KcZHe2nTOGrj
         Xau7bmBg5E9Kcz0si0BlsqFBpO2dG6v8DlfZekLPOGbfafObXNCKjtpd5n4AiuvETIuE
         UZcw==
X-Forwarded-Encrypted: i=1; AJvYcCWLjLSwzuAL7gCuTA19Gkha6GkZPRn6+VOqrfNR4YSNCRHxRXW2K7MV9p6SOjsubxDKc5XzeEBqpc9Czfe7Kr1u+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeAH68Dbt9rA8FVElHb3MeKUAeDecC7BclwQLl9UnFuow5F0Yc
	cehf2qAGFPxL7HmCwh9Zfyyj4psYGn+pLbvfO7/Npci1+vRKYPQm4g2C/Np2su9EA/0=
X-Gm-Gg: AY/fxX5cX16kDpvKKdi75jEXuhjIfgeWi60bJnmytcbX3qQ/6DY2nr1eHlzPd5B4uOt
	UUJT39hBB6ISwWTUtQxd161h5qgBEK3AWM5qFVAyNDVBTneACmXnNUyCViuHkmrtaiBqQT5qxWN
	aoedrPKBh3rV7SqEqKr+NdXh84UMb86NXhNZZ8vjzd5gC2Qaqgvi5yNbBRBXIjpFNutgKxYloHp
	quALLMvJ56UqNiF0w93VE8/U4QRAceeZzRJLKjPf8Y2iFm4BRa7rY0Jm37R1mz3rqMdXlZBgZGv
	vx58+PGQPQl+4PRvX50BPMNr7NoY1EkvKwprfI2/zfqMtzdS2rOT2bth9LVFM6ee/1xnaEMEzuF
	zQAKx9XBy4Vq8cupksKxbqyDqJ/mRHrV62QjTcrc5AbFP17vuTWKFCLe7kqhxcUbXpGjhhGn6sd
	fBLfm49qo5sG1wMtde2nskl50MuamVKu1ZQALA1y5bsfAmGIFbA7Vllb3fq5ITbI1V
X-Google-Smtp-Source: AGHT+IFNrAPWGxzcsoaQLoabTeny92MuV3z4VFx51LTPkZKLWoAPMlDB5aYM21GbjGHuz92+M8hP8w==
X-Received: by 2002:a05:600c:3489:b0:479:2a09:9262 with SMTP id 5b1f17b1804b1-47d1953dabamr123231785e9.9.1766421036091;
        Mon, 22 Dec 2025 08:30:36 -0800 (PST)
Received: from ta2.c.googlers.com (62.221.76.34.bc.googleusercontent.com. [34.76.221.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa4749sm23071258f8f.37.2025.12.22.08.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 08:30:35 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 22 Dec 2025 16:30:08 +0000
Subject: [PATCH v4 4/5] soc: samsung: exynos-chipid: add google,gs101-otp
 support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-gs101-chipid-v4-4-aa8e20ce7bb3@linaro.org>
References: <20251222-gs101-chipid-v4-0-aa8e20ce7bb3@linaro.org>
In-Reply-To: <20251222-gs101-chipid-v4-0-aa8e20ce7bb3@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766421032; l=5635;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=M/Ht02RXnwpyI8/d82bw2pNNTOH9KcOIpttNOEpsz50=;
 b=0wI3TjHRprHCL0MH4xmRPJElU8StjYDtY2qkStptCp0VsYE/h9uYZem6ZSzBlAAqwPiTmCoj4
 eZhUU35XhVfA61saeDelePzXlNVEEF0o5EqhMfSa1e/APSjAs9qjfVa
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

GS101 is different (but also e850 and autov9 I assume) from the SoCs
that are currently handled by the exynos-chipid driver because the
chip ID info is part of the OTP registers. GS101 OTP has a clock, an
interrupt line, a register space (that contains product and chip ID,
TMU data, ASV, etc) and a 32Kbit memory space that can be
read/program/locked with specific commands. On GS101 the "ChipID block"
is just an abstraction, it's not a physical device. When the power-on
sequence progresses, the OTP chipid values are loaded to the OTP
registers.

Add the GS101 chip ID support. The support is intentionally added in the
exynos-chipid driver, and not in a dedicated Exynos OTP driver, because
we estimate that there will not be any OTP consumers in the kernel other
than the chip ID/SoC interface. The downstream GS101 drivers confirm
this supposition.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/soc/samsung/exynos-chipid.c | 70 ++++++++++++++++++++++++++++++++-----
 1 file changed, 61 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 5c8660374269c87ec38ebca242918bd7b1d362e5..6ef9751e2509c94bd9625072d0b81ddb93048d4a 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -15,7 +15,8 @@
 #include <linux/array_size.h>
 #include <linux/device.h>
 #include <linux/device/devres.h>
-#include <linux/errno.h>
+#include <linux/err.h>
+#include <linux/ioport.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -28,9 +29,11 @@
 #include "exynos-asv.h"
 
 struct exynos_chipid_variant {
-	unsigned int rev_reg;		/* revision register offset */
+	unsigned int main_rev_reg;	/* main revision register offset */
+	unsigned int sub_rev_reg;	/* sub revision register offset */
 	unsigned int main_rev_shift;	/* main revision offset in rev_reg */
 	unsigned int sub_rev_shift;	/* sub revision offset in rev_reg */
+	bool efuse;
 };
 
 struct exynos_chipid_info {
@@ -69,6 +72,8 @@ static const struct exynos_soc_id {
 	{ "EXYNOS990", 0xE9830000 },
 	{ "EXYNOSAUTOV9", 0xAAA80000 },
 	{ "EXYNOSAUTOV920", 0x0A920000 },
+	/* Compatible with: google,gs101-otp */
+	{ "GS101", 0x9845000 },
 };
 
 static const char *exynos_product_id_to_name(unsigned int product_id)
@@ -93,19 +98,53 @@ static int exynos_chipid_get_chipid_info(struct device *dev,
 		return dev_err_probe(dev, ret, "failed to read Product ID\n");
 	soc_info->product_id = val & EXYNOS_MASK;
 
-	if (data->rev_reg != EXYNOS_CHIPID_REG_PRO_ID) {
-		ret = regmap_read(regmap, data->rev_reg, &val);
+	if (data->sub_rev_reg == EXYNOS_CHIPID_REG_PRO_ID) {
+		/* exynos4210 case */
+		main_rev = (val >> data->main_rev_shift) & EXYNOS_REV_PART_MASK;
+		sub_rev = (val >> data->sub_rev_shift) & EXYNOS_REV_PART_MASK;
+	} else {
+		unsigned int val2;
+
+		ret = regmap_read(regmap, data->sub_rev_reg, &val2);
 		if (ret < 0)
 			return dev_err_probe(dev, ret,
 					     "failed to read revision\n");
+
+		if (data->main_rev_reg == EXYNOS_CHIPID_REG_PRO_ID)
+			/* gs101 case */
+			main_rev = (val >> data->main_rev_shift) & EXYNOS_REV_PART_MASK;
+		else
+			/* exynos850 case */
+			main_rev = (val2 >> data->main_rev_shift) & EXYNOS_REV_PART_MASK;
+
+		sub_rev = (val2 >> data->sub_rev_shift) & EXYNOS_REV_PART_MASK;
 	}
-	main_rev = (val >> data->main_rev_shift) & EXYNOS_REV_PART_MASK;
-	sub_rev = (val >> data->sub_rev_shift) & EXYNOS_REV_PART_MASK;
+
 	soc_info->revision = (main_rev << EXYNOS_REV_PART_SHIFT) | sub_rev;
 
 	return 0;
 }
 
+static struct regmap *exynos_chipid_get_efuse_regmap(struct platform_device *pdev)
+{
+	struct resource *res;
+	void __iomem *base;
+
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(base))
+		return ERR_CAST(base);
+
+	const struct regmap_config reg_config = {
+		.reg_bits = 32,
+		.reg_stride = 4,
+		.val_bits = 32,
+		.use_relaxed_mmio = true,
+		.max_register = (resource_size(res) - reg_config.reg_stride),
+	};
+
+	return devm_regmap_init_mmio_clk(&pdev->dev, "pclk", base, &reg_config);
+}
+
 static void exynos_chipid_unregister_soc(void *data)
 {
 	soc_device_unregister(data);
@@ -127,7 +166,11 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, -EINVAL,
 				     "failed to get match data\n");
 
-	regmap = device_node_to_regmap(dev->of_node);
+	if (drv_data->efuse)
+		regmap = exynos_chipid_get_efuse_regmap(pdev);
+	else
+		regmap = device_node_to_regmap(dev->of_node);
+
 	if (IS_ERR(regmap))
 		return dev_err_probe(dev, PTR_ERR(regmap),
 				     "failed to get regmap\n");
@@ -177,19 +220,28 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 }
 
 static const struct exynos_chipid_variant exynos4210_chipid_drv_data = {
-	.rev_reg	= 0x0,
 	.main_rev_shift	= 4,
 	.sub_rev_shift	= 0,
 };
 
 static const struct exynos_chipid_variant exynos850_chipid_drv_data = {
-	.rev_reg	= 0x10,
+	.main_rev_reg	= 0x10,
+	.sub_rev_reg	= 0x10,
 	.main_rev_shift	= 20,
 	.sub_rev_shift	= 16,
 };
 
+static const struct exynos_chipid_variant gs101_chipid_drv_data = {
+	.sub_rev_reg	= 0x10,
+	.sub_rev_shift	= 16,
+	.efuse = true,
+};
+
 static const struct of_device_id exynos_chipid_of_device_ids[] = {
 	{
+		.compatible	= "google,gs101-otp",
+		.data		= &gs101_chipid_drv_data,
+	}, {
 		.compatible	= "samsung,exynos4210-chipid",
 		.data		= &exynos4210_chipid_drv_data,
 	}, {

-- 
2.52.0.322.g1dd061c0dc-goog

