Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6896C2F3610
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 08:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762936159; cv=none; b=W+q4i5aRiMF/YCaoensdByq6t8vgqf+C3EDQ45HpLzI0FCewKTaf3e9pcNeVF3WQAtEA1CR5l+1NpIdDsavHCeJFA1L7aMXXO9vBO5iOIOq2uZyl350U500Sd3oorSb5ubKS7KKyW0AP1o0ns08ykgzdHIcXwKcFOuGNvoj/4ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762936159; c=relaxed/simple;
	bh=Li+VDDl2o0wwPBNrOIHV0RaUwWBjWYyE/9cxRiwy8Sw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NJsexwmC/MrZQT9HNyLR7tPXqzyrZ5Voyy/Dp0+Ar+ChO5Iw6P1tfaro44aPZ4zbkCy0l9dK8R9gicmclbd6PPifkqrKnNwbb9N41TRMM5NtvjsD9ogocprqrjsB72Y0eE40GGK+Q2XmxmgKRo1f5m2TsCDMvfQ44Q0CfRa9YrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B+xey5XN; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B+xey5XN"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-429c82bf86bso269669f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 00:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762936156; x=1763540956; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rt+jeQ1XRUj/xqkVOPKXqYs256K/htyDigTFKcqMrBg=;
        b=B+xey5XNwyCZleBmIIIQDwueZUOsvpEG/IXO52MABR40ZP8Ev5MgPPzjwzOQEft8b4
         /It0eLxaZmT8IqkLKVJzlSWFT6A5ZPnipsRcnzkXVztUJR6ddrT2FcKeqC5tg2HLUGtF
         PWmdrCBqb+V77uJdBez7YrunFU8JYF2b9oLgAkTJ53WEGvBGA/wjbj0eDuHJIH6hLO+I
         wLhoohsf4BRajooSL6n7eZvOOUdHBIkYH0AJHqGKd+brRGQcrT7yN1zLotkvhvTp4yHa
         lgB4OE+x+FSh6fql3ZIB75ixrTCujjv2qHys1Hcr5gBQ3/9CC7f5cnfJNuCIONSJSFp+
         OC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762936156; x=1763540956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rt+jeQ1XRUj/xqkVOPKXqYs256K/htyDigTFKcqMrBg=;
        b=PFYEw8ybhA0DOZklqe3FKoMr0Ft3wNm1d8eTp/igelVGDdG6/7DosR5iar6zz9qrG2
         qID0NYRxDESMv0Iyxx/VH29NeRRK3Ezb4vCKwLRFfwRouPPl19vgmE4oP+mDqsB45YWY
         weHFnT7VuyMhQDuS7YOZgBpw7OBc8ckLN10c/jGrcmi8bHSwnRROnoGiMeNz+MQh0bvX
         UoxtpnD8bWMfXxr4xL3a8VpwuKrlcKE1JqrcSOU8ikuMBG6Dk6C/fx02eEEF1XYjRF6Q
         H1sWu332IZzfrQ+clIY0rLDDk/vOVr0ExgcsfJTAway4mi6Clgf59no1NiNfyrbS6PDP
         1Bjw==
X-Forwarded-Encrypted: i=1; AJvYcCUrC6C3MMjtSSUCqhALb+djgSqTHJJRI0RM4VUWyxxSJPhUJvRUEGvIzT6XrjLZdTjNKJzuwzKee+LCXO04nXKgYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsE2aIe7ZmNp2nJ2G9BGTdW84OHRZN4rAczmLOiFupjkvuG7ni
	WniEoajIeHsDWznprG1WdyYoy1EIyrfzPa9MbnCBh/S7UfHtgeuO4JnScP4P90fGmD8=
X-Gm-Gg: ASbGncuItWZLtQbEk+fpoyofa2BvWPqEYvGGrz+us0XaRDzAEyah8aLpKURuvNDanLK
	8XPC2cB2CHgSTZsyKxsKkeQ+M28uqkZE8Cmjb486cM37JG1eFEOQlvljghOAnBo/55wzPPYU2wk
	pIuIbKcwyjwYVo4AlIaIXxdbqDEG0y9WlUg38iO9+Qsjvty7EV+3H/SMFBa0ikEI0T4EzrsUFdf
	Ofklkr0UN3bVmPfdjo7celQ1VB+IUgQGiJZx1DLimZqUotcPUE+K91QfPu800ZjfAiMMOz4QP3Z
	VUbm5k5KnEaAH92DqZ1fJPrgGVI4HzYN+XIH0OvhPQfAkghGaGBLSNRoD7iMzyXaFjSsaGsg/hb
	uWtu24y1q3NulPl0s9CsM7sRSFBaGqeo90iSfDTjhJydC514RJEqmyd7EHet2tgrU9z5Nwt3hVe
	mj13AQ3yoZm5oVse0ece2nCYJWkG6DH2zX9QqrUmNvbt6WushfqYkScOOr
