Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616625;
	b=YziAoQxpSV4fGLJ6qTDKFcVNbMCz9aCaCNoj+rjjV9B7NHj9SI0QM7ngzDXEo3Avn5J2
	 OthYur1sbdZb0y+6OAZnundIypYaa4h/Nfnzf5ciACvOI0E3DDEm5N/bvk7adGqXt1FQt
	 VbmpQQHq0XJmCCYaBEMKNiddo6rRRrsWnqOSWGhP+VQGKHW2vfgjQcoyX/xPjIw8JzSnv
	 eioQFTOrGqa/LNdySftnH9yGboyhnSZzRP7Eeu7nOTQiaVPb+BG+07LzrtTtW+mwva9PS
	 CWXlPTrm6LTZp56wNI9XHNRb/luRlXwsWfOyXmjJzs2lb2XVy94ZXiE53oFxx8hHWUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=0/aFPQt49ikbeQUDeEJ95DjEIDG8hIXLsnOyjwQr970=;
	b=4qnJrUmO8vVrdZAJ/GTEwCn3rjZ7YvKcrrflblYhb6cerIa926vJT3gQyRqE2yFjNj9K
	 gq2Kh75ieuryNt53eis3yZzuZdWR9kfdPQgKHlQvI+eZ7SrtgFQyQaDQ1WZItVn/hmSFm
	 ERIng3y1zHpY+62NapWcTV9e0Hi15s0Kely2dnGbkBlMsuYEZXQfkWkt8aXvj4wrY1KkM
	 9o/oUXRQe2U64Gy7HgGRYe/hleDNg8Sx53KsrJ7F1ToNPxTuPZxbVzmly/p4GtBjU+Msg
	 j8y4z/Bu2mTM9axmyI0d5GWqPtJdF8wNXPPU4VK3pG0p746GgnKDGiRXHKuLgF1Sl5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hiJcPhUU;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4290606A32D
	for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Nov 2026 14:23:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4290606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hiJcPhUU
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso72561395e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Nov 2026 06:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795616623; x=1796221423; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0/aFPQt49ikbeQUDeEJ95DjEIDG8hIXLsnOyjwQr970=;
        b=hiJcPhUULAmPztjzWi/HrHtJ9NlPw0ZsmybzonAHMZG3H7hf5ktLxpZKK2WpGaRmCU
         7465xBkTFmS1/bfrtmtkafpgUPmTwg9+lIqBpUf45FbO1SEZopixDcjb0s4LeseVkc+u
         zIUeYKMAs9yZrb3vj39jbA69KUpl6jBt2qFybYiwATe4KlBLkIHVkPk8syLbLoqNrKh0
         A0GPjX/O+QsT7CZObIuq+21p3gG1LPVVg/uJbWJzRmcWG3vgSVa5Ie45HsJb2ekOXVnv
         TjBdCErxqS2XwEchv/ECFoTCqp6NeZ3Z+z1+EVFyKb+CYzHra63jzqNWVmpgv8kyhARW
         bP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616623; x=1796221423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0/aFPQt49ikbeQUDeEJ95DjEIDG8hIXLsnOyjwQr970=;
        b=Z9WUm3mK4lPOFD0nZYqThsedNRNdZ/tSC72QHDXhI5byrSkfK4G0ZBBUhvEsn1V69A
         Lj7vb60VzIGLyE7twk0B7B//azS3pF7pBcgeYgKj0430K9bvZAQ/AfRy9/R0lflSvpBn
         uXPq7heW1nWqoW+Iz0I+UiCNDvnhsg+zRrHqZPtN2QTWZzp4Lzaorsf7E9EBNUpRKdWk
         AtLoNAxkeeb8BTFrmgRtEpylC8XB9P0WmFhh3vR8yRda04ExpzvgLitHMHH8PBjvErWz
         /6z+/HPDNcgLZwTmLOxRqSB1KXGeRvSpg114yNDEmmd8ALY44xwzTpae7hi5JIn2p+rE
         DKGw==
