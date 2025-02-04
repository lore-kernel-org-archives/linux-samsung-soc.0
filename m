Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FA921660B;
	Tue,  4 Feb 2025 17:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738690152; cv=none; b=sbqxIZaa/Y2LvTzoLut01YKRzzdFRviZoMqE1wZ78/gPfv4u6cqMNDnSstTKtbnwf3zjVfuNnXORsN8gdrnD2/MdP3jE/sPMD/R5OmxrjdX6x8h2GMgJBldBTboIlaKxJ+BCbuAntuRoCjcyEisTu4q1uWDTF3F7BDwO0Ux30w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738690152; c=relaxed/simple;
	bh=747rBV4CrB3ncxxx0etCDFXxKa/DqQKjOWmnHOvE8Ac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pSlHvgnJrB+Bv2vDjfUIdw557OwA6fjKMCaVlv1e44YOKgdGfkvj4hDrIoM6WS9Ra9M0e62xjSzE0O+ZbkXUh5/Jq1sRLEZB35chNWQxb6OIHLTGyuMPSVdakWz88q5RMzn4FBkTrsFUNUCBiBW6ReULIPvC9LsJ99ca/nzYzSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BxoPEZoY; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BxoPEZoY"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5db6890b64eso11465019a12.3;
        Tue, 04 Feb 2025 09:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738690149; x=1739294949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZBre3tfK9eNw0D6ztWoJ2B8wDlLW7jzGaVQPJWiVrhc=;
        b=BxoPEZoYfEMnC2gHPNpq/oI9dDB41pGmOBga5pgFXEE1jJliG9qz9oGiOVj0sIOh7U
         NzFRCPoUVbeolLkU7mLup9pMXNDyGTd34C0Z5ZTdI4kIZMOyVv5Lgb0Ykw7bOcRnZM8+
         LgZlhFG2i/grNdhQJnVXSOJt5cV0kVMJTtMuG8vv6Pm/wPM8HzRxC1SiWy+LXNJEgVAC
         dobRMZKSZfDEAmWJwnIMimt4cYFsG3T/GmyKc1QoaMraZ3B0qvQcUsFD5d6jDk4zHOhh
         HtXdEGiSpyJxFmOpHczWo9xIx00nAsanm3oQNgWhs9b8ZgkaBkSoOUh8vX07IDcj/OM0
         01SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738690149; x=1739294949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZBre3tfK9eNw0D6ztWoJ2B8wDlLW7jzGaVQPJWiVrhc=;
        b=IqrjnR6+9KwIyMI2JQEBy853fJS3YxdIvkvFVnc6hIPupXq0xq3DVn/AM/YQa75/xj
         uqnMTY+L6yrJkq2LV2dB0ahX++cXHJ2OoWFYI5FUzp4IrzvLVYVFhHgH4arf5Upixsaz
         V/kYiFrkLY1d9D/mAze0d/AP2wc64UXtsY27n4zC29TfxW7o2OWD2y/UDmQotyYDboX4
         ABWui0GxvlOnoFF5Y5R/19/b/8XAxSEnkBtFS/Ele/GEymFkkCgFdzh+/fE9QtYL5Oki
         qZT3szSVFqpChc/L/FvbM6+/bZEwWBh66HSOzMcJiGMnaXTRi3piIFetOP7TaeChtAt/
         gvdA==
X-Forwarded-Encrypted: i=1; AJvYcCXtf09LH1Cpn2qHuMwYvYzzx7vBojeKeDrW+w92AAUazfBxZ9wPvLNbM+dK1P2ey1JttL7qUuLcEQRYRnQ/c6ouccY=@vger.kernel.org, AJvYcCXyfUjGnfw7vxqOjG8UMIFZK+UOa3i3JBjxF/iS0+XhRWFjWSPQ92zBER4GrpKnsQEGIjU9NA3Feb0a86M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1SWOofEaaV6O+buWIUMrPAKnOn/D/SlQlnEIPafKPP8P+jnxe
	GGxoFgnrIk+AKUUfeGU+eEaFogSxx1SSlKtofGnXHOP95kHh95U0
