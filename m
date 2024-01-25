Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF7D74E27
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 15:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706195809; cv=none; b=AjcP4LY7Zeof3jNzm4nnRyRaA8GLlDZ0I+KvXdOUDFL9s5zNmStp47yy455YgPvfEbIiWP9Bfh6QcLpNk1SRG8AAF3sn+sNIUKBDD45tgVPwIaptOhF173BznibkWhkIcBoUHXk6QwALMypNUOHcuN1q8m1yHL5dWYDSV9ihf4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706195809; c=relaxed/simple;
	bh=FTTDJwnrK7E36EZxAV/LZq7tKNV5qxmi0FcnlYPFXNo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XbbH9XOYo27gyt5/SbelTZ2cuO9vTw518MdUaZdUhq0KNVlW1cqZv47euwsiKCD1/pTY38t+kHP1UlOoQtzOaAkHFl/wDPe8DLbahewQQiT1iTwNJOpbpruOgIbGdCezZcZhJuZysjCr/Z2PyXW02tj8So8ovwN+wnOHs2i2R+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oL/tsqkJ; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oL/tsqkJ"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-339231c062bso4833467f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 07:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706195806; x=1706800606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tXxPqJOvoUlfXn9BCYWKqTCOJ1mrScyukPmjwSmqHnA=;
        b=oL/tsqkJP1HMjNzmSZkZ+FaSw18KYThdi3vq/Mg/dr1SI7EXLVBV1fQesMc67jXTNr
         vyfkWNxr5SoZWu4YtChPmBejXmZ7a7ChhsyCAe2FGtMB3DSmkOAyUO8HZs4+vbjryEdP
         c1r3OtYVfW2l9j8jE46VHTr8BmazimQ79t0pEo832pTqoQfi9oB8I4FhLaw126b/9cxm
         0jWn/OoRoUTRFFq1cnzSQlqlc+gDq+cI5fRtLXuqTXbyelnOrqjeMkmzjUUWinPFb0or
         ZAjbM+CrjDLrDfDhjVgWxlpZNAS9W09qngbw9z1GDOA5vhy+14E50UzGMafSh4zfrmJz
         o+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706195806; x=1706800606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tXxPqJOvoUlfXn9BCYWKqTCOJ1mrScyukPmjwSmqHnA=;
        b=Wz1QMj6AZZBkfynB72MZlIaOAKKgK5DMzsKdUcYRln5V8/RIOB2SM/9CJBfOV1G+ga
         EkQ2PJswrVSqeCk6IgBO2VxnGMqo2F4jvCfc29UrgGgv90gNXdWaPwsiQxtaW7nmEPv0
         TTCSiUkInHmnoylRDxEXQ2/T3+UurVtIxuo0cK9pU4AAbhAbrlwtSBjP6JphcdIXxNkA
         p/yPYealC2d31F375ln6qxarYKqYdbacsGv9nqf3A8SrAW9uJ3Gz3LW6Hxeg8k7qpiyE
         5OOtPKtu4+KbnXWIE8KLAaXDUHwFddjIpH/e15ZcVX6kxydbPJp9x9Eap+/9wY1UTbO5
         8Zhw==
X-Gm-Message-State: AOJu0YxtLUgfTJPmcY4gS7bglzMXVSRKwNQK0lDDzb2993wEwU8wdqf+
	DNqOuDmLnv3CYdvNyj5O+CF4Ub+Cj6D2RU78b2QRfS3PseKsiE1TL8onbPrLxRo=
X-Google-Smtp-Source: AGHT+IFOoZHXMIT/4Zve03YeeUbOYEFQZSqJR86REuQDoTvLqWV4vzsg7EY4ouv402Ob73dh/Vbehw==
X-Received: by 2002:a5d:4407:0:b0:33a:c013:68d7 with SMTP id z7-20020a5d4407000000b0033ac01368d7mr530130wrq.11.1706195806021;
        Thu, 25 Jan 2024 07:16:46 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id q17-20020adfcb91000000b00337d3465997sm3184656wrh.38.2024.01.25.07.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 07:16:45 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: krzysztof.kozlowski+dt@linaro.org,
	broonie@kernel.org
Cc: robh+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org,
	andre.draszik@linaro.org,
	peter.griffin@linaro.org,
	semen.protsenko@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 5/7] ARM: dts: samsung: exynos5450: specify the SPI fifosize
Date: Thu, 25 Jan 2024 15:16:28 +0000
Message-ID: <20240125151630.753318-6-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240125151630.753318-1-tudor.ambarus@linaro.org>
References: <20240125151630.753318-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Up to now the SPI alias was used as an index into an array defined in
the SPI driver to determine the SPI FIFO size. Drop the dependency on
the SPI alias and specify the SPI FIFO size directly into the SPI node.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm/boot/dts/samsung/exynos5420.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/exynos5420.dtsi b/arch/arm/boot/dts/samsung/exynos5420.dtsi
index 25ed90374679..e22692063aa9 100644
--- a/arch/arm/boot/dts/samsung/exynos5420.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos5420.dtsi
@@ -658,6 +658,7 @@ spi_0: spi@12d20000 {
 			pinctrl-0 = <&spi0_bus>;
 			clocks = <&clock CLK_SPI0>, <&clock CLK_SCLK_SPI0>;
 			clock-names = "spi", "spi_busclk0";
+			samsung,spi-fifosize = <256>;
 			status = "disabled";
 		};
 
@@ -674,6 +675,7 @@ spi_1: spi@12d30000 {
 			pinctrl-0 = <&spi1_bus>;
 			clocks = <&clock CLK_SPI1>, <&clock CLK_SCLK_SPI1>;
 			clock-names = "spi", "spi_busclk0";
+			samsung,spi-fifosize = <64>;
 			status = "disabled";
 		};
 
@@ -690,6 +692,7 @@ spi_2: spi@12d40000 {
 			pinctrl-0 = <&spi2_bus>;
 			clocks = <&clock CLK_SPI2>, <&clock CLK_SCLK_SPI2>;
 			clock-names = "spi", "spi_busclk0";
+			samsung,spi-fifosize = <64>;
 			status = "disabled";
 		};
 
-- 
2.43.0.429.g432eaa2c6b-goog