X-Google-Smtp-Source: AGHT+IHGHnSfrrzELDfd7YF+hF/OHj22idkKXVhcMLjXsrVeGVwFD7eZctJMNZ+Ugf0VFaQBvE7Wwg==
X-Received: by 2002:a05:6000:2301:b0:429:d4e1:cbb5 with SMTP id ffacd0b85a97d-42b4bb8f0cemr1432783f8f.8.1762936155583;
        Wed, 12 Nov 2025 00:29:15 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac677ab75sm31571428f8f.35.2025.11.12.00.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 00:29:15 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 12 Nov 2025 08:29:06 +0000
Subject: [PATCH v2 2/5] nvmem: add Samsung Exynos OTP support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-gs101-otp-v2-2-bff2eb020c95@linaro.org>
References: <20251112-gs101-otp-v2-0-bff2eb020c95@linaro.org>
In-Reply-To: <20251112-gs101-otp-v2-0-bff2eb020c95@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: semen.protsenko@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762936153; l=6857;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=Li+VDDl2o0wwPBNrOIHV0RaUwWBjWYyE/9cxRiwy8Sw=;
 b=Ddba4WgE/pF9+yKfDxWBoS8iGMOCyRE6dcilKwkcgA/7aCGbrve9EJXLFHar0NWFf+ToGMfUP
 PiVbkgEiOVWBDLzdJYaXCyKetvYMfFzb1KkwBBesLc04vpaaAYAS61Y
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add initial support for the Samsung Exynos OTP controller. Read the
product and chip IDs from the OTP controller registers space and
register the SoC info to the SoC interface.

The driver can be extended to empower the controller become nvmem
provider. This is not in the scope of this patch because it seems the
OTP memory space is not yet used by any consumer, even downstream.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/nvmem/Kconfig      |  10 +++
 drivers/nvmem/Makefile     |   2 +
 drivers/nvmem/exynos-otp.c | 160 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 172 insertions(+)

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index e0d88d3199c11a3b71cc274b2114e9554ac486fc..aa8c14d4624b820a3685cdf14f2f32521a82db4a 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -84,6 +84,16 @@ config NVMEM_BRCM_NVRAM
 	  This driver provides support for Broadcom's NVRAM that can be accessed
 	  using I/O mapping.
 
+config NVMEM_EXYNOS_OTP
+	tristate "Samsung Exynos OTP support"
+	depends on ARCH_EXYNOS || COMPILE_TEST
+	help
+	  This driver provides support for the OTP controller found on some
+	  Samsung Exynos SoCs.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called nvmem-exynos-otp.
+
 config NVMEM_IMX_IIM
 	tristate "i.MX IC Identification Module support"
 	depends on ARCH_MXC || COMPILE_TEST
diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
index 70a4464dcb1e25cf9116280a32f4a0f4f9941a75..920a536fc359a5a7d8f3aabba6a712e85c277ee7 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -20,6 +20,8 @@ obj-$(CONFIG_NVMEM_BCM_OCOTP)		+= nvmem-bcm-ocotp.o
 nvmem-bcm-ocotp-y			:= bcm-ocotp.o
 obj-$(CONFIG_NVMEM_BRCM_NVRAM)		+= nvmem_brcm_nvram.o
 nvmem_brcm_nvram-y			:= brcm_nvram.o
+obj-$(CONFIG_NVMEM_EXYNOS_OTP)		+= nvmem-exynos-otp.o
+nvmem-exynos-otp-y			:= exynos-otp.o
 obj-$(CONFIG_NVMEM_IMX_IIM)		+= nvmem-imx-iim.o
 nvmem-imx-iim-y				:= imx-iim.o
 obj-$(CONFIG_NVMEM_IMX_OCOTP)		+= nvmem-imx-ocotp.o
