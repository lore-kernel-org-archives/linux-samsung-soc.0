Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635E234DCD8
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Aug 2025 12:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756298543; cv=none; b=bg9OVTfa3WTWtPPz8qUsbBv/3FVEc/IqH4bzA7CTBHt0XQo9VfSMmZ/5pqvBqO89TuYnCpA8V/fZFlNQRPOAXBHLHD3NmuAEOKtb6TSJherxXDIgifs5RYXNm8EY4sqyw0awBOSMcbTq5pEpd1u+dQwC8un7xj1z9jahjIshsCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756298543; c=relaxed/simple;
	bh=CjPSf0JcvfE5W5RPnVdJxx5tBeiX99q+c7xebVDWfmk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y/VC4vqN6H+LJ5ZJ0gqEpL42FkYYiRRytlNG+3NWH+YIJGmiBfyetAQ6MiLtBfqc3JOHY+2/Wc2yjEdIUvMC+Ot8Wv6NRvfEiXM+D49Ci31ddUKfOFuL0fwBcTpHsl8t1hoSvkVCmqKjxCUw+iPx5UmXlLSi/spKHY1vQEjw8bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KMwXVqky; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KMwXVqky"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3c8fe6bd038so1701881f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Aug 2025 05:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756298538; x=1756903338; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/NP62jCtJT+dUkA0JE4QBmFqmyFOUOJehxqUTC1++vw=;
        b=KMwXVqkyfxzEYc3PrH4z3xpUTknu3WTaS5dQLz3axUEokMVV+qdNijpchAk7GBjffE
         6b1kXb8G3M29DsrXGixl5FsVhBzxhTBvg3EVJ7iOBPtSc7Q6TLMapXASpo3s3uZ/YWG2
         uDQBIsOiwsnpB2mUjS5PeXUZ+8Ji9mroEGMG/auBlb8wHaYdCLO9tfRCxTt/KCHYLacr
         EuPa/hRBosQEI+FKZWWNlr/m89rpQK20vIjimgF8hHySg/J/fHcg7Lr3d7VIHqT0a1OE
         qf8kbbh5fuAUJQnwHt717EUI4BB/Z0sXd1ToYYsPr32OmmoTi/nUcPZegHgSoNwHxW94
         /1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756298538; x=1756903338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/NP62jCtJT+dUkA0JE4QBmFqmyFOUOJehxqUTC1++vw=;
        b=WbAiwVcU7Rbo37ko1zVY80WELzk/yUiTLx1hHGKV0v++Mz4GxvHS2rM6OXGqChxZsO
         YcO149Z0IqLNuYyqALl9Jzj/mLU/dBGeoviLyyGixWxt+JhZPPqdmRDUnyNp4YdhbmDb
         7oMtTGz8Kspb8MDpGTcPq4djZyHAiabevSHB3a+4oej1FAznkkM0ECNVBRtpABLHkD//
         JDQx4+QV5hEjzMm1E0wbsfth7zOi1MKl7bLDHqpaqOsS3v+6SRlPcYu/eHNWb+jK2oY/
         9Ys9XaEnzWvieDyuxCkxMce2MTcNF53MJeWqyo+EM2oGVMcF+kkgoqbtwpJ07VO8x9bs
         cmcw==
X-Forwarded-Encrypted: i=1; AJvYcCVYkPvt2OoWIrvFbe3n6Zkz8xSLC6MLUUYZ/FbbC+Y/NQKgMLcynVGLZC/avis84iQGxP8xJaEsR77AS9lNTD+2Ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkELd/OYT3gm0N7PeKc23qh96ufgq0kB0+mnmnTsnHI93JI1ri
	6UGigKifbxB+ZyeBvhGlshJN9SEwwmr+hQncmaeEXkbVcM6NgWKtAr/JYePFcDSEIwg=
X-Gm-Gg: ASbGncuKWNa5uOrX+VBg8U0B2C3YDT0XYyFJyQxHg8s4yWSuBNOuvj35fAEWzqiWxCy
	/LhTB1QCISuPrn4pnqdXXY4vSWGgHChGx7LqH+GIZTVn3+q7tSzWierZ172dVtWsaOuptJVCI92
	CTpoc5KotaK5O8+8wdyXKagQaa9/iTmnXTiL08B2kLWFh5ZR6Zph9oWMS4kZuqJm+m5khRddJ4M
	+RxHH0s2Y4do7UdUz03LSVq5R9OqOJEfKGVSa3m6btJxCNCTcNDqPMBnyFK0qZxO7vcSrj5WErj
	cjoe8PTD7UG+7eF6ZIKCHzMRTgCCHXy+mwPMxxJkQYlF8xx/Du0R7Z05XJuOTOr3oF5OM4GgFT4
	BW3Nk5T4axwgwHP+wqqkvz/uIqjtFes/ktmddcBV/Q1VE+eJk5IEjvRybW7RK7z/KkhotvWtF62
	fBLA==
