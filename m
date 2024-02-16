Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A55312CD98
	for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Feb 2024 14:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708092301; cv=none; b=XPD38s2C0YHdZVDkJBbCliCtsrRzODex5RMfFj1T7cUQjOrTEd51L292EfQS0JRYoa86LvgAdEH4YyMVjXvcYrr+0dw+NV2MOQWFm+P+qFFti+vVHMEIn3VuckUgwnKT3Rta0x1aXZE0q4N5KgOZKxaoaO2DLsAexKEVT56Z12o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708092301; c=relaxed/simple;
	bh=+4hpMqvo2MaSV4b7Jg+jh1kB57aNCVnu3p9sey7n17U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nC9JDTpmWEF7kZw5+n7Flgj4OGOy2Ue6le56UBGBJyJ9o0cU1IGwK9r1VRi3+Cvx7ZXmV37l5j0Oqk0XLoYJ/jrs9KFWxCwJQyfOHjXomE3fPV1uc2gTRST8zGmpbtw09Ca9CfUkY/qlwzudycgRJhzbPM4Vu9s17Dt+tXmMBPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hFKwSnqL; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hFKwSnqL"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2d0a4e8444dso7596111fa.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Feb 2024 06:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708092297; x=1708697097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Zx9+5BqwaAzaN+5Db7Ws66Fn8aez1AAIMWd7GQ05DA=;
        b=hFKwSnqLmXqQTdpYBPsQdOEWUrzONHDWt4keqbkASzd0muwDJ8vyTolaAyrztEnnSG
         f3KGRc3xkUofEtfFw1CUgoxrhQb3Aw1iRcagvvIGiL5AZ6RGcxmq4hUGVeEkHthZjMmK
         VSIdg78rXb5549cBo4AYqnGfbSSRzNTjwCdCdCKl9041E9veb3u/r7Pa/SnpxU5hJqdD
         ehz6nqPxvmAjkPuE6jmRorVscVb7sr/LZnBlu/ENRJoOC6yJC0U/E+hNBigAP1xgtYt9
         J3rNJtKN8JqYK7MT48B91h98TIwee/HxIk8fS93Nw6ryVy34SkX09eI7hYlbuykPYqE9
         aDRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708092297; x=1708697097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Zx9+5BqwaAzaN+5Db7Ws66Fn8aez1AAIMWd7GQ05DA=;
        b=sbBdbuAxW8yFMtYMyJ2tz1XgEU0IGEuQqeErq0t5UZqlNyeZ8oxKTl/mNKxgjEbDYR
         tSm7lAEjUn7NKrN/Jt5XO2AKh2sZQgZUxAoYZ6lun07J+RNju6Ecfzt/Ud894NOAL9j5
         CT36SKAUEWr+hgspqvw7p2P8cTspsA8XApw95OsWt8lL2/dTogtxmcm9OYwFxLwSn/4q
         4HjK/f2EGGz0sQuhlPOzYArAhUgF5UT+3HW59kvUTdjc3IJP7EB4lwuRII9JXWLCX+HF
         h2vzpStuhZfMJVP0RtlhF98ilKsrk0VYB+uqQMglm0xfz8jvQ+jye6Pte5WC+0UR0k4b
         qF0g==
X-Forwarded-Encrypted: i=1; AJvYcCU3TgLJlcBTHxRP99y84AKS0bg8F1TVEPmK4vWNyJ0SNhIJtmQazkwPjNCGplBsKn5kUPR7ZkkPMZMFydObFm+O1arNvUzjDIlaVFyIEbdjrNg=
X-Gm-Message-State: AOJu0Yxfac9JO2v5UtzhYvA8fRa9XBVtge2xcVpk0slKCCuXCfx4Jt1M
	EboEhRmk4AicpIcUTSrFDJftBFWQwmyKQLKkfHbPCNMsBEDOMf94NgSMALi/zMY=
X-Google-Smtp-Source: AGHT+IE0EGbYQbv4l1lKRbqg12eixWC4l3SC8S7Jp79dW2xoIxVUBLK5AuANr1RWkebpsL9mNE5ikA==
X-Received: by 2002:a2e:a684:0:b0:2d1:107b:3ba1 with SMTP id q4-20020a2ea684000000b002d1107b3ba1mr3441338lje.10.1708092297388;
        Fri, 16 Feb 2024 06:04:57 -0800 (PST)
Received: from ta2.c.googlers.com.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id az5-20020a05600c600500b0040e4733aecbsm2516628wmb.15.2024.02.16.06.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 06:04:56 -0800 (PST)
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
Subject: [PATCH v2 3/7] ARM: dts: samsung: exynos5250: specify the SPI FIFO depth
Date: Fri, 16 Feb 2024 14:04:45 +0000
Message-ID: <20240216140449.2564625-4-tudor.ambarus@linaro.org>
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

exynos5250.dtsi defines the following aliases:
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
 arch/arm/boot/dts/samsung/exynos5250.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/exynos5250.dtsi b/arch/arm/boot/dts/samsung/exynos5250.dtsi
index 99c84bebf25a..b9e7c4938818 100644
--- a/arch/arm/boot/dts/samsung/exynos5250.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos5250.dtsi
@@ -511,6 +511,7 @@ spi_0: spi@12d20000 {
 			clock-names = "spi", "spi_busclk0";
 			pinctrl-names = "default";
 			pinctrl-0 = <&spi0_bus>;
+			fifo-depth = <256>;
 		};
 
 		spi_1: spi@12d30000 {
@@ -526,6 +527,7 @@ spi_1: spi@12d30000 {
 			clock-names = "spi", "spi_busclk0";
 			pinctrl-names = "default";
 			pinctrl-0 = <&spi1_bus>;
+			fifo-depth = <64>;
 		};
 
 		spi_2: spi@12d40000 {
@@ -541,6 +543,7 @@ spi_2: spi@12d40000 {
 			clock-names = "spi", "spi_busclk0";
 			pinctrl-names = "default";
 			pinctrl-0 = <&spi2_bus>;
+			fifo-depth = <64>;
 		};
 
 		mmc_0: mmc@12200000 {
-- 
2.44.0.rc0.258.g7320e95886-goog

