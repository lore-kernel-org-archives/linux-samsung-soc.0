Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1165013C69A
	for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Mar 2024 15:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711465987; cv=none; b=uA7Un/1pLcJRiO6whdvLNo4nW5CgKgrvlNb1+blfCgukdQyxz7ViChjv6RBbn96tZwkOHAEBKHgE8taNm8s2kvV6rfQgE6VAUYRwQvWM6Vt5nnrmwXXm5Q2EARVMJ+34ugzjJKyTdRg4MfW7iQY+xnmXndm2CR611mtTXhnQ7lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711465987; c=relaxed/simple;
	bh=VR15R2WP+377srHz2NsdR72PZk2ShcAumCvdNJ/OrpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kTKfYrdAvBSNpdUcgUnBY9mI3xzhe1Fj+wlzlfOR8c3IS68f+GI9GXAUODIdzOGrbh9Mz/z3omoZgqhcw42mOJG7CHoZBzre8Ax0bQubKmYezYBvDup6Jn83Ls6Rtz1Kr3nDoVcWy5GCCFK1l7mdnJLdhTQN1xSCm5pSCFR+gnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L1NxEESc; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L1NxEESc"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4148c65e890so9137185e9.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Mar 2024 08:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711465984; x=1712070784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gn9m+1lA6AcpZGbpMknvvS6Xp0LvUkbLedZBp4mYCns=;
        b=L1NxEEScKfFmYVoLHmUItezgfxlAsSZzhoGK6TUj7X2onJ81++UxVkyjd3gkFgLsjl
         Me2UsnFfs5q6LW8eaZe8jqDW/jFK/Y2M2tF2d8cJ1q4sNjFY11saNbZvbkW7B7DiPHuI
         4mwO4qQpNjvZlk+p8XCAr2u9Ee7aFoiiofxbDLtHlvw4OYjVEU9TknP4BA66BCjyDpim
         oTdecwkb0Y15YgCvgV4BasGXKutz033WnJX9jwTFRr0ixkEVcwBq4bFXNLAMUPZ0xEiL
         XoQLiVHBQpoFm4hou7so+Br1LxKoexDlKmuJV8gmDSm2sEVGH9xqop9LqW1T4vWVMBFo
         Ai1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711465984; x=1712070784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gn9m+1lA6AcpZGbpMknvvS6Xp0LvUkbLedZBp4mYCns=;
        b=dZW9kp6QKzG8jZS47X0xdpJ3akBN/HinPnEP14wWAR/6bm89068y142F4Lh7n994+x
         Sn1iZj8bJ/ly3WC2pTTyw+70YPkZLG3T8Lyk4qUPdFK+gTgVk/LUrd063Q0c9auL6tMP
         3qHWZY3JqZzP5Tiyq1kbCkVZ8MumOQPskCR+DqgjluKbDKYCaKBmrWhcuACqS5dQdU+F
         W81TovzfHitJ4qTvGmyuPh9eB0WrsW9zcGjhmdmkACXCkxwfLZag3gWGJxhZFeRGpFmO
         +5w8afN6IoBLSdWwX3Kl9m5lc6cVVtW1L6RruWeszwLU0LEjFYyOSm/sibBIhmH4KeUK
         f6GA==
X-Forwarded-Encrypted: i=1; AJvYcCVCEGVYKXU+JdXAZwfiC796Ck6p7eeGwophbBCreSlIYv5G9V6HIdU8SeQVQ03n5Cvttq57PLV6r2tqZ6WJoIBv+0mulV0sQybCn6FddVZ3eK4=
X-Gm-Message-State: AOJu0Yw/dcJF37lJIwNSNxetSvYuVMMl1cNpEgg3Q4T45hYaD3Yi865h
	Y6joOwtWsjmgVueNHv0drHXvO4/HEWFvJbrSU8axKbHgOg+vfbNzkKPPL+IkKZM=
X-Google-Smtp-Source: AGHT+IGB7lFBQVEWs59x6w/DBERXvC6mjvqqcHglQjnQsaK6/Fp0y7bhjtErhQrG4DXYj7M5YgXYqw==
X-Received: by 2002:a5d:61cc:0:b0:341:be75:5e6c with SMTP id q12-20020a5d61cc000000b00341be755e6cmr1297348wrv.3.1711465984474;
        Tue, 26 Mar 2024 08:13:04 -0700 (PDT)
Received: from ta2.c.googlers.com.com (158.100.79.34.bc.googleusercontent.com. [34.79.100.158])
        by smtp.gmail.com with ESMTPSA id b1-20020a5d40c1000000b0033e7a204dc7sm12325692wrq.32.2024.03.26.08.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 08:13:03 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peter.griffin@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andre.draszik@linaro.org,
	willmcvicker@google.com,
	kernel-team@android.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 1/5] arm64: dts: exynos: gs101: reorder pinctrl-* properties
Date: Tue, 26 Mar 2024 15:12:57 +0000
Message-ID: <20240326151301.348932-2-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
In-Reply-To: <20240326151301.348932-1-tudor.ambarus@linaro.org>
References: <20240326151301.348932-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@linaro.org>

The Preferred order for these is pinctrl-0 pinctrl-names.

Update the DTSI & DTS accordingly.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 4 ++--
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
index 6ccade2c8cb4..40de2b0aa086 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
@@ -29,8 +29,8 @@ chosen {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		pinctrl-names = "default";
 		pinctrl-0 = <&key_voldown>, <&key_volup>, <&key_power>;
+		pinctrl-names = "default";
 
 		button-vol-down {
 			label = "KEY_VOLUMEDOWN";
@@ -103,8 +103,8 @@ key_power: key-power-pins {
 };
 
 &serial_0 {
-	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_bus>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 55e6bcb3689e..5868c96c771f 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -393,8 +393,8 @@ hsi2c_8: i2c@10970000 {
 				interrupts = <GIC_SPI 642 IRQ_TYPE_LEVEL_HIGH 0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
-				pinctrl-names = "default";
 				pinctrl-0 = <&hsi2c8_bus>;
+				pinctrl-names = "default";
 				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_7>,
 					 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_7>;
 				clock-names = "hsi2c", "hsi2c_pclk";
-- 
2.44.0.396.g6e790dbe36-goog

