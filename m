Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611CD31E0F2
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Nov 2025 14:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763129467; cv=none; b=URbNX11pnNF/0BPM4fdzfQsTuZ+QFhIdsCeVlQawVQFgC6XxJF2AcA7J9DnGXi86nKIXSBh7guvagRpVzkBsNrbjE4Lx2+m7wFXBRosCt302Npnn4+b3MY29uKk0jJFgZOeNWkVNLeY9/Mx1qf044C4Y0BX0QeDvfdHtg8Q8shk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763129467; c=relaxed/simple;
	bh=wqc8bNzHacyAqxgyv6B/haW5mpIwAi4OJICexTaUa7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sP3eZzLIbqBVmFlIFJ/lgDo1KZ2TNOlstDvqgnJpOb/NcjWNrCC5v+a/lhc2TpkgW10VrimtFI2F5P4jr1flCJT8NV8D9dnLDBiXJwUyM5TRPP062MXO/f16mRfB+AjXRIFB6rUt4MTahxxlXdKMB4cBfcn9kJnctnJuKWfRi0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Kaqcgb3R; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kaqcgb3R"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b714b1290aeso303495166b.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Nov 2025 06:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763129461; x=1763734261; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P5i1aNz8H3encFDexaz8c63loY0QBYJOvJuXhfdmWlE=;
        b=Kaqcgb3RplgUZhMClnysxWVN9cBmFCh1Hp6EiHt6dWPbhQJIjugNURagWMIeTFSEMn
         3niBW2+HT5JOXmF7XiZqseOPx1htX6tiesR497ks1nhK+ihMD4Pv2xlyD+443Vs1ICpX
         mJOQZRSmGJFxpK17Wq9+JUgqeHhsKD4Ud/0TG9wFQ569lo6Qx/YBfYBxUGP3IqOhDwyA
         VY/r+eBxBdTceOJvyBL11l6gLXhSWyxLF7jP6WaF4Ve9prBjvdQjD5rJ5B8B5oDa1K8p
         yeWuUBFWSxOLeeeC3Bjv8b2+K6M71bl7Hz+YppoUx1OV0YBU/z98YL+ViP03aILktIrL
         bahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763129461; x=1763734261;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P5i1aNz8H3encFDexaz8c63loY0QBYJOvJuXhfdmWlE=;
        b=ipyXneiV81IFSGwUM7FpUsFLZqKokQpmYai/9a4lbLhMrx96+z2rJo3UuESH7p5Ugu
         61sd6m20LRhCfWzILb0HQ5Rq1/esWa9osm2f1pZkVG9rarc/43qrZrhX8nJ2mHvml23l
         IwaRnTdAaMTlvWz+V2Q3Pp8vbqTA84nke+37eFzL9LZZBh9FRRi65NKCKFtCiwTfMtEY
         R/srp2brYteFIczodRXelAgscfH0P94oviJys2PdatAlRJWcfHybb0Yi0D3i1z5tuqQy
         0BPLtiBZP+Hdrg0G0GRDs/vZCo+xRcbK0Xy2nh5uWPS12qfNh/G6qX2KL0mFZjz6pgLR
         uXdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWx8iBxmgHf6mwh5ZaXrXgnoYonwhvvttAutTN9Tu+fD/sTgTz1Xjo89HXms6om3JQZgo5sOTGFSdK3Wa06CInKIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDfV8XodKBhdPyPV5ZzghQ+QhVwIrPd+d42Im6bc335Il8jfg5
	KQhpapbHMolBwN8wXJO7xXx77KJXKaf83HvR+pDrPwK+1kUbfSM3z9pq4/QO9c9oaHY=
