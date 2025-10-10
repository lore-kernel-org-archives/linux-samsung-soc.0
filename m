Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E5E2F1FCB
	for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Oct 2025 12:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760100412; cv=none; b=rKe9mlAiD+sY/bGS9O+CJPJzkgXQACVvMsyWDfzvHy+xlfadgbtnBwisnBxaWn37Pq6KtADNq2jrmEl3IRdiJtmiIk5qLstN9s5ASX95D20gWdihzxysNqI5HJ5On0e8NTzR+1bSfGFLF2Nz4PNEkUHzEw6uzXuILSKqEVEi/tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760100412; c=relaxed/simple;
	bh=WUOPaewEXUxz1AoJ6NXGQ9zCjuaJhlXKujpMsFiB5fI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ogYY96avVG5KEs1UbqG7rofEp2QNt1xzjV/6kmj4PSKaQfPAzMOrr90Pz3Htjq6suhuyK6oAHuUKxpnJnCRc0c3lJ6hmLyQZHgzI/1lLdPvhDQ7q898Mhw4T3xJRl1N/d9VUK+rYxCCEPFI7Cd9vbWwJD0Dkk4jXxjwbJ+bskbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wH5cq9Qr; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wH5cq9Qr"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-46e37d10f3eso15147115e9.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Oct 2025 05:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760100407; x=1760705207; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LAlEGGoIwwLS+tNt2iilinfrs+DKRYT+/rT/ksD4Tt4=;
        b=wH5cq9QrWs7r15VOlSbLBFIfdqVquh6HoI+h9nrerjGQClHwKTiCcVKIlu533yx6kD
         Do4SZYxLNlptSKn7ZQ7Ih0ECAZsFI7/ny25Hql5nhQtfOGqYGmEAvMJ7L007LplgqxW2
         4qyEvizTDufqK7DNUpQUe3Y8t/fqnBRZuLolnJEueIiuluaTKFep3imrw0+1Ys9sI+qG
         hHAsIY6XI+xz6gyHeOglnCIYLouYCUV36EBvKym3GEk6YJqUF70dZKcTrwpfmzprY+oK
         2evqiIy0VdffXUi//h8YifCVAawu9b/J6mDOmAu5yf6RXeTWADVlYyuhvSIM0YxQ8v9o
         6hxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760100407; x=1760705207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LAlEGGoIwwLS+tNt2iilinfrs+DKRYT+/rT/ksD4Tt4=;
        b=JT7ycgzA4LLNgN/7Ty4Ko6B/1mqr/ZgqbTUkfwKf1TALxzCSIKvSvqCRTDoUQwPU8j
         1vea1tN+F1mJ504rlb7ecr/kJmgZ8jQiGe3rrWhnx62D8m11kZByLMAGQHJV5TT7lZfC
         rzxTq4lxavLWOOK0uEiPL1mYdXFFvK8ajZOHHNctGZ4hIbb+MXAguF6VlaNTYI2y9XX2
         aZb5qT133/YQcKKh1XY2vUdzRxuIhJGsjgwrpAt5mL3NSFSBsLqG8ndpLk+aFRMy/Z13
         r3bxja008TQj+wlw+fTVbXQhyQtFJBeFCLpskXS6lOrSdSoQMgUT1ZxLnIZ5mRlF/N0m
         gLBA==
X-Forwarded-Encrypted: i=1; AJvYcCVY0oykOsi/BvJD2v4pD4JYWb4m5QIz+/smDQZ8sYWVhKlgH7z/toe7MXUuXFwTqenJtsV+ma89GLmx8oCLzGtI7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4EqWl/R4cifdgG5ZzXk5W3s2U35TReIbEZDmlmMvevTh8OVUt
	+KYfb5R4tswLyuyGSBhoyYg011l/pb6t8WtA35rOehbQSnACEjKHy5RwRMpYuOLvubI=
