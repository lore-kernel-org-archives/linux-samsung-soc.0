Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616624;
	b=H5rhAFndoGUhw8LQgoJf8C9fFzTOGWSSmfnXkZEWzDdfmkj5GSbZjx9sqpFNKC0liJ9y
	 RoZX2KArrM+KB/XDdxruzf7t205M1v06atUWPuVPuVURM6Akqd5xjJHBiyS98JffeG42/
	 rZzi2MHpRM4AuFpg2JxSEuDOWY5WHdZFM7pNGhXiRbavtvBB8mSrSJrUQUuzu/kH3HKCa
	 Wk9gccEgzFz9tkt+ysfCHuAB5PUzdD8rjZ78UcQ8ExjST62kABHmor6roV+3C3DqjeaWd
	 dB4MIMYAvk+N+lfSy99hHLrK30FZ5O+SGPoLBuHukHS8xuaYLUS161RF3VNSD3bQS5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=XcsPi3qvnIrsdxjh28gNxRodworsSCcyn+GNHNwrRhE=;
	b=SQWF2P4G1TG0JsiX468wiuZHB3OaZ1o96i1Yx4hN3F3KSuflTy0JrpzAGjoT+CHP45AJ
	 GrwAuUpXyx0jg1EUKn8LWGZQyTp7OgylDbH3NIswkZXp0NCVbmYxZVx2GSHglN8aIfRw7
	 KahdrlLQTqhD1qZoV0Ye+ubumZJxhM2KZ9759rseFepaQC+H07QLska0Zgyc+CXNchHF4
	 kcT2uzSzKMb2o8+EWq/DP5NyKIVBUhwsqwpFXtl5zke3iuPsF8fVIy4lTZqRL5CQcFgFs
	 wvpLEV08H3eqsmoq85MXc+8JpV6MQQPGl46EoqjYiPVt3bf+HRc59c3ek+t8l4E0ERw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zSRPf0Ga;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99852606A32E
	for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Nov 2026 14:23:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99852606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zSRPf0Ga
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e47347279so3530623f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Nov 2026 06:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795616622; x=1796221422; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XcsPi3qvnIrsdxjh28gNxRodworsSCcyn+GNHNwrRhE=;
        b=zSRPf0GaSxYn6WB59LekBw8DtzCIiRITMNpj6fxnvi7Mcvl1SVAq2IfQBui3mZrVIZ
         UAzDUFArtgCznflzWqJDcZtEwsZcjh1boX/y++Sty31fL7KE6OrkAfkPrmHVpeErcZzS
         lToPf6l2QHRbYp+aNC7BGrHeK/uIvm1Cg4z1ShCVz3fGx41HwrOO8/Am10NMjKifqCPA
         HAlOXBEr2q8Uv7BL0T/9EyDqgWlTngO8yiOTvldiQ8NeXQMWiPJxxFUHPomHkqrK0OAN
         GwJYyIR8Oe/Usx3KacEOpadWbof3LBP3+MfXfhMZI7ICcFd/ehtN/GWGaJhS3lynteKc
         jdog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616622; x=1796221422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XcsPi3qvnIrsdxjh28gNxRodworsSCcyn+GNHNwrRhE=;
        b=joIiCO/MZtuCHj3xokWHhWpsVHfiR3RhAs3YnYMs4tE94ytp34wR4aTVTwFjrqMU1A
         MnIvcpROXw1Oh3w43SX3ydFL98hvejEAo4SKa7h5SxP2m3w0xOeDQlIbCBDsRG/gCGor
         CVreh7zSnIfmGkBBRBZft5NS2+jUg9LPNDMA7qcrf28+NUASBln6Yg4QLyStRDNWOojy
         pQ9HLmn2waAvKdDaPc17w5wyU5ywgIdJ2S7OfMXXoJz47Vx8kUzl+nASLLHvMpEeNM/Y
         ZzzAR9fs73jKOt5fZOOt698bpTWAxKORNtabpYdARuc3qNwnMOvAfze/hrgSkWUtQ0Fk
         278g==
X-Forwarded-Encrypted: i=1; AL+hErFskjJA7Buu4PSbavL0cC1cnDslRbYEzBOWtXA4AcSIhyOV1sAOmZT28sjE7FCZ05as8N03QJUHs/EffAX17m/2PQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/knBPnUrRR2Vw9OAXPLcRlQdAkglj83iJ+p7/CLbdLIXGP5ufu
	AvttZZcT1Hu77mMzFMqjDCTQuv1mKzEwvNcUA9f/nqdubMGIG5hdSS4P/dZW7e4PnE8=
X-Gm-Gg: AZFdTZcZ+2X204qvIwS6UE2oNaku1hEIGqduOXOmYYkqUJRd09oW+Tjqt+2vvr53ENk
	QxjhzhP/FGTEr27TkZFHaKvpzkKjAdprkTu6MnwXiiE2xmm0Q2T4LfFCfL0+Ggmx6MOC8uekwtr
	4qNQPMT4z7TdK0r8wy4TWb00PGP/6yYRoutyTeZqvd2cFMt7alhp3QrplMXK+nWpsyddxTWB3+O
	T338+G89aCMEH/526no03D0pcNVdrCi3fGtW1eh7rxODUvFe6h0QULF/MHd+myTnmMgebduqXyJ
	pSyJS5uxJ97ZpSANjymfWv3JM3caavhDPlAQkE515YSJBbsu0CCZQt2vrKWe3dGxymbK/yGn1OT
	rTZrT259deQ5pir+n1fDL5wrF3g4lH4BTH+CXD21UPzctS1P/B7VRrddLmA5smOjQzK/tF/Dagf
	eybwzM6wyhA+gHUyyMj/TU+fKNfKl/85HuGp/KswiJ6BnLc0q9GgZv4WxRrItTtSEZv0SK37EtQ
	dSDOIBwStBMdbCqRnF/0B7ik62ZM+jgPqBpnW7hRQIS9P3RwFD6xFaKJOZo/697+eclx/9nICUI
	yo1a9oUA8gSmMHxKq9AQoo054uIaKBjMihPEEOxFxxJX6BaWJVUcTqdZTbVpowsmS7we8fviabX
	TOPwhU3k3g/56kdyNJOpaHg==
