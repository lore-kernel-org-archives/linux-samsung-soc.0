Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B28B31197D
	for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Aug 2025 11:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755603959; cv=none; b=kGxb6OTbKAgL3YZXDE6SPxgbCXju+2cFCg91aOB//jLr+2TFY3rTbhrhOIY2g9jejnIpfu7ujmAqVBOe6RNGKiv7fHJmUqOfXtR9Notjl5Gqesztmakv+/2Qa6t5GEKm0AJyfCV/v5FeZFlVOvHfQZOqEFRLRscuQuwlH8fim9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755603959; c=relaxed/simple;
	bh=8q8yoH0OH0fUK6u5BVFDQi4Ifhan8hzBsvGgsfXDGMU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SRWtBv22U1nTISESado/QPOVvj0vIfU3ukfEyFvalb3MiH+LQ9HoEjDMXaF5Z7mA6g01ESUmaBQHkXbhIEcv+rvyxzmDrdeQnA08i3QVW1OtNNr6VjJyEKaW1vXs5wrXIBIuYUTgwQ2ZSAPB6W8f8jU/ZzxDZCOQOrWCmQbB4XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SeRhq6hD; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SeRhq6hD"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b9edf0e4efso3544295f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Aug 2025 04:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755603956; x=1756208756; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5BohF4EtiUuYNnWKjjEQo5YJp9OK645hWvc5QEpxWs4=;
        b=SeRhq6hD7E2tTZIYzwMLUV2V1MA/pCRLEubtcBvigZ49wOyS4cBFyx9Ro1Er8UjSxs
         /M5MorfDMxWiUBeK5jzbU5/Nm+Fg57pbGBvYDqPJjpQrrbpBHtsZ8fo5pWSDWXuQcAop
         e52IvjJFMp6veNMjdkj0nDj/TKN2DZLM6D6wgF2CwA58IJVt3xFGHy7aDIZCsjzBo+CF
         rhWJIsfn3QgZeLPsOho46ASJWEXV69G12xgIzm3P+ryXxKfDKZF8H3ERg/WHDJ1yn9tN
         rSDY8wBxO4x471zfg5KHwoTfRY0ExoAfgCAne/ykFvbE02kGsBYGzRov5wxelKKPL74l
         Esfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755603956; x=1756208756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5BohF4EtiUuYNnWKjjEQo5YJp9OK645hWvc5QEpxWs4=;
        b=m9KhcW2n/OP4LxlRDBai7Lr+L9l1CSEToc3wiLqeQP6PA+A7tlwaYDDs+mcNqimxFh
         ACnVgsdm9qhz4E8TCgu6G6pjjWHE3dAAgvfoIMrg225I91APWSFr/+L81wMzhRN3sRpm
         j/0Z85yW4cwNMgufQVq6YlwHnBMw0dMNASzLGOufYDUCk0tPnxO1wJ/FbtSVixYb8/5B
         W+T4WZSRUErwPLkqszuhsLok0/LZr3Z18tWtxQFNR0UGEZCzLwrP+7wvJJzP6OA+07x5
         cj62lHwrxlEPB8GLe+f8caxX1Kp+Rszl0LDGXz9Bp7d6O9z8WTdXpynrAUChaYJ/rgtX
         jl/A==
X-Forwarded-Encrypted: i=1; AJvYcCWv8Td8SdUinw4H5Wk9l9JRL+HL/re4Ei3h6CX+URDKgfzcKh7H81UUJbmoGdxdw/svaVdjWYWeOLBh98vYwcNoNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzEXZlkrG/jR97DBWaxhLvly225Oa27zYSM7fU83OAjrhDW3Yt
	YdyPQnCZYfqxb4IOhIBT6eYZLjOTse8IN2lJQgRdpwBRfZpDJcK57+3/pGPlReGgXCU=