X-Gm-Gg: ASbGncvg6r6BDJoEOnkFqo8yBDzh9JOZ6xp5g1u0/UTM/cApWBL6Qo4L5Ozk+i05gOM
	mb7z3kEmngYzzs1QlWflWB0FwqDEJ5/okqxm2/FCEhiloouTuoQpaRAmHyjZ3/35fHvHqmLQRqY
	vUSm3U0p+F1bovGGPdqczWgBhVBH0JazXlcdEPWhij2jEg2Ovfdm5Hmt3lg/2qB4gz1LbOvdbFn
	QIzdOU0dNPVitevwbub0r0DlBk8EtyUwMmkHqIA5d+IEAClR73dxaIv/Eu5S3cSBujo+XVWYHV3
	C4oo9gKqb/DBBxKMYlhkXkqbzcFVcW6ZhsA2iQG//MxxsA19QgDX/iEiwbVSC9pVm+ULZZgekSl
	E3RXW8eu3CONHUNQQ4ntwsUB0vQroI5QSeJnBs0yhbzJzB+Tq8Gm32phjddFFuJ3CUfts7/D9hs
	AKSRHPEQ6exY50fg9yCO4nxA==
X-Google-Smtp-Source: AGHT+IGuI2G+Ae3XpP1MAn3JfPl3PWFrf8R525ep2U5Hm4R+0mx8g5Lnp7ZF1uVZR6Qd868Jax78JA==
X-Received: by 2002:a05:600c:8505:b0:46e:67c8:729f with SMTP id 5b1f17b1804b1-46fa9a9447cmr76851325e9.7.1760100407426;
        Fri, 10 Oct 2025 05:46:47 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb484d056sm46376895e9.9.2025.10.10.05.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 05:46:46 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 10 Oct 2025 12:46:34 +0000
Subject: [PATCH v6 4/6] clk: samsung: add Exynos ACPM clock driver
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-acpm-clk-v6-4-321ee8826fd4@linaro.org>
References: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
In-Reply-To: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760100401; l=7194;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=WUOPaewEXUxz1AoJ6NXGQ9zCjuaJhlXKujpMsFiB5fI=;
 b=BanjhtC7fgNjpy0sgYOx2hwH230uKAsCpatoQx+xvu1n80CRbIq0YU4T5O6Mx0kMVbVRBX0ub
 M8hXBqCff5zB8P8HnSUfWxh3XsBlLFCNADZbVT8yMkXZR+KKkPOOCRs
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add the Exynos ACPM clock driver. It provides support for clocks that
are controlled by firmware that implements the ACPM interface.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org> # on gs101-oriole
---
 drivers/clk/samsung/Kconfig    |  10 +++
 drivers/clk/samsung/Makefile   |   1 +
 drivers/clk/samsung/clk-acpm.c | 185 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 196 insertions(+)

diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
index 76a494e95027af26272e30876a87ac293bd56dfa..70a8b82a0136b4d0213d8ff95e029c52436e5c7f 100644
--- a/drivers/clk/samsung/Kconfig
+++ b/drivers/clk/samsung/Kconfig
@@ -95,6 +95,16 @@ config EXYNOS_CLKOUT
 	  status of the certains clocks from SoC, but it could also be tied to
 	  other devices as an input clock.
 
+config EXYNOS_ACPM_CLK
+	tristate "Clock driver controlled via ACPM interface"
+	depends on EXYNOS_ACPM_PROTOCOL || (COMPILE_TEST && !EXYNOS_ACPM_PROTOCOL)
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
index ef464f434740f96623f9df62f94e2903e14e2226..f3657f2e1b98c6f431ab1f04c2d2a44fe317261b 100644
--- a/drivers/clk/samsung/Makefile
+++ b/drivers/clk/samsung/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos990.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynosautov9.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynosautov920.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-gs101.o
+obj-$(CONFIG_EXYNOS_ACPM_CLK)		+= clk-acpm.o
 obj-$(CONFIG_S3C64XX_COMMON_CLK)	+= clk-s3c64xx.o
 obj-$(CONFIG_S5PV210_COMMON_CLK)	+= clk-s5pv210.o clk-s5pv210-audss.o
 obj-$(CONFIG_TESLA_FSD_COMMON_CLK)	+= clk-fsd.o
