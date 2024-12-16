Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00D5205ABA
	for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Dec 2024 13:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734354392; cv=none; b=Rbi67sFdAT1t5VBtPdQiN6O2B6Qb/Mukj5K+e0EnECzX+UIZ/c2LfyJyml4OWFACNWPNM/nzXlyfJgvdQvfwd5r9nCLIpuVsCBbqlo7YFtfVMnliByJW0N8M0OfXbR8PbRg2LmKe9i4lD6pP+UePuILRdu2kd3rLVR+RmLZEJYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734354392; c=relaxed/simple;
	bh=dW69wdGGaJJffaULTyEoO4UsQKSqs2x4lTN6HGmvILs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=owEUPA36jFtxD2BGzYLTtnX6rr73GWJhedymRjUV0msoshGbR0P4em+bU4GGVsqSVVWMb2IiWoyvSZriPMEwpw4aN6J1v9rAg2aRI1v6olQEUgojvX6xYgJgHABS2QVFHwvN0+0pWMesP0QYs+ZhnZnRvfCncLWolvoxXZhoRRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gIEpdrBP; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gIEpdrBP"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aa692211331so781865866b.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Dec 2024 05:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734354388; x=1734959188; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xMJ7CrX9kIOqu3iDaYB20vU9TBUK1RF3UFshpl59L2U=;
        b=gIEpdrBPGhDQqh7vMIcev5wAqbwxohcIKU+RtNMS+fByeIRvNaL7at+NUyglm1LSBC
         nLc7zdDhZequsfNVHGHnocXhBG2rnAbxq4VQG8Dzppgeu/BQ+eQesGJrcZEb8U2TUZC9
         M0jEYMkTJj7by1RUl24zUUOAU+wfdfhy8j8goYQ2jTt+snRxUUOn5PPU0k5zM2tWh36D
         40kxjB9YJkcjJw9zLkeApHSuPhc9F79Jfz5gtFlj1V5nSoxcWvH86QM6OSfNPokPT30B
         JuOe19ecoGSy8bXnTbT/D13FJk+7NRQTfrcvnJ+l3z2gU+GAYJO2oUCCA+cd1n7HcXtP
         QDWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734354388; x=1734959188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xMJ7CrX9kIOqu3iDaYB20vU9TBUK1RF3UFshpl59L2U=;
        b=NathpA37oW8eIb48azzhVrHry6z0V/Fw40vKI8QAG/bhdqiUJQ5NWzXXiHrObO5In3
         7g1T3AqSyparqiilpn5pbulq4TNrsBFiJCqJcEEg54UJmtMJuLTswCDbm6Olo5n0bKWN
         X4TkNmB9fafL5A4Nctr6dxd1mPPWViNMxqlCBmsE7dtHxtVSIG+ZLsy/ApUt/whV5BGX
         NIXbT6Rgt5nNHStuCNAesDbgUEn5og++Lva5Dxgen/xKLepBcJtouq1+Yt+xsj9ssPHv
         qRmtWOpV10SQHRbgSiE/P0dApQEof4ybnMk/2Ghtexj40moMXfgnKCHQJijecGZCGS/O
         D8Dg==
X-Forwarded-Encrypted: i=1; AJvYcCUxamrX55QkFUif39trT+GNwS0dsB9AmTU9ePUL6O/q9VcFKuvvR5uKhi00sJLiLZAIcpFwfJh77dT+pzW+9ymD4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZlo+by0XWFrEO9HkG4uPucJ50zCvDboMkQogM1jCBFYJ6xD77
	m3CRl8/wRqCuXwJo3ev0D5EewbWbnMQ+upT6yfOtkRvMBg1NF7/hm3B6Nr2p7h4=
X-Gm-Gg: ASbGncup/vJkkZ4CnkmQbn7OdSbHXJQQ+eUW0b4X1Khw81Xq/L6tGhsZuZEwwlGkW+s
	HbHOlc/RsUwyv5hXocFpUJVbFo8gCoIr3tHUI6IxlhCCDJmz5Jlb4gabx/XTYiC6fIUMJp5urnl
	nEM98XgxOQnVtecpGOXL1nDqTN2yRqUDpvMgrAflgn+EZ3bGCldNnBuVMtCgj7YMmCbEp9U5+dF
	yTU1sTjoBUAki6on8yrvJ137WXC0Km8i8Cd3N7dDY2eoTE5ynunGfgFJEvaysysc08Kkbch2HN+
	G41ibuiv05l4Q1G0UKrb7K0Hk6dl5HzO820SHG92
