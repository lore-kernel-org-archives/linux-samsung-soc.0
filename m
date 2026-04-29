Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7569842316F
	for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Apr 2026 19:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777489235; cv=none; b=c5foUw1ptO/99aYBzwKT159HYnX+P/C2eYPN8uIgtEbHxha+3YJ16XFTF23hk0FSryapnT2LP8iD+gPYcHn2zTnNYjbBtk+G1m44DoSu1E7aC+lbVRGtAb8mZEtxDOwwCbuIeqMWYuJuL61Xy0rz/vd1NlEEPyq8JBsMfbS/ztI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777489235; c=relaxed/simple;
	bh=2wrIkCg2F0ORc8+hMPtq5Mv5GcVpiU80g1pcRdLD/fE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VZKAlcXvT2ayeHZglALqrBZ0fh8eOSX5nUxf86ZdrzfyVbiHLFZFCEyq/w6MAQ5xUIytUSst0MayyfTVxezypJVjNslOWBeznmQnyermK0hxoE3v05SFmth/bBhS52/0MYT5LsZ0tyiRG7XMhr7yIX9sJv4iE7KiLJSEG24rf40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xrkp8dJx; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xrkp8dJx"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso1008325e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Apr 2026 12:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777489232; x=1778094032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qBYA5nKt8YmzIPAJc6uOBQ1k/4UmKz7MxOXdNyaxiqk=;
        b=Xrkp8dJxjf3OIyIE4gAktt2vidMxt9afGtxdvsh8l8UDjH1rwJ/LmVle2LmltkP/ow
         GSHbOd07Sqs5v4a/QV5UEK0qvzw4IyU4y+zLZz/3vTu+9JFLQDlI4iuJjtwrT7RbInVB
         bQitzJHLeeO45nelM7z/KVDx+0gxNYTGUGatlWicpgZuIgFbsXLuaYBMifTZZ3zfsi1u
         laU4L8tjjrnRGdIXlqzVj7JkUhtFJEiZEEq72yKPkr/bIx0ABMWwTqAz60PX77WSGxL3
         oEvjs9QFfKCw8RJPkUmHmoGhHFGPZy9gUB8OV+jBaCngTKii9eBsGZD2ebvUyGLrT0IR
         A6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777489232; x=1778094032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qBYA5nKt8YmzIPAJc6uOBQ1k/4UmKz7MxOXdNyaxiqk=;
        b=Yg5SoY/ZQ9jShDrCnAuSnk0O7M4tvfphW/EORsbOE3GbPu4ujaM3Mo5Syam//MYPou
         ++JwnKw9718MbHni6GrS2a+9CRmsR1BqBE6Hx+Xidt2dAQT/rU9g6pCsfh8W6Bc4swAH
         sjQoLLBjnYaGE3jwj/QXRLItRokAONU/pq7yYvCgXbGReVhDCACcmMGfmXA1YIqOPwaz
         Bly113AmJCydrN1arI0y5+LjlfiEAkek8Hga0pedfrIS6oesB+DmGsoqGKvoIHdGE1RN
         PCnFeD6rSD1N0lAuErnnGmhM226SY8HigIYoEtVdSya3ssNBglYyx3YoaoAuR9NpzWzv
         f6WQ==
X-Forwarded-Encrypted: i=1; AFNElJ9hdRya5JxUS1n/3JwllqYhBU9iIA+KoLJPm40TZJLqJzaj06LcFFzq9S9AI309PogSxw/4xycNPTfdOElVq37n4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8ZTCuH1pKqFPZ/BhQ3iMU/Mr/y5EwQ5WfyeDnLP0TPCi1+Zbk
	XxJzyKFVpHvkiOl6KDWQalXHPE4jAGvUio0ifSEbvbR60F9kI4EgIiOXARkjGeTemCC1oUew8tC
	uAOoLuKs=