X-Google-Smtp-Source: AGHT+IGCykOrz3Ls5FsENqVCJUHPX3kaNYmIuKO1r4y9r/6R/x/q73zW/EfEZWxqDVlpSEdJd3mILg==
X-Received: by 2002:a05:6000:2411:b0:3c7:c594:232a with SMTP id ffacd0b85a97d-3c7c59427c6mr10897000f8f.19.1756298538239;
        Wed, 27 Aug 2025 05:42:18 -0700 (PDT)
Received: from ta2.c.googlers.com (219.43.233.35.bc.googleusercontent.com. [35.233.43.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cbab3ead0dsm6439420f8f.29.2025.08.27.05.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 05:42:17 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 27 Aug 2025 12:42:13 +0000
Subject: [PATCH v2 3/5] clk: samsung: add Exynos ACPM clock driver
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-acpm-clk-v2-3-de5c86b49b64@linaro.org>
References: <20250827-acpm-clk-v2-0-de5c86b49b64@linaro.org>
In-Reply-To: <20250827-acpm-clk-v2-0-de5c86b49b64@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756298535; l=7253;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=CjPSf0JcvfE5W5RPnVdJxx5tBeiX99q+c7xebVDWfmk=;
 b=0Ba+Ymd/OUWS8Zi93fBaCsEVXNgbYq78bO0mwgK4kg9TlZDI6WFDwGs7+rI9Z0K4sI8CHUorN
 CG+HjumlfJhDktCvJuIyjJ+H2cH4OiKHmSeTNLKVoB3TA8dHZBqJ7ab
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add the Exynos ACPM clock driver. It provides support for clocks that
are controlled by firmware that implements the ACPM interface.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/clk/samsung/Kconfig            |  10 +++
 drivers/clk/samsung/Makefile           |   1 +
 drivers/clk/samsung/clk-acpm.c         | 148 +++++++++++++++++++++++++++++++++
 include/linux/platform_data/clk-acpm.h |  24 ++++++
 4 files changed, 183 insertions(+)

diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
index 76a494e95027af26272e30876a87ac293bd56dfa..fe05212d7dd882adde9cd5c656cd0d58d501c42f 100644
--- a/drivers/clk/samsung/Kconfig
+++ b/drivers/clk/samsung/Kconfig
@@ -95,6 +95,16 @@ config EXYNOS_CLKOUT
 	  status of the certains clocks from SoC, but it could also be tied to
 	  other devices as an input clock.
 
+config EXYNOS_ACPM_CLK
+	tristate "Clock driver controlled via ACPM interface"
+	depends on EXYNOS_ACPM_PROTOCOL || COMPILE_TEST
+	help
+	  This driver provides support for clocks that are controlled by
+	  firmware that implements the ACPM interface.
+
+	  This driver uses the ACPM interface to interact with the firmware
+	  providing all the clock controlls.
+
 config TESLA_FSD_COMMON_CLK
 	bool "Tesla FSD clock controller support" if COMPILE_TEST
 	depends on COMMON_CLK_SAMSUNG
diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
index b77fe288e4bb484c68d1ff497acc0b83d132ea03..04b63436b12f6f5169575d74f54b105e97bbb052 100644
--- a/drivers/clk/samsung/Makefile
+++ b/drivers/clk/samsung/Makefile
@@ -27,6 +27,7 @@ obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos990.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynosautov9.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynosautov920.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-gs101.o
+obj-$(CONFIG_EXYNOS_ACPM_CLK)		+= clk-acpm.o
 obj-$(CONFIG_S3C64XX_COMMON_CLK)	+= clk-s3c64xx.o
 obj-$(CONFIG_S5PV210_COMMON_CLK)	+= clk-s5pv210.o clk-s5pv210-audss.o
 obj-$(CONFIG_TESLA_FSD_COMMON_CLK)	+= clk-fsd.o
diff --git a/drivers/clk/samsung/clk-acpm.c b/drivers/clk/samsung/clk-acpm.c
new file mode 100644
index 0000000000000000000000000000000000000000..e0db63ba1e07efdae53e340bc24c3576b2a5fd04
--- /dev/null
+++ b/drivers/clk/samsung/clk-acpm.c
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Samsung Exynos ACPM protocol based clock driver.
+ *
+ * Copyright 2025 Linaro Ltd.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/firmware/samsung/exynos-acpm-protocol.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_data/clk-acpm.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+
+struct acpm_clk {
+	u32 id;
+	struct clk_hw hw;
+	unsigned int mbox_chan_id;
+	const struct acpm_handle *handle;
+};
+
+#define to_acpm_clk(clk) container_of(clk, struct acpm_clk, hw)
+
+static unsigned long acpm_clk_recalc_rate(struct clk_hw *hw,
+					  unsigned long parent_rate)
+{
+	struct acpm_clk *clk = to_acpm_clk(hw);
+
+	return clk->handle->ops.dvfs_ops.get_rate(clk->handle,
+					clk->mbox_chan_id, clk->id, 0);
+}
+
+static int acpm_clk_determine_rate(struct clk_hw *hw,
+				   struct clk_rate_request *req)
+{
+	/*
+	 * We can't figure out what rate it will be, so just return the
+	 * rate back to the caller. acpm_clk_recalc_rate() will be called
+	 * after the rate is set and we'll know what rate the clock is
+	 * running at then.
+	 */
+	return 0;
+}
+
+static int acpm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
+			     unsigned long parent_rate)
+{
+	struct acpm_clk *clk = to_acpm_clk(hw);
+
+	return clk->handle->ops.dvfs_ops.set_rate(clk->handle,
+					clk->mbox_chan_id, clk->id, rate);
+}
+
+static const struct clk_ops acpm_clk_ops = {
+	.recalc_rate = acpm_clk_recalc_rate,
+	.determine_rate = acpm_clk_determine_rate,
+	.set_rate = acpm_clk_set_rate,
+};
+
+static int acpm_clk_ops_init(struct device *dev, struct acpm_clk *aclk,
+			     const char *name)
+{
+	struct clk_init_data init = {};
+
+	init.name = name;
+	init.ops = &acpm_clk_ops;
+	aclk->hw.init = &init;
+
+	return devm_clk_hw_register(dev, &aclk->hw);
+}
+
+static int acpm_clk_probe(struct platform_device *pdev)
+{
+	const struct acpm_clk_platform_data *pdata;
+	const struct acpm_handle *acpm_handle;
+	struct clk_hw_onecell_data *clk_data;
+	struct clk_hw **hws;
+	struct device *dev = &pdev->dev;
+	struct acpm_clk *aclks;
+	unsigned int mbox_chan_id;
+	int i, err, count;
+
+	pdata = dev_get_platdata(&pdev->dev);
+	if (!pdata)
+		return dev_err_probe(dev, -EINVAL,
+				     "Failed to get platform data.\n");
+
+	acpm_handle = devm_acpm_get_by_node(dev, dev->parent->of_node);
+	if (IS_ERR(acpm_handle))
+		return dev_err_probe(dev, PTR_ERR(acpm_handle),
+				     "Failed to get acpm handle.\n");
+
+	count = pdata->nr_clks;
+	mbox_chan_id = pdata->mbox_chan_id;
+
+	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, count),
+				GFP_KERNEL);
+	if (!clk_data)
+		return -ENOMEM;
+
+	clk_data->num = count;
+	hws = clk_data->hws;
+
+	aclks = devm_kcalloc(dev, count, sizeof(*aclks), GFP_KERNEL);
+	if (!aclks)
+		return -ENOMEM;
+
+	for (i = 0; i < count; i++) {
+		const struct acpm_clk_variant *variant = &pdata->clks[i];
+		unsigned int id = variant->id;
+		struct acpm_clk *aclk;
+
+		if (id >= count)
+			return dev_err_probe(dev, -EINVAL,
+					     "Invalid ACPM clock ID.\n");
+
+		aclk = &aclks[id];
+		aclk->id = id;
+		aclk->handle = acpm_handle;
+		aclk->mbox_chan_id = mbox_chan_id;
+
+		hws[id] = &aclk->hw;
+
+		err = acpm_clk_ops_init(dev, aclk, variant->name);
+		if (err)
+			return dev_err_probe(dev, err,
+					     "Failed to register clock.\n");
+	}
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
+					   clk_data);
+}
+
+static struct platform_driver acpm_clk_driver = {
+	.driver	= {
+		.name = "acpm-clocks",
+	},
+	.probe = acpm_clk_probe,
+};
+module_platform_driver(acpm_clk_driver);
+
+MODULE_ALIAS("platform:acpm-clocks");
+MODULE_AUTHOR("Tudor Ambarus <tudor.ambarus@linaro.org>");
+MODULE_DESCRIPTION("Samsung Exynos ACPM clock driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/platform_data/clk-acpm.h b/include/linux/platform_data/clk-acpm.h
new file mode 100644
index 0000000000000000000000000000000000000000..8327435fbb603472346b14b81160ffe98a79486b
--- /dev/null
+++ b/include/linux/platform_data/clk-acpm.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Samsung Exynos Alive Clock and Power Manager (ACPM) clock driver.
+ *
+ * Copyright 2025 Linaro Ltd.
+ */
+
+#ifndef __LINUX_PLATFORM_DATA_CLK_ACPM_H__
+#define __LINUX_PLATFORM_DATA_CLK_ACPM_H__
+
+#include <linux/types.h>
+
+struct acpm_clk_variant {
+	unsigned int id;
+	const char *name;
+};
+
+struct acpm_clk_platform_data {
+	const struct acpm_clk_variant *clks;
+	unsigned int nr_clks;
+	unsigned int mbox_chan_id;
+};
+
+#endif /* __LINUX_PLATFORM_DATA_CLK_ACPM_H__ */

-- 
2.51.0.261.g7ce5a0a67e-goog

