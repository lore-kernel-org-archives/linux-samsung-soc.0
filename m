Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BAE1A9FA0
	for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Nov 2025 13:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763474184; cv=none; b=eoc9k0g1cMCgXfb+gIXuKCSaZTEcDwQ1hLhU5KNOhBynwYjuRvueiagdRw9r760hoeKjUyi7BbRuTuVNMRaD7yb/2J6JYYTkaU1J/yf4eU32L0wKB5qB/OlgufStTF3Ncjkyw8TgogYaWP5+xdDynGGu6RT/wbro6MO/ueACeu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763474184; c=relaxed/simple;
	bh=p4ZObKdORDPs9HTtQcCqfM4Dt9UYXjFKiNvgoGM8eUg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ugtvXIgutF57y8uBkdQSoxaW6DheLYWbHAdk4fJXiIw+0UxPS+a61y+VagK1FWWDnzeHOwigsZRQLdMKbLssngStpQRoN2fDEvJZXAgZ7MXmRe5tko+M1Rejuhv0RYBhoYDmTPfJqdfa8Bx3BRRvle7/exBn3t/AgKDgN/mL2Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zM6rHLZY; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zM6rHLZY"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-429c8632fcbso3934079f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Nov 2025 05:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763474180; x=1764078980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=krmSxhstA40QKaUa91FcpQEPCxCXSSQwFp3fjsLx65I=;
        b=zM6rHLZY42U0K358T59xoH768cxkOmmY1lQbDvVMQvRHehvPlB6fA5c8GfbWFBY3CB
         /tKSnhthWZZm73KV0T5FRzWJPNUkJ1dY7h9vmib+hVvnhc9/o/z6nFFvKYrSTr1Yup8J
         CGStt44AMfl/7p/4WUT/ZL1vc/nAafQEpxz31TLwCUsE2F6EvKMVogQjzoI6/hG4xWx4
         uW2ttszgNNQWJz9Pr4TiqBw89AFkHHnZOKcpUASKlTAi+Tl+cCykVoxVZb4+3C2xQhtT
         zCDkk+eikDAdwrQYCNmB9hTI58lPVO4qcaMuKo1I3bitDKiTfiBG2GXX6WcIgaw6RWz5
         g3pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763474180; x=1764078980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=krmSxhstA40QKaUa91FcpQEPCxCXSSQwFp3fjsLx65I=;
        b=HXBGF5uUtjc3EpKNiAyGPgmOefR/cAhdjaa6rzZIygkDZ5KFDV34lM3ZLcROA4tj59
         3HFz5iHSS2Fc7zkF3AOIeEdBsp+qL/dloNg0Yd9zZTeJPI6MP4LrhUPW4Iy8PuQtEcjB
         4INtKnjFSuAUbfqr+LPgI+TJuL/Fa3s+uIKcmodSuYUZIJ2PhTe2Tb8sWYa6YEpieqKl
         DQ9+Vj943o3pj6d1TSLYMskx6+i0dsSyiNiibcaXzfN07oWb2tYplgPNRXVYdo3xCW4d
         /v+9SYBYvVACPMzIoiKCravkdKKA3rXFqVBaVIa5v5eEOttae87heHmlGFLeKdhqhvB5
         6bGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIEZ5V7Fz0gEjtmFOe5zvqRzDaCcsubtk3j1rjJQF/Avlc2GninJFBKEqxjl9n6my/hlhIjos4fhRjLmMNkDvNgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMoDnPv/bbtmxuJpVwq88x36YjXdxWQIyE52kyEerFGhcZsg6y
	ynRFQ3JTO46az2kVmAGomH1/3ik0FLPrQe7PJeuJDaEXVYiAAMwYMsbL3aRPBItKM0c=
X-Gm-Gg: ASbGncuZ9lxku3+LVwlE8V6jh4hQzD/jb9mO0xyPvCVD9RTRiaO8d5/WVjq3Fck3jr7
	Xd7U9gzAFY5A59vVjrd4xxvlmOAF6J3X0hrlySz8mFceFw76et3iG0yEC9lqePb42OF1z97Y3dr
	h4jquzKbPrlm/q9DVSRHnMQA4GUWmsPMI7879fvPDcRPsMbmU+03c3JE9+ci/AXd7YHiJ/X0ZuO
	yJt8wdELi3OuRo7AWstkOBquvNF3Rwr2nD4jSIfwvYzoYqdfksouTcKE65N8VUP+YqoaOvE3zoF
	CrlJ68VEVDF+IeAe4B1dTnpM28dceVoPnmcMz9VjaCuqnM7/dL0DNAkuUFjAJtL2maGe4K77uW4
	FhUArQrUL4IHsFKBbTTtjy7+PwZja4NHx8Q+5xtJ65oZxHqYJxHFMnlnVsLNkLkiuD5PYtl15g7
	+MEqh87i5TQvTpgyOGvAd3c0qVHTSLQRvDcxs/uHoSbpA3H/CNQKILSTV7gL2gVadMJJEDck8Mo
	Tdzjg==