X-Gm-Gg: ASbGnctojYDQw/b4qKueQRhAtZ4TpmIdhALpoDFpNOjVPs/BgQDAUdo3APH17a7MbdG
	UKW6iavBsEUTH1wEzzdfmWvaQDqNCzQF5DOakSh96GhhiFk2ezQnhaO+cAivZXPeVYQkUweoaTX
	eLaKMi43vB7dguKGq7p3+q8hL8psNC96xnkRNqsdnl+w1iuuPR7K06fXXwVbjgCqzpePKVWnvxa
	I9qtJ70erVa3e02rriPOtUOiAcGMCGvG8/QsW1YbvzSl4ypqChPT6docL1cCG+WAWmMx2SpnLI3
	Z2JTa2ZX9F9+DBtT0ke7DUAhYWevFL+j7EvgbR9FolobHmWLeOQ83pfSlq3FE7gYsbM=
X-Google-Smtp-Source: AGHT+IFu+slwz91GENh5QMjYcOh4lrpEqmBdNLas88SGUpO3WiuE6Ri0unHYb7Tl4RKE9yFsTn+Pnw==
X-Received: by 2002:a05:6402:40c8:b0:5d0:ed71:3ce4 with SMTP id 4fb4d7f45d1cf-5dc5efad984mr33079113a12.6.1738690148448;
        Tue, 04 Feb 2025 09:29:08 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcd3156ec7sm664981a12.67.2025.02.04.09.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 09:29:07 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 4/4] arm64: dts: exynos: update all samsung,mode constants