diff --git a/drivers/nvmem/exynos-otp.c b/drivers/nvmem/exynos-otp.c
new file mode 100644
index 0000000000000000000000000000000000000000..5acdc6ef1f8e07ffb6d465b160659732f4ef5a22
--- /dev/null
+++ b/drivers/nvmem/exynos-otp.c
@@ -0,0 +1,160 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2025 Linaro Ltd.
+ *
+ * Samsung Exynos OTP driver.
+ */
+
+#include <linux/array_size.h>
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/device/devres.h>
+#include <linux/err.h>
+#include <linux/ioport.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/sys_soc.h>
+
+#define EXYNOS_OTP_PRODUCT_ID			0
+#define EXYNOS_OTP_PRODUCT_ID_MASK		GENMASK(31, 12)
+#define EXYNOS_OTP_PRODUCT_ID_MAIN_REV		GENMASK(3, 0)
+
+#define EXYNOS_OTP_CHIPID(i)			(0x4 + (i) * 4)
+#define EXYNOS_OTP_CHIPID3_SUB_REV		GENMASK(19, 16)
+
+#define EXYNOS_OTP_PRODUCT_ID_MAIN_REV_SHIFT	4
+
+struct exynos_otp {
+	struct clk *pclk;
+	struct device *dev;
+	struct regmap *regmap;
+};
+
+static const struct exynos_otp_soc_id {
+	const char *name;
+	u32 id;
+} eotp_soc_ids[] = {
+	{ "GS101", 0x9845 },
+};
+
+static const char *exynos_otp_xlate_soc_name(u32 id)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(eotp_soc_ids); i++)
+		if (id == eotp_soc_ids[i].id)
+			return eotp_soc_ids[i].name;
+	return NULL;
+}
+
+static void exynos_otp_unregister_soc(void *data)
+{
+	soc_device_unregister(data);
+}
+
+static int exynos_otp_soc_device_register(struct exynos_otp *eotp)
+{
+	struct soc_device_attribute *soc_dev_attr;
+	struct regmap *regmap = eotp->regmap;
+	struct device *dev = eotp->dev;
+	struct soc_device *soc_dev;
+	u32 val, main_rev, sub_rev;
+	u32 product_id, revision;
+	int ret;
+
+	soc_dev_attr = devm_kzalloc(dev, sizeof(*soc_dev_attr), GFP_KERNEL);
+	if (!soc_dev_attr)
+		return -ENOMEM;
+
+	ret = regmap_read(regmap, EXYNOS_OTP_PRODUCT_ID, &val);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to read product id\n");
+
+	product_id = FIELD_GET(EXYNOS_OTP_PRODUCT_ID_MASK, val);
+	main_rev = FIELD_GET(EXYNOS_OTP_PRODUCT_ID_MAIN_REV, val);
+
+	ret = regmap_read(regmap, EXYNOS_OTP_CHIPID(3), &val);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to read chip id\n");
+
+	sub_rev = FIELD_GET(EXYNOS_OTP_CHIPID3_SUB_REV, val);
+	revision = main_rev << EXYNOS_OTP_PRODUCT_ID_MAIN_REV_SHIFT | sub_rev;
+
+	soc_dev_attr->family = "Samsung Exynos";
+	soc_dev_attr->soc_id = exynos_otp_xlate_soc_name(product_id);
+	if (!soc_dev_attr->soc_id)
+		return dev_err_probe(dev, -ENODEV, "failed to translate chip id to name\n");
+
+	soc_dev_attr->revision = devm_kasprintf(dev, GFP_KERNEL, "%x",
+						revision);
+	if (!soc_dev_attr->revision)
+		return -ENOMEM;
+
+	soc_dev = soc_device_register(soc_dev_attr);
+	if (IS_ERR(soc_dev))
+		return dev_err_probe(dev, PTR_ERR(soc_dev),
+				     "failed to register to the SoC interface\n");
+
+	ret = devm_add_action_or_reset(dev, exynos_otp_unregister_soc, soc_dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add devm action\n");
+
+	return 0;
+}
+
+static int exynos_otp_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct exynos_otp *eotp;
+	struct resource *res;
+	void __iomem *base;
+
+	eotp = devm_kzalloc(dev, sizeof(*eotp), GFP_KERNEL);
+	if (!eotp)
+		return -ENOMEM;
+
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	const struct regmap_config reg_config = {
+		.reg_bits = 32,
+		.reg_stride = 4,
+		.val_bits = 32,
+		.use_relaxed_mmio = true,
+		.max_register = (resource_size(res) - reg_config.reg_stride),
+	};
+
+	eotp->regmap = devm_regmap_init_mmio(dev, base, &reg_config);
+	if (IS_ERR(eotp->regmap))
+		return PTR_ERR(eotp->regmap);
+
+	eotp->pclk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(eotp->pclk))
+		return dev_err_probe(dev, PTR_ERR(eotp->pclk), "failed to get clock\n");
+
+	eotp->dev = dev;
+
+	return exynos_otp_soc_device_register(eotp);
+}
+
+static const struct of_device_id exynos_otp_dt_ids[] = {
+	{ .compatible = "google,gs101-otp" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, exynos_otp_dt_ids);
+
+static struct platform_driver exynos_otp_driver = {
+	.probe	= exynos_otp_probe,
+	.driver = {
+		.name	= "exynos-otp",
+		.of_match_table = exynos_otp_dt_ids,
+	},
+};
+module_platform_driver(exynos_otp_driver);
+
+MODULE_AUTHOR("Tudor Ambarus <tudor.ambarus@linaro.org>");
+MODULE_DESCRIPTION("Samsung Exynos OTP driver");
+MODULE_LICENSE("GPL");

-- 
2.51.2.1041.gc1ab5b90ca-goog

