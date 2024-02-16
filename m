Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2F012CDBD
	for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Feb 2024 14:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708092302; cv=none; b=B//8Dy/Y+8eMQnpvyZSDxM53iRfFR7RT9fucfsB56RP/PGJweArEmiHMhEhre1pxdHXcP3gl5zphaNCTkcuVsR9YhaSPfywZe3OoD0R7XJXnVx5C61Y6k9Mwqf652KDlqXYV7dtHzGNB3ewv4rfDd6i4zb3PHLW8wbyIUUxexxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708092302; c=relaxed/simple;
	bh=GrK2q7DlbtQY1WTzK5R2HznL/kcWzqoRab2apDhvAwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sdvXJwPf3CbexGmqh1PgGAqH452IF1rjdoXCooNUihu+WmgqUQ55Ye+4guJ8kvc73Y1gVTva7dQ3M1dP0ABjAhM5x1Y4+FQ7z6rtXU60LZv514Gb1CHZ675pvP9W7zjAyXEg3I1d5fW9CtqOultFcQ+w1PJAkNmA5tsR+x31wMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F5kRviix; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F5kRviix"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d204e102a9so26007161fa.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Feb 2024 06:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708092298; x=1708697098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJ7Tgql1DL0Frghi7Oag5F57dXBGRkIPbGxxgHm6Hxc=;
        b=F5kRviixUT2g4dXXaYzE5Qi4U7r2Fs9lIXFAJhsNm4wJtRp4l8gNFAt5guF2WeizA7
         DIiL33iiWT0KoO3XAhvBPhgDaDS07TTHZHoWo6mdpo7Ikw6AKyf1DfNEwOBcyUKzKfd3
         5SwIoUMli8IPxsh4YENSCJ5bswBmMNKv4xyGPz/FDCqU90wPDbrEYp4sLtRWxW/eE6RK
         ZzSiIzbQiL5GE9xo7+Avlf88zpNcNWXo9206uScGpAg/uAi116AgpXHII9EyLMHX6gxo
         VN0dAyDM/iINvkQoypyfXgHOGlN4FInoUujg69cklkU51sV4QExPm4Cm2npOD8PJKEWP
         dR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708092298; x=1708697098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJ7Tgql1DL0Frghi7Oag5F57dXBGRkIPbGxxgHm6Hxc=;
        b=Ky+FC+mrXiLSwsW8UXsOI6JrhyG52jHIN3srz5u4H/1yQxJBe6nAikORP/ZUWiAzjj
         +yeRfPfYfNJ4ObBbm73fw+93bQJEUjWLYX+34vY6Ndw4jN8xyaTHbdkarBXjacC+fGt8
         2ViMnDIVvaVnKqGN3o8WWee0GbC2TjE+dtRRqrIlMcrlAsdwOUz2LpfQkK6CBQ3NaIeC
         N3ZjygbhHH6eUJQTNv7ahYwG1+mzK8bKJvBbVynVrlrT3oxb+5N5yIF447p4B6S63BBP
         YqQIc4uPEf8Nu0+iA7tI3KrjYE2RFTkEDrGLnh7OmHe7449SVW7xIzeA8N0jtrAN/T2S
         5HLA==
X-Forwarded-Encrypted: i=1; AJvYcCVUDDgm10zcEas1lTy4QRHqUtLKgIwlEfzsrMM2BiK8C0cK0ujwhKE4zqVsCPC55+bM546oYIAcutoKdvyJyFYUvXnO10rflvePeaK/vR4VSqg=
X-Gm-Message-State: AOJu0Yy7/Ix1TsP1YRTYD3q1C+vkz5ByG+frRsHQeskY8OHQ5Zi7idpD
	j6KxnWYP8VM+bdbSSFRZ31SQnjvjq49AEaTLb9gGUGs+1XH7ZSb0ae+e+xKrHss=
X-Google-Smtp-Source: AGHT+IGa96Bfo9g5nXjjGLG0eTx75/Ggxg2VA+hGJqraejkAQYX30I75/4p3/e+XG2Q57P8TXVx7Bg==
X-Received: by 2002:a2e:a686:0:b0:2cd:706a:8ec8 with SMTP id q6-20020a2ea686000000b002cd706a8ec8mr3392254lje.10.1708092298240;
        Fri, 16 Feb 2024 06:04:58 -0800 (PST)
Received: from ta2.c.googlers.com.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id az5-20020a05600c600500b0040e4733aecbsm2516628wmb.15.2024.02.16.06.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 06:04:57 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: krzysztof.kozlowski+dt@linaro.org,
	robh@kernel.org,
	conor+dt@kernel.org
Cc: alim.akhtar@samsung.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	broonie@kernel.org,
	andi.shyti@kernel.org,
	semen.protsenko@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	andre.draszik@linaro.org,
	peter.griffin@linaro.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 4/7] ARM: dts: samsung: exynos5420: specify the SPI FIFO depth
Date: Fri, 16 Feb 2024 14:04:46 +0000
Message-ID: <20240216140449.2564625-5-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
In-Reply-To: <20240216140449.2564625-1-tudor.ambarus@linaro.org>
References: <20240216140449.2564625-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Up to now the SPI alias was used as an index into an array defined in
the SPI driver to determine the SPI FIFO depth. Drop the dependency on
the SPI alias and specify the SPI FIFO depth directly into the SPI node.

exynos5420.dtsi defines the following aliases:
	spi0 = &spi_0;
	spi1 = &spi_1;
	spi2 = &spi_2;
spi-s3c64xx.c driver defines the following fifo_lvl_mask for the
"samsung,exynos4210-spi" compatible:
	.fifo_lvl_mask  = { 0x1ff, 0x7F, 0x7F },
Thus spi0 was considered having a 256 byte FIFO depth, and spi1 and spi2
having 64 byte FIFO depth each. Update device tree with these FIFO depths.
No functional change expected.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm/boot/dts/samsung/exynos5420.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/exynos5420.dtsi b/arch/arm/boot/dts/samsung/exynos5420.dtsi
index 25ed90374679..196c6d04675a 100644
--- a/arch/arm/boot/dts/samsung/exynos5420.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos5420.dtsi
@@ -658,6 +658,7 @@ spi_0: spi@12d20000 {
 			pinctrl-0 = <&spi0_bus>;
 			clocks = <&clock CLK_SPI0>, <&clock CLK_SCLK_SPI0>;
 			clock-names = "spi", "spi_busclk0";
+			fifo-depth = <256>;
 			status = "disabled";
 		};
 
@@ -674,6 +675,7 @@ spi_1: spi@12d30000 {
 			pinctrl-0 = <&spi1_bus>;
 			clocks = <&clock CLK_SPI1>, <&clock CLK_SCLK_SPI1>;
 			clock-names = "spi", "spi_busclk0";
+			fifo-depth = <64>;
 			status = "disabled";
 		};
 
@@ -690,6 +692,7 @@ spi_2: spi@12d40000 {
 			pinctrl-0 = <&spi2_bus>;
 			clocks = <&clock CLK_SPI2>, <&clock CLK_SCLK_SPI2>;
 			clock-names = "spi", "spi_busclk0";
+			fifo-depth = <64>;
 			status = "disabled";
 		};
 
-- 
2.44.0.rc0.258.g7320e95886-goog