Date: Tue,  4 Feb 2025 19:28:03 +0200
Message-ID: <20250204172803.3425496-5-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204172803.3425496-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250204172803.3425496-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update all samsung,mode property values to account for renaming USI_V2
constants to USI_MODE in the bindings.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi     | 14 +++---
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi  | 48 +++++++++----------
 .../arm64/boot/dts/exynos/exynosautov920.dtsi |  2 +-
 .../boot/dts/exynos/google/gs101-oriole.dts   |  4 +-
 arch/arm64/boot/dts/exynos/google/gs101.dtsi  |  2 +-
 5 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index f1c8b4613..cb55015c8 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -651,7 +651,7 @@ usi_uart: usi@138200c0 {
 			compatible = "samsung,exynos850-usi";
 			reg = <0x138200c0 0x20>;
 			samsung,sysreg = <&sysreg_peri 0x1010>;
-			samsung,mode = <USI_V2_UART>;
+			samsung,mode = <USI_MODE_UART>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -677,7 +677,7 @@ usi_hsi2c_0: usi@138a00c0 {
 			compatible = "samsung,exynos850-usi";
 			reg = <0x138a00c0 0x20>;
 			samsung,sysreg = <&sysreg_peri 0x1020>;
-			samsung,mode = <USI_V2_I2C>;
+			samsung,mode = <USI_MODE_I2C>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -706,7 +706,7 @@ usi_hsi2c_1: usi@138b00c0 {
 			compatible = "samsung,exynos850-usi";
 			reg = <0x138b00c0 0x20>;
 			samsung,sysreg = <&sysreg_peri 0x1030>;
-			samsung,mode = <USI_V2_I2C>;
+			samsung,mode = <USI_MODE_I2C>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -735,7 +735,7 @@ usi_hsi2c_2: usi@138c00c0 {
 			compatible = "samsung,exynos850-usi";
 			reg = <0x138c00c0 0x20>;
 			samsung,sysreg = <&sysreg_peri 0x1040>;
-			samsung,mode = <USI_V2_I2C>;
+			samsung,mode = <USI_MODE_I2C>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -764,7 +764,7 @@ usi_spi_0: usi@139400c0 {
 			compatible = "samsung,exynos850-usi";
 			reg = <0x139400c0 0x20>;
 			samsung,sysreg = <&sysreg_peri 0x1050>;
-			samsung,mode = <USI_V2_SPI>;
+			samsung,mode = <USI_MODE_SPI>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -796,7 +796,7 @@ usi_cmgp0: usi@11d000c0 {
 			compatible = "samsung,exynos850-usi";
 			reg = <0x11d000c0 0x20>;
 			samsung,sysreg = <&sysreg_cmgp 0x2000>;
-			samsung,mode = <USI_V2_I2C>;
+			samsung,mode = <USI_MODE_I2C>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -855,7 +855,7 @@ usi_cmgp1: usi@11d200c0 {
 			compatible = "samsung,exynos850-usi";
 			reg = <0x11d200c0 0x20>;
 			samsung,sysreg = <&sysreg_cmgp 0x2010>;
-			samsung,mode = <USI_V2_I2C>;
+			samsung,mode = <USI_MODE_I2C>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
index b36292a7d..66628cb32 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
@@ -442,7 +442,7 @@ usi_0: usi@103000c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x103000c0 0x20>;
 			samsung,sysreg = <&syscon_peric0 0x1000>;
-			samsung,mode = <USI_V2_UART>;
+			samsung,mode = <USI_MODE_UART>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -505,7 +505,7 @@ usi_i2c_0: usi@103100c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x103100c0 0x20>;
 			samsung,sysreg = <&syscon_peric0 0x1004>;
-			samsung,mode = <USI_V2_I2C>;
+			samsung,mode = <USI_MODE_I2C>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -534,7 +534,7 @@ usi_1: usi@103200c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x103200c0 0x20>;
 			samsung,sysreg = <&syscon_peric0 0x1008>;
-			samsung,mode = <USI_V2_UART>;
+			samsung,mode = <USI_MODE_UART>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -597,7 +597,7 @@ usi_i2c_1: usi@103300c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x103300c0 0x20>;
 			samsung,sysreg = <&syscon_peric0 0x100c>;
-			samsung,mode = <USI_V2_I2C>;
+			samsung,mode = <USI_MODE_I2C>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -626,7 +626,7 @@ usi_2: usi@103400c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x103400c0 0x20>;
 			samsung,sysreg = <&syscon_peric0 0x1010>;
-			samsung,mode = <USI_V2_UART>;
+			samsung,mode = <USI_MODE_UART>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -689,7 +689,7 @@ usi_i2c_2: usi@103500c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x103500c0 0x20>;
 			samsung,sysreg = <&syscon_peric0 0x1014>;
-			samsung,mode = <USI_V2_I2C>;
+			samsung,mode = <USI_MODE_I2C>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -718,7 +718,7 @@ usi_3: usi@103600c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x103600c0 0x20>;
 			samsung,sysreg = <&syscon_peric0 0x1018>;
-			samsung,mode = <USI_V2_UART>;
+			samsung,mode = <USI_MODE_UART>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -781,7 +781,7 @@ usi_i2c_3: usi@103700c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x103700c0 0x20>;
 			samsung,sysreg = <&syscon_peric0 0x101c>;
-			samsung,mode = <USI_V2_I2C>;
+			samsung,mode = <USI_MODE_I2C>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -810,7 +810,7 @@ usi_4: usi@103800c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x103800c0 0x20>;
 			samsung,sysreg = <&syscon_peric0 0x1020>;
-			samsung,mode = <USI_V2_UART>;
+			samsung,mode = <USI_MODE_UART>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -873,7 +873,7 @@ usi_i2c_4: usi@103900c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x103900c0 0x20>;
 			samsung,sysreg = <&syscon_peric0 0x1024>;
-			samsung,mode = <USI_V2_I2C>;
+			samsung,mode = <USI_MODE_I2C>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -902,7 +902,7 @@ usi_5: usi@103a00c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x103a00c0 0x20>;
 			samsung,sysreg = <&syscon_peric0 0x1028>;
-			samsung,mode = <USI_V2_UART>;
+			samsung,mode = <USI_MODE_UART>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -965,7 +965,7 @@ usi_i2c_5: usi@103b00c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x103b00c0 0x20>;
 			samsung,sysreg = <&syscon_peric0 0x102c>;
-			samsung,mode = <USI_V2_I2C>;
+			samsung,mode = <USI_MODE_I2C>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -994,7 +994,7 @@ usi_6: usi@109000c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x109000c0 0x20>;
 			samsung,sysreg = <&syscon_peric1 0x1000>;
-			samsung,mode = <USI_V2_UART>;
+			samsung,mode = <USI_MODE_UART>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -1057,7 +1057,7 @@ usi_i2c_6: usi@109100c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x109100c0 0x20>;
 			samsung,sysreg = <&syscon_peric1 0x1004>;
-			samsung,mode = <USI_V2_I2C>;
+			samsung,mode = <USI_MODE_I2C>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -1086,7 +1086,7 @@ usi_7: usi@109200c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x109200c0 0x20>;
 			samsung,sysreg = <&syscon_peric1 0x1008>;
-			samsung,mode = <USI_V2_UART>;
+			samsung,mode = <USI_MODE_UART>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -1149,7 +1149,7 @@ usi_i2c_7: usi@109300c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x109300c0 0x20>;
 			samsung,sysreg = <&syscon_peric1 0x100c>;
-			samsung,mode = <USI_V2_I2C>;
+			samsung,mode = <USI_MODE_I2C>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -1178,7 +1178,7 @@ usi_8: usi@109400c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x109400c0 0x20>;
 			samsung,sysreg = <&syscon_peric1 0x1010>;
-			samsung,mode = <USI_V2_UART>;
+			samsung,mode = <USI_MODE_UART>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -1241,7 +1241,7 @@ usi_i2c_8: usi@109500c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x109500c0 0x20>;
 			samsung,sysreg = <&syscon_peric1 0x1014>;
-			samsung,mode = <USI_V2_I2C>;
+			samsung,mode = <USI_MODE_I2C>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -1270,7 +1270,7 @@ usi_9: usi@109600c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x109600c0 0x20>;
 			samsung,sysreg = <&syscon_peric1 0x1018>;
-			samsung,mode = <USI_V2_UART>;
+			samsung,mode = <USI_MODE_UART>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -1333,7 +1333,7 @@ usi_i2c_9: usi@109700c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x109700c0 0x20>;
 			samsung,sysreg = <&syscon_peric1 0x101c>;
-			samsung,mode = <USI_V2_I2C>;
+			samsung,mode = <USI_MODE_I2C>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -1362,7 +1362,7 @@ usi_10: usi@109800c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x109800c0 0x20>;
 			samsung,sysreg = <&syscon_peric1 0x1020>;
-			samsung,mode = <USI_V2_UART>;
+			samsung,mode = <USI_MODE_UART>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -1425,7 +1425,7 @@ usi_i2c_10: usi@109900c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x109900c0 0x20>;
 			samsung,sysreg = <&syscon_peric1 0x1024>;
-			samsung,mode = <USI_V2_I2C>;
+			samsung,mode = <USI_MODE_I2C>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -1454,7 +1454,7 @@ usi_11: usi@109a00c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x109a00c0 0x20>;
 			samsung,sysreg = <&syscon_peric1 0x1028>;
-			samsung,mode = <USI_V2_UART>;
+			samsung,mode = <USI_MODE_UART>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -1515,7 +1515,7 @@ usi_i2c_11: usi@109b00c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x109b00c0 0x20>;
 			samsung,sysreg = <&syscon_peric1 0x102c>;
-			samsung,mode = <USI_V2_I2C>;
+			samsung,mode = <USI_MODE_I2C>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index c759134c9..6e9007518 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -223,7 +223,7 @@ usi_0: usi@108800c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x108800c0 0x20>;
 			samsung,sysreg = <&syscon_peric0 0x1000>;
-			samsung,mode = <USI_V2_UART>;
+			samsung,mode = <USI_MODE_UART>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
index 387fb779b..b73c152c7 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
@@ -161,12 +161,12 @@ &usi_uart {
 };
 
 &usi8 {
-	samsung,mode = <USI_V2_I2C>;
+	samsung,mode = <USI_MODE_I2C>;
 	status = "okay";
 };
 
 &usi12 {
-	samsung,mode = <USI_V2_I2C>;
+	samsung,mode = <USI_MODE_I2C>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 302c5beb2..473db46aa 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -825,7 +825,7 @@ usi_uart: usi@10a000c0 {
 				 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP1_IPCLK_0>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric0 0x1020>;
-			samsung,mode = <USI_V2_UART>;
+			samsung,mode = <USI_MODE_UART>;
 			status = "disabled";
 
 			serial_0: serial@10a00000 {
-- 
2.43.0

