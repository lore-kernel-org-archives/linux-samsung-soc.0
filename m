Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802891B0F3D
	for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Jan 2025 16:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736957477; cv=none; b=sobpwVRtpYQHEEe0FjAhdW/+SQUMVPwGHnipOBOURVXp7G4H21yaUyJIBzuhkqB670XT+DrLGnXply7/CYKlc4STJB3Wz8whDoBwW9mhombzqMAe2JXoMBTtv1oSON7BnJmYP/up+fOU0z7T1h19RCS//4oVMJ+pVlnyexYGAJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736957477; c=relaxed/simple;
	bh=kx7ZAfKl58JGTsnJABVXTvUq2/3fVBMwWMuqAnQSIMw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H+WerjSymDP8A9cy22g5Cs3gXGlo0Zg8euEic5D2NwXcXZabAeN2b5nveyXCXi36kfROmhe8oVAsTrnTW1+P2c+JtZbosOsrIcf2WcyzX58rlMO/zVxMtIF+UXPRkB/kchupgAV5MYh5EKTbFFpKsa7FhIzDklnPc+tftC3jspo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PcMe01KV; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PcMe01KV"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5d3dce16a3dso2059138a12.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Jan 2025 08:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736957473; x=1737562273; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MfnXh4xNEl2veLLUMoW2fFOfVxeDxb438BEqj2RkATs=;
        b=PcMe01KVJlRyFBNPK8ex1shEDVGhTKbDKgruuXvEVC6PDYpIXB84fIPmLf1YxybzUS
         ZHhz6SCdKeiumX6cYDOBS9w/WiKdyu2VlI/PwJGZviB6Su8q3dH0LDhNdE84JbRHJWwi
         QZAln70WQf5u+7aJz2rbHbzFNcte0/0QUfZNEVUdRM1Z/JqsRQvvnNN28OasdKY88Sqm
         u/GIu3KjBk2/Fkkbi1mz5zV42oWgqK7rdfO06A2xijG39dXYZdUgVQ02jSJZTN9syGjX
         w+/Ff7NTGMm1RM4GeiQnZ23mWbYzWcwwCQqhw+vFvX7aVF1Pks9AAbOYXyeC225iCwoL
         FT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736957473; x=1737562273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MfnXh4xNEl2veLLUMoW2fFOfVxeDxb438BEqj2RkATs=;
        b=m1qqglGnZhpAv2AXjV8Wfbl7kXKHHrjK9cJJbk5lNxV8qHb8dvGerxoinIQe4TrUvd
         vu+bLNKHgIRCZovXxK5InEV3Q17YTmwd+et6R9uw5I0ggoo+pg/voIfhiEKylwi7YlTt
         h0BLDZ7Dm7fkUVoPXqTkzCltfsWdcKyM2anacPVovEKO/E7MBRKgLBEgNSr/J8jFcjQL
         DTt6/wFLgDxH0ljp6fr1lu1/xiub2huWDDeiW1zPtocwDWsj5AP0W0oGGiOwv/iVdbaO
         CWEafLq7J7pHm0E24qpg1PH1b58KrhEv9JUIKm+3ju/0Gt4oQkvtbSL4Ctg9wD8Ezndq
         oXdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaP3IVEUsuHsBliHfTiosXsfiT8qO9L1XJm0yJUqCb0UTcXgR/POlfZ4pqJvTOfNltfPNVrjagFYB3xzieEjLJxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUczE0ggKnu3yvb6WpO9k5+T9lnqVkoUNiqea5NsH9J0XaVJCJ
	ofciy9jevHLrjkjZ6FSsNTjcNCIvZfz8J/wm3oxiUVf/qEfnZaiLnSZBcRRTLb0=
X-Gm-Gg: ASbGncvbZoXevtN1+jTN6xvGfeyG9YNiqpoF6nhLMIjutsuR24Hnfksc0TlK/dof1CZ
	RA1/6OZNuLanhRvspCYOJNSvfa22nts8dvjx5CnWn3OjduXSG2/nQZABGFuFaaRc8HUOrnxgxBa
	Vq/Zs7wJ4XfmE294fPN6wW0fgmR00EVuk2pUDb3O8p9tITHcqttrz83PWLCTaWRUf5AXRcjEU1M
	khsALIjEXiH2aigTvZwS6Kr5pbX3RDGaCJqgxfAj/yBf05iv3x6/wflKZV6N0u8JDJmw2lMNJ3A
	KwOO2Q5zBgizoQ1l/G9v9hibLhrtMm0mot/EWT5i
X-Google-Smtp-Source: AGHT+IFMiB29BckZaQwUVqk7S5h51YFYdYV3Hy0EsqymCK739Yxc0g+kndvAuXsvigO7Vod/nvuxNA==
X-Received: by 2002:a05:6402:350a:b0:5d0:e7a0:154a with SMTP id 4fb4d7f45d1cf-5da0c2c2872mr3165352a12.8.1736957472606;
        Wed, 15 Jan 2025 08:11:12 -0800 (PST)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9904a55f9sm7416232a12.81.2025.01.15.08.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 08:11:11 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 15 Jan 2025 16:11:11 +0000
Subject: [PATCH v3 3/4] arm64: dts: exynos: gs101-oriole: move common
 Pixel6 & 6Pro parts into a .dtsi
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250115-gs101-simplefb-v3-3-52eca3a582b7@linaro.org>
References: <20250115-gs101-simplefb-v3-0-52eca3a582b7@linaro.org>
In-Reply-To: <20250115-gs101-simplefb-v3-0-52eca3a582b7@linaro.org>
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

