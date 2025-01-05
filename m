Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9548118D63C;
	Sun,  5 Jan 2025 16:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736093039; cv=none; b=fPpYKgw1HKzDTTyuWT/+g8EaYVHf3PD9Aw8myvQhwzGzC4CW4CbEZ0oEqF87/VtlXB4Q+h2NDGOuAHXo/UyLmZMR23+v22K3slkVB1yGeE7eEx8ARRRtshgWUfAyR2P/jJ5d2TjADxBPmUx2QUpbmFBHg05L6BExsqB8RNuiHc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736093039; c=relaxed/simple;
	bh=747rBV4CrB3ncxxx0etCDFXxKa/DqQKjOWmnHOvE8Ac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BWfKVEkKi2BTf5g5x+Ew9JZExTDGiirgk7KstldzG1kmny/jugkdUDDAyOn8Z2jcXHrCsrwM0EowqpW8B+gIQJ/RzycSM+iMt3RGbbEPea32rz6kdvUCDJ1DtFp8culebL8O4eYvv4TL6r1YVtOaUCivi/SznzakLPktedJhcXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fh8GCLgk; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fh8GCLgk"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-436341f575fso141016755e9.1;
        Sun, 05 Jan 2025 08:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736093036; x=1736697836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZBre3tfK9eNw0D6ztWoJ2B8wDlLW7jzGaVQPJWiVrhc=;
        b=fh8GCLgkMCzw2WlQkXQOyR/PS0bpzuFCTk5FES6WR9zneQpQN72W9T63WrMo7Wmy2V
         LkcFRrfrFcrpVaH5kDucBWosAVPeT34KqXmtVKvgVRJbIDl6mETUwlwnjDBvr+sWUWb3
         AG3T4vwglJh5xugE6wyk1P9VIiQ0mYEATWnN3VJWsOebe5CoRIqz6Mb1VvpG1u4AqYd3
         XldN7D0QSurPhKOZTvbXsFdYU6nR8+rRpSNd3m/uD+TBK99ByJQyBiG5wd+662TRpIp/
         D8A+6OlxZh27sSsYLnXx1MYTThKwp/8o1FPZubl/K+H5BPkSLfvReVTMdTb994zWAdGC
         4E4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736093036; x=1736697836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZBre3tfK9eNw0D6ztWoJ2B8wDlLW7jzGaVQPJWiVrhc=;
        b=wdfBBk35SDwHKv2q7nY5EFGIn/KaahiN02HM/Xm1rQK33qZCvYijjJCUAYdxeYS/wK
         uwz8ZFpmHP2zsrMw8dhOp7tHwtb5ZD7AGymR5pjEllA4YjnBhRiIR/ZBA07uoQjcOvUO
         rqWz8PuWoSLQ/ToaYzsz88JHTC0jUa7Zl2nv/hWlUU/kl951e9xK5EutlbScVKRkHLrZ
         GMZvr5sjstnJ4kLJl9gWPCHkQZxq+zvUhNw6Q2XCJzqqn0jH8d+95peAOD5VH5QqrRZ7
         MR9v3uk2QpO8FCHkQc8H6Y4CnUBybUogsVnYrNW1UtEMCIJx1sZu3HA+TAn3E4Sa4ZeC
         YWWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRSh5UA9ApdAbURyUj7X4fqPP2qqNLvv3pqP97AvQ4HFzA3ukIqcJ7skrnWF7p+Syn1dV24tTp4bYNi8o=@vger.kernel.org, AJvYcCXY9sFlq8YS9luCH+zIMx/7v8hPSUY3BHM1D2BtrG+2P5zFX9jFnvEnCuvnSTi9okBLym9+VT5yfzukQN68vKslmz8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIp87Wk+dG0ynBOC3itr7Mn+e8iNOJOut0bx8VQmsHdqjchpyJ
	qPcqLBdwzm1enpcSAJrnoaqLwXktmWpZeU1nC1RBDdPqHmLDtdQo
X-Gm-Gg: ASbGncv937m2Mm3MglVSFG8p2oAnA1LhE3hKSdmJ21Rk+19kZs519y6ihyst/YPx65Q
	Uy1x4NurWlLC97W2cHvSSQiR1cnKZ9QtS/+KVImP1YRnowiWZaQncdczjpNoD0d2vfXsOBc6ub+
	T3mj6PanhAQI95AV2Vfnh1BGl0hiNUUo1k/BjSSEg47iNVdvSqhA/SPF8UDHt+5/cDHsJkdWuZ7
	ZOVKNGmoTdXnkATeVk08ad8hsu40dQ051kNP8z24MzJ+Y47YLQEcMBIaY34dAIgVl8VJqQ=
X-Google-Smtp-Source: AGHT+IGJ5yPjEyBY093kqwSSzrdR6Xl6nRHSpFI4J32YiyqdHeZBu6ptxJHCEtmUCp6QJovXur/C9g==
X-Received: by 2002:a05:600c:35cb:b0:436:1baa:de1c with SMTP id 5b1f17b1804b1-4366854c186mr466960695e9.13.1736093035592;
        Sun, 05 Jan 2025 08:03:55 -0800 (PST)
Received: from ivaylo-T580.. ([94.131.202.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c84705esm46031925f8f.44.2025.01.05.08.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 08:03:55 -0800 (PST)
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
Subject: [PATCH v3 4/4] arm64: dts: exynos: update all samsung,mode constants
Date: Sun,  5 Jan 2025 18:03:46 +0200
Message-ID: <20250105160346.418829-5-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105160346.418829-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250105160346.418829-1-ivo.ivanov.ivanov1@gmail.com>
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

