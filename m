Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC52A3BE16C
	for <linux-samsung-soc@vger.kernel.org>; Thu,  1 Oct 2026 03:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790824163; cv=none; b=KxydDURZGDL6fZUtpNceGSDQE05mfhfmEJ66R+keoILJNb4JH6xxxWRt57ONjvEy+LVUZN8NIKMtaKDJiZskoaGsZO6WaGPSojSR3FmmUCcd/iZPKGYC0S+wQlSGg2owQ2L/LI9ucO5HcYzg2nJnX/UiBp1DSuAs2ctTN9RBmr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790824163; c=relaxed/simple;
	bh=HJ782ZkVd+cwbg2zr5WPHdLJxTol40QDCPVd3j2YWCE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sclrVj/+96AdmQyLc7jdL+i9ibM7+AMsig1ZnZCbZUwe5wRneLbeQQStXKe61KWXU9MYl7PXOBEenPwx4EFyGuCWvMPdqyibONN6RpPgRkIZcOdUHLpBd2lxiKFJIX0Q9SI6MnVT3sJhOZ1NzNODb2h65R7ERdsXwXexn17ksz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mLTxWQJT; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mLTxWQJT"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d391aso45913555e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Sep 2026 20:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790824157; x=1791428957; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ebr0zKwmRy5Wy2u8eNXuEfkoYnCwRU2+CdFY8YmOfEU=;
        b=mLTxWQJTr9+8kDTGwGXy7NPOSfOvKqRT0UJEeiCOAFwQ9DsYzkgQHRE3S24wpy7Kk7
         XV8NUoGRBadLY9cqsFftFXdeCobwJJuYSaZR9kxfBX+kQydC7hHt23HH9Zw1WXVwDSIU
         BHXR0KIkcAYQpoBzSCOZIT+8FzmIQRtXgvJ+xKZqbNfDQGrEKXXpRdS+kX/3uqjpZN2F
         DYQowM8ZVlAIJWzcpLgW+9r0dPZrsRF1ywqHl562od7xV0rxTbkZ4LaJccpM9o9morjh
         XdFAoUgsGM1Hx1G/4zla/o45vM8YSnYhIBGWoPiV2fkEy7/yocHQkWNsz505vh4/W4tJ
         G9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790824157; x=1791428957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ebr0zKwmRy5Wy2u8eNXuEfkoYnCwRU2+CdFY8YmOfEU=;
        b=dGY6ygOvFhVla0GfEA55FhbF9DU/QfVt8R1fgmkiVcXTHDiLUkgMLLb9g+H5l29KJA
         hSpAnin2X7lOPOcqVPGWeeH5putNeW8RHHnfFPRqwUyK5A864Slfu8HJK9zywLmSvw1J
         4lW7jH+BlKF2d0Fq3UNNo3QvFk8dQg4WAHJDlFMbopLzCYzywrcmfgYU9Xwz74AlmjKN
         jv8bgC2V5q87/MFUZj89eRNUGOCIALmSmMGx9hCRglgTDgozvaXN03gqulHg7X/BWlZG
         sGEbFFtZqAblJ9FErLQ8WGdbb5TftPiht+1MNRfotFVUKlqqZIneKdcDfrTIycux6QXI
         YI3g==
X-Forwarded-Encrypted: i=1; AKwUvBwgb7A3hnTd9N0pIzT7IvyhCM/+SNmHzh5lzOfh4hMdEiC1yY1zEfdf9AhVnpLcjyoQ4HqmBOzr1f6hJV43hBQBgg==@vger.kernel.org
X-Gm-Message-State: AFuF++lpezfLchAfgvlr+qFkqX2/Mg0xFreWlUj8J45WuTSWf5wx4bHv
	t5QP4hUCNmGXxSrXVI2PZJcgIQhNJSVtyQLv5YGCOzMMBwn61Lr/WjDjUUaggC8HrIA=
X-Gm-Gg: AYBFou2goohKAVqBpU47HyuATI0Umg/wKY7blfyf3dQAU0+ZNEYQd0gq5PDeFdjaWfK
	aW/6SYP/fzx9tBCXjTg3lJfpqBI9vC1YX0oQ+tSQqj+Z/gpnmx/L9ELNzma6cD8f2dSsUxN206Z
	PP0nRFikpSkvjA4S6P4XFRPDF83kzF7tGKRMsJQ1ZdGtNHIznd2IfGhG83os7a9XVk7vNryF6Ru
	MHTpJOTaQwokPvE5Bqvrzq6V/pRdJW++p5gtSsfabpBYGQCLp1Jj3JJeGRuPZ5rQvTYFvA3BQ6v
	KUq6hv1DoRqbNDvfVb7nniVcdKIs9u7GKHAz6YDuPVqQH7bme4GYOmnDwuGQNz9jmK3ebyh2DVt
	RNd5FJJ177ZyL1NMk+OllnGCrpHjtXQ3NCe7L20AYWAjWun6/f2Bz+DnBevO1RL/jw695Aute6d
	Tq9cP07bEIIIjI2KiKW788Nnge7Im6eMjdjwQysdYbP/quBhSiZnIDsg3LucgRQLUSHHRkKoFmU
	RLcTR+X2hOuioqZW1p9reW4AoEOFrMZ7L+BJQshZXKShA2YJDH1HZSGXGxZgQ==
