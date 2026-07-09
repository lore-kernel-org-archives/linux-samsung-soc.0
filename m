Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E9229994B
	for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Jul 2026 14:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783608344; cv=none; b=jeCX1byECZvWVPhgKENJnfSAiLkZhy16alQfnQjUBbjyfmFjwWHoMafkJMKV8bC/qGFKU+srgNNYS4u/h5dIGDzWiCB7lfup+QxDuDn5mNJFqfudoM/drWmSh+fqnaepEsVOZHIA32g2FkQSLjxkaCIrG2d9WhzD5FfXzvyZgFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783608344; c=relaxed/simple;
	bh=HIml+MyqhrM0fvI5KdhsRuEYP/j52YdwE4GExRT8dog=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SF66nHkFEQbf/8C8lkdQhL0MKoVqgACVYl+yHO7DolH4YfchbadCaFAYe6HAWMQe1UTajnVtUgR5dV1wn2ED3LzWcefwL74orZbrdSvjdGxjZiGb12rUURIlRKZKtjnmmRNnAlNW9bBE3o7oU3Fb19LyHsmkngNxxXhvrZFhhVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a7DyX/Y8; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a7DyX/Y8"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-475cb71a4ebso1834877f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Jul 2026 07:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783608341; x=1784213141; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sbhm2y91wOEPq0FWBEAzboduk4MNUncXQAPdVuYnt3s=;
        b=a7DyX/Y8MYnMukvYBDXe7+ZAL394ppcPxlVcJV+TQXAa2Pq5NtFeVWeLqF+Qa/j2LP
         MXjawVr69dRYpFLUems9t5hH3aZt2/3p2KeHPrFYXDM6kWqINSa46v854DeLPES6FGmh
         xEdkctrOcJt/48YL9vKan3L51q6fNIz5Ze8CoioWRB0CgtN/660V3mEe9EP4jlLbU7zW
         cUZgrW9aBO0+lT8DkV10MwDdaD60CBcVLDGNkAVfECJ9+3INlV7NgpAOAa8f9PNdTcLC
         ppHL36IUK6tWxn8pFXO66Ko+Wev9GF1wHpmNhPJi6+1XNyh2SKbGqV8ESa8JKzSYRhD6
         SjsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783608341; x=1784213141;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sbhm2y91wOEPq0FWBEAzboduk4MNUncXQAPdVuYnt3s=;
        b=JQDh0vnG1X3hFgG+pUcLzRSkR/ZCYzuiL2AduoWojFzArQeDcVkuiNinciWW36F0SI
         H0eJDi7LjeZv0J04LQV9CFb7C3+8BdRKtsBOYKJsy3L4qhvv4kzR7+offPOUO86Lmcc/
         4VzXGHfT7lZL/0FSn7/YoAM6zhjpbYLvOgJvu1ARp3Jzb4CgDs15zu1fVrTULDrJ0A4H
         fD66iH849lejm3/+Z6xFSsZ+zPSb89a3TYl+yLl7FP10GWFdvBoLILjXoU9gUSB2Q4BY
         utJIIGTDEnRV1iu0QcYVIdk4cYgcEZ8y1l1/DYvjDQsVZIgAGOKIv46UV90mkNwMMyVh
         UVIw==
X-Forwarded-Encrypted: i=1; AHgh+RomyAZXUBzcTzWw5mcuy7v6Zqkzyr5Mmi3+pzwRaihvyzk6Q6owaTIf4DtNw40M7ak5/GcHUNUKNTpQyivyr63hBg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9LOnQTq/6H1880NkTzcfGa6RlLHec1d5BNTGvWfwxJlhka6b6
	NJm11z/z3RQXUYSGJhlnp+GCOkxtMt+VmJsBZ+a1BTf+hedJ/ZiOHhUT9MLIGqgHm9g=
X-Gm-Gg: AfdE7ck3vRwfBKro6dgUEmX1tkSxOk6ZrNeZF4N9hXkfuiwmdeE111CH2AFig4c9KMp
	n7NkXRNpVexoIkqb4kn3szKAMRRhq7FgpkgROeGb5ILtxxlygex/DkbBmkGLh31sP+jCXal5VII
	+Eee/j+83BC1H9vw0M/vi9r5V/aOezuXiO6RCGYB6O64812Pdx2FLs6ehDRf2JNlyXNVoeuBzAb
	lxnaUQO0ySYeb+hYkOFQuWRbv/auR/YV695MjWWEHaC8RST9yAkXgHQMgNWRnS0rK48+Y+mPZu2
	AI7Gh82pQ9ulVusIch/Ji2Bun/0q+ZEXA+EdqKlfUjtw1BhY8jNT/j1hJpqjmifj9hHvrlorPbC
	X1N4neDrOI3lcjoql9JuUhy9Zv1A/4hB1vLdFkXcnJrlrGXxWxP19Si5Uz0Y9C5NrCLpaxHT34A
	hb9aL0SlCyMszKlQyfI1qLiGaG3u6lKJEpdLLbY/oBoEa1tut9cVgAIc/So14H4RFU3HrBIdvGI
	J7I
X-Received: by 2002:a05:6000:41f7:b0:472:79bc:3919 with SMTP id ffacd0b85a97d-47df079051fmr8084209f8f.39.1783608341484;
        Thu, 09 Jul 2026 07:45:41 -0700 (PDT)