X-Google-Smtp-Source: AGHT+IEr4pMQNQbqucFCQZfc2jHAjvz/4A3/fbcu/5xQPFk07/32e+lX7UjbRG+TTnyWYHvyJgLvcw==
X-Received: by 2002:a17:907:9687:b0:aa6:1afe:b0a5 with SMTP id a640c23a62f3a-aa6c40bca07mr1823335266b.2.1734354388039;
        Mon, 16 Dec 2024 05:06:28 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab960681dbsm326648666b.52.2024.12.16.05.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 05:06:27 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 16 Dec 2024 13:06:28 +0000
Subject: [PATCH 3/4] arm64: dts: exynos: gs101-oriole: move common Pixel6 &
 6Pro parts into a .dtsi
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241216-gs101-simplefb-v1-3-8ccad1830281@linaro.org>
References: <20241216-gs101-simplefb-v1-0-8ccad1830281@linaro.org>
In-Reply-To: <20241216-gs101-simplefb-v1-0-8ccad1830281@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

In order to support Pixel 6 (Oriole) and Pixel 6 Pro (Raven) properly,
we have to be able to distinguish them properly as we add support for
more features.

For example, Raven has a larger display. There are other differences,
like battery design capacity, etc.

Move all the parts that are common for now into a gs101-raviole.dtsi,
and just leave the display related things in gs101-oriole.dts.

Raviole was chosen as the name because Google uses that when referring
to the combination of Oriole & Raven, keeping the familiar terminology.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
Note: MAINTAINERS doesn't need updating, it covers this whole directory
---
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 290 +-------------------
 .../boot/dts/exynos/google/gs101-raviole.dtsi      | 297 +++++++++++++++++++++
 2 files changed, 305 insertions(+), 282 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