X-Received: by 2002:a05:600c:6206:b0:49f:c1a1:5222 with SMTP id 5b1f17b1804b1-4a01b128d1amr54436895e9.33.1790824157298;
        Wed, 30 Sep 2026 20:09:17 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f9145e6sm27091885e9.5.2026.09.30.20.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 20:09:16 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 01 Oct 2026 04:09:13 +0100
Subject: [PATCH 2/4] iio: adc: exynos_adc: add Exynos850 support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-exynos850_adc-v1-2-791b3516bb9d@linaro.org>
References: <20261001-exynos850_adc-v1-0-791b3516bb9d@linaro.org>
In-Reply-To: <20261001-exynos850_adc-v1-0-791b3516bb9d@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

The Exynos850 ADC controller located inside the CMGP block differs from
other Exynos ADC controllers, mainly in its register layout.
Specifically, the data register sits at offset 0x08.

Abstract the read_value() operation in driver data exynos_adc_data to
support SoC-dependent data register read callbacks.
Add the exynos850_adc_data struct that describes Exynos850 ADC ops.
It also requires its own hardware initialization and exit routines.
Add them as well.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/iio/adc/exynos_adc.c | 66 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 64 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/exynos_adc.c b/drivers/iio/adc/exynos_adc.c
index c1a0061b16ca..3e9b5d28b922 100644
--- a/drivers/iio/adc/exynos_adc.c
+++ b/drivers/iio/adc/exynos_adc.c
@@ -46,6 +46,8 @@
 #define ADC_V2_INT_ST(x)	((x) + 0x14)
 #define ADC_V2_VER(x)		((x) + 0x20)
 
+#define ADC_EXYNOS850_DAT(x)	((x) + 0x08)
+
 /* Bit definitions for ADC_V1 */
 #define ADC_V1_CON_RES		(1u << 16)
 #define ADC_V1_CON_PRSCEN	(1u << 14)
@@ -133,6 +135,7 @@ struct exynos_adc_data {
 	void (*exit_hw)(struct exynos_adc *info);
 	void (*clear_irq)(struct exynos_adc *info);
 	void (*start_conv)(struct exynos_adc *info, unsigned long addr);
+	u32 (*read_value)(struct exynos_adc *info);
 };
 
 static void exynos_adc_unprepare_clk(struct exynos_adc *info)
@@ -195,6 +198,11 @@ static int exynos_adc_enable_clk(struct exynos_adc *info)
 	return 0;
 }
 