X-Gm-Gg: ASbGncudvPas1DDih9VqQD0N2gsvPwIG3Qom33WssdSDZ9jzoFXYyuR7Z5jWb7zZ/hi
	k5uq84JSaAnX/jcbi/rlA9zmfVciQHPoBwSNFDKP+/NZSXJrxIvekU+GTgvHYUhBiUnRBZ4abcZ
	CvG4HKiOtMOwWur7NlLn/faCoOeO//c+R+fNqeS2EPi7jTH1f7IxlUj0Xb1rAKMHC2DAUXR9Myu
	B2N/uAT0wT18qfZNb0V7GEckvcCLF9So98XxUDBdcOzfcWKQt6vbB4tBS3U6WPau0jTrE2AuC4w
	CLEi1Cz4/DIZGXMKC55JmmWQg9gEuYsNDHweAOWfCvTX5hY5QF/1Q8oICXKvP7qP8htX/qBPaWn
	63YaWkJif3zUNTUnjhPbREWFFl7UZoaNvXF+PxkvYXbsPjiwCtsw6MG0SPFRy7Vtj2EWtaGjb/0
	lNwmHH64PHILkY
X-Google-Smtp-Source: AGHT+IHiPrZjgMCEzLKrHz6FpbpVq1VUkxFTXmy6o02XM5DHXgqXcijADKLMgzV7WnkvIgeHncjraQ==
X-Received: by 2002:a05:6000:2004:b0:3a5:2d42:aa25 with SMTP id ffacd0b85a97d-3c0ed1f348bmr1564826f8f.50.1755603955683;
        Tue, 19 Aug 2025 04:45:55 -0700 (PDT)
