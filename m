Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F712F1FC4
	for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2025 11:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763638188; cv=none; b=eYbb8Ndx17+1iCkdlu3xPsee4W8s4FeTv9n71Z4VGaL6Z3cLkv1p42e+s22q6ih/ykmfynfILckrLKuDG6Xhya50cVKhKwLDZHqbNZLPJmMhvxUUXsiVbxNI/jyVERmuYETZE3gO3VcwdVKxTvdTGb6kMprS23Qvv6PPy9M1Xfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763638188; c=relaxed/simple;
	bh=Hx0Wk3GLsyUiGvEN/qp5B6nJmnx3EpkHuI8i+qqhClA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bAB/FHG5SAiy5Ktr4aY4wIywUz9b74W0o4M8xrLNDvyARbkW0fLRE8jC7XxSSCXtWY38ten+HwjYWYZLA8wTFMwisrDjUgPYno0r/z5OFFB3aYJN+S18FTc0eUGxD3WSYgscc9sQ+wk5nh2UMvlfgIjbQFFyeHJv9goHY52t2bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SOMoTk+L; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SOMoTk+L"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42bb288c219so696506f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2025 03:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763638184; x=1764242984; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xGjx4noM1tm5gVaifoDiY0Cc8fekcKfT3Xb17cdNq9w=;
        b=SOMoTk+LLXZ/LBOyJP11kx4f/F2h5Wo1jwbokgQUa8YulaGR6unZDH8QJlMNDXPjTu
         TpfuPO76F8eABjvJHUCWyp9N2fOOoTQXg2lK4HCes3UX/GAFIpE8Ucb88LxV99tXt30l
         tRLSkmWcSGaufXSqOv3jmCMbaUeOAlXhOT1Y3/LUL1pZpVAN9q9gPWADr/Pn7+cdaDO8
         Rqz4TfP0lmb/SW0hTwM1m7Ix6VWLlbZeF2g4XeLxxIEX/Zy+1yAWyDuo1EIF9IpD2T70
         UYUdLBvrita1IpRdUT+Fo/PFO99yBH7WsVYr2qTQV/NJ6y8Y3KNPEkEo7KIe2zqVWnLB
         +VXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763638184; x=1764242984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xGjx4noM1tm5gVaifoDiY0Cc8fekcKfT3Xb17cdNq9w=;
        b=hc0OS2Lokk9mPSN40Qw6JqLf2uD2EjBrqZUghLyHnScPI853tYDxFxmumgt5PwyDAG
         5OSHO3TaBbN2GUGcgk7arNv7Vez0tBftaMLZ8p71LwqyZ2kATLWoOeoxOMadQvP/UMvg
         yt5zaVymgxhFfy5pky6zQVQrH73bFxMubSIIDROqptNoBlfoiNyWlQwzYPVo4NE1fvjG
         jTh0vOwPaPzWlQXrzouUTRuY7XRz9oBlsrbLTdzXF/QTmI5I4cvuIK2ZeIU53Pv/h/H/
         GRMZilj7DwFBgJ+RCeGlVSVrb0aMXtVqRc3Hh4kVX6hYjIpneuJ6aEhbsxFtvEO0N+fh
         Gocg==
X-Forwarded-Encrypted: i=1; AJvYcCX6RgzJx9rbXEk9aX/+w+huOGSeKs3ns7CmW2JHh5m+dbARj9x26Y5lQtBF0iSG+6r14yciX+gt1csXia18/UjTBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyW8De4iVID5Nv3gMYRiIoEDRgBdUgq81uypgMP/lO1PaB84kTX
	X4SQs4Ah7wNmrHZx74V6S6KZtjyAKccxdUB8gvnrrR/LrETHg/plo1wRqalQHq9xIdA=
