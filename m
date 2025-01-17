Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9452519258B
	for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Jan 2025 17:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737133809; cv=none; b=ZmC37duKhO5RZTWpjtswsISxeGLvTkkMrIk4pNRl81AdoWGg4sZuxhkkgaQG+xAq91t9rQ/36ANi9oJ9JoCSKoMk/egm1r48bzXX6SM9D/i/lvMAzKR5emSJMrmukqfEF+1SX+T1Nk2Lj+T3AqzsBBMdnNgozZfq7FiFJ1vwW1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737133809; c=relaxed/simple;
	bh=kx7ZAfKl58JGTsnJABVXTvUq2/3fVBMwWMuqAnQSIMw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JPLdh09YJTIFLSa438ORZ11vuaNUGRT4zpcxJNJgvXa69yMgELKVAWGlJkH1DMGPATTDwF+DvpB4THWq4dPu7j9rfEl0C92ei1AZ0rLEW//vVvSaQ9ONb3SGwR5Rh6tkjXDU6hS9B98TgJHKF9c87Qy+5KWeD6sYOl1W74rmYwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Iwm5xd8s; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Iwm5xd8s"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ab2b29dfc65so354054766b.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Jan 2025 09:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737133806; x=1737738606; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MfnXh4xNEl2veLLUMoW2fFOfVxeDxb438BEqj2RkATs=;
        b=Iwm5xd8sf7Jnkry+PBBTRjr6X2mv1oBiBwrLzZrM24YtGJHBCEWFIYXNIxpK1m+Dz3
         qDh2dXZPk2hA3tkqC0bo8B/zm1uqTHWd59h8fsvBWXktD+em5kq+AKOhNzthnm9JEnDp
         sir+8dgStlYIBO5kkgaDDc5/uvSTSgUoEBDyw7n1UwMuSqd6A0sh//uaN8O6PSTUuMFn
         F/ZdgI0k9/cuu5o/EitE+OmPU7a4YezpZw1IRaF2GFV8Jewj7wN0onojRAIFW4K+q8v6
         gjWasZso1to75nOCQtPdiJ0TaRCaU3/Qx5GMrx0lnJEyCpS5vnGX/uno4nZ3bUj4Z4FR
         0THQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737133806; x=1737738606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MfnXh4xNEl2veLLUMoW2fFOfVxeDxb438BEqj2RkATs=;
        b=wGXP6EnBsGW67BL2snps3W3/o+oSwh/FZapD8+gehyZ9Zrn3Ly3bQ5JQIyBVfqEznA
         +Qzc/jP9stvYM1j+MG8Z6m1oMw2zj44S+vketj9jcLA4CJf254P44esLOBdSkZEenep6
         3eqjW5RdEsDk0Tt8yBbM6I6Kmto/FLktYsmVluCmGf6wyfn832RykT+S6YMvfmhrmyk8
         i7MIcfoEpoM9fAYI0IVIxWLAQKYuRLMrfQyrObY/FAgH8thxk+49enGL7BcZSxZf8k/x
         glnESinKFrDUHiH3pLQGfmJsV1mqFXj8o6dLw+SrJadtePt1s+PQdLULyU/uKWNCJHGL
         jUtA==
X-Forwarded-Encrypted: i=1; AJvYcCUVtJdf09Zzbtymnr8OUmSr/2D5vjaWOHFS0j07Fj2SLYl2b7ehrzYM1lC40hReeV+RPxKCqZGXZZqpZQbq2jslyA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3c7eGCqHSsH4vC6rsLhyYLwCLFzMEwKmk0e7Cf2CyNF9x9rAN
	DFwwEJT5b1OmBw/qfmxlip7AeapQiPYTOib6Ndk+9XMxmC3+Q2OfqC8GmIaOEB8=
X-Gm-Gg: ASbGncuy3ht5tyOU1+nCNnwB47aPg+Bz1C7F/KMLnxkeA92QL/UpgIVQj57vAPPEVsF
	+g/ccxYEZ+O5HohmEAVP9Nz6LGcOIXy8Y9n90NA3rteSR6d7UpZ87e2poMLm2+vw0ehdm2YJo1G
	Yh9p64kwP0sAzNiyMM5Tpy0xk4Mbjx55hWj5n5j4tDcEZ9LOkMV9kz7H85MBnh3+VOoI9j3UJ5O
	NFhv1BTDbkXFa7sIAJf9pcvNar4AQlCiz1XMFqwlVHpA4SPRXgQUvnpVzZ8WSA8ttD5VDYEkubN
	cjjZRQYnZmPATduO7xseNXVwIXuVrG7SFToIIod8