Received: from ta2.c.googlers.com (245.92.187.35.bc.googleusercontent.com. [35.187.92.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077788df7sm3430817f8f.48.2025.08.19.04.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:45:55 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 19 Aug 2025 11:45:38 +0000
Subject: [PATCH 3/3] clk: samsung: add Exynos ACPM clock driver
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-acpm-clk-v1-3-6bbd97474671@linaro.org>
References: <20250819-acpm-clk-v1-0-6bbd97474671@linaro.org>
In-Reply-To: <20250819-acpm-clk-v1-0-6bbd97474671@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755603952; l=7617;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=8q8yoH0OH0fUK6u5BVFDQi4Ifhan8hzBsvGgsfXDGMU=;
 b=jxt0eQAwhd6DT9TsOur1oHjS9c7qn2o8JHVXwh1iXrKemD+TMGRIF/c1A3mQ6S8uUBRB/Gj+w
 JSq9nsCgOR8C9NcNGgFYfkyO5z5ydEhAoZC8DCIZ2Wuhdkgo3JIYJTs
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add the Exynos ACPM clock driver. It provides support for clocks that
are controlled by firmware that implements the ACPM interface.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/clk/samsung/Kconfig    |  10 +++
 drivers/clk/samsung/Makefile   |   1 +
 drivers/clk/samsung/clk-acpm.c | 192 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 203 insertions(+)

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
index 0000000000000000000000000000000000000000..e3e648331ad54072876f52a63b11fe259a0b9be2
--- /dev/null
+++ b/drivers/clk/samsung/clk-acpm.c
@@ -0,0 +1,192 @@
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
+#include <linux/platform_device.h>
+#include <linux/types.h>
+
+#include <dt-bindings/clock/google,gs101.h>
+
+struct acpm_clk {
+	u32 id;
+	struct clk_hw hw;
+	unsigned int acpm_chan_id;
+	const struct acpm_handle *handle;
+};
+
+#define to_acpm_clk(clk) container_of(clk, struct acpm_clk, hw)
+
+struct acpm_clk_variant {
+	unsigned int id;
+	const char *name;
+};
+
+struct acpm_clk_match_data {
+	const struct acpm_clk_variant *clks;
+	unsigned int nr_clks;
+	unsigned int acpm_chan_id;
+};
+
+static unsigned long acpm_clk_recalc_rate(struct clk_hw *hw,
+					  unsigned long parent_rate)
+{
+	struct acpm_clk *clk = to_acpm_clk(hw);
+
+	return clk->handle->ops.dvfs_ops.get_rate(clk->handle,
+					clk->acpm_chan_id, clk->id, 0);
+}
+
+static long acpm_clk_round_rate(struct clk_hw *hw, unsigned long rate,
+				unsigned long *parent_rate)
+{
+	/*
+	 * We can't figure out what rate it will be, so just return the
+	 * rate back to the caller. acpm_clk_recalc_rate() will be called
+	 * after the rate is set and we'll know what rate the clock is
+	 * running at then.
+	 */
+	return rate;
+}
+
+static int acpm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
+			     unsigned long parent_rate)
+{
+	struct acpm_clk *clk = to_acpm_clk(hw);
+
+	return clk->handle->ops.dvfs_ops.set_rate(clk->handle,
+					clk->acpm_chan_id, clk->id, rate);
+}
+
+static const struct clk_ops acpm_clk_ops = {
+	.recalc_rate = acpm_clk_recalc_rate,
+	.round_rate = acpm_clk_round_rate,
+	.set_rate = acpm_clk_set_rate,
+};
+
+static int __init acpm_clk_ops_init(struct device *dev, struct acpm_clk *aclk,
+				    const char *name)
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
+static int __init acpm_clk_probe(struct platform_device *pdev)
+{
+	const struct acpm_clk_match_data *match_data;
+	const struct acpm_handle *acpm_handle;
+	struct clk_hw_onecell_data *clk_data;
+	struct clk_hw **hws;
+	struct device *dev = &pdev->dev;
+	struct acpm_clk *aclks;
+	unsigned int acpm_chan_id;
+	int i, err, count;
+
+	acpm_handle = devm_acpm_get_by_node(dev, dev->parent->of_node);
+	if (IS_ERR(acpm_handle))
+		return dev_err_probe(dev, PTR_ERR(acpm_handle),
+				     "Failed to get acpm handle.\n");
+
+	match_data = of_device_get_match_data(dev);
+	if (!match_data)
+		return dev_err_probe(dev, -EINVAL,
+				     "Failed to get match data.\n");
+
+	count = match_data->nr_clks;
+	acpm_chan_id = match_data->acpm_chan_id;
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
+		const struct acpm_clk_variant *variant = &match_data->clks[i];
+		struct acpm_clk *aclk = &aclks[i];
+
+		hws[i] = &aclk->hw;
+
+		aclk->id = variant->id;
+		aclk->handle = acpm_handle;
+		aclk->acpm_chan_id = acpm_chan_id;
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
+#define ACPM_CLK(_id, cname)					\
+	{							\
+		.id		= _id,				\
+		.name		= cname,			\
+	}
+
+static const struct acpm_clk_variant gs101_acpm_clks[] __initconst = {
+	ACPM_CLK(CLK_ACPM_DVFS_MIF, "mif"),
+	ACPM_CLK(CLK_ACPM_DVFS_INT, "int"),
+	ACPM_CLK(CLK_ACPM_DVFS_CPUCL0, "cpucl0"),
+	ACPM_CLK(CLK_ACPM_DVFS_CPUCL1, "cpucl1"),
+	ACPM_CLK(CLK_ACPM_DVFS_CPUCL2, "cpucl2"),
+	ACPM_CLK(CLK_ACPM_DVFS_G3D, "g3d"),
+	ACPM_CLK(CLK_ACPM_DVFS_G3DL2, "g3dl2"),
+	ACPM_CLK(CLK_ACPM_DVFS_TPU, "tpu"),
+	ACPM_CLK(CLK_ACPM_DVFS_INTCAM, "intcam"),
+	ACPM_CLK(CLK_ACPM_DVFS_TNR, "tnr"),
+	ACPM_CLK(CLK_ACPM_DVFS_CAM, "cam"),
+	ACPM_CLK(CLK_ACPM_DVFS_MFC, "mfc"),
+	ACPM_CLK(CLK_ACPM_DVFS_DISP, "disp"),
+	ACPM_CLK(CLK_ACPM_DVFS_BO, "b0"),
+};
+
+static const struct acpm_clk_match_data acpm_clk_gs101 __initconst = {
+	.clks = gs101_acpm_clks,
+	.nr_clks = ARRAY_SIZE(gs101_acpm_clks),
+	.acpm_chan_id = 0,
+};
+
+static const struct of_device_id acpm_clk_ids[] __initconst = {
+	{
+		.compatible = "google,gs101-acpm-dvfs-clocks",
+		.data =  &acpm_clk_gs101,
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(of, acpm_clk_ids);
+
+static struct platform_driver acpm_clk_driver __refdata = {
+	.driver	= {
+		.name = "acpm-clocks",
+		.of_match_table = acpm_clk_ids,
+	},
+	.probe = acpm_clk_probe,
+};
+module_platform_driver(acpm_clk_driver);
+
+MODULE_AUTHOR("Tudor Ambarus <tudor.ambarus@linaro.org>");
+MODULE_DESCRIPTION("Samsung Exynos ACPM clock driver");
+MODULE_LICENSE("GPL");

-- 
2.51.0.rc1.167.g924127e9c0-goog

