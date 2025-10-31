Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A84719ABC6
	for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Oct 2025 12:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761914723; cv=none; b=L30tslJOXU2Xa7VPW5CZfNcclI8zIU3BDOM8/Hq9+z1cYzhjOg8rmU4q5oJisTy69QwxPcQcnTm6xyBAMh4aQMP5H2mP8E8ZqdktrVQ7bgnJMQtRwEDeooRhG2tAl1QIN+meR14CIBJU7Pwy4LbqeK/YPLPFwb0UUO3OezwPovk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761914723; c=relaxed/simple;
	bh=w0yfdSTm6gp3caPgxHc/5REqzvFvqbJrg1PSnC6Rs4g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hr3aTYezoGU7Dh6i+S09yzAyjn/6OQxlhVEFS+y0/ge2K2wfCPEjqd4PQmH40Y04zZskayV5/unyu7nFPH9ci5q4g7N4wg0RuRBLZeIMK9gAyNpnidoCKIJwz+aq6+yk5s4AUEhTThKfgPdJttMbDFCZy/zpQNbJszAaEGSKbis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f2usZh1l; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f2usZh1l"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4711b95226dso27866985e9.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Oct 2025 05:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761914718; x=1762519518; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=660/GUyr8+xiyQEE/ln7pRyZWtVdpwNeVJPsoSzCzFA=;
        b=f2usZh1lmyVN0DQCO6OnKiKTqtM1YR3MrQN1JzWAsw87CxmVdMeKCTTWg+4flgbU3z
         DdIvidj6+mBLUHLZYBCqc2Sr3kkDZRueEexAO34yud0q0fYdDFzOet/4q2XLo6ttrh2P
         RpKfLwx0W1jaZjwubFBXoTolqJp0nHpsKK53BHqUIrozg15Wmc2z9jZnTbq4ieMWhFsR
         CV9PBX8DHjoEofULhOZ35vWT/UgxJidUuVCpWvNTDXiHumCbtmnBrEbq/WOr0FZAI0fd
         z3mXgfeApdpUVb0vdOULYxLSnA3KvzyaNFroGo5n87jFpoFQOm++Uzb6+X2j5QV8HAOR
         HGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761914718; x=1762519518;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=660/GUyr8+xiyQEE/ln7pRyZWtVdpwNeVJPsoSzCzFA=;
        b=ICtxFaLPi4ugte+WmCouHlqK8aVJ5JmG840Yj+R+DyAdfymnH2vl2FrgHS5yNM7Jft
         0BlqVCb8OLAr5sIOs5Y1NMeYW50BI8Av6+ioZ7hG81CUOFr6HaCoeqDlgrv8Eq7lZrB0
         /fbwWKYXAlMK+zCdz0JAFu+XpHv80tnw3e4PjZi5zpUBAR1yQ8IhAJWSF2/qOLbossY3
         XDlU2h2XSGY9qgdXWvaItjH/nOJr+reGMF5EBtEwnEtHUqqH8uc9RrdvsMBo7bP2E05h
         HJfvqJgvcRz3rfoHOocprfM61tPAkvuAx/i/h+0vcLjoQYLxGXyl/FSJNAS9X+omXGma
         0skg==
X-Forwarded-Encrypted: i=1; AJvYcCXt6l+rZO0YP2HImchjiZgxMxG5UcoBwntvwCrLbm2zTjCuZhtiDD/FU3Q/KrSaRsYKKPpVD+hFE2t/726AuhTWwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLRxxxStyzy1flbHds7gNfcqUdN5TcQlwiIIJ/ajSjMc4Ilh+t
	XtCmwO4drRg5OBIQGWz7MVmiUkeabVpaAu7lRrr+JRAhmETsH/wUbhmOr98Tx++/dpA=
X-Gm-Gg: ASbGncsiUxL5VXdBnVbwKsy/ZIMkTHtYF+RNOXR5AfDSNOvWLCTL+cyKn8QdVptMkJs
	PiK8tLzIK3gBTOVm0i6p8KAwzlTluycqK+lNNvi597RhmStFhKZKsvYS1XChd6By5a2uBya+T3e
	Izh1KPLTtLUJ8kihideoKec9JTIn8IAkZOZsgokXVcWygGJCazEtPgVulxv7zHUvCbpHAPuL89a
	gfX9JmO4iA0T5P3LI3a5vuhTON7gnWDEVp9S8BuOyVKmcv/GMkyeg4cCiudemVzO3XXYo5sp4sv
	78rGFaWEXHzNDTUdxESG/b1UQ2v2s7v2WHsFP5QUkADs5RIWJ7O6yOhuWSAURbhtdXItw0Lj99h
	0Rb7Jgh+vB+EuOo6uPkI+/AdCwNsHVsc8j6203YicZDHNnxAzIKwxPXP4fp3ftue3Ijk3W1uoRx
	h5IgaiXYolFv1kVwaQi+9tGpVVedCNQ394IoR87LHHQawEt4lhDjWAwR1ASmEDxSc=