X-Received: by 2002:a5d:428b:0:b0:49d:78ad:a2ec with SMTP id ffacd0b85a97d-4abb47b1ba6mr27250862f8f.25.1795616622030;
        Wed, 25 Nov 2026 06:23:42 -0800 (PST)
Received: from [127.0.1.1] ([2a02:c7c:5e34:8000:720:5dc9:500c:65bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bc8ce06sm33638667f8f.47.2026.11.25.06.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:23:41 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 25 Nov 2026 14:23:34 +0000
Subject: [PATCH v2 2/5] iio: adc: exynos_adc: add ->read_value() callback
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
Message-Id: <20261125-exynos850_adc-v2-2-26de1c6f1717@linaro.org>
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

The ADC data register offset differs between SoCs. In preparation for
adding Exynos850 support, abstract reading the conversion result into a
->read_value() callback in struct exynos_adc_data.

Add exynos_adc_v1_read_value() for the existing SoCs and use it from the
interrupt handler. No functional change intended.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/iio/adc/exynos_adc.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/exynos_adc.c b/drivers/iio/adc/exynos_adc.c
index c1a0061b16ca..a1124a418f29 100644
--- a/drivers/iio/adc/exynos_adc.c
+++ b/drivers/iio/adc/exynos_adc.c
@@ -133,6 +133,7 @@ struct exynos_adc_data {
 	void (*exit_hw)(struct exynos_adc *info);
 	void (*clear_irq)(struct exynos_adc *info);
 	void (*start_conv)(struct exynos_adc *info, unsigned long addr);
+	u32 (*read_value)(struct exynos_adc *info);
 };
 
 static void exynos_adc_unprepare_clk(struct exynos_adc *info)
@@ -195,6 +196,11 @@ static int exynos_adc_enable_clk(struct exynos_adc *info)
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
@@ -252,6 +258,7 @@ static const struct exynos_adc_data exynos4212_adc_data = {
 	.exit_hw	= exynos_adc_v1_exit_hw,
 	.clear_irq	= exynos_adc_v1_clear_irq,
 	.start_conv	= exynos_adc_v1_start_conv,
+	.read_value	= exynos_adc_v1_read_value,
 };
 
 static const struct exynos_adc_data exynos_adc_v1_data = {
@@ -264,6 +271,7 @@ static const struct exynos_adc_data exynos_adc_v1_data = {
 	.exit_hw	= exynos_adc_v1_exit_hw,
 	.clear_irq	= exynos_adc_v1_clear_irq,
 	.start_conv	= exynos_adc_v1_start_conv,
+	.read_value	= exynos_adc_v1_read_value,
 };
 
 static const struct exynos_adc_data exynos_adc_s5pv210_data = {
@@ -274,6 +282,7 @@ static const struct exynos_adc_data exynos_adc_s5pv210_data = {
 	.exit_hw	= exynos_adc_v1_exit_hw,
 	.clear_irq	= exynos_adc_v1_clear_irq,
 	.start_conv	= exynos_adc_v1_start_conv,
+	.read_value	= exynos_adc_v1_read_value,
 };
 
 static void exynos_adc_s3c64xx_start_conv(struct exynos_adc *info,
@@ -295,6 +304,7 @@ static struct exynos_adc_data const exynos_adc_s3c64xx_data = {
 	.exit_hw	= exynos_adc_v1_exit_hw,
 	.clear_irq	= exynos_adc_v1_clear_irq,
 	.start_conv	= exynos_adc_s3c64xx_start_conv,
+	.read_value	= exynos_adc_v1_read_value,
 };
 
 static void exynos_adc_v2_init_hw(struct exynos_adc *info)
@@ -356,6 +366,7 @@ static const struct exynos_adc_data exynos_adc_v2_data = {
 	.exit_hw	= exynos_adc_v2_exit_hw,
 	.clear_irq	= exynos_adc_v2_clear_irq,
 	.start_conv	= exynos_adc_v2_start_conv,
+	.read_value	= exynos_adc_v1_read_value,
 };
 
 static const struct exynos_adc_data exynos3250_adc_data = {
@@ -369,6 +380,7 @@ static const struct exynos_adc_data exynos3250_adc_data = {
 	.exit_hw	= exynos_adc_v2_exit_hw,
 	.clear_irq	= exynos_adc_v2_clear_irq,
 	.start_conv	= exynos_adc_v2_start_conv,
+	.read_value	= exynos_adc_v1_read_value,
 };
 
 static void exynos_adc_exynos7_init_hw(struct exynos_adc *info)
@@ -395,6 +407,7 @@ static const struct exynos_adc_data exynos7_adc_data = {
 	.exit_hw	= exynos_adc_v2_exit_hw,
 	.clear_irq	= exynos_adc_v2_clear_irq,
 	.start_conv	= exynos_adc_v2_start_conv,
+	.read_value	= exynos_adc_v1_read_value,
 };
 
 static const struct of_device_id exynos_adc_match[] = {
@@ -484,10 +497,9 @@ static int exynos_read_raw(struct iio_dev *indio_dev,
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
2.53.0

