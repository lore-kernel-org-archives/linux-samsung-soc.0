Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1198A12C526
	for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Feb 2024 14:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708092299; cv=none; b=JCUkci5g+xt3EE8AW+9ic85rAWM8gEvuPHmjCy2OSH0afdsQGO2kTgtNCNBedeRE5MRiuoPs7naRpw0bfTCOKlwoQ+899pBHaojzW9uv6RP8bQGX9+ZaS/N+wAAVvjR1u+Ve/zpOtuB6fKZJYgqw00RvgsEzZ4w9sU959Q27avA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708092299; c=relaxed/simple;
	bh=nQr8Kfcz6Jo4+i8KVH+YbRUWCwWoQLLr3kZy2y0plho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fobxF9GV2wPtFW5+tE4EWBdvePw5+GvSdInWiYLAzXrV8uqZBbTXhuvUbMfdCsOMIFt3BQy7FNACVrcZkfOOkomsx6LLGY83Damq5I5W03wvoW4vN0HyseOySzJ1efArQ0aflwuSlzAoRRi2IgCRCNxFGTf+fffJUTMvelNXJR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nAZPG2or; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nAZPG2or"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5120ecfd75cso2842392e87.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Feb 2024 06:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708092296; x=1708697096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IoKD5bRktYBx1n+y/s9dpLnkNcyEHfZAqtDf6Pd57R0=;
        b=nAZPG2or9gQRV2dZuVvrUVLr/aZEnbfcNljngqh1KUjspTOK3Bl6CWKDBYZo2LKIdI
         PDkRGb6S/iMRf9Tyq66pPompFh17jRtuX7kETVuDZ35BKOON6N9c02wKLnDzyKxSYpVX
         Gal424JH2t0g2XMImrG4kdMlgwEXAkis7yeddpwtMIIBL8DR7/iH3QRW8/rCHWwhFMos
         WxXS+lwnktsEjQQvI51OUip6DzCRsJzNhHqSmlTqUpnf7nWxCD+nZIa5jliexYnTxBBi
         AnCjDCd0ZHlFDswlJPNbeSvYbkPBIyCA0ZvRL0mwwq4QD4wVCujsyfegcIMJhnXOXKBW
         ZbMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708092296; x=1708697096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IoKD5bRktYBx1n+y/s9dpLnkNcyEHfZAqtDf6Pd57R0=;
        b=mg9F0Zd3vQI85AFj5sIJajevy9HVBWQQ/k3tK/Jk5v53tZdhOAyu6UooryYPihKZid
         mmK4/81LbKEZsXjrvqbWabuxFdNeZKcW75nclDqpvaoEma7jbIrFHZZNqo6/1Sz95bK2
         cuenqvTaLtN8RvOC0DsFGPTn1Y3gSQNEV6niXzc3QkrV8HF2S2wez439O1Qxtze4qH9A
         U3jpI8K9KGNlDPNiIb6ORQ38HTfqVIvnr0G0JnhH7grOWDDE1ukxalNSxwCnveutYGdf
         ThOdJF3OjZk99A93v/ITbjNnMSWzXYKeW0WHb1ps8vFD+lCiNOKM7eB+Xv2K/jrHzOKD
         DsPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOQpEfO7/UuPEiAX7im2O/EfsySYMmS/mN+rdiWDdv1vKqYflv2+tHxEtBXKWnU6MAGqqwHF5eOGc2NArNzmpk5ozFfuwmVGKotTplcxFbz8Q=
X-Gm-Message-State: AOJu0YxYaAJtv2/HRbOSQ0s7rSVgbooxKlqcUTt2n218/3oCS7C0ewS4
	aQE5PCf6k6B9m2u8BGhEIPP/WorWxM4pKlVYHB5p2pAk8qTVRrEQcMDYB4sv9dsNDXpdirFB6oF
	Q/HM=
X-Google-Smtp-Source: AGHT+IE9vX1AKj2JOn/B8o/haeJFU2gEt8ObeXnpMNVVvEAqUlLvLNixeuJWM0nROcdwy3mX/SWqsg==
X-Received: by 2002:a05:6512:2253:b0:512:999e:671b with SMTP id i19-20020a056512225300b00512999e671bmr808593lfu.54.1708092295996;
        Fri, 16 Feb 2024 06:04:55 -0800 (PST)
Received: from ta2.c.googlers.com.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id az5-20020a05600c600500b0040e4733aecbsm2516628wmb.15.2024.02.16.06.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 06:04:55 -0800 (PST)
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
Subject: [PATCH v2 2/7] ARM: dts: samsung: exynos4: specify the SPI FIFO depth
Date: Fri, 16 Feb 2024 14:04:44 +0000
Message-ID: <20240216140449.2564625-3-tudor.ambarus@linaro.org>
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

exynos4.dtsi defines the following SPI aliases:
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
 arch/arm/boot/dts/samsung/exynos4.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/exynos4.dtsi b/arch/arm/boot/dts/samsung/exynos4.dtsi
index 7f981b5c0d64..ed47d0ce04e1 100644
--- a/arch/arm/boot/dts/samsung/exynos4.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4.dtsi
@@ -621,6 +621,7 @@ spi_0: spi@13920000 {
 			clock-names = "spi", "spi_busclk0";
 			pinctrl-names = "default";
 			pinctrl-0 = <&spi0_bus>;
+			fifo-depth = <256>;
 			status = "disabled";
 		};
 
@@ -636,6 +637,7 @@ spi_1: spi@13930000 {
 			clock-names = "spi", "spi_busclk0";
 			pinctrl-names = "default";
 			pinctrl-0 = <&spi1_bus>;
+			fifo-depth = <64>;
 			status = "disabled";
 		};
 
@@ -651,6 +653,7 @@ spi_2: spi@13940000 {
 			clock-names = "spi", "spi_busclk0";
 			pinctrl-names = "default";
 			pinctrl-0 = <&spi2_bus>;
+			fifo-depth = <64>;
 			status = "disabled";
 		};
 
-- 
2.44.0.rc0.258.g7320e95886-goog