index 4e1625e3fbb4..2bc9371cd42e 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
@@ -8,294 +8,20 @@
 
 /dts-v1/;
 
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/input/input.h>
-#include <dt-bindings/usb/pd.h>
-#include "gs101-pinctrl.h"
-#include "gs101.dtsi"
+#include "gs101-raviole.dtsi"
 
 / {
 	model = "Oriole";
 	compatible = "google,gs101-oriole", "google,gs101";
-
-	aliases {
-		serial0 = &serial_0;
-	};
-
-	chosen {
-		#address-cells = <2>;
-		#size-cells = <1>;
-		ranges;
-
-		/* Bootloader expects bootargs specified otherwise it crashes */
-		bootargs = "";
-		stdout-path = &serial_0;
-
-		/* Use display framebuffer as setup by bootloader */
-		framebuffer0: framebuffer@fac00000 {
-			compatible = "simple-framebuffer";
-			reg = <0x0 0xfac00000 (1080 * 2400 * 4)>;
-			width = <1080>;
-			height = <2400>;
-			stride = <(1080 * 4)>;
-			format = "a8r8g8b8";
-		};
-	};
-
-	gpio-keys {
-		compatible = "gpio-keys";
-		pinctrl-0 = <&key_voldown>, <&key_volup>, <&key_power>;
-		pinctrl-names = "default";
-
-		button-vol-down {
-			label = "KEY_VOLUMEDOWN";
-			linux,code = <KEY_VOLUMEDOWN>;
-			gpios = <&gpa7 3 GPIO_ACTIVE_LOW>;
-			wakeup-source;
-		};
-
-		button-vol-up {
-			label = "KEY_VOLUMEUP";
-			linux,code = <KEY_VOLUMEUP>;
-			gpios = <&gpa8 1 GPIO_ACTIVE_LOW>;
-			wakeup-source;
-		};
-
-		button-power {
-			label = "KEY_POWER";
-			linux,code = <KEY_POWER>;
-			gpios = <&gpa10 1 GPIO_ACTIVE_LOW>;
-			wakeup-source;
-		};
-	};
-
-	/* TODO: Remove this once PMIC is implemented  */
-	reg_placeholder: regulator-0 {
-		compatible = "regulator-fixed";
-		regulator-name = "placeholder_reg";
-	};
-
-	/* TODO: Remove this once S2MPG11 slave PMIC is implemented  */
-	ufs_0_fixed_vcc_reg: regulator-1 {
-		compatible = "regulator-fixed";
-		regulator-name = "ufs-vcc";
-		gpio = <&gpp0 1 GPIO_ACTIVE_HIGH>;
-		regulator-boot-on;
-		enable-active-high;
-	};
-
-	reserved-memory {
-		cont_splash_mem: splash@fac00000 {
-			reg = <0x0 0xfac00000 (1080 * 2400 * 4)>;
-			no-map;
-		};
-	};
-};
-
-&ext_24_5m {
-	clock-frequency = <24576000>;
-};
-
-&ext_200m {
-	clock-frequency = <200000000>;
-};
-
-&hsi2c_8 {
-	status = "okay";
-
-	eeprom: eeprom@50 {
-		compatible = "atmel,24c08";
-		reg = <0x50>;
-	};
-};
-
-&hsi2c_12 {
-	status = "okay";
-	/* TODO: add the devices once drivers exist */
-
-	usb-typec@25 {
-		compatible = "maxim,max77759-tcpci", "maxim,max33359";
-		reg = <0x25>;
-		interrupts-extended = <&gpa8 2 IRQ_TYPE_LEVEL_LOW>;
-		pinctrl-0 = <&typec_int>;
-		pinctrl-names = "default";
-
-		connector {
-			compatible = "usb-c-connector";
-			label = "USB-C";
-			data-role = "dual";
-			power-role = "dual";
-			self-powered;
-			try-power-role = "sink";
-			op-sink-microwatt = <2600000>;
-			slow-charger-loop;
-			/*
-			 * max77759 operating in reverse boost mode (0xA) can
-			 * source up to 1.5A while extboost can only do ~1A.
-			 * Since extboost is the primary path, advertise 900mA.
-			 */
-			source-pdos = <PDO_FIXED(5000, 900,
-						 (PDO_FIXED_SUSPEND
-						  | PDO_FIXED_USB_COMM
-						  | PDO_FIXED_DATA_SWAP
-						  | PDO_FIXED_DUAL_ROLE))>;
-			sink-pdos = <PDO_FIXED(5000, 3000,
-					       (PDO_FIXED_DATA_SWAP
-						| PDO_FIXED_USB_COMM
-						| PDO_FIXED_HIGHER_CAP
-						| PDO_FIXED_DUAL_ROLE))
-				     PDO_FIXED(9000, 2200, 0)
-				     PDO_PPS_APDO(5000, 11000, 3000)>;
-			sink-vdos = <VDO_IDH(1, 1, IDH_PTYPE_PERIPH, 0,
-					     IDH_PTYPE_DFP_HOST, 2, 0x18d1)
-				     VDO_CERT(0x0)
-				     VDO_PRODUCT(0x4ee1, 0x0)
-				     VDO_UFP(UFP_VDO_VER1_2,
-					     (DEV_USB2_CAPABLE
-					      | DEV_USB3_CAPABLE),
-					     UFP_RECEPTACLE, 0,
-					     AMA_VCONN_NOT_REQ, 0,
-					     UFP_ALTMODE_NOT_SUPP,
-					     UFP_USB32_GEN1)
-				     /* padding */ 0
-				     VDO_DFP(DFP_VDO_VER1_1,
-					     (HOST_USB2_CAPABLE
-					      | HOST_USB3_CAPABLE),
-					     DFP_RECEPTACLE, 0)>;
-			sink-vdos-v1 = <VDO_IDH(1, 1, IDH_PTYPE_PERIPH, 0,
-						0, 0, 0x18d1)
-					VDO_CERT(0x0)
-					VDO_PRODUCT(0x4ee1, 0x0)>;
-			/*
-			 * Until bootloader is updated to set those two when
-			 * console is enabled, we disable PD here.
-			 */
-			pd-disable;
-			typec-power-opmode = "default";
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-
-					usbc0_orien_sw: endpoint {
-						remote-endpoint = <&usbdrd31_phy_orien_switch>;
-					};
-				};
-
-				port@1 {
-					reg = <1>;
-
-					usbc0_role_sw: endpoint {
-						remote-endpoint = <&usbdrd31_dwc3_role_switch>;
-					};
-				};
-			};
-		};
-	};
-};
-
-&pinctrl_far_alive {
-	key_voldown: key-voldown-pins {
-		samsung,pins = "gpa7-3";
-		samsung,pin-function = <GS101_PIN_FUNC_EINT>;
-		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
-		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
-	};
-
-	key_volup: key-volup-pins {
-		samsung,pins = "gpa8-1";
-		samsung,pin-function = <GS101_PIN_FUNC_EINT>;
-		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
-		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
-	};
-
-	typec_int: typec-int-pins {
-		samsung,pins = "gpa8-2";
-		samsung,pin-function = <GS101_PIN_FUNC_EINT>;
-		samsung,pin-pud = <GS101_PIN_PULL_UP>;
-		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
-	};
-};
-
-&pinctrl_gpio_alive {
-	key_power: key-power-pins {
-		samsung,pins = "gpa10-1";
-		samsung,pin-function = <GS101_PIN_FUNC_EINT>;
-		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
-		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
-	};
-};
-
-&serial_0 {
-	status = "okay";
-};
-
-&ufs_0 {
-	status = "okay";
-	vcc-supply = <&ufs_0_fixed_vcc_reg>;
-};
-
-&ufs_0_phy {
-	status = "okay";
-};
-
-&usbdrd31 {
-	vdd10-supply = <&reg_placeholder>;
-	vdd33-supply = <&reg_placeholder>;
-	status = "okay";
-};
-
-&usbdrd31_dwc3 {
-	dr_mode = "otg";
-	usb-role-switch;
-	role-switch-default-mode = "peripheral";
-	maximum-speed = "super-speed-plus";
-	status = "okay";
-
-	port {
-		usbdrd31_dwc3_role_switch: endpoint {
-			remote-endpoint = <&usbc0_role_sw>;
-		};
-	};
-};
-
-&usbdrd31_phy {
-	orientation-switch;
-	/* TODO: Update these once PMIC is implemented */
-	pll-supply = <&reg_placeholder>;
-	dvdd-usb20-supply = <&reg_placeholder>;
-	vddh-usb20-supply = <&reg_placeholder>;
-	vdd33-usb20-supply = <&reg_placeholder>;
-	vdda-usbdp-supply = <&reg_placeholder>;
-	vddh-usbdp-supply = <&reg_placeholder>;
-	status = "okay";
-
-	port {
-		usbdrd31_phy_orien_switch: endpoint {
-			remote-endpoint = <&usbc0_orien_sw>;
-		};
-	};
-};
-
-&usi_uart {
-	samsung,clkreq-on; /* needed for UART mode */
-	status = "okay";
-};
-
-&usi8 {
-	samsung,mode = <USI_V2_I2C>;
-	status = "okay";
 };
 