+static u32 exynos_adc_v1_read_value(struct exynos_adc *info)
+{
+	return readl(ADC_V1_DATX(info->regs)) & info->data->mask;
+}
+
 static void exynos_adc_v1_init_hw(struct exynos_adc *info)
 {
 	u32 con1;
@@ -252,6 +260,7 @@ static const struct exynos_adc_data exynos4212_adc_data = {
 	.exit_hw	= exynos_adc_v1_exit_hw,
 	.clear_irq	= exynos_adc_v1_clear_irq,
 	.start_conv	= exynos_adc_v1_start_conv,
+	.read_value	= exynos_adc_v1_read_value,
 };
 
 static const struct exynos_adc_data exynos_adc_v1_data = {
@@ -264,6 +273,7 @@ static const struct exynos_adc_data exynos_adc_v1_data = {
 	.exit_hw	= exynos_adc_v1_exit_hw,
 	.clear_irq	= exynos_adc_v1_clear_irq,
 	.start_conv	= exynos_adc_v1_start_conv,
+	.read_value	= exynos_adc_v1_read_value,
 };
 
 static const struct exynos_adc_data exynos_adc_s5pv210_data = {
@@ -274,6 +284,7 @@ static const struct exynos_adc_data exynos_adc_s5pv210_data = {
 	.exit_hw	= exynos_adc_v1_exit_hw,
 	.clear_irq	= exynos_adc_v1_clear_irq,
 	.start_conv	= exynos_adc_v1_start_conv,
+	.read_value	= exynos_adc_v1_read_value,
 };
 
 static void exynos_adc_s3c64xx_start_conv(struct exynos_adc *info,
@@ -295,6 +306,7 @@ static struct exynos_adc_data const exynos_adc_s3c64xx_data = {
 	.exit_hw	= exynos_adc_v1_exit_hw,
 	.clear_irq	= exynos_adc_v1_clear_irq,
 	.start_conv	= exynos_adc_s3c64xx_start_conv,
+	.read_value	= exynos_adc_v1_read_value,
 };
 
 static void exynos_adc_v2_init_hw(struct exynos_adc *info)
@@ -356,6 +368,7 @@ static const struct exynos_adc_data exynos_adc_v2_data = {
 	.exit_hw	= exynos_adc_v2_exit_hw,
 	.clear_irq	= exynos_adc_v2_clear_irq,
 	.start_conv	= exynos_adc_v2_start_conv,
+	.read_value	= exynos_adc_v1_read_value,
 };
 
 static const struct exynos_adc_data exynos3250_adc_data = {
@@ -369,6 +382,7 @@ static const struct exynos_adc_data exynos3250_adc_data = {
 	.exit_hw	= exynos_adc_v2_exit_hw,
 	.clear_irq	= exynos_adc_v2_clear_irq,
 	.start_conv	= exynos_adc_v2_start_conv,
+	.read_value	= exynos_adc_v1_read_value,
 };
 
 static void exynos_adc_exynos7_init_hw(struct exynos_adc *info)
@@ -395,6 +409,52 @@ static const struct exynos_adc_data exynos7_adc_data = {
 	.exit_hw	= exynos_adc_v2_exit_hw,
 	.clear_irq	= exynos_adc_v2_clear_irq,
 	.start_conv	= exynos_adc_v2_start_conv,
+	.read_value	= exynos_adc_v1_read_value,
+};
+
+static void exynos850_adc_init_hw(struct exynos_adc *info)
+{
+	u32 con1, con2;
+
+	con1 = ADC_V2_CON1_SOFT_RESET;
+	writel(con1, ADC_V2_CON1(info->regs));
+
+	/* Bring out of reset */
+	writel(0, ADC_V2_CON1(info->regs));
+
+	/* 64 times conversion */
+	con2 = ADC_V2_CON2_C_TIME(6);
+	writel(con2, ADC_V2_CON2(info->regs));
+
+	writel(1, ADC_V2_INT_EN(info->regs));
+}
+
+static void exynos850_adc_exit_hw(struct exynos_adc *info)
+{
+	u32 con2;
+
+	con2 = readl(ADC_V2_CON2(info->regs));
+	con2 &= ~ADC_V2_CON2_C_TIME(7);
+	writel(con2, ADC_V2_CON2(info->regs));
+
+	writel(0, ADC_V2_INT_EN(info->regs));
+}
+
+static u32 exynos850_adc_read_value(struct exynos_adc *info)
+{
+	return readl(ADC_EXYNOS850_DAT(info->regs)) & info->data->mask;
+}
+
+static const struct exynos_adc_data exynos850_adc_data = {
+	.num_channels	= MAX_ADC_V2_CHANNELS,
+	.mask		= ADC_DATX_MASK, /* 12 bit ADC resolution */
+	.needs_adc_phy	= false,
+
+	.init_hw	= exynos850_adc_init_hw,
+	.exit_hw	= exynos850_adc_exit_hw,
+	.clear_irq	= exynos_adc_v2_clear_irq,
+	.start_conv	= exynos_adc_v2_start_conv,
+	.read_value	= exynos850_adc_read_value,
 };
 
 static const struct of_device_id exynos_adc_match[] = {
@@ -419,6 +479,9 @@ static const struct of_device_id exynos_adc_match[] = {
 	}, {
 		.compatible = "samsung,exynos7-adc",
 		.data = &exynos7_adc_data,
+	}, {
+		.compatible = "samsung,exynos850-adc",
+		.data = &exynos850_adc_data,
 	},
 	{ }
 };
@@ -484,10 +547,9 @@ static int exynos_read_raw(struct iio_dev *indio_dev,
 static irqreturn_t exynos_adc_isr(int irq, void *dev_id)
 {
 	struct exynos_adc *info = dev_id;
-	u32 mask = info->data->mask;
 
 	/* Read value */
-	info->value = readl(ADC_V1_DATX(info->regs)) & mask;
+	info->value = info->data->read_value(info);
 
 	/* clear irq */
 	if (info->data->clear_irq)

-- 
2.51.0

