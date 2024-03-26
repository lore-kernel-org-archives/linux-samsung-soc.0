Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9F913C9A8
	for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Mar 2024 15:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711465992; cv=none; b=hOpvi6SdqvYpzGhVJnfVYIFfD3cy4JMWfLSGebAQpqz1QnxSd2firsUpi8FU9Ty8quY0G9msr/HxfrMZnh0vjFspML25x0ICEW6M3/Ibq9CEcCHrZHYHnPPDm1lkR9siZAcaFWq7+yP5XCrPEM4XBLkPXMarLrpdsC9AcIwSvSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711465992; c=relaxed/simple;
	bh=3MjqmoH3WniLREjKtpJy6Ei22eZ2CTVq3YCpFO/uyZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i8+/EkydxRGN84/0gVnl2ujjW89XWbkw7dqJlqJKPUpS1iQBqIDnreKS9eTETsl8tHveFA3sdyq0IeZMNWABFXyVyNo1fR8qBYZWzCy1lfshoVgRBD09JiNSndXTrPjSQKyYl5bCAP3pUZi4lBJFDFQjtAhX714J/5in0KwaKT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QKshboez; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QKshboez"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-341c7c8adf3so1999460f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Mar 2024 08:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711465988; x=1712070788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fswag0r4wwD6QybKq0XpPvu7XTv6A3HgoPtC1X0d1eE=;
        b=QKshboezaV3PNclEG0hN7CVemdqWJv8UpnPanxsalFAd813oBd+jieMHGDdzVz/6E7
         4xgxMrhZDl3fQ5zrOP381012EBPJOV2h8GpLR3xk8Gbzt4mCg7W73+VkcHiq8PdAAHcd
         OFM9drNGixdv4u2dlO0tNXhLRB7MrghicMVb0EPSNo+JSIhTCQlL/FUCQHtVl+DWTBrB
         aU0pdtybXMTA4bffAPaLcXvo1MHCOwpcyqRz5f0t9GuWyc4zr1wDS1FfuW7ok6Ta58wI
         5HDwVcOLNGe+aA4myPTvsy12zEAjvBybNTBlRX2X1JjhzzZ4nGwMkmdkMuFE1b9As9NP
         c4RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711465988; x=1712070788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fswag0r4wwD6QybKq0XpPvu7XTv6A3HgoPtC1X0d1eE=;
        b=DyVrIT83pWjZZ2nDZuM0YCEtbKUnXro7nrVyrBu9jNAAdTBzk+iaiXpxajHs9qs2yD
         H5m5UaCCkA7D1zAhpT4smIokrsS8OweXjCYjB2VIopza+6V2dGWrZpWRTV8R3RQGEoQ6
         o0M81+GF5eKt39vvZDlY/s0q0qstgbDH7C7rq1QNLTfzfdfCFkxNJyFt4jyZDaD/Mx2u
         UkveTbmCmRwi2+saT0G8J/NruhFIzaKVPIaOFLjiIQetbaADEuff7d4nU36yJkxijkZF
         9o4dzlVjJibdVfTweUteXnX2Uex9wGkwnTxrSgx/u3eLnqr+tuNLCPRmd3tAbvMZ35aP
         vK8g==
X-Forwarded-Encrypted: i=1; AJvYcCVxfB16Pw2SGJ5yWN2ZOF83ZfzJGRydhZDGEhLbnL/WRLzbRxK6UquI2LL2kte1mXMRxMJNyBjH//QwF5B2SxwQSmrU4x4cjyA3XsmUCQQrnrA=
X-Gm-Message-State: AOJu0YxZ7zyQoRdy/ITFe6A2Bk9ZizaEBeV1jdn30po3AMLtQ3VhUMmD
	kCRNdSAa/oAM6Yw/ufv9+/NhVmW84nY/euDJom23KcszHVSSr3RJKsVhyaitAvY=
X-Google-Smtp-Source: AGHT+IGf3X9LqSwQUYHkUPSLjuQF/lZVpgI2xGvAQ1ZwgqoexpehCBgs7FTo6pMFyLdIFg4/MF5D7A==
X-Received: by 2002:a05:6000:1d85:b0:341:c9d1:eae5 with SMTP id bk5-20020a0560001d8500b00341c9d1eae5mr6787384wrb.27.1711465988133;
        Tue, 26 Mar 2024 08:13:08 -0700 (PDT)