X-Gm-Gg: AeBDieuxV1MGI6P6KD2aFRtHE9nWV5D40AVPhFpsgZD/wDrlbnwQzsu4fOG5/qNsoaT
	HKt5iHpqUXHuaaN7+blIQAak0YiDtrX5FyYZ8JFzWAIfR9T4Zb2dVP+govF9/JrkR1LQJLcGvzc
	3xTWZ3SryteKUZMs4nO9dL6JdVBeeR4LGmx+AOQn+1Va8KOCpvLpK1AceWF7RSAik+uwXKCru4H
	X2yojBLTXzPmO3siXdyPu9MAy6+qKE6jDU0cTQku7FdvjgxzmHRdh0hG0WNXzWzP9kb19q/u1RP
	rcnsaoavGWn95D/ZG2dTsD19r3b7XLHksghipTHZPLMCThK8mBedhqvU7SYYu42f9U7nQbaMmpM
	z1pw7vS4OyMCb1bPirZ8bXNmcBcbajAj31uHjUK2sCFylxIWqPDu6nDegcz72/MRSM6TMY/JMXP
	pyE3rm2lte1TjnrUUwmUigCQ3Q5xiNDBwZLUZ5QkNQDLIjcn25Q73aSOsE02p5zVlbCp2FOqmAG
	XMEGdR40Vq+OpZ7RHerFyfBjk8=
X-Received: by 2002:a05:600c:a409:b0:486:fba7:b150 with SMTP id 5b1f17b1804b1-48a7b531980mr72931285e9.15.1777489231411;
        Wed, 29 Apr 2026 12:00:31 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b900b40sm26187785e9.2.2026.04.29.12.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 12:00:30 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 29 Apr 2026 20:00:25 +0100
Subject: [PATCH v3 2/2] mailbox: exynos: Add support for Exynos850 mailbox
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-exynos850-ap2apm-mailbox-v3-2-8e2719608c46@linaro.org>
References: <20260429-exynos850-ap2apm-mailbox-v3-0-8e2719608c46@linaro.org>
In-Reply-To: <20260429-exynos850-ap2apm-mailbox-v3-0-8e2719608c46@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>, 
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
 drivers/mailbox/exynos-mailbox.c | 59 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 56 insertions(+), 3 deletions(-)

diff --git a/drivers/mailbox/exynos-mailbox.c b/drivers/mailbox/exynos-mailbox.c
index d2355b128ba4..11657dd475c0 100644
--- a/drivers/mailbox/exynos-mailbox.c
+++ b/drivers/mailbox/exynos-mailbox.c
@@ -31,14 +31,52 @@
 
 #define EXYNOS_MBOX_CHAN_COUNT		HWEIGHT32(EXYNOS_MBOX_INTGR1_MASK)
 
+#define EXYNOS850_MBOX_INTGR0		0x8	/* Interrupt Generation Register 0	*/
+#define EXYNOS850_MBOX_INTMR1		0x24	/* Interrupt Mask Register 1		*/
+
+#define EXYNOS850_MBOX_INTMR1_MASK	GENMASK(15, 0)
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
+ */
+struct exynos_mbox_driver_data {
+	u16 intgr;
+	u16 intgr_shift;
+	u16 intmr;
+	u16 intmr_mask;
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
+};
+
+static const struct exynos_mbox_driver_data exynos_gs101_mbox_data = {
+	.intgr = EXYNOS_MBOX_INTGR1,
+	.intgr_shift = 0,
+	.intmr = EXYNOS_MBOX_INTMR0,
+	.intmr_mask = EXYNOS_MBOX_INTMR0_MASK,
 };
 
 static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
@@ -57,7 +95,9 @@ static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
 		return -EINVAL;
 	}
 
-	writel(BIT(msg->chan_id), exynos_mbox->regs + EXYNOS_MBOX_INTGR1);
+	/* Ring the doorbell */
+	writel(BIT(msg->chan_id) << exynos_mbox->data->intgr_shift,
+	       exynos_mbox->regs + exynos_mbox->data->intgr);
 
 	return 0;
 }
@@ -87,13 +127,21 @@ static struct mbox_chan *exynos_mbox_of_xlate(struct mbox_controller *mbox,
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
@@ -122,6 +170,11 @@ static int exynos_mbox_probe(struct platform_device *pdev)
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
@@ -133,7 +186,7 @@ static int exynos_mbox_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, exynos_mbox);
 
 	/* Mask out all interrupts. We support just polling channels for now. */
-	writel(EXYNOS_MBOX_INTMR0_MASK, exynos_mbox->regs + EXYNOS_MBOX_INTMR0);
+	writel(data->intmr_mask, exynos_mbox->regs + data->intmr);
 
 	return devm_mbox_controller_register(dev, mbox);
 }

-- 
2.51.0