X-Google-Smtp-Source: AGHT+IGO2k9zmqpedfG17qLS9EqiIeFYPlFsb7tvN+iv0GH4peIlK9YZK62ZtqRxsVP1aji62RVIHQ==
X-Received: by 2002:a17:907:706:b0:ab3:2b9a:4a5a with SMTP id a640c23a62f3a-ab38b3c6a1emr357999966b.51.1737133799124;
        Fri, 17 Jan 2025 09:09:59 -0800 (PST)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384f87065sm199197966b.133.2025.01.17.09.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 09:09:58 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 17 Jan 2025 17:09:56 +0000
Subject: [PATCH v4 3/4] arm64: dts: exynos: gs101-oriole: move common
 Pixel6 & 6Pro parts into a .dtsi
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250117-gs101-simplefb-v4-3-a5b90ca2f917@linaro.org>
References: <20250117-gs101-simplefb-v4-0-a5b90ca2f917@linaro.org>
In-Reply-To: <20250117-gs101-simplefb-v4-0-a5b90ca2f917@linaro.org>
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

In order to support Pixel 6 (Oriole), Pixel 6 Pro (Raven), Pixel 6a
(Bluejay), and all other versions correctly, we have to be able to
distinguish them properly as we add support for more features.

For example, Raven has a larger display. There are other differences,
like battery design capacity, etc.

Move all the parts that are common for now into a
gs101-pixel-common.dtsi, and just leave the display related things in
gs101-oriole.dts.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
Note: MAINTAINERS doesn't need updating, it covers this whole directory

v3:
- separate DTBs for Pixel 6 and Pixel 6 Pro like in v1 (Krzysztof)
- override/extend nodes ordered by label name (Krzysztof)
- name common include gs101-pixel-common.dtsi instead of
  gs101-raviole.dtsi

v2:
- use a generic gs101-based Pixel base board DTB with different
  additions to it that make up the different versions 6, 6Pro, 6a,
  etc.) using overlays, rather than one DTB per version to avoid
  needless increase of binary sizes and reflect reality
- switch to memory-region instead of reg for framebuffer memory
---
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 284 +--------------------
 .../{gs101-oriole.dts => gs101-pixel-common.dtsi}  |  15 +-
 2 files changed, 14 insertions(+), 285 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
index d3dd411c9bd0..8df42bedbc03 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
@@ -8,290 +8,22 @@
 
 /dts-v1/;
 
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/input/input.h>
-#include <dt-bindings/usb/pd.h>
-#include "gs101-pinctrl.h"
-#include "gs101.dtsi"
+#include "gs101-pixel-common.dtsi"
 
 / {
 	model = "Oriole";
 	compatible = "google,gs101-oriole", "google,gs101";
-
-	aliases {
-		serial0 = &serial_0;
-	};
-
-	chosen {
-		/* Bootloader expects bootargs specified otherwise it crashes */
-		bootargs = "";
-		stdout-path = &serial_0;
-
-		/* Use display framebuffer as setup by bootloader */
-		framebuffer0: framebuffer-0 {
-			compatible = "simple-framebuffer";
-			memory-region = <&cont_splash_mem>;
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
+&cont_splash_mem {
+	reg = <0x0 0xfac00000 (1080 * 2400 * 4)>;
 	status = "okay";
 };
 
-&watchdog_cl0 {
-	timeout-sec = <30>;
+&framebuffer0 {
+	width = <1080>;
+	height = <2400>;
+	stride = <(1080 * 4)>;
+	format = "a8r8g8b8";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
similarity index 96%
copy from arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
copy to arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index d3dd411c9bd0..b25230495c64 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Oriole Device Tree
+ * Device Tree nodes common for all GS101-based Pixel
  *
  * Copyright 2021-2023 Google LLC
  * Copyright 2023 Linaro Ltd - <peter.griffin@linaro.org>
@@ -15,9 +15,6 @@
 #include "gs101.dtsi"
 
 / {
-	model = "Oriole";
-	compatible = "google,gs101-oriole", "google,gs101";
-
 	aliases {
 		serial0 = &serial_0;
 	};
@@ -31,10 +28,8 @@ chosen {
 		framebuffer0: framebuffer-0 {
 			compatible = "simple-framebuffer";
 			memory-region = <&cont_splash_mem>;
-			width = <1080>;
-			height = <2400>;
-			stride = <(1080 * 4)>;
-			format = "a8r8g8b8";
+			/* format properties to be added by actual board */
+			status = "disabled";
 		};
 	};
 
@@ -82,8 +77,10 @@ ufs_0_fixed_vcc_reg: regulator-1 {
 
 	reserved-memory {
 		cont_splash_mem: splash@fac00000 {
-			reg = <0x0 0xfac00000 (1080 * 2400 * 4)>;
+			/* size to be updated by actual board */
+			reg = <0x0 0xfac00000 0x0>;
 			no-map;
+			status = "disabled";
 		};
 	};
 };

-- 
2.48.0.rc2.279.g1de40edade-goog