Received: from ta2.c.googlers.com.com (158.100.79.34.bc.googleusercontent.com. [34.79.100.158])
        by smtp.gmail.com with ESMTPSA id b1-20020a5d40c1000000b0033e7a204dc7sm12325692wrq.32.2024.03.26.08.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 08:13:07 -0700 (PDT)
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
Subject: [PATCH v3 5/5] arm64: dts: exynos: gs101: define all PERIC USI nodes
Date: Tue, 26 Mar 2024 15:13:01 +0000
Message-ID: <20240326151301.348932-6-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
In-Reply-To: <20240326151301.348932-1-tudor.ambarus@linaro.org>
References: <20240326151301.348932-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Universal Serial Interface (USI) supports three types of serial
interface such as UART, SPI and I2C. Each protocol works independently.
USI can be configured to work as one of these protocols. Define all the
USI nodes from the PERIC blocks (USI0-14), in all their possible
configurations. These blocks have the TX/RX FIFO depth of 64 bytes.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 769 +++++++++++++++++++
 1 file changed, 769 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 690deca37e4f..eddb6b326fde 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -373,6 +373,391 @@ pinctrl_peric0: pinctrl@10840000 {
 			interrupts = <GIC_SPI 625 IRQ_TYPE_LEVEL_HIGH 0>;
 		};
 