X-Google-Smtp-Source: AGHT+IFAvpSIo5Boh9uZGNRz1jnPH4zVkRyDa+XU94Z/sZjJKjAL+c0xF0VcYKBmnlzP3uQx4J36ZQ==
X-Received: by 2002:a05:6000:2dc8:b0:429:d40e:fa40 with SMTP id ffacd0b85a97d-42b5937324cmr15236841f8f.45.1763474179646;
        Tue, 18 Nov 2025 05:56:19 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7ae16sm32728666f8f.3.2025.11.18.05.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 05:56:19 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 18 Nov 2025 13:56:09 +0000
Subject: [PATCH v2 2/7] soc: samsung: exynos-chipid: add google,gs101-otp
 support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-gs101-chipid-v2-2-e9f1e7460e35@linaro.org>
References: <20251118-gs101-chipid-v2-0-e9f1e7460e35@linaro.org>
In-Reply-To: <20251118-gs101-chipid-v2-0-e9f1e7460e35@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763474177; l=5916;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=p4ZObKdORDPs9HTtQcCqfM4Dt9UYXjFKiNvgoGM8eUg=;
 b=LgZlOadmjkQB7OdfDpvgPkVbF7pYjTLOuPDsVJbWNZP7uMGPhhsOLuzdntKh28msuquJ/TRVv
 i0HyigF3mGIALH+Q3JnnxQb5bAsptf+gjuhHFJ+IHOd9/Zjx4XEZM4w
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
 drivers/soc/samsung/exynos-chipid.c | 86 ++++++++++++++++++++++++++++++++-----
 1 file changed, 75 insertions(+), 11 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index d3b4b5508e0c808ee9f7b0039073ef57915d60fc..8904ffdaf9a6f6d069cc6af18a24dd00a2780892 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -13,8 +13,11 @@
  */
 
 #include <linux/array_size.h>
+#include <linux/clk.h>
 #include <linux/device.h>
-#include <linux/errno.h>
+#include <linux/device/devres.h>
+#include <linux/err.h>
+#include <linux/ioport.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -27,9 +30,11 @@
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
@@ -68,6 +73,8 @@ static const struct exynos_soc_id {
 	{ "EXYNOS990", 0xE9830000 },
 	{ "EXYNOSAUTOV9", 0xAAA80000 },
 	{ "EXYNOSAUTOV920", 0x0A920000 },
+	/* Compatible with: google,gs101-otp */
+	{ "GS101", 0x9845000 },
 };
 
 static const char *product_id_to_soc_id(unsigned int product_id)
@@ -92,18 +99,52 @@ static int exynos_chipid_get_chipid_info(struct regmap *regmap,
 		return ret;
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
 			return ret;
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
+	return devm_regmap_init_mmio(&pdev->dev, base, &reg_config);
+}
+
 static int exynos_chipid_probe(struct platform_device *pdev)
 {
 	const struct exynos_chipid_variant *drv_data;
@@ -119,9 +160,23 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 	if (!drv_data)
 		return -EINVAL;
 
-	regmap = device_node_to_regmap(dev->of_node);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
+	if (drv_data->efuse) {
+		struct clk *clk;
+
+		regmap = exynos_chipid_get_efuse_regmap(pdev);
+		if (IS_ERR(regmap))
+			return dev_err_probe(dev, PTR_ERR(regmap),
+					     "failed to get efuse regmap\n");
+
+		clk = devm_clk_get_enabled(dev, NULL);
+		if (IS_ERR(clk))
+			return dev_err_probe(dev, PTR_ERR(clk),
+					     "failed to get clock\n");
+	} else {
+		regmap = device_node_to_regmap(dev->of_node);
+		if (IS_ERR(regmap))
+			return PTR_ERR(regmap);
+	}
 
 	ret = exynos_chipid_get_chipid_info(regmap, drv_data, &soc_info);
 	if (ret < 0)
@@ -177,19 +232,28 @@ static void exynos_chipid_remove(struct platform_device *pdev)
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
2.52.0.rc1.455.g30608eb744-goog