-&usi12 {
-	samsung,mode = <USI_V2_I2C>;
-	status = "okay";
+&framebuffer0 {
+	reg = <0x0 0xfac00000 (1080 * 2400 * 4)>;
+	width = <1080>;
+	height = <2400>;
+	stride = <(1080 * 4)>;
 };
 
-&watchdog_cl0 {
-	timeout-sec = <30>;
-	status = "okay";
+&cont_splash_mem {
+	reg = <0x0 0xfac00000 (1080 * 2400 * 4)>;
 };
diff --git a/arch/arm64/boot/dts/exynos/google/gs101-raviole.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-raviole.dtsi
new file mode 100644
index 000000000000..90b08c1addbb
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/google/gs101-raviole.dtsi
@@ -0,0 +1,297 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Raviole Device Tree
+ *
+ * Copyright 2021-2023 Google LLC
+ * Copyright 2023 Linaro Ltd - <peter.griffin@linaro.org>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/usb/pd.h>
+#include "gs101-pinctrl.h"
+#include "gs101.dtsi"
+
+/ {
+	aliases {
+		serial0 = &serial_0;
+	};
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges;
+
+		/* Bootloader expects bootargs specified otherwise it crashes */
+		bootargs = "";
+		stdout-path = &serial_0;
+
+		/* Use display framebuffer as setup by bootloader */
+		framebuffer0: framebuffer@fac00000 {
+			compatible = "simple-framebuffer";
+			/* size to be updated by actual board */
+			reg = <0x0 0xfac00000 0x100>;
+			format = "a8r8g8b8";
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&key_voldown>, <&key_volup>, <&key_power>;
+		pinctrl-names = "default";
+
+		button-vol-down {
+			label = "KEY_VOLUMEDOWN";
+			linux,code = <KEY_VOLUMEDOWN>;
+			gpios = <&gpa7 3 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-vol-up {
+			label = "KEY_VOLUMEUP";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&gpa8 1 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-power {
+			label = "KEY_POWER";
+			linux,code = <KEY_POWER>;
+			gpios = <&gpa10 1 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+	};
+
+	/* TODO: Remove this once PMIC is implemented  */
+	reg_placeholder: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "placeholder_reg";
+	};
+
+	/* TODO: Remove this once S2MPG11 slave PMIC is implemented  */
+	ufs_0_fixed_vcc_reg: regulator-1 {
+		compatible = "regulator-fixed";
+		regulator-name = "ufs-vcc";
+		gpio = <&gpp0 1 GPIO_ACTIVE_HIGH>;
+		regulator-boot-on;
+		enable-active-high;
+	};
+
+	reserved-memory {
+		cont_splash_mem: splash@fac00000 {
+			/* size to be updated by actual board */
+			reg = <0x0 0xfac00000 0x100>;
+			no-map;
+		};
+	};
+};
+
+&ext_24_5m {
+	clock-frequency = <24576000>;
+};
+
+&ext_200m {
+	clock-frequency = <200000000>;
+};
+
+&hsi2c_8 {
+	status = "okay";
+
+	eeprom: eeprom@50 {
+		compatible = "atmel,24c08";
+		reg = <0x50>;
+	};
+};
+
+&hsi2c_12 {
+	status = "okay";
+	/* TODO: add the devices once drivers exist */
+
+	usb-typec@25 {
+		compatible = "maxim,max77759-tcpci", "maxim,max33359";
+		reg = <0x25>;
+		interrupts-extended = <&gpa8 2 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&typec_int>;
+		pinctrl-names = "default";
+
+		connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			data-role = "dual";
+			power-role = "dual";
+			self-powered;
+			try-power-role = "sink";
+			op-sink-microwatt = <2600000>;
+			slow-charger-loop;
+			/*
+			 * max77759 operating in reverse boost mode (0xA) can
+			 * source up to 1.5A while extboost can only do ~1A.
+			 * Since extboost is the primary path, advertise 900mA.
+			 */
+			source-pdos = <PDO_FIXED(5000, 900,
+						 (PDO_FIXED_SUSPEND
+						  | PDO_FIXED_USB_COMM
+						  | PDO_FIXED_DATA_SWAP
+						  | PDO_FIXED_DUAL_ROLE))>;
+			sink-pdos = <PDO_FIXED(5000, 3000,
+					       (PDO_FIXED_DATA_SWAP
+						| PDO_FIXED_USB_COMM
+						| PDO_FIXED_HIGHER_CAP
+						| PDO_FIXED_DUAL_ROLE))
+				     PDO_FIXED(9000, 2200, 0)
+				     PDO_PPS_APDO(5000, 11000, 3000)>;
+			sink-vdos = <VDO_IDH(1, 1, IDH_PTYPE_PERIPH, 0,
+					     IDH_PTYPE_DFP_HOST, 2, 0x18d1)
+				     VDO_CERT(0x0)
+				     VDO_PRODUCT(0x4ee1, 0x0)
+				     VDO_UFP(UFP_VDO_VER1_2,
+					     (DEV_USB2_CAPABLE
+					      | DEV_USB3_CAPABLE),
+					     UFP_RECEPTACLE, 0,
+					     AMA_VCONN_NOT_REQ, 0,
+					     UFP_ALTMODE_NOT_SUPP,
+					     UFP_USB32_GEN1)
+				     /* padding */ 0
+				     VDO_DFP(DFP_VDO_VER1_1,
+					     (HOST_USB2_CAPABLE
+					      | HOST_USB3_CAPABLE),
+					     DFP_RECEPTACLE, 0)>;
+			sink-vdos-v1 = <VDO_IDH(1, 1, IDH_PTYPE_PERIPH, 0,
+						0, 0, 0x18d1)
+					VDO_CERT(0x0)
+					VDO_PRODUCT(0x4ee1, 0x0)>;
+			/*
+			 * Until bootloader is updated to set those two when
+			 * console is enabled, we disable PD here.
+			 */
+			pd-disable;
+			typec-power-opmode = "default";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usbc0_orien_sw: endpoint {
+						remote-endpoint = <&usbdrd31_phy_orien_switch>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usbc0_role_sw: endpoint {
+						remote-endpoint = <&usbdrd31_dwc3_role_switch>;
+					};
+				};
+			};
+		};
+	};
+};
+
+&pinctrl_far_alive {
+	key_voldown: key-voldown-pins {
+		samsung,pins = "gpa7-3";
+		samsung,pin-function = <GS101_PIN_FUNC_EINT>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	key_volup: key-volup-pins {
+		samsung,pins = "gpa8-1";
+		samsung,pin-function = <GS101_PIN_FUNC_EINT>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	typec_int: typec-int-pins {
+		samsung,pins = "gpa8-2";
+		samsung,pin-function = <GS101_PIN_FUNC_EINT>;
+		samsung,pin-pud = <GS101_PIN_PULL_UP>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+};
+
+&pinctrl_gpio_alive {
+	key_power: key-power-pins {
+		samsung,pins = "gpa10-1";
+		samsung,pin-function = <GS101_PIN_FUNC_EINT>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+};
+
+&serial_0 {
+	status = "okay";
+};
+
+&ufs_0 {
+	status = "okay";
+	vcc-supply = <&ufs_0_fixed_vcc_reg>;
+};
+
+&ufs_0_phy {
+	status = "okay";
+};
+
+&usbdrd31 {
+	vdd10-supply = <&reg_placeholder>;
+	vdd33-supply = <&reg_placeholder>;
+	status = "okay";
+};
+
+&usbdrd31_dwc3 {
+	dr_mode = "otg";
+	usb-role-switch;
+	role-switch-default-mode = "peripheral";
+	maximum-speed = "super-speed-plus";
+	status = "okay";
+
+	port {
+		usbdrd31_dwc3_role_switch: endpoint {
+			remote-endpoint = <&usbc0_role_sw>;
+		};
+	};
+};
+
+&usbdrd31_phy {
+	orientation-switch;
+	/* TODO: Update these once PMIC is implemented */
+	pll-supply = <&reg_placeholder>;
+	dvdd-usb20-supply = <&reg_placeholder>;
+	vddh-usb20-supply = <&reg_placeholder>;
+	vdd33-usb20-supply = <&reg_placeholder>;
+	vdda-usbdp-supply = <&reg_placeholder>;
+	vddh-usbdp-supply = <&reg_placeholder>;
+	status = "okay";
+
+	port {
+		usbdrd31_phy_orien_switch: endpoint {
+			remote-endpoint = <&usbc0_orien_sw>;
+		};
+	};
+};
+
+&usi_uart {
+	samsung,clkreq-on; /* needed for UART mode */
+	status = "okay";
+};
+
+&usi8 {
+	samsung,mode = <USI_V2_I2C>;
+	status = "okay";
+};
+
+&usi12 {
+	samsung,mode = <USI_V2_I2C>;
+	status = "okay";
+};
+
+&watchdog_cl0 {
+	timeout-sec = <30>;
+	status = "okay";
+};

-- 
2.47.1.613.gc27f4b7a9f-goog