X-Google-Smtp-Source: AGHT+IH0gyK0WWDUF75+dz03qe3+Zyttu7Zg0jZFhbcGhaDg57ZydmfAmUHKy/Cjxcmg2bJ8GmNwBw==
X-Received: by 2002:a05:600c:1f0e:b0:46e:4704:b01e with SMTP id 5b1f17b1804b1-477305a24bcmr36164165e9.8.1761914718273;
        Fri, 31 Oct 2025 05:45:18 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47732ff7fdbsm31077535e9.16.2025.10.31.05.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:45:17 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 31 Oct 2025 12:45:10 +0000
Subject: [PATCH 2/5] nvmem: add Samsung Exynos OTP support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-gs101-otp-v1-2-2a54f6c4e7b6@linaro.org>
References: <20251031-gs101-otp-v1-0-2a54f6c4e7b6@linaro.org>
In-Reply-To: <20251031-gs101-otp-v1-0-2a54f6c4e7b6@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761914716; l=5190;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=w0yfdSTm6gp3caPgxHc/5REqzvFvqbJrg1PSnC6Rs4g=;
 b=YcYEgJptfXhF94yOa4/Ab0f9sCdd4QntT5HeUNYAN73i4zFNGC6vPbnjwfZ9a76WL82ms///n
 VwtDhW+9XjTBzgLFrKzjVbzbdb/axrnQvjUKPYf9zol9IGWEShWS2Mz
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add support for the Samsung Exynos OTP controller. On the Google GS101
SoC, this controller provides 32 Kbit of OTP memory space that can be
read/program/lock using a specific sequence of register accesses.

The OTP controller register space is of interest as well because it
contains dedicated registers for the Product ID and the Chip ID (apart
other things like TMU or ASV info). Register the OTP controller
register space as a nvmem device so that other drivers can access its
contents using nvmem cells.

Support for the OTP memory space can follow and be modeled as a
dedicated nvmem device.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/nvmem/Kconfig      | 10 +++++
 drivers/nvmem/Makefile     |  2 +
 drivers/nvmem/exynos-otp.c | 98 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 110 insertions(+)

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index e0d88d3199c11a3b71cc274b2114e9554ac486fc..f973e009737f2fbdc8511e50f1aa9e6003286065 100644
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
+	  will be called exynos-otp.
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
index 0000000000000000000000000000000000000000..3bff9421e6f2b80a8f20533b490a289687d117e8
--- /dev/null
+++ b/drivers/nvmem/exynos-otp.c
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2025 Linaro Ltd.
+ *
+ * Samsung Exynos OTP driver.
+ */
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/ioport.h>
+#include <linux/module.h>
+#include <linux/nvmem-provider.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/mod_devicetable.h>
+
+struct exynos_otp {
+	struct clk *pclk;
+	struct regmap *regmap;
+};
+
+static int exynos_otp_read(void *context, unsigned int offset, void *val,
+			   size_t bytes)
+{
+	struct exynos_otp *eotp = context;
+
+	return regmap_bulk_read(eotp->regmap, offset, val, bytes / 4);
+}
+
+static struct nvmem_config exynos_otp_nvmem_config = {
+	.name = "exynos-otp-reg",
+	.add_legacy_fixed_of_cells = true,
+	.reg_read = exynos_otp_read,
+	.word_size = 4,
+	.stride = 4,
+};
+
+static int exynos_otp_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct nvmem_device *nvmem;
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
+		.val_bits = 32,
+		.reg_stride = 4,
+		.use_relaxed_mmio = true,
+		.max_register = (resource_size(res) - reg_config.reg_stride),
+	};
+
+	eotp->regmap = devm_regmap_init_mmio(dev, base, &reg_config);
+	if (IS_ERR(eotp->regmap))
+		return PTR_ERR(eotp->regmap);
+
+	eotp->pclk = devm_clk_get_enabled(dev, "pclk");
+	if (IS_ERR(eotp->pclk))
+		return dev_err_probe(dev, PTR_ERR(eotp->pclk),
+				     "Could not get pclk\n");
+
+	exynos_otp_nvmem_config.size = resource_size(res);
+	exynos_otp_nvmem_config.dev = dev;
+	exynos_otp_nvmem_config.priv = eotp;
+
+	nvmem = devm_nvmem_register(dev, &exynos_otp_nvmem_config);
+
+	return PTR_ERR_OR_ZERO(nvmem);
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
2.51.1.930.gacf6e81ea2-goog