X-Gm-Gg: ASbGncvhXdDXaQFNRiAQbs0/zeVs4RL2IDOPf8uhZtjbLqSayPvYSf8znNmeHmOuUJn
	X1sknKYIPLAIyiH41sK/elGDIoNb+qh4UBUY9rD3/WBVg27KeLN7N9DMTX3+caYZYHXXH/+5lh3
	qlx5pLj5olVuHRAC0m6AhAecDtmHXQd6j18WJ/8NKTKUfF/9poWncNgRfEjE2IwGZut/0dGyOXW
	d1u8O2l41bauyQuouxNTUmoe6MFBENzfV/wmC+PPfcxm3RD/tvrrx1qcctl9UAaTjcEMF/+6nkk
	JVDZaBd+Yc8yUArX4EF3op9Pb40Lm7yS1C9PFp9uZsMbcnoTRQpX7S7obWOe3XrcLgiV66dLme7
	Cjyu+hhui9Wu/PO874LHbBTj2jwPUBYEBm8+WIU6bgQPj2SYGzk6ufNyhKx7KndQbWU/u75Hp7J
	RuSZKhKNxklSEKjMOZemAdCzzF9RA7p1J2jeq4iqvjsarIQZH6RYJfz29WyO9qt81WAXXVWWLAq
	XBvrw==
X-Google-Smtp-Source: AGHT+IF5NwlyBHtD12anUC4nI/Qmh/iP+mZgjMVwytdNsIYtuE0AXxcOg3RzCBmlLIyp3nwl3EYZlQ==
X-Received: by 2002:a17:906:7307:b0:b73:5146:8b7b with SMTP id a640c23a62f3a-b73678e9981mr249590366b.36.1763129460930;
        Fri, 14 Nov 2025 06:11:00 -0800 (PST)
