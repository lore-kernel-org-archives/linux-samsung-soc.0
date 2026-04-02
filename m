Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9306633B6DC
	for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Apr 2026 02:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775096431; cv=none; b=IcQ1Aq8ZL1JpLBu56yThJcv9yLQ88bCiXzcQ8cMC/XrwYZHNt52DufSTXUJjN9AlM8vmQSdjt1iN9x0EMGG17P1mm1HzMvAvJhuZp3Dp9sLgtLJ2X+HGHf+S/RtKkh1nxd8rk98nDX1CxKk2g9vAsO434Tecf0ktMkrlUVB9Zn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775096431; c=relaxed/simple;
	bh=mI1c4tvqRqmTd2c4Bajssy+09eEhLGeg/XucDzIs6Fg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B98Q2ZGUzHEXay9VlwgZ0GhmpPJG+xv6OvuGbd+cedMv/u7tNssknT1aeO08QpwMpRtX879HRBf3vTx6dHozZb/nKqPAzXvjUFSy5DSSukhPnY7b6lbAgvF8Vcw5PUiMYUN2et9cxpGQ/HN0biXKIR4BG8vzlpUkMmU/OhMh9zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ttlbMsdK; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ttlbMsdK"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-486fc4725f0so3199345e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Apr 2026 19:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775096428; x=1775701228; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DbF9xEzoPSgu59LUq/lUmgY7AyJO2/QP6FYhaZepCm4=;
        b=ttlbMsdKPQoyOckVLWIC9DKVYi/ZxTPYjIb+6ssOw76qWxYXk+1UWbK3RuhlX8VjHB
         JbZCLJL70qWpwpzOvmslMxwA2MMcciYLQQTMaHHz09KcWvTTz47Kayv49SnoW2/8Sq2s
         uu63d9C8HjM2c0hvbqfBs3QCSxqfcUmVtPNGwsXnv7liiy7nfyBTvwJm8C1qgTgbU1Rk
         hpGXnHVZqFbSBe/IVO27Ff19JdyGV8Uetz6HcKfwTIIOxzdiGyiG4/bTjyzgsKY8p0+g
         hS7l6Fr5zCDhtm0iUVklS6og+tq8uwXwk1qjPZSdkwBuzyRWb9ZIm2LZ7JCF0gC3kSEe
         ju8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775096428; x=1775701228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DbF9xEzoPSgu59LUq/lUmgY7AyJO2/QP6FYhaZepCm4=;
        b=PHgUWKXQK3r2EeqVkEP/xFtglnmtp6hZfsKRIfNu6mHq22A0OAa8j3km7F04tCsykd
         1QCB5p7KEgHmad7qEGw/jgGzj0jS2lSCpRpILXsKnPt0unIMVyPJ59It00aw3CsIdA21
         Q3BzJPTmZcWgpKFcwKptTsQM0gLLcA8V3hnYrA0gJzt2lu6+ebo7g7aNzQXGmH0QPitD
         diF63wQ5xQYSmASitCwa8ZCU+a77upKkBozvZbKfZ6d4ieS9uIMS2Rz2SRtwqwLb9xHk
         mlGJuxp4wQFptm+/fYgTI/qLNJTIoeZIutIT94DcC9rrxWXo7mgyFVva3VgCWoRPzbV7
         O9MA==
X-Forwarded-Encrypted: i=1; AJvYcCVFxxTFq4IL5tcDyR0/f9+RN5ftUBVs42zwvz7zwTTynV5QLgj9Zm/afSJxf7Lp1kd+xMZigG6mJsBIExV6fODvcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwB5bOx9G1BPSE2Oj52chEUhiZy2/LztSfP4ysLv+K3iW8cLNEI
	bIBjCyrzOtnlsponY7+UmXmo5s8Yv4zE0sRffSmkIs+OsaEBtl3tlakRIM8r9ctwOmA=
