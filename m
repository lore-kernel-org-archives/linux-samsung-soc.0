Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F35A1DE891
	for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Dec 2024 09:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734428452; cv=none; b=G0daquDL6kdumYq+Cx16KUZ2IoSbswLbydH9UEgsbQy4VhkVBCmouwzho/Q7xW5uU9WhufgMZdiLnikZ26eSdPpLybm092UfHVMM8NWdvjcE8rothp+WV6dVzHtdwrjLzOP7aEAwpUEuromSEs/BCPCuP2zv50sphTLzgQ48mmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734428452; c=relaxed/simple;
	bh=ch9bLEDAwuuM6wIBFS8dUZsQMo2a87ncAz/QuVGegyA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FHfbj6Kz/ViOlKwfVzgA3RHBiVxDYf8XJsyhcGrl2O1DO7tY74iOk4dsafybleu9oaPlJbkZZwEropMotDLktaQ3LzXfSDi9Jp4usRUjJ2S3P2oadJlVw4o0VFYrK3ZmUgKRTS/ZBjQckdI4FtFRHLA5Ou2bJ+qJY/PhCROCVWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TV70rXLx; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TV70rXLx"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-436249df846so35191915e9.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Dec 2024 01:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734428448; x=1735033248; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6/Djx8gAdq+6Madviq7gLnC0w9gcqNrwEJGOMmsFz5k=;
        b=TV70rXLxoXI4OgqPIgHXwRC4ZGgK9DLlEj7xOYzuYvQyPfBQP/C45RszQPIJLpPN9f
         G2C/3ra/labXB1h8soDzcqv3q9Pyiq7hJZ6LA9NM1Zly5HTEA/N4eUernSDJtB5E4qpG
         NwpPMm2Sg+6BShr0zzg7U2JVC5JEd1FzE+5JPYWZQ2sHLc6GeVJH96LUpF+3sq+u4pZ9
         zWTrpDaUScln0ofJkadOAxzE97WFkRX1FqlAOsLEwbAS2sRFl09Ae8tDJiuNd0PyzfnD
         ZISdkdRmN2+WXaEettEUS9H8JzxrOlDqx9CFmPoE/vPpBb7BEYS13XzDNfhT4FvU+pK8
         bjug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734428448; x=1735033248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6/Djx8gAdq+6Madviq7gLnC0w9gcqNrwEJGOMmsFz5k=;
        b=BZ5k5aqzpAnwpNv8AOm7KvXbPaQMlXi8yj7wCVHChyyIe1VQXVHeYMhoz2oo19LY/W
         LvR+zPxdpV3ybh8hdMkUjhmdrUiSaHYL29TWrmT+LyZtotJ8imxUme/xHXjJV2+PTPZ1
         t1jZDQkR6SswJJF4UjPAq7zioTQag6FWLVfVG4MB/ajBF815bwgjWeTiU6OFs6zYe1D+
         WRqUMr3E/gwQtMVUAqcH4mTef99HbPBstB3EqqHpAfKLMD50gqU0wVK6eYr05QwCYez6
         LmqoB4r2+jl2aYOLyHt7AaGWwewoxBd1SmA3kBUV+cfuEtSmysORMaSSyLM6s4uG8wrY
         B9jw==
X-Forwarded-Encrypted: i=1; AJvYcCUD14PoAz+5RLaPhmE9vdOuvWtu22cKAvOZbI2aTUPAsYNKec6jxdGro+6nnxs73FaCEpewfETjZAMF20qAJQAMdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzI9c/kwi7oYOrrGWVy5AD7gvKQjzS5CMmL45K2OV7mCDRnPlse
	Fe4XMN2HCPnvItqS4ZNoje5S2T4fhiup/9GEbOvQ6L7b4Zl87P8256QhVxeXE5M=
