Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C055A22579A
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Dec 2024 17:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733420506; cv=none; b=CDEwc/6BEOI1i5tLmP7NRanx3R1ZdEUE3LM263U4SfXHm2p9yke7tdmqJx70DbeTPD5Jqtv9VeydangH8VHdfpLzTuDroCmL00uWvJ0jQRlzaK5s7nvZltw345qgr6QkWQxkeFzyEGc6GXGCeqZ28C2MlChpGa0coSrN4AGcPKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733420506; c=relaxed/simple;
	bh=BN8uQMRb85s772lE/MD9ObRCqzPRTvim4Eyu5bHJlkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JIiiBmaDmIfAVpBHaHlQAH8qsWmpaTYqKAO2PzyHjpTV9fDWj80LHb0TTQas45AJ536iiDedl/XzTu+wBxglxzqsPaBmDfVpi5gp4cUxtb/19K3wwAr1rjrEQgDJ4igdBuvyis8HFlRRNRakTMbXKquvyPd58vrPfgsCMuwjOd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eYmP5Ydo; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eYmP5Ydo"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43494a20379so12022395e9.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Dec 2024 09:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733420502; x=1734025302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wo6TX+bBHYFp5yEtuTvKYoGV7nlrucX5ZnLEJPkTV/E=;
        b=eYmP5YdownWMSJN5UzkdRAnTIUkv6OXxdZvA+E5yodMQPWNNEef854mJKmkHB4vdXl
         d9pfUlioKn6+uwELdcNg764EG5atUrErnfsAOwjY+pZuQ92u1Sg9y5d3q19smONLY4Az
         XHKderQ16BqgfcQyRT0+cP+UxCRbBNAj5MtMxgF6RKL3GYr7qj70qmwVuYwQl6NYiV10
         n7CVmIPipwneJa4cH97XjdbWHbn89CJj/4VpJq1i4wVKgnzlbr9yt5hOwTIX2AibfFCS
         lppKNsByJT/deeTPM6Ka/LylW2u/iK5hG3gT1K3YCYgvKmSJzZcd241F8yOlRwfe872d
         YvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733420502; x=1734025302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wo6TX+bBHYFp5yEtuTvKYoGV7nlrucX5ZnLEJPkTV/E=;
        b=bBVFu5jTJBPun0XU3u9Lg49HVVL/ax/BFzgAaMLyB/T7vzlITMfn8DF/vj0oApJI6P
         8F1ySkdB71o9q0pRr3WXMUjRY7Zriu8Q6vfP0hUjo0Ngmt04PodinVhQg/UkQR9ZjGUR
         oQ5MHYL57sAeJrKKEcvkvg/KH+fxrufXpfN+m69lEU8Bw8XbgucVjECSg37zMKe6pB9G
         fqPW5p91L4iV8Vr0v8foWuhWzCcTT29qbvyZ5EwVWLIA9yOOsE1JT1RwzbBML2q/tqp0
         U6N7Kt8jlb8sCOidpMz18zy3WmAhibaqNw06XJ8Im16CKl7heVDoGpWEx12rWUxgygg5
         hQmg==
X-Forwarded-Encrypted: i=1; AJvYcCXPUdf7z9m5W57ER73Y5Zz0lsyAwjl+50LaRDvN645gwf5wL2OTdq3vkYiXz86lk2JKzqw4eiUS9WXR8g4SPQSeUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMQFijp8t46LymHSX1SuJo2cXGmYUjMHIvn+svOxMMxt5SsU76
	1vX93ivhDWEK/JeOKjFFPK25+kYn+B7eRc/aYsRBulS3v2mbfkWT+SZwQVbOLis=
X-Gm-Gg: ASbGncv6imYFpUSoSKKnlUt74B4+yrsZbGbDzgQu+zj4xhb8wQg90xHm0Xwl9xfrgJZ
	UhlpCfuxP7Wu7gkaAJjE0L4Xx0dvS6iMySh2yD5ks4dap/hztAKzrDJ6VjOw5sxJ1vEVG3pF8pw
	NeGYZ/ndBhxE0PDThNjmQwU8D/Yu6eRi18BzYP2mXe96+AXmoRvOB8YKxyoh3kMXkN3g3GzckNS
	ttfW+dN8VkYS77c6hNsTu8+6zj9QDPl06Zoz46AxQz/s0OMd/xUQJTF6bR8Y3PBLuVNR6oNpVqa
	mp3mF6WV8yj/XXFr70O6oL7ZZMeUOJIE
X-Google-Smtp-Source: AGHT+IHb0o9dq8kY11HSiBExfA3eNeePmx2xXippa5MoXXeosok09IJCvD/BXrBGF6Agc4uVGD4lVQ==
X-Received: by 2002:a05:600c:358f:b0:42c:de2f:da27 with SMTP id 5b1f17b1804b1-434ddeadeeemr1546605e9.2.1733420502047;
        Thu, 05 Dec 2024 09:41:42 -0800 (PST)
Received: from ta2.c.googlers.com.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da0d6961sm30318525e9.12.2024.12.05.09.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 09:41:41 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: jassisinghbrar@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	peter.griffin@linaro.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 2/3] mailbox: add samsung exynos driver
Date: Thu,  5 Dec 2024 17:41:36 +0000
Message-ID: <20241205174137.190545-3-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241205174137.190545-1-tudor.ambarus@linaro.org>
References: <20241205174137.190545-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The samsung exynos mailbox controller has 16 flag bits for hardware
interrupt generation and a shared register for passing mailbox messages.
When the controller is used by the ACPM protocol the shared register is
ignored and the mailbox controller acts as a doorbell. The controller
just raises the interrupt to APM after the ACPM protocol has written
the message to SRAM.

Add support for the samsung exynos mailbox controller.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mailbox/Kconfig          |  11 +++
 drivers/mailbox/Makefile         |   2 +
 drivers/mailbox/exynos-mailbox.c | 143 +++++++++++++++++++++++++++++++
 3 files changed, 156 insertions(+)
 create mode 100644 drivers/mailbox/exynos-mailbox.c

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
index 000000000000..6d4e9b3106b2
--- /dev/null
+++ b/drivers/mailbox/exynos-mailbox.c
@@ -0,0 +1,143 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2020 Samsung Electronics Co., Ltd.
+ * Copyright 2020 Google LLC.
+ * Copyright 2024 Linaro Ltd.
+ */
+
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
+	writel_relaxed(BIT(index), exynos_mbox->regs + EXYNOS_MBOX_INTGR1);
+
+	return 0;
+}
+
+static const struct mbox_chan_ops exynos_mbox_chan_ops = {
+	.send_data = exynos_mbox_send_data,
+};
+
+static const struct of_device_id exynos_mbox_match[] = {
+	{ .compatible = "google,gs101-acpm-mbox" },
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
+	writel_relaxed(EXYNOS_MBOX_INTMR0_MASK,
+		       exynos_mbox->regs + EXYNOS_MBOX_INTMR0);
+
+	return devm_mbox_controller_register(dev, mbox);
+}
+
+static struct platform_driver exynos_mbox_driver = {
+	.probe	= exynos_mbox_probe,
+	.driver	= {
+		.name = "exynos-acpm-mbox",
+		.of_match_table	= of_match_ptr(exynos_mbox_match),
+	},
+};
+module_platform_driver(exynos_mbox_driver);
+
+MODULE_AUTHOR("Tudor Ambarus <tudor.ambarus@linaro.org>");
+MODULE_DESCRIPTION("Exynos mailbox driver");
+MODULE_LICENSE("GPL");
-- 
2.47.0.338.g60cca15819-goog