X-Gm-Gg: ASbGncvmG2N5S8yNowPcDUxAwaTG9xI3Ei0PlEQ/tfwtsABBlLe0OFzbhQ6Fv27i96A
	sGB4H+qKbm7Gx3P+A4TNZhrKhXEbmju2s0Zn28JQSTyvFsHkFv8ieZSfhFUKl5gyHcZ14Iw+BIX
	9qby/eJjS57+XcMh+yCCfNq4TvEtkxtsJaAClHQ4AWYAoVpfz87eF0Zz/XjFcBBVrvk5NrbOFca
	RlmILULPzvLG1HzpBgJ8ztld76ihspDG7ldAdNkPLn4UUgw/WsDipf4SaZ2u6owibPPAD5zkheu
	+X+QuGZSIMcHADW4fLBTmGq9t6Reoec0zQamiHn25RFykvS8S+f9VGJZmljkGBpGsLtBkqBRXBG
	saExtymdpLVM+xka7jtgboCCjYEglk2qcQYsaZFGM/lX9b9ZbU57GPgyi566nwoEyGlXhrHbDn4
	ebECmY9OoBAki8zhVscrICwMMiVqpCvvxY1fKhBjlQTPj5kQw47GzwydekKGeAz4lL5W0=
X-Google-Smtp-Source: AGHT+IHLwhppa11NSu0fg35jlo/DjGMaiLuTQ/yFrCLaSK5ubFNizQXGeSmz5gWNNC42PHU7x92MmA==
X-Received: by 2002:a05:6000:288a:b0:42b:3746:3b85 with SMTP id ffacd0b85a97d-42cb9a5c1c9mr2024241f8f.45.1763638184091;
        Thu, 20 Nov 2025 03:29:44 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f34fd1sm4961040f8f.11.2025.11.20.03.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 03:29:43 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 20 Nov 2025 11:29:39 +0000
Subject: [PATCH v3 5/6] soc: samsung: exynos-chipid: add google,gs101-otp
 support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-gs101-chipid-v3-5-1aeaa8b7fe35@linaro.org>
References: <20251120-gs101-chipid-v3-0-1aeaa8b7fe35@linaro.org>
In-Reply-To: <20251120-gs101-chipid-v3-0-1aeaa8b7fe35@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763638176; l=6167;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=Hx0Wk3GLsyUiGvEN/qp5B6nJmnx3EpkHuI8i+qqhClA=;
 b=tAcT5R8w819O9dIOPhFo9z2LAc7AhyX1zJ2nQpev2tr5239eUppOc+DfySeDBbmPZIRtuXl7y
 SGEQQBpFilmCBQ1nTDK/qRBO4HJ1oNoxhRljdDsF7IckRFf6T92p/M9
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
 drivers/soc/samsung/exynos-chipid.c | 87 ++++++++++++++++++++++++++++++++-----
 1 file changed, 75 insertions(+), 12 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 5c8660374269c87ec38ebca242918bd7b1d362e5..06eb6ef8740d3f58eda52c8e71cf40074d2deb1f 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -13,9 +13,11 @@
  */
 
 #include <linux/array_size.h>
+#include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/device/devres.h>
-#include <linux/errno.h>
+#include <linux/err.h>
+#include <linux/ioport.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -28,9 +30,11 @@
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
@@ -69,6 +73,8 @@ static const struct exynos_soc_id {
 	{ "EXYNOS990", 0xE9830000 },
 	{ "EXYNOSAUTOV9", 0xAAA80000 },
 	{ "EXYNOSAUTOV920", 0x0A920000 },
+	/* Compatible with: google,gs101-otp */
+	{ "GS101", 0x9845000 },
 };
 
 static const char *exynos_product_id_to_name(unsigned int product_id)
@@ -93,19 +99,53 @@ static int exynos_chipid_get_chipid_info(struct device *dev,
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
+	return devm_regmap_init_mmio(&pdev->dev, base, &reg_config);
+}
+
 static void exynos_chipid_unregister_soc(void *data)
 {
 	soc_device_unregister(data);
@@ -127,10 +167,24 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, -EINVAL,
 				     "failed to get match data\n");
 
-	regmap = device_node_to_regmap(dev->of_node);
-	if (IS_ERR(regmap))
-		return dev_err_probe(dev, PTR_ERR(regmap),
-				     "failed to get regmap\n");
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
+			return dev_err_probe(dev, PTR_ERR(regmap),
+					     "failed to get regmap\n");
+	}
 
 	ret = exynos_chipid_get_chipid_info(dev, regmap, drv_data, &soc_info);
 	if (ret < 0)
@@ -177,19 +231,28 @@ static int exynos_chipid_probe(struct platform_device *pdev)
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