Received: from puffmais2.c.googlers.com (180.192.141.34.bc.googleusercontent.com. [34.141.192.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fed90c0sm395728766b.65.2025.11.14.06.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:11:00 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 14 Nov 2025 14:10:59 +0000
Subject: [PATCH] mfd: sec: Use chained IRQs for s2mpg10
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251114-s2mpg10-chained-irq-v1-1-34ddfa49c4cd@linaro.org>
X-B4-Tracking: v=1; b=H4sIAHI4F2kC/x2MQQqAIBAAvyJ7bsGVDOor0UFstT1kpRCB9Pek4
 zDMVCichQtMqkLmW4ocqQF1CvzmUmSUtTEYbSwR9VjMfkbS2KwkXlHyhdbr0Q4ctDMErTwzB3n
 +67y87werP1bZZQAAAA==
X-Change-ID: 20251114-s2mpg10-chained-irq-5c0956ef0a21
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 Douglas Anderson <dianders@chromium.org>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

On S2MPG10 (and similar like S2MPG11), top-level interrupt status and
mask registers exist which need to be unmasked to get the PMIC
interrupts. This additional status doesn't seem to exist on other PMICs
in the S2MP* family, and the S2MPG10 driver is manually dealing with
masking and unmasking currently.

The correct approach here is to register this hierarchy as chained
interrupts, though, without any additional manual steps. Doing so will
also simplify addition of other, similar, PMICs (like S2MPG11) in the
future.

Update the driver to do just that.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
This patch and
https://lore.kernel.org/all/20251114-s5m-alarm-v1-0-c9b3bebae65f@linaro.org/
that I sent earlier will conflict due to patch context.

I propose to have this one here merged first (as it should be more
straight forward and I think it's simpler and hopefully less
controversial), and then I can send a rebased version of the other
series if you agree.
---
 drivers/mfd/sec-acpm.c          | 23 +------------
 drivers/mfd/sec-irq.c           | 73 +++++++++++++++++++++++++++++++++++++++--
 include/linux/mfd/samsung/irq.h |  6 ++++
 3 files changed, 77 insertions(+), 25 deletions(-)

diff --git a/drivers/mfd/sec-acpm.c b/drivers/mfd/sec-acpm.c
index 8b31c816d65b86c54a108fa994384abfac0e7da4..36622069a7885c9b5fc74329efec34e1e4bcc106 100644
--- a/drivers/mfd/sec-acpm.c
+++ b/drivers/mfd/sec-acpm.c
@@ -325,11 +325,6 @@ static struct regmap *sec_pmic_acpm_regmap_init(struct device *dev,
 	return regmap;
 }
 
-static void sec_pmic_acpm_mask_common_irqs(void *regmap_common)
-{
-	regmap_write(regmap_common, S2MPG10_COMMON_INT_MASK, S2MPG10_COMMON_INT_SRC);
-}
-
 static int sec_pmic_acpm_probe(struct platform_device *pdev)
 {
 	struct regmap *regmap_common, *regmap_pmic, *regmap;
@@ -360,15 +355,10 @@ static int sec_pmic_acpm_probe(struct platform_device *pdev)
 	shared_ctx->speedy_channel = pdata->speedy_channel;
 
 	regmap_common = sec_pmic_acpm_regmap_init(dev, shared_ctx, SEC_PMIC_ACPM_ACCESSTYPE_COMMON,
-						  pdata->regmap_cfg_common, false);
+						  pdata->regmap_cfg_common, true);
 	if (IS_ERR(regmap_common))
 		return PTR_ERR(regmap_common);
 
-	/* Mask all interrupts from 'common' block, until successful init */
-	ret = regmap_write(regmap_common, S2MPG10_COMMON_INT_MASK, S2MPG10_COMMON_INT_SRC);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to mask common block interrupts\n");
-
 	regmap_pmic = sec_pmic_acpm_regmap_init(dev, shared_ctx, SEC_PMIC_ACPM_ACCESSTYPE_PMIC,
 						pdata->regmap_cfg_pmic, false);
 	if (IS_ERR(regmap_pmic))
@@ -391,17 +381,6 @@ static int sec_pmic_acpm_probe(struct platform_device *pdev)
 	if (device_property_read_bool(dev, "wakeup-source"))
 		devm_device_init_wakeup(dev);
 
-	/* Unmask PMIC interrupt from 'common' block, now that everything is in place. */
-	ret = regmap_clear_bits(regmap_common, S2MPG10_COMMON_INT_MASK,
-				S2MPG10_COMMON_INT_SRC_PMIC);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to unmask PMIC interrupt\n");
-
-	/* Mask all interrupts from 'common' block on shutdown */
-	ret = devm_add_action_or_reset(dev, sec_pmic_acpm_mask_common_irqs, regmap_common);
-	if (ret)
-		return ret;
-
 	return 0;
 }
 
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index c5c80b1ba104e6c5a55b442d2f10a8554201a961..d992e41e716dcdc060421e1db8475523842a12be 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -20,6 +20,12 @@
 #include "sec-core.h"
 
 static const struct regmap_irq s2mpg10_irqs[] = {
+	REGMAP_IRQ_REG(S2MPG10_COMMON_IRQ_PMIC, 0, S2MPG10_COMMON_INT_SRC_PMIC),
+	/* No documentation or other reference for remaining bits */
+	REGMAP_IRQ_REG(S2MPG10_COMMON_IRQ_UNUSED, 0, GENMASK(7, 1)),
+};
+
+static const struct regmap_irq s2mpg10_pmic_irqs[] = {
 	REGMAP_IRQ_REG(S2MPG10_IRQ_PWRONF, 0, S2MPG10_IRQ_PWRONF_MASK),
 	REGMAP_IRQ_REG(S2MPG10_IRQ_PWRONR, 0, S2MPG10_IRQ_PWRONR_MASK),
 	REGMAP_IRQ_REG(S2MPG10_IRQ_JIGONBF, 0, S2MPG10_IRQ_JIGONBF_MASK),
@@ -183,11 +189,20 @@ static const struct regmap_irq s5m8767_irqs[] = {
 /* All S2MPG10 interrupt sources are read-only and don't require clearing */
 static const struct regmap_irq_chip s2mpg10_irq_chip = {
 	.name = "s2mpg10",
+	.status_base = S2MPG10_COMMON_INT,
+	.mask_base = S2MPG10_COMMON_INT_MASK,
+	.num_regs = 1,
 	.irqs = s2mpg10_irqs,
 	.num_irqs = ARRAY_SIZE(s2mpg10_irqs),
-	.num_regs = 6,
+};
+
+static const struct regmap_irq_chip s2mpg10_irq_chip_pmic = {
+	.name = "s2mpg10-pmic",
 	.status_base = S2MPG10_PMIC_INT1,
 	.mask_base = S2MPG10_PMIC_INT1M,
+	.num_regs = 6,
+	.irqs = s2mpg10_pmic_irqs,
+	.num_irqs = ARRAY_SIZE(s2mpg10_pmic_irqs),
 };
 
 static const struct regmap_irq_chip s2mps11_irq_chip = {
@@ -253,6 +268,59 @@ static const struct regmap_irq_chip s5m8767_irq_chip = {
 	.ack_base = S5M8767_REG_INT1,
 };
 
+static int s2mpg1x_add_chained_irq_chip(struct device *dev, struct regmap *regmap, int pirq,
+					struct regmap_irq_chip_data *parent,
+					const struct regmap_irq_chip *chip,
+					struct regmap_irq_chip_data **data)
+{
+	int irq, ret;
+
+	irq = regmap_irq_get_virq(parent, pirq);
+	if (irq < 0)
+		return dev_err_probe(dev, irq, "Failed to get parent vIRQ(%d) for chip %s\n", pirq,
+				     chip->name);
+
+	ret = devm_regmap_add_irq_chip(dev, regmap, irq, IRQF_ONESHOT | IRQF_SHARED, 0, chip, data);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add %s IRQ chip\n", chip->name);
+
+	return 0;
+}
+
+static int sec_irq_init_s2mpg1x(struct sec_pmic_dev *sec_pmic)
+{
+	const struct regmap_irq_chip *irq_chip, *chained_irq_chip;
+	struct regmap_irq_chip_data *irq_data;
+	struct regmap *regmap_common;
+	int chained_pirq;
+	int ret;
+
+	switch (sec_pmic->device_type) {
+	case S2MPG10:
+		irq_chip = &s2mpg10_irq_chip;
+		chained_irq_chip = &s2mpg10_irq_chip_pmic;
+		chained_pirq = S2MPG10_COMMON_IRQ_PMIC;
+		break;
+	default:
+		return dev_err_probe(sec_pmic->dev, -EINVAL, "Unsupported device type %d\n",
+				     sec_pmic->device_type);
+	};
+
+	regmap_common = dev_get_regmap(sec_pmic->dev, "common");
+	if (!regmap_common)
+		return dev_err_probe(sec_pmic->dev, -EINVAL, "No 'common' regmap %d\n",
+				     sec_pmic->device_type);
+
+	ret = devm_regmap_add_irq_chip(sec_pmic->dev, regmap_common, sec_pmic->irq, IRQF_ONESHOT, 0,
+				       irq_chip, &irq_data);
+	if (ret)
+		return dev_err_probe(sec_pmic->dev, ret, "Failed to add %s IRQ chip\n",
+				     irq_chip->name);
+
+	return s2mpg1x_add_chained_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic, chained_pirq,
+					    irq_data, chained_irq_chip, &sec_pmic->irq_data);
+}
+
 int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 {
 	const struct regmap_irq_chip *sec_irq_chip;
@@ -268,8 +336,7 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 		sec_irq_chip = &s2mps14_irq_chip;
 		break;
 	case S2MPG10:
-		sec_irq_chip = &s2mpg10_irq_chip;
-		break;
+		return sec_irq_init_s2mpg1x(sec_pmic);
 	case S2MPS11X:
 		sec_irq_chip = &s2mps11_irq_chip;
 		break;
diff --git a/include/linux/mfd/samsung/irq.h b/include/linux/mfd/samsung/irq.h
index b4805cbd949bd605004bd88cf361109d1cbbc3bf..8402a5f8e18ab62b4bec89541d785442674adee0 100644
--- a/include/linux/mfd/samsung/irq.h
+++ b/include/linux/mfd/samsung/irq.h
@@ -57,6 +57,12 @@ enum s2mpa01_irq {
 #define S2MPA01_IRQ_B24_TSD_MASK	(1 << 4)
 #define S2MPA01_IRQ_B35_TSD_MASK	(1 << 5)
 
+enum s2mpg10_common_irq {
+	/* Top-level (common) block */
+	S2MPG10_COMMON_IRQ_PMIC,
+	S2MPG10_COMMON_IRQ_UNUSED,
+};
+
 enum s2mpg10_irq {
 	/* PMIC */
 	S2MPG10_IRQ_PWRONF,

---
base-commit: b179ce312bafcb8c68dc718e015aee79b7939ff0
change-id: 20251114-s2mpg10-chained-irq-5c0956ef0a21

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