X-Gm-Gg: ATEYQzwnREK2Q6N9EAzi/ANPaTV/DHatS+f3joQoEJHdguSe7y1u8HocMzYBl0/AuKu
	etVMvW52M+AVCg7BdcSplKz+HL7t8F/AFIZW8+tefEcu0RW84oV9WIzPIPzi1dsnmg7thOuGBfW
	DEY8ElE/bZmZOaLa0ZO2fPfqzT6+9o2iNDMQv61X+uxi79pNIlBHNuu1AcBJsYOE+e8/6MFo++Q
	guKsxEnPel/83P03b1P9v3igVmf6YCCW6MipioS1NlarfHsWWNpL7U/mXMHUWS+7Mu6j9FeAKfX
	zgAUWPRKZHeZ9BFv9jqfq+XQ/yyKUQJIRPIRCoHqyyh0DhayU+fv5PMeOPofsOnZVf8SgulUhzB
	vJESQcwT4UQtLkOHEP31EPPkg2EhAF3eeXnfP2rSyBXCAYU8HEb8/XMO9PjXN5W7w4rFAYrK92z
	xzusXVqBnggv6aQ6xMQiHiRU/+AwXsaLhNRYkk/nVKhux+GmUsG5MShGA/a9bwzecg9KbAHYEEk
	NXDCalbfF/TkV8a
X-Received: by 2002:a05:600c:890c:b0:485:3e00:944a with SMTP id 5b1f17b1804b1-4888e0990c5mr6473235e9.9.1775096428010;
        Wed, 01 Apr 2026 19:20:28 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887aacb88fsm56379725e9.2.2026.04.01.19.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 19:20:26 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 02 Apr 2026 03:20:15 +0100
Subject: [PATCH v2 2/3] mailbox: exynos: Add support for Exynos850 mailbox
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-exynos850-ap2apm-mailbox-v2-2-ca5ffdff99d4@linaro.org>
References: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
In-Reply-To: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3

Exynos850-based platforms support ACPM and has similar workflow
of communicating with ACPM via mailbox, however mailbox controller
registers are located at different offsets and writes/reads could be
different. To distinguish between such different behaviours,
the registers offsets for Exynos850 and the platform-specific data
structs are introduced and configuration is described in such structs
for gs101 and exynos850 based SoCs. Probe routine now selects the
corresponding platform-specific data via device_get_match_data().

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/mailbox/exynos-mailbox.c | 67 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 64 insertions(+), 3 deletions(-)

diff --git a/drivers/mailbox/exynos-mailbox.c b/drivers/mailbox/exynos-mailbox.c
index d2355b128ba4..f9c59c07558a 100644
--- a/drivers/mailbox/exynos-mailbox.c
+++ b/drivers/mailbox/exynos-mailbox.c
@@ -31,14 +31,61 @@
 
 #define EXYNOS_MBOX_CHAN_COUNT		HWEIGHT32(EXYNOS_MBOX_INTGR1_MASK)
 
