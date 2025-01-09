Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891C42153D4;
	Thu,  9 Jan 2025 09:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736413449; cv=none; b=Qe6iuEjd/K3KtkiViwy50utt33L9PothSs/sJtTgWiGcW5zArDT6KiLBgEZXw9WlabiEGHgg+1I30nfQ1v8pLoynMKexPDKnBToWlhXbtb/coyoQJiw3Hm/HwGffoytsfdDGSYPmDqVU1QrY+ZsdHPKX/sJsoidDBEuPrqpwWpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736413449; c=relaxed/simple;
	bh=747rBV4CrB3ncxxx0etCDFXxKa/DqQKjOWmnHOvE8Ac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jH48SwuSG5P/jkF0C68scxE0miZKR5uN+S3ROHck5yvQTA6T1q/YL97V4O90mAe1A2V0KodA4Uklp0fGKP6x6EIt/aW4wPWw7K6agwNMBpzCzhjltOWdJDLXpOlc4IEMpuML9oj7tD+CcyGWfQviFtd5EBZ8ycSEtpRyBlACy5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M6fM/J7V; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M6fM/J7V"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-385e0e224cbso356951f8f.2;
        Thu, 09 Jan 2025 01:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736413446; x=1737018246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZBre3tfK9eNw0D6ztWoJ2B8wDlLW7jzGaVQPJWiVrhc=;
        b=M6fM/J7Viw1sOOq2OmOfsQfmI7olOljbQrK8iYcSmCwIIPti02NMlBOiO7XrMCHWw7
         8sHOXNJq8FKdcJIv6Yyi3GBxvPkkGrLZmTI+cpnRqTTPfHQ7pnCvvMj5cBmaERNVE/kV
         2DJVrFocctVY/mFfQcTqDzpSPzyuZLNH0jguqriaV16l7pNFtWqqsrnwjS4N+ENSXkh3
         MHY4Pb4IIfBJFKXoPjuHoToWYnav/TuRowJmJE1Xk8be02PZu1eWqV4VvMM4ofoBsw15
         rMXPskT/CGZEsmp+oUo6WXwsRnfxlmmDVZJ8/akR4isc6hFQ83TmStt+LwQHaMhycnLa
         8fJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736413446; x=1737018246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZBre3tfK9eNw0D6ztWoJ2B8wDlLW7jzGaVQPJWiVrhc=;
        b=C8cocACtO57P8EuvjkhN+O94tZg7GWsi0OqSO8U8qKPq+I1TUjkWdnfvPbRLtvKY5f
         OFxMpb3kSliYVlkjB6gl/psjhEF1IuB/FKna+AfvRwvzfAHDBBwcZsWxloGg/4I4BnaJ
         UGqLPn53vW9twbs8uDL+lhkKC3irwM4IL39xBe/wR9YGGTVZlhHn2kTTd224hocV4tph
         YmoUXBWsbSuoDcA+Lf53tuWxreJ+xbbNe6P9MbOTQQf5K0C1ra7wlntjXEscSpS3pCvi
         nF92DHhoAc+3JDBkF69QN+w3HYGEokEXdZZ13uoiWGOKoxS4tF3gWPpftsvXJSQTUqjw
         FfIA==
X-Forwarded-Encrypted: i=1; AJvYcCUlZrySbwe90vqpcREJ7V4V0qlKRkriBMGGOj31nzx9JCyDYOkc66O8BTc7E2iVuC5/QhqwgT5otAONazQ=@vger.kernel.org, AJvYcCVIbBWImtTg7FYmwcY08SW4xukrKLbmF/wRx0MaxKwEb9st+3oNMzQNvitHTcXWXp60WDva1/nKDsxAXLRY426wmVE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq2Eux7xDeMbVm91kJf0Mq4McUfrUJfPVv20j0hs5dPcdmRKUH
	0TNLqW2g7hYffeWTiESK8I2OT62FFIvMZCwb1P6vsmdpXIzGu2fbJD5+ig==
X-Gm-Gg: ASbGnctbGwRsPxpl6SxQ6Rh9aaK2yVG3TX6P86f9e3vHBB6/IHYObt6qv/miTg7fF80
	iUi2R7xq7eqpqKQ2Dmkt42mxTZ0AmVDapI+vXFpVbRRr7BG9z5zVDi+YpDNwBg5IiK/w0hMKD8a
	AFHMgzhs8Y/8jJqP4Ku4b/vfrZfMXuohm68P0f6+q5u9QBZUTn4ytVFqDwl+8zCQW+XqT2pTF8p
	DToI6ag77Z2P/YusVp9uM2gvBPtYfifzdDTOtUB7CsBsvEoyLXYAT7jfgMhVFjdPeyJMK956sZa
	N9Tt+KCQGsbWpgmk3ts=
X-Google-Smtp-Source: AGHT+IGx574cDudtAcm0a67dcSm2ibn5dzaHhj/kf09L4ekpC1X5fqoTRc+FNu5M1rnroXGd/0Twiw==
X-Received: by 2002:a5d:6d84:0:b0:385:e8ff:b9c9 with SMTP id ffacd0b85a97d-38a87308cbfmr4341559f8f.42.1736413445705;
        Thu, 09 Jan 2025 01:04:05 -0800 (PST)
Received: from ivaylo-T580.. (62-73-104-42.ip.btc-net.bg. [62.73.104.42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b80b2sm1196692f8f.80.2025.01.09.01.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 01:04:05 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/4] arm64: dts: exynos: update all samsung,mode constants
Date: Thu,  9 Jan 2025 11:03:25 +0200
Message-ID: <20250109090325.595475-5-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250109090325.595475-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250109090325.595475-1-ivo.ivanov.ivanov1@gmail.com>
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