Received: from [127.0.1.1] ([2.122.8.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960b06sm50995732f8f.28.2026.07.09.07.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 07:45:40 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 09 Jul 2026 15:45:37 +0100
Subject: [PATCH v4 2/2] mailbox: exynos: Add support for Exynos850 mailbox
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-exynos850-ap2apm-mailbox-v4-2-caf2fe9a237d@linaro.org>
References: <20260709-exynos850-ap2apm-mailbox-v4-0-caf2fe9a237d@linaro.org>
In-Reply-To: <20260709-exynos850-ap2apm-mailbox-v4-0-caf2fe9a237d@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3

Exynos850-based platforms support ACPM and has similar workflow
of communicating with ACPM via mailbox, however mailbox controller
registers are located at different offsets and writes/reads could be
different. To distinguish between such different behaviours,
the registers offsets for Exynos850 and the platform-specific data
structs are introduced and configuration is described in such structs
for gs101 and exynos850 based SoCs. Probe routine now selects the
corresponding platform-specific data via device_get_match_data().

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/mailbox/exynos-mailbox.c | 72 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 66 insertions(+), 6 deletions(-)

diff --git a/drivers/mailbox/exynos-mailbox.c b/drivers/mailbox/exynos-mailbox.c
index fa02f18948cf..ff75c1c7633c 100644
--- a/drivers/mailbox/exynos-mailbox.c
+++ b/drivers/mailbox/exynos-mailbox.c
@@ -24,14 +24,60 @@
 
 #define EXYNOS_MBOX_CHAN_COUNT		HWEIGHT32(EXYNOS_MBOX_INTGR1_MASK)
 
+#define EXYNOS850_MBOX_INTGR0		0x8	/* Interrupt Generation Register 0	*/
+#define EXYNOS850_MBOX_INTMR1		0x24	/* Interrupt Mask Register 1		*/
+
+#define EXYNOS850_MBOX_INTMR1_MASK	GENMASK(15, 0)
+#define EXYNOS850_MBOX_INTGR0_MASK	GENMASK(31, 16)
+
+#define EXYNOS850_MBOX_CHAN_COUNT	HWEIGHT32(EXYNOS850_MBOX_INTGR0_MASK)
+
+/**
+ * struct exynos_mbox_driver_data - platform-specific mailbox configuration.
+ * @intgr:		offset to the IRQ generation register, doorbell
+ *			to APM co-processor.
+ * @intgr_shift:	shift to apply to the value written to IRQ generation
+ *			register.
+ * @intmr:		offset to the IRQ mask register.
+ * @intmr_mask:		value to write to the mask register to mask out all
+ *			interrupts.
+ * @num_chans:		number of channels the mailbox can support (hardware
+ *			capability).
+ */
+struct exynos_mbox_driver_data {
+	u32 intgr;
+	u32 intgr_shift;
+	u32 intmr;
+	u32 intmr_mask;
+	int num_chans;
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
+	.intgr = EXYNOS850_MBOX_INTGR0,
+	.intgr_shift = 16,
+	.intmr = EXYNOS850_MBOX_INTMR1,
+	.intmr_mask = EXYNOS850_MBOX_INTMR1_MASK,
+	.num_chans = EXYNOS850_MBOX_CHAN_COUNT,
+};
+
+static const struct exynos_mbox_driver_data exynos_gs101_mbox_data = {
+	.intgr = EXYNOS_MBOX_INTGR1,
+	.intgr_shift = 0,
+	.intmr = EXYNOS_MBOX_INTMR0,
+	.intmr_mask = EXYNOS_MBOX_INTMR0_MASK,
+	.num_chans = EXYNOS_MBOX_CHAN_COUNT,
 };
 
 static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
@@ -50,7 +96,9 @@ static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
 		return -EINVAL;
 	}
 
-	writel(BIT(msg->chan_id), exynos_mbox->regs + EXYNOS_MBOX_INTGR1);
+	/* Ring the doorbell */
+	writel(BIT(msg->chan_id) << exynos_mbox->data->intgr_shift,
+	       exynos_mbox->regs + exynos_mbox->data->intgr);
 
 	return 0;
 }
@@ -80,19 +128,31 @@ static struct mbox_chan *exynos_mbox_of_xlate(struct mbox_controller *mbox,
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
 	struct mbox_chan *chans;
 	struct clk *pclk;
 
+	data = device_get_match_data(&pdev->dev);
+	if (!data)
+		return -ENODEV;
+
 	exynos_mbox = devm_kzalloc(dev, sizeof(*exynos_mbox), GFP_KERNEL);
 	if (!exynos_mbox)
 		return -ENOMEM;
@@ -101,8 +161,7 @@ static int exynos_mbox_probe(struct platform_device *pdev)
 	if (!mbox)
 		return -ENOMEM;
 
-	chans = devm_kcalloc(dev, EXYNOS_MBOX_CHAN_COUNT, sizeof(*chans),
-			     GFP_KERNEL);
+	chans = devm_kcalloc(dev, data->num_chans, sizeof(*chans), GFP_KERNEL);
 	if (!chans)
 		return -ENOMEM;
 
@@ -115,7 +174,8 @@ static int exynos_mbox_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(pclk),
 				     "Failed to enable clock.\n");
 
-	mbox->num_chans = EXYNOS_MBOX_CHAN_COUNT;
+	exynos_mbox->data = data;
+	mbox->num_chans = data->num_chans;
 	mbox->chans = chans;
 	mbox->dev = dev;
 	mbox->ops = &exynos_mbox_chan_ops;
@@ -126,7 +186,7 @@ static int exynos_mbox_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, exynos_mbox);
 
 	/* Mask out all interrupts. We support just polling channels for now. */
-	writel(EXYNOS_MBOX_INTMR0_MASK, exynos_mbox->regs + EXYNOS_MBOX_INTMR0);
+	writel(data->intmr_mask, exynos_mbox->regs + data->intmr);
 
 	return devm_mbox_controller_register(dev, mbox);
 }

-- 
2.51.0