+#define EXYNOS850_MBOX_MCUCTRL		0x0	/* Mailbox Control Register		*/
+#define EXYNOS850_MBOX_INTGR0		0x8	/* Interrupt Generation Register 0	*/
+#define EXYNOS850_MBOX_INTCR0		0x0C	/* Interrupt Clear Register 0		*/
+#define EXYNOS850_MBOX_INTMR0		0x10	/* Interrupt Mask Register 0		*/
+#define EXYNOS850_MBOX_INTSR0		0x14	/* Interrupt Status Register 0		*/
+#define EXYNOS850_MBOX_INTMSR0		0x18	/* Interrupt Mask Status Register 0	*/
+#define EXYNOS850_MBOX_INTGR1		0x1C	/* Interrupt Generation Register 1	*/
+#define EXYNOS850_MBOX_INTMR1		0x24	/* Interrupt Mask Register 1		*/
+#define EXYNOS850_MBOX_INTSR1		0x28	/* Interrupt Status Register 1		*/
+#define EXYNOS850_MBOX_INTMSR1		0x2C	/* Interrupt Mask Status Register 1	*/
+#define EXYNOS850_MBOX_VERSION		0x70
+
+#define EXYNOS850_MBOX_INTMR1_MASK	GENMASK(15, 0)
+
+/**
+ * struct exynos_mbox_driver_data - platform-specific mailbox configuration.
+ * @irq_doorbell_offset:	offset to the IRQ generation register, doorbell
+ *				to APM co-processor.
+ * @irq_doorbell_shift:		shift to apply to the value written to IRQ
+ *				generation register.
+ * @irq_mask_offset:		offset to the IRQ mask register.
+ * @irq_mask_value:		value to right to the mask register to mask out
+ *				all interrupts.
+ */
+struct exynos_mbox_driver_data {
+	u16 irq_doorbell_offset;
+	u16 irq_doorbell_shift;
+	u16 irq_mask_offset;
+	u16 irq_mask_value;
+};
+
 /**
  * struct exynos_mbox - driver's private data.
  * @regs:	mailbox registers base address.
  * @mbox:	pointer to the mailbox controller.
+ * @data:	pointer to driver platform-specific data.
  */
 struct exynos_mbox {
 	void __iomem *regs;
 	struct mbox_controller *mbox;
+	const struct exynos_mbox_driver_data *data;
+};
+
+static const struct exynos_mbox_driver_data exynos850_mbox_data = {
+	.irq_doorbell_offset = EXYNOS850_MBOX_INTGR0,
+	.irq_doorbell_shift = 16,
+	.irq_mask_offset = EXYNOS850_MBOX_INTMR1,
+	.irq_mask_value = EXYNOS850_MBOX_INTMR1_MASK,
+};
+
+static const struct exynos_mbox_driver_data exynos_gs101_mbox_data = {
+	.irq_doorbell_offset = EXYNOS_MBOX_INTGR1,
+	.irq_doorbell_shift = 0,
+	.irq_mask_offset = EXYNOS_MBOX_INTMR0,
+	.irq_mask_value = EXYNOS_MBOX_INTMR0_MASK,
 };
 
 static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
@@ -57,7 +104,8 @@ static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
 		return -EINVAL;
 	}
 
-	writel(BIT(msg->chan_id), exynos_mbox->regs + EXYNOS_MBOX_INTGR1);
+	writel(BIT(msg->chan_id) << exynos_mbox->data->irq_doorbell_shift,
+	       exynos_mbox->regs + exynos_mbox->data->irq_doorbell_offset);
 
 	return 0;
 }
@@ -87,13 +135,21 @@ static struct mbox_chan *exynos_mbox_of_xlate(struct mbox_controller *mbox,
 }
 
 static const struct of_device_id exynos_mbox_match[] = {
-	{ .compatible = "google,gs101-mbox" },
+	{
+		.compatible = "google,gs101-mbox",
+		.data = &exynos_gs101_mbox_data
+	},
+	{
+		.compatible = "samsung,exynos850-mbox",
+		.data = &exynos850_mbox_data
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, exynos_mbox_match);
 
 static int exynos_mbox_probe(struct platform_device *pdev)
 {
+	const struct exynos_mbox_driver_data *data;
 	struct device *dev = &pdev->dev;
 	struct exynos_mbox *exynos_mbox;
 	struct mbox_controller *mbox;
@@ -122,6 +178,11 @@ static int exynos_mbox_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(pclk),
 				     "Failed to enable clock.\n");
 
+	data = device_get_match_data(&pdev->dev);
+	if (!data)
+		return -ENODEV;
+
+	exynos_mbox->data = data;
 	mbox->num_chans = EXYNOS_MBOX_CHAN_COUNT;
 	mbox->chans = chans;
 	mbox->dev = dev;
@@ -133,7 +194,7 @@ static int exynos_mbox_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, exynos_mbox);
 
 	/* Mask out all interrupts. We support just polling channels for now. */
-	writel(EXYNOS_MBOX_INTMR0_MASK, exynos_mbox->regs + EXYNOS_MBOX_INTMR0);
+	writel(data->irq_mask_value, exynos_mbox->regs + data->irq_mask_offset);
 
 	return devm_mbox_controller_register(dev, mbox);
 }

-- 
2.51.0