X-Forwarded-Encrypted: i=1; AL+hErGLz8E+TeOaLBs6wJHLrxX0xOBqjAjhSiCGA0wb599Qz3XEjPsYgaZUK0RZso4tOl+JyjPMRQXo1E1ZzwxxZ3e7Vw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+nHll5CoY7H1+/thJuNXBGQBVise2C73a9YNSp/1NaSjdJjjyE
	FqrLjAF0dWgLzEKcBmEoL6Ss30VRLXZFO2jcHHlFCwBLwMSLY+6l2I6NRhPfPx80Iw8=
X-Gm-Gg: AZFdTZeqIeVZHL3zht1hh6IrvIB5N6S9PcxH36nIeDtvTxOxBLMLAl8sA1vQVM4dKv5
	soe6RqO2EuTOtYsnnl+eVa5eQAXhGDc5VQIfOb8exJnb3HbPJY0/0A8/uqdpM5GndkDNSao50gn
	p8vyrWIaeXReb8YyEH65raFkyDtP/sfnl6UO+T0QRUosMhYn/659hXEMWCjjlTP5ywPlP2QVn1P
	r3oyAkvWAIkmj5YpubQr7bV2IyIObEB76awkF8Aj0kYPxIC6oVXHulWAlflkapnJZ/0fP63H7bG
	x+0A4Sg3ULnZNJTTV/3WPmR6mc8FDzkyujg2HWR8V6LtptwN/zic9RCHRibKj1/QevEGR2BBxTw
	IydSUpX9u2IHaBUqEqD4auXUGrkZgLR8H8OtTgA8zBk8b6PPuCN7zE0o1n7+kldp0mLyvJwurby
	JUg7Vm376aUzpm1sQIw56WV9CXpriZfx5GKag06/g9DMNi6JTyjiOmDRBhXGXLcd2+MNxJv9m58
	PyGW9My8rRt1WZcwW5KB86cxCa3906/m5AZENrcomqMM3QSc+UtJZySBbY9+FEzOvBaqZ1NMfIL
	gHIHrrVAHmNz/c1gFTagGe5gROzd4GNMgLiiYWG6aWWpZXjeQmv2wUkZ7xx8k7MUIUtqFSYC62o
	5llk5qX/ZCR2eY76TTgMTzC4=
X-Received: by 2002:a05:600c:3ba3:b0:4bb:6118:4c9a with SMTP id 5b1f17b1804b1-4bb88819940mr421222855e9.30.1795616623233;
        Wed, 25 Nov 2026 06:23:43 -0800 (PST)
Received: from [127.0.1.1] ([2a02:c7c:5e34:8000:720:5dc9:500c:65bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bc8ce06sm33638667f8f.47.2026.11.25.06.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:23:42 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 25 Nov 2026 14:23:35 +0000
Subject: [PATCH v2 3/5] iio: adc: exynos_adc: add Exynos850 support
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-exynos850_adc-v2-3-26de1c6f1717@linaro.org>
References: <20261125-exynos850_adc-v2-0-26de1c6f1717@linaro.org>
In-Reply-To: <20261125-exynos850_adc-v2-0-26de1c6f1717@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, 
 Sam Protsenko <joe.skb7@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.14.3

The Exynos850 ADC controller located inside the CMGP block differs from
other Exynos ADC controllers, mainly in its register layout.
Specifically, the data register sits at offset 0x08.

Add the exynos850_adc_data struct that describes Exynos850 ADC ops.
It also requires its own hardware initialization and exit routines.
Add them as well.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/iio/adc/exynos_adc.c | 50 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/iio/adc/exynos_adc.c b/drivers/iio/adc/exynos_adc.c
index a1124a418f29..3e9b5d28b922 100644
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
@@ -410,6 +412,51 @@ static const struct exynos_adc_data exynos7_adc_data = {
 	.read_value	= exynos_adc_v1_read_value,
 };
 
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
+};
+
 static const struct of_device_id exynos_adc_match[] = {
 	{
 		.compatible = "samsung,s3c6410-adc",
@@ -432,6 +479,9 @@ static const struct of_device_id exynos_adc_match[] = {
 	}, {
 		.compatible = "samsung,exynos7-adc",
 		.data = &exynos7_adc_data,
+	}, {
+		.compatible = "samsung,exynos850-adc",
+		.data = &exynos850_adc_data,
 	},
 	{ }
 };

-- 
2.53.0