+		usi1: usi@109000c0 {
+			compatible = "google,gs101-usi", "samsung,exynos850-usi";
+			reg = <0x109000c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_0>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_0>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x1000>;
+			status = "disabled";
+
+			hsi2c_1: i2c@10900000 {
+				compatible = "google,gs101-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10900000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_0>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_0>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 635 IRQ_TYPE_LEVEL_HIGH 0>;
+				pinctrl-0 = <&hsi2c1_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			serial_1: serial@10900000 {
+				compatible = "google,gs101-uart";
+				reg = <0x10900000 0xc0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_0>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_0>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 635 IRQ_TYPE_LEVEL_HIGH 0>;
+				pinctrl-0 = <&uart1_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+
+			spi_1: spi@10900000 {
+				compatible = "google,gs101-spi";
+				reg = <0x10900000 0x30>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_0>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_0>;
+				clock-names = "spi", "spi_busclk0";
+				interrupts = <GIC_SPI 635 IRQ_TYPE_LEVEL_HIGH 0>;
+				pinctrl-0 = <&spi1_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
+		usi2: usi@109100c0 {
+			compatible = "google,gs101-usi", "samsung,exynos850-usi";
+			reg = <0x109100c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_1>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_1>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x1004>;
+			status = "disabled";
+
+			hsi2c_2: i2c@10910000 {
+				compatible = "google,gs101-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10910000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_1>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_1>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 636 IRQ_TYPE_LEVEL_HIGH 0>;
+				pinctrl-0 = <&hsi2c2_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			serial_2: serial@10910000 {
+				compatible = "google,gs101-uart";
+				reg = <0x10910000 0xc0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_1>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_1>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 636 IRQ_TYPE_LEVEL_HIGH 0>;
+				pinctrl-0 = <&uart2_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+
+			spi_2: spi@10910000 {
+				compatible = "google,gs101-spi";
+				reg = <0x10910000 0x30>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_1>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_1>;
+				clock-names = "spi", "spi_busclk0";
+				interrupts = <GIC_SPI 636 IRQ_TYPE_LEVEL_HIGH 0>;
+				pinctrl-0 = <&spi2_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
+		usi3: usi@109200c0 {
+			compatible = "google,gs101-usi", "samsung,exynos850-usi";
+			reg = <0x109200c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_2>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_2>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x1008>;
+			status = "disabled";
+
+			hsi2c_3: i2c@10920000 {
+				compatible = "google,gs101-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10920000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_2>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_2>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 637 IRQ_TYPE_LEVEL_HIGH 0>;
+				pinctrl-0 = <&hsi2c3_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			serial_3: serial@10920000 {
+				compatible = "google,gs101-uart";
+				reg = <0x10920000 0xc0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_2>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_2>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 637 IRQ_TYPE_LEVEL_HIGH 0>;
+				pinctrl-0 = <&uart3_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+
+			spi_3: spi@10920000 {
+				compatible = "google,gs101-spi";
+				reg = <0x10920000 0x30>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_2>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_2>;
+				clock-names = "spi", "spi_busclk0";
+				interrupts = <GIC_SPI 637 IRQ_TYPE_LEVEL_HIGH 0>;
+				pinctrl-0 = <&spi3_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
+		usi4: usi@109300c0 {
+			compatible = "google,gs101-usi", "samsung,exynos850-usi";
+			reg = <0x109300c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_3>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_3>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x100c>;
+			status = "disabled";
+
+			hsi2c_4: i2c@10930000 {
+				compatible = "google,gs101-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10930000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_3>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_3>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 638 IRQ_TYPE_LEVEL_HIGH 0>;
+				pinctrl-0 = <&hsi2c4_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			serial_4: serial@10930000 {
+				compatible = "google,gs101-uart";
+				reg = <0x10930000 0xc0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_3>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_3>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 638 IRQ_TYPE_LEVEL_HIGH 0>;
+				pinctrl-0 = <&uart4_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+
+			spi_4: spi@10930000 {
+				compatible = "google,gs101-spi";
+				reg = <0x10930000 0x30>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_3>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_3>;
+				clock-names = "spi", "spi_busclk0";
+				interrupts = <GIC_SPI 638 IRQ_TYPE_LEVEL_HIGH 0>;
+				pinctrl-0 = <&spi4_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
+		usi5: usi@109400c0 {
+			compatible = "google,gs101-usi", "samsung,exynos850-usi";
+			reg = <0x109400c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_4>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_4>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x1010>;
+			status = "disabled";
+
+			hsi2c_5: i2c@10940000 {
+				compatible = "google,gs101-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10940000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_4>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_4>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 639 IRQ_TYPE_LEVEL_HIGH 0>;
+				pinctrl-0 = <&hsi2c5_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			serial_5: serial@10940000 {
+				compatible = "google,gs101-uart";
+				reg = <0x10940000 0xc0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_4>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_4>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 639 IRQ_TYPE_LEVEL_HIGH 0>;
+				pinctrl-0 = <&uart5_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+
+			spi_5: spi@10940000 {
+				compatible = "google,gs101-spi";
+				reg = <0x10940000 0x30>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_4>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_4>;
+				clock-names = "spi", "spi_busclk0";
+				interrupts = <GIC_SPI 639 IRQ_TYPE_LEVEL_HIGH 0>;
+				pinctrl-0 = <&spi5_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
+		usi6: usi@109500c0 {
+			compatible = "google,gs101-usi", "samsung,exynos850-usi";
+			reg = <0x109500c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_5>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_5>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x1014>;
+			status = "disabled";
+
+			hsi2c_6: i2c@10950000 {
+				compatible = "google,gs101-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10950000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_5>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_5>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 640 IRQ_TYPE_LEVEL_HIGH 0>;
+				pinctrl-0 = <&hsi2c6_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			serial_6: serial@10950000 {
+				compatible = "google,gs101-uart";
+				reg = <0x10950000 0xc0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_5>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_5>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 640 IRQ_TYPE_LEVEL_HIGH 0>;
+				pinctrl-0 = <&uart6_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+
+			spi_6: spi@10950000 {
+				compatible = "google,gs101-spi";
+				reg = <0x10950000 0x30>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_5>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_5>;
+				clock-names = "spi", "spi_busclk0";
+				interrupts = <GIC_SPI 640 IRQ_TYPE_LEVEL_HIGH 0>;
+				pinctrl-0 = <&spi6_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
+		usi7: usi@109600c0 {
+			compatible = "google,gs101-usi", "samsung,exynos850-usi";
+			reg = <0x109600c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_6>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_6>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x1018>;
+			status = "disabled";
+
+			hsi2c_7: i2c@10960000 {
+				compatible = "google,gs101-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10960000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_6>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_6>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH 0>;
+				pinctrl-0 = <&hsi2c7_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			serial_7: serial@10960000 {
+				compatible = "google,gs101-uart";
+				reg = <0x10960000 0xc0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_6>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_6>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH 0>;
+				pinctrl-0 = <&uart7_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+
+			spi_7: spi@10960000 {
+				compatible = "google,gs101-spi";
+				reg = <0x10960000 0x30>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_6>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_6>;
+				clock-names = "spi", "spi_busclk0";
+				interrupts = <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH 0>;
+				pinctrl-0 = <&spi7_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
 		usi8: usi@109700c0 {
 			compatible = "google,gs101-usi", "samsung,exynos850-usi";
 			reg = <0x109700c0 0x20>;
@@ -399,6 +784,33 @@ hsi2c_8: i2c@10970000 {
 				pinctrl-names = "default";
 				status = "disabled";
 			};
+
+			serial_8: serial@10970000 {
+				compatible = "google,gs101-uart";
+				reg = <0x10970000 0xc0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_7>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_7>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 642 IRQ_TYPE_LEVEL_HIGH 0>;
+				pinctrl-0 = <&uart8_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+
+			spi_8: spi@10970000 {
+				compatible = "google,gs101-spi";
+				reg = <0x10970000 0x30>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_7>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_7>;
+				clock-names = "spi", "spi_busclk0";
+				interrupts = <GIC_SPI 642 IRQ_TYPE_LEVEL_HIGH 0>;
+				pinctrl-0 = <&spi8_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
 		};
 
 		usi_uart: usi@10a000c0 {
@@ -428,6 +840,61 @@ serial_0: serial@10a00000 {
 			};
 		};
 
+		usi14: usi@10a200c0 {
+			compatible = "google,gs101-usi", "samsung,exynos850-usi";
+			reg = <0x10a200c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP1_PCLK_2>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP1_IPCLK_2>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x1028>;
+			status = "disabled";
+
+			hsi2c_14: i2c@10a20000 {
+				compatible = "google,gs101-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10a20000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP1_IPCLK_2>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP1_PCLK_2>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 643 IRQ_TYPE_LEVEL_HIGH 0>;
+				pinctrl-0 = <&hsi2c14_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			serial_14: serial@10a20000 {
+				compatible = "google,gs101-uart";
+				reg = <0x10a20000 0xc0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP1_PCLK_2>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP1_IPCLK_2>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 643 IRQ_TYPE_LEVEL_HIGH 0>;
+				pinctrl-0 = <&uart14_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+
+			spi_14: spi@10a20000 {
+				compatible = "google,gs101-spi";
+				reg = <0x10a20000 0x30>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP1_PCLK_2>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP1_IPCLK_2>;
+				clock-names = "spi", "spi_busclk0";
+				interrupts = <GIC_SPI 643 IRQ_TYPE_LEVEL_HIGH 0>;
+				pinctrl-0 = <&spi14_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
 		cmu_peric1: clock-controller@10c00000 {
 			compatible = "google,gs101-cmu-peric1";
 			reg = <0x10c00000 0x4000>;
@@ -450,6 +917,226 @@ pinctrl_peric1: pinctrl@10c40000 {
 			interrupts = <GIC_SPI 644 IRQ_TYPE_LEVEL_HIGH 0>;
 		};
 
+		usi0: usi@10d100c0 {
+			compatible = "google,gs101-usi", "samsung,exynos850-usi";
+			reg = <0x10d100c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_1>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_1>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x1000>;
+			status = "disabled";
+
+			hsi2c_0: i2c@10d10000 {
+				compatible = "google,gs101-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10d10000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_1>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_1>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 651 IRQ_TYPE_LEVEL_HIGH 0>;
+				pinctrl-0 = <&hsi2c0_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			serial_usi0: serial@10d10000 {
+				compatible = "google,gs101-uart";
+				reg = <0x10d10000 0xc0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_1>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_1>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 651 IRQ_TYPE_LEVEL_HIGH 0>;
+				pinctrl-0 = <&uart0_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+
+			spi_0: spi@10d10000 {
+				compatible = "google,gs101-spi";
+				reg = <0x10d10000 0x30>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_1>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_1>;
+				clock-names = "spi", "spi_busclk0";
+				interrupts = <GIC_SPI 651 IRQ_TYPE_LEVEL_HIGH 0>;
+				pinctrl-0 = <&spi0_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
+		usi9: usi@10d200c0 {
+			compatible = "google,gs101-usi", "samsung,exynos850-usi";
+			reg = <0x10d200c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_2>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_2>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x1004>;
+			status = "disabled";
+
+			hsi2c_9: i2c@10d20000 {
+				compatible = "google,gs101-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10d20000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_2>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_2>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 652 IRQ_TYPE_LEVEL_HIGH 0>;
+				pinctrl-0 = <&hsi2c9_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			serial_9: serial@10d20000 {
+				compatible = "google,gs101-uart";
+				reg = <0x10d20000 0xc0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_2>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_2>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 652 IRQ_TYPE_LEVEL_HIGH 0>;
+				pinctrl-0 = <&uart9_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+
+			spi_9: spi@10d20000 {
+				compatible = "google,gs101-spi";
+				reg = <0x10d20000 0x30>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_2>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_2>;
+				clock-names = "spi", "spi_busclk0";
+				interrupts = <GIC_SPI 652 IRQ_TYPE_LEVEL_HIGH 0>;
+				pinctrl-0 = <&spi9_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
+		usi10: usi@10d300c0 {
+			compatible = "google,gs101-usi", "samsung,exynos850-usi";
+			reg = <0x10d300c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_3>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_3>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x1008>;
+			status = "disabled";
+
+			hsi2c_10: i2c@10d30000 {
+				compatible = "google,gs101-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10d30000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_3>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_3>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 653 IRQ_TYPE_LEVEL_HIGH 0>;
+				pinctrl-0 = <&hsi2c10_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			serial_10: serial@10d30000 {
+				compatible = "google,gs101-uart";
+				reg = <0x10d30000 0xc0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_3>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_3>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 653 IRQ_TYPE_LEVEL_HIGH 0>;
+				pinctrl-0 = <&uart10_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+
+			spi_10: spi@10d30000 {
+				compatible = "google,gs101-spi";
+				reg = <0x10d30000 0x30>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_3>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_3>;
+				clock-names = "spi", "spi_busclk0";
+				interrupts = <GIC_SPI 653 IRQ_TYPE_LEVEL_HIGH 0>;
+				pinctrl-0 = <&spi10_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
+		usi11: usi@10d400c0 {
+			compatible = "google,gs101-usi", "samsung,exynos850-usi";
+			reg = <0x10d400c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_4>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_4>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x100c>;
+			status = "disabled";
+
+			hsi2c_11: i2c@10d40000 {
+				compatible = "google,gs101-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10d40000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_4>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_4>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 654 IRQ_TYPE_LEVEL_HIGH 0>;
+				pinctrl-0 = <&hsi2c11_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			serial_11: serial@10d40000 {
+				compatible = "google,gs101-uart";
+				reg = <0x10d40000 0xc0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_4>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_4>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 654 IRQ_TYPE_LEVEL_HIGH 0>;
+				pinctrl-0 = <&uart11_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+
+			spi_11: spi@10d40000 {
+				compatible = "google,gs101-spi";
+				reg = <0x10d40000 0x30>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_4>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_4>;
+				clock-names = "spi", "spi_busclk0";
+				interrupts = <GIC_SPI 654 IRQ_TYPE_LEVEL_HIGH 0>;
+				pinctrl-0 = <&spi11_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
 		usi12: usi@10d500c0 {
 			compatible = "google,gs101-usi", "samsung,exynos850-usi";
 			reg = <0x10d500c0 0x20>;
@@ -476,6 +1163,88 @@ hsi2c_12: i2c@10d50000 {
 				pinctrl-names = "default";
 				status = "disabled";
 			};
+
+			serial_12: serial@10d50000 {
+				compatible = "google,gs101-uart";
+				reg = <0x10d50000 0xc0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_5>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_5>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 655 IRQ_TYPE_LEVEL_HIGH 0>;
+				pinctrl-0 = <&uart12_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+
+			spi_12: spi@10d50000 {
+				compatible = "google,gs101-spi";
+				reg = <0x10d50000 0x30>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_5>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_5>;
+				clock-names = "spi", "spi_busclk0";
+				interrupts = <GIC_SPI 655 IRQ_TYPE_LEVEL_HIGH 0>;
+				pinctrl-0 = <&spi12_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
+		usi13: usi@10d600c0 {
+			compatible = "google,gs101-usi", "samsung,exynos850-usi";
+			reg = <0x10d600c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_6>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_6>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x1014>;
+			status = "disabled";
+
+			hsi2c_13: i2c@10d60000 {
+				compatible = "google,gs101-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10d60000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_6>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_6>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 656 IRQ_TYPE_LEVEL_HIGH 0>;
+				pinctrl-0 = <&hsi2c13_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			serial_13: serial@10d60000 {
+				compatible = "google,gs101-uart";
+				reg = <0x10d60000 0xc0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_6>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_6>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 656 IRQ_TYPE_LEVEL_HIGH 0>;
+				pinctrl-0 = <&uart13_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+
+			spi_13: spi@10d60000 {
+				compatible = "google,gs101-spi";
+				reg = <0x10d60000 0x30>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_6>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_6>;
+				clock-names = "spi", "spi_busclk0";
+				interrupts = <GIC_SPI 656 IRQ_TYPE_LEVEL_HIGH 0>;
+				pinctrl-0 = <&spi13_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
 		};
 
 		pinctrl_hsi1: pinctrl@11840000 {
-- 
2.44.0.396.g6e790dbe36-goog