X-Gm-Gg: ASbGncuglB44V/efzC2djKkmKG6zNdk+QbPVTe+59vlmppGQUExmyOARGwChHCVXJh+
	Q90haW277WXQFz6Vso9O4kApsQq5endngGpY0IkqhM6SFbCNjgeuVHMO4zUjFYCaokDOOxnYMRB
	qIsUuOa7STnX6eWr9oKzdImT18Hxu+gj+d0x3+8+Hh7f+zkW8iB4BVypYU/NhAtTR8y4hcqT0GQ
	8RI+yfqI0UA8URGSBLQvyEeYJf0pkRbwWl39wSQanAzC3o3b35B2KUa5VB0fh+1t+3zj5Eot4l9
	xxxsvZ4LxyPtDuuMZdTLb8kNrpYi4p+9PQ==
X-Google-Smtp-Source: AGHT+IG+k2qI5CN/3b8k5L/klKgTjAfvpmyras46GJtNglWrMmcnTcB9ds0ar2l+dqxP5ENqco2mOQ==
X-Received: by 2002:a05:600c:1e14:b0:434:f1d5:1453 with SMTP id 5b1f17b1804b1-4362a987b06mr149065085e9.0.1734428447704;
        Tue, 17 Dec 2024 01:40:47 -0800 (PST)
Received: from ta2.c.googlers.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4362559ec46sm167475755e9.20.2024.12.17.01.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 01:40:47 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 17 Dec 2024 09:40:21 +0000
Subject: [PATCH v5 2/3] mailbox: add Samsung Exynos driver
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-acpm-v4-upstream-mbox-v5-2-cd1d3951fe84@linaro.org>
References: <20241217-acpm-v4-upstream-mbox-v5-0-cd1d3951fe84@linaro.org>
In-Reply-To: <20241217-acpm-v4-upstream-mbox-v5-0-cd1d3951fe84@linaro.org>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 andre.draszik@linaro.org, peter.griffin@linaro.org, kernel-team@android.com, 
 willmcvicker@google.com, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734428445; l=7613;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=ch9bLEDAwuuM6wIBFS8dUZsQMo2a87ncAz/QuVGegyA=;
 b=HWP8gwFS9ptfi3AaIeb3AKQ+iprpG9u2wio+GD624E3JpOIVeTIIaXaABprepkLT1aF8Rh93H
 q2JPx5KG9vxCho8aFuENRfcLF0k2Zb0bFQT7EFy2timfM1nk31d5rbQ
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

The Samsung Exynos mailbox controller has 16 flag bits for hardware
interrupt generation and a shared register for passing mailbox messages.
When the controller is used by the ACPM protocol the shared register is
ignored and the mailbox controller acts as a doorbell. The controller
just raises the interrupt to APM after the ACPM protocol has written
the message to SRAM.

Add support for the Samsung Exynos mailbox controller.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mailbox/Kconfig          |  11 +++
 drivers/mailbox/Makefile         |   2 +
 drivers/mailbox/exynos-mailbox.c | 184 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 197 insertions(+)

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index 8ecba7fb999e..44b808c4d97f 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -36,6 +36,17 @@ config ARM_MHU_V3
 	  that provides different means of transports: supported extensions
 	  will be discovered and possibly managed at probe-time.
 
+config EXYNOS_MBOX
+	tristate "Exynos Mailbox"
+	depends on ARCH_EXYNOS || COMPILE_TEST
+	help
+	  Say Y here if you want to build the Samsung Exynos Mailbox controller
+	  driver. The controller has 16 flag bits for hardware interrupt
+	  generation and a shared register for passing mailbox messages.
+	  When the controller is used by the ACPM protocol the shared register
+	  is ignored and the mailbox controller acts as a doorbell that raises
+	  the interrupt to the ACPM firmware.
+
 config IMX_MBOX
 	tristate "i.MX Mailbox"
 	depends on ARCH_MXC || COMPILE_TEST
diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
index 5f4f5b0ce2cc..86192b5c7c32 100644
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@ -11,6 +11,8 @@ obj-$(CONFIG_ARM_MHU_V2)	+= arm_mhuv2.o
 
 obj-$(CONFIG_ARM_MHU_V3)	+= arm_mhuv3.o
 
+obj-$(CONFIG_EXYNOS_MBOX)	+= exynos-mailbox.o
+
 obj-$(CONFIG_IMX_MBOX)	+= imx-mailbox.o
 
 obj-$(CONFIG_ARMADA_37XX_RWTM_MBOX)	+= armada-37xx-rwtm-mailbox.o
diff --git a/drivers/mailbox/exynos-mailbox.c b/drivers/mailbox/exynos-mailbox.c
new file mode 100644
index 000000000000..9d875806d0f9
--- /dev/null
+++ b/drivers/mailbox/exynos-mailbox.c
@@ -0,0 +1,184 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2020 Samsung Electronics Co., Ltd.
+ * Copyright 2020 Google LLC.
+ * Copyright 2024 Linaro Ltd.
+ */
+
+#include <dt-bindings/mailbox/google,gs101.h>
+#include <linux/bitops.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/mailbox_controller.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#define EXYNOS_MBOX_MCUCTRL		0x0	/* Mailbox Control Register */
+#define EXYNOS_MBOX_INTCR0		0x24	/* Interrupt Clear Register 0 */
+#define EXYNOS_MBOX_INTMR0		0x28	/* Interrupt Mask Register 0 */
+#define EXYNOS_MBOX_INTSR0		0x2c	/* Interrupt Status Register 0 */
+#define EXYNOS_MBOX_INTMSR0		0x30	/* Interrupt Mask Status Register 0 */
+#define EXYNOS_MBOX_INTGR1		0x40	/* Interrupt Generation Register 1 */
+#define EXYNOS_MBOX_INTMR1		0x48	/* Interrupt Mask Register 1 */
+#define EXYNOS_MBOX_INTSR1		0x4c	/* Interrupt Status Register 1 */
+#define EXYNOS_MBOX_INTMSR1		0x50	/* Interrupt Mask Status Register 1 */
+
+#define EXYNOS_MBOX_INTMR0_MASK		GENMASK(15, 0)
+#define EXYNOS_MBOX_INTGR1_MASK		GENMASK(15, 0)
+
+#define EXYNOS_MBOX_CHAN_COUNT		HWEIGHT32(EXYNOS_MBOX_INTGR1_MASK)
+
+enum {
+	EXYNOS_MBOX_CELL_TYPE,
+	EXYNOS_MBOX_CELL_ID,
+	EXYNOS_MBOX_CELLS
+};
+
+#define EXYNOS_MBOX_CELL_TYPE_COUNT	2
+
+/**
+ * struct exynos_mbox - driver's private data.
+ * @regs:	mailbox registers base address.
+ * @mbox:	pointer to the mailbox controller.
+ * @dev:	pointer to the mailbox device.
+ * @pclk:	pointer to the mailbox peripheral clock.
+ */
+struct exynos_mbox {
+	void __iomem *regs;
+	struct mbox_controller *mbox;
+	struct device *dev;
+	struct clk *pclk;
+};
+
+static int exynos_mbox_chan_index(struct mbox_chan *chan)
+{
+	struct mbox_controller *mbox = chan->mbox;
+	int i;
+
+	for (i = 0; i < mbox->num_chans; i++)
+		if (chan == &mbox->chans[i])
+			return i;
+	return -EINVAL;
+}
+
+static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
+{
+	struct exynos_mbox *exynos_mbox = dev_get_drvdata(chan->mbox->dev);
+	int index;
+
+	index = exynos_mbox_chan_index(chan);
+	if (index < 0)
+		return index;
+
+	writel(BIT(index), exynos_mbox->regs + EXYNOS_MBOX_INTGR1);
+
+	return 0;
+}
+
+static const struct mbox_chan_ops exynos_mbox_chan_ops = {
+	.send_data = exynos_mbox_send_data,
+};
+
+static struct mbox_chan *exynos_mbox_of_xlate(struct mbox_controller *mbox,
+					      const struct of_phandle_args *sp)
+{
+	u32 type, id;
+
+	if (sp->args_count != EXYNOS_MBOX_CELLS) {
+		dev_err(mbox->dev, "Invalid argument count %d\n",
+			sp->args_count);
+		return ERR_PTR(-EINVAL);
+	}
+
+	type = sp->args[EXYNOS_MBOX_CELL_TYPE];
+	if (type >= EXYNOS_MBOX_CELL_TYPE_COUNT) {
+		dev_err(mbox->dev, "Invalid channel type %d\n", type);
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (type == DATA) {
+		dev_err(mbox->dev, "DATA channel type [%d] not supported\n",
+			type);
+		return ERR_PTR(-EINVAL);
+	};
+
+	id = sp->args[EXYNOS_MBOX_CELL_ID];
+	if (id >= mbox->num_chans) {
+		dev_err(mbox->dev, "Invalid channel ID %d\n", id);
+		return ERR_PTR(-EINVAL);
+	}
+
+	return &mbox->chans[id];
+}
+
+static const struct of_device_id exynos_mbox_match[] = {
+	{ .compatible = "google,gs101-mbox" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, exynos_mbox_match);
+
+static int exynos_mbox_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct exynos_mbox *exynos_mbox;
+	struct mbox_controller *mbox;
+	struct mbox_chan *chans;
+	int i;
+
+	exynos_mbox = devm_kzalloc(dev, sizeof(*exynos_mbox), GFP_KERNEL);
+	if (!exynos_mbox)
+		return -ENOMEM;
+
+	mbox = devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
+	if (!mbox)
+		return -ENOMEM;
+
+	chans = devm_kcalloc(dev, EXYNOS_MBOX_CHAN_COUNT, sizeof(*chans),
+			     GFP_KERNEL);
+	if (!chans)
+		return -ENOMEM;
+
+	exynos_mbox->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(exynos_mbox->regs))
+		return PTR_ERR(exynos_mbox->regs);
+
+	exynos_mbox->pclk = devm_clk_get_enabled(dev, "pclk");
+	if (IS_ERR(exynos_mbox->pclk))
+		return dev_err_probe(dev, PTR_ERR(exynos_mbox->pclk),
+				     "Failed to enable clock.\n");
+
+	mbox->num_chans = EXYNOS_MBOX_CHAN_COUNT;
+	mbox->chans = chans;
+	mbox->dev = dev;
+	mbox->ops = &exynos_mbox_chan_ops;
+	mbox->of_xlate = exynos_mbox_of_xlate;
+
+	for (i = 0; i < EXYNOS_MBOX_CHAN_COUNT; i++)
+		chans[i].mbox = mbox;
+
+	exynos_mbox->dev = dev;
+	exynos_mbox->mbox = mbox;
+
+	platform_set_drvdata(pdev, exynos_mbox);
+
+	/* Mask out all interrupts. We support just polling channels for now. */
+	writel(EXYNOS_MBOX_INTMR0_MASK, exynos_mbox->regs + EXYNOS_MBOX_INTMR0);
+
+	return devm_mbox_controller_register(dev, mbox);
+}
+
+static struct platform_driver exynos_mbox_driver = {
+	.probe	= exynos_mbox_probe,
+	.driver	= {
+		.name = "exynos-acpm-mbox",
+		.of_match_table	= exynos_mbox_match,
+	},
+};
+module_platform_driver(exynos_mbox_driver);
+
+MODULE_AUTHOR("Tudor Ambarus <tudor.ambarus@linaro.org>");
+MODULE_DESCRIPTION("Samsung Exynos mailbox driver");
+MODULE_LICENSE("GPL");

-- 
2.47.1.613.gc27f4b7a9f-goog

