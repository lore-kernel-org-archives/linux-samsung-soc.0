Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795873911;
	b=SXL78ajd0lpFsjVsd21arM0EEOjliRTN0v+C77IBrAjN9cVqalL23/kiFa8mnVQGRoe8
	 veWTln3ZOF9J0gPvQCXcLqiyeK98DiUY+A5RQmjbk8DXdazzIMi6Tzxlh420WucWaG/J4
	 dOFHyVnAswN5f8+w8zPy9sQxHI4X7K/IY9WGhe2VeMBZHpyuxOgtzsKvLirKffF8qnVpy
	 uY2ntvylRhHhSMXklXq3xAHsIN9xaEBy+p9c3urkLfiP/VviY8l1TnDZdY4QAfuGy8Enh
	 auXhFyyzY41x1bhDiIWoJZSpdzXEjiW6OKOa9OfxbI6JdreBG833LYdmmlOZw+PA6dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795873911;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Rspamd-Queue-Id;
	bh=OKhL1RyQfYU1mPuHr0IfuJwmsiVrtkgY2MGvOoQEXQI=;
	b=w0ukJvN0XYQ1vTos/UXP9tstk67HOCJHl7Xt2xoAPASEFH5GmRNLF2m0HF4HCbK5deDV
	 gT2kX+/ghOW8VWdbN7z9VuY49liStLA7h4FT/p3KpW4+6pDhcqeoh1hhoDk+D/k0Hp+HY
	 HWksQKFyoh/bFmaGkoKI7ou+c4yibCIR0aDxjJJ41GCH/9SuC8swVysRJEsQHVrfbISCe
	 nfpG8Vcvsmyc5ptMFnBvg02e0etb8WILf5U/fwH0USijhxVQm7660FeOWPGZ7FtlKn7w8
	 8UphRiKMHb6g2H2JEMTKvxOaERpVRRbUSV/2J+a5whWWyV2jhq/uZFzL5BHNr0chlFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=timmermann.space;
	spf=pass smtp.mailfrom=timmermann.space;
	dkim=pass header.d=timmermann.space header.i=@timmermann.space header.a=rsa-sha256 header.s=MBO0001 header.b=ZTi0SnQ7;
	arc=none smtp.remote-ip=80.241.56.161
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41278606A33F;
	Sat, 28 Nov 2026 13:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41278606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=timmermann.space header.i=@timmermann.space header.a=rsa-sha256 header.s=MBO0001 header.b=ZTi0SnQ7
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4jcBXc3F2tzKmKQ;
	Sat, 28 Nov 2026 14:51:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timmermann.space;
	s=MBO0001; t=1795873904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OKhL1RyQfYU1mPuHr0IfuJwmsiVrtkgY2MGvOoQEXQI=;
	b=ZTi0SnQ761ftQ76weU0n1A3/YmDfFdNU1xg7TdNjlucRyuClqIcli1CZ28xqIHJegWFDkK
	hqnN9ExaiasEDTNFivXo/6fpEbvYOXGN98xR1FNFKUZnNgZVU2J+5vMxxH73SlKe+oh830
	llLOC+ocz9vWMBDSeLIpbvvCSesZaW8e5sWWkbvHRM41txTjRMgiT+1zNsUsdOo6WAUasI
	+FwJUGAnBwI2HUY+v8Jsb455Bk4GvernpEr9cWEvvSKi7ie2Z4f7M42F2Pj4/xgUXkJpax
	HeY0NEVzIrXK9LKKoGwqSoQq6GKdnUeZO+4euFPMwJtFMPm5c2AWx2Hrv31Wtw==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of foss@timmermann.space designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=foss@timmermann.space
From: Lukas Timmermann <foss@timmermann.space>
Date: Sat, 28 Nov 2026 14:51:33 +0100
Subject: [PATCH v2 6/7] arm64: dts: exynos: gs101-raven: add S6SY791
 touchscreen
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
Message-Id: <20261128-lat3st-google-raven-touch-upstream-v2-6-1be5c1029087@timmermann.space>
References: <20261128-lat3st-google-raven-touch-upstream-v2-0-1be5c1029087@timmermann.space>
In-Reply-To: <20261128-lat3st-google-raven-touch-upstream-v2-0-1be5c1029087@timmermann.space>
To: Lukas Timmermann <foss@timmermann.space>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 4jcBXc3F2tzKmKQ

Configure USI11 as SPI controller and add the S6SY791 touchscreen with
its supplies, reset and interrupt lines.

The touch SPI bus can be muxed between the AP and the AOC coprocessor
via TS_SPI_SEL (gpp26-1). Hog it low so the AP owns the bus.

Signed-off-by: Lukas Timmermann <foss@timmermann.space>
---
 arch/arm64/boot/dts/exynos/google/gs101-raven.dts | 50 +++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-raven.dts b/arch/arm64/boot/dts/exynos/google/gs101-raven.dts
index 7c4273796a22..02b19e39055a 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-raven.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-raven.dts
@@ -47,3 +47,53 @@ &framebuffer0 {
 
 	status = "okay";
 };
+
+&gpp26 {
+	/* TS_SPI_SEL: low = AP owns the touch SPI bus, high = AOC */
+	ts-spi-sel-hog {
+		gpio-hog;
+		gpios = <1 GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "ts-spi-sel";
+	};
+};
+
+&pinctrl_gpio_alive {
+	ts_irq: ts-irq-pins {
+		samsung,pins = "gpa9-0";
+		samsung,pin-function = <GS101_PIN_FUNC_EINT>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+};
+
+&spi_11 {
+	cs-gpios = <&gpp23 3 GPIO_ACTIVE_LOW>;
+	num-cs = <1>;
+	pinctrl-0 = <&spi11_bus &spi11_cs>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	touchscreen@0 {
+		compatible = "samsung,s6sy791";
+		reg = <0>;
+		spi-max-frequency = <10000000>;
+		spi-cpol;
+		spi-cpha;
+
+		interrupt-parent = <&gpa9>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&ts_irq>;
+		pinctrl-names = "default";
+
+		reset-gpios = <&gpp26 0 GPIO_ACTIVE_LOW>;
+
+		vdd-supply = <&s2mpg10_ldo25m>;
+		avdd-supply = <&s2mpg10_ldo26m>;
+	};
+};
+
+&usi11 {
+	samsung,mode = <USI_MODE_SPI>;
+	status = "okay";
+};

-- 
2.56.1