diff --git a/drivers/clk/samsung/clk-acpm.c b/drivers/clk/samsung/clk-acpm.c
new file mode 100644
index 0000000000000000000000000000000000000000..b90809ce3f882c489114c9d7299417d7fe373749
--- /dev/null
+++ b/drivers/clk/samsung/clk-acpm.c
@@ -0,0 +1,185 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Samsung Exynos ACPM protocol based clock driver.
+ *
+ * Copyright 2025 Linaro Ltd.
+ */
+
+#include <linux/array_size.h>
+#include <linux/clk-provider.h>
+#include <linux/container_of.h>
+#include <linux/device/devres.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/firmware/samsung/exynos-acpm-protocol.h>
+#include <linux/module.h>
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
+struct acpm_clk_variant {
+	const char *name;
+};
+
+struct acpm_clk_driver_data {
+	const struct acpm_clk_variant *clks;
+	unsigned int nr_clks;
+	unsigned int mbox_chan_id;
+};
+
+#define to_acpm_clk(clk) container_of(clk, struct acpm_clk, hw)
+
+#define ACPM_CLK(cname)					\
+	{						\
+		.name		= cname,		\
+	}
+
+static const struct acpm_clk_variant gs101_acpm_clks[] = {
+	ACPM_CLK("mif"),
+	ACPM_CLK("int"),
+	ACPM_CLK("cpucl0"),
+	ACPM_CLK("cpucl1"),
+	ACPM_CLK("cpucl2"),
+	ACPM_CLK("g3d"),
+	ACPM_CLK("g3dl2"),
+	ACPM_CLK("tpu"),
+	ACPM_CLK("intcam"),
+	ACPM_CLK("tnr"),
+	ACPM_CLK("cam"),
+	ACPM_CLK("mfc"),
+	ACPM_CLK("disp"),
+	ACPM_CLK("bo"),
+};
+
+static const struct acpm_clk_driver_data acpm_clk_gs101 = {
+	.clks = gs101_acpm_clks,
+	.nr_clks = ARRAY_SIZE(gs101_acpm_clks),
+	.mbox_chan_id = 0,
+};
+
+static unsigned long acpm_clk_recalc_rate(struct clk_hw *hw,
+					  unsigned long parent_rate)
+{
+	struct acpm_clk *clk = to_acpm_clk(hw);
+
+	return clk->handle->ops.dvfs_ops.get_rate(clk->handle,
+					clk->mbox_chan_id, clk->id);
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
+static int acpm_clk_register(struct device *dev, struct acpm_clk *aclk,
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
+	const struct acpm_handle *acpm_handle;
+	struct clk_hw_onecell_data *clk_data;
+	struct clk_hw **hws;
+	struct device *dev = &pdev->dev;
+	struct acpm_clk *aclks;
+	unsigned int mbox_chan_id;
+	int i, err, count;
+
+	acpm_handle = devm_acpm_get_by_node(dev, dev->parent->of_node);
+	if (IS_ERR(acpm_handle))
+		return dev_err_probe(dev, PTR_ERR(acpm_handle),
+				     "Failed to get acpm handle\n");
+
+	count = acpm_clk_gs101.nr_clks;
+	mbox_chan_id = acpm_clk_gs101.mbox_chan_id;
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
+		struct acpm_clk *aclk = &aclks[i];
+
+		/*
+		 * The code assumes the clock IDs start from zero,
+		 * are sequential and do not have gaps.
+		 */
+		aclk->id = i;
+		aclk->handle = acpm_handle;
+		aclk->mbox_chan_id = mbox_chan_id;
+
+		hws[i] = &aclk->hw;
+
+		err = acpm_clk_register(dev, aclk,
+					acpm_clk_gs101.clks[i].name);
+		if (err)
+			return dev_err_probe(dev, err,
+					     "Failed to register clock\n");
+	}
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
+					   clk_data);
+}
+
+static const struct platform_device_id acpm_clk_id[] = {
+	{ "gs101-acpm-clk" },
+	{}
+};
+MODULE_DEVICE_TABLE(platform, acpm_clk_id);
+
+static struct platform_driver acpm_clk_driver = {
+	.driver	= {
+		.name = "acpm-clocks",
+	},
+	.probe = acpm_clk_probe,
+	.id_table = acpm_clk_id,
+};
+module_platform_driver(acpm_clk_driver);
+
+MODULE_AUTHOR("Tudor Ambarus <tudor.ambarus@linaro.org>");
+MODULE_DESCRIPTION("Samsung Exynos ACPM clock driver");
+MODULE_LICENSE("GPL");

-- 
2.51.0.740.g6adb054d12-goog

