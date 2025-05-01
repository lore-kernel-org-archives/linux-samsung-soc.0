Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7D122B8BF;
	Thu,  1 May 2025 11:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746099254; cv=none; b=A2k7EdT1NdIDIwMlai4sH5Im5QS6Tw6uPJF6QrBBup1TKLMj2tu/uuydMWnS8JNbJf7/uDQnIffRM8cypYi+9A+f9bB+IOr/1n0WWmtQbR/Pxf050UyKv5AvF3WXAdNqZkunv35pDgjBD0uILLXxfhlAPoX47cJ2WB3ZG0TG5yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746099254; c=relaxed/simple;
	bh=1t6etv+yzq/k2swtasHTUgsqyK+5AZePSz8OK7woU+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IExfXEwfkoDHVYbTkJJvA9XkaW9A7sbLheHf9OVGZFW79D6I9TleH3g3LcFvE88RJ2P2d3kd9wwodMcht9wFfIxvfqr6COPBTj8arlAsPSS+wa3dpms4Ho5I3UE6dCQuas6tfvd5MnqyQrjo9buFxEMG95bDGxq6dxmeusKFuQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=GERuw9N4; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="GERuw9N4"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0DDE420240;
	Thu,  1 May 2025 13:34:11 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s_0JlPuh4B2J; Thu,  1 May 2025 13:34:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746099249; bh=1t6etv+yzq/k2swtasHTUgsqyK+5AZePSz8OK7woU+M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GERuw9N4J6u4OiwldyT2mWaeZD+OdBIi9HiS3yL6UkYu4RjxBEZL0XS8EopDNXOv/
	 RICIyGvaJ2IxNd7Rc5B180g8FTU3ww6j1RflBTd5xCqVQHz6uu25Uz0mEznjvYe/rN
	 QpQSKTQp8uG7ZNyaO6v1vdYBczLSLaaqwBbtaLWzW/UvmgeqiTWPdu6Ag3K6Z/HVHx
	 FdOWCFky+xofzmzH7GbOauDbh8NePuAlrvqfs5yVx2fRvL2XsdPdMbB8UnPkzq/Byl
	 urE9UiGTfy9kT77BWcwPFAWQzgheNTnAvOFXRfEcRDRhuF+nuMe3Vl8FTPz36saGoA
	 iVjq7IHRw8A/g==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 01 May 2025 17:03:00 +0530
Subject: [PATCH v7 4/5] arm64: dts: exynos: add initial support for Samsung
 Galaxy A2 Core
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-exynos7870-v7-4-bb579a27e5eb@disroot.org>
References: <20250501-exynos7870-v7-0-bb579a27e5eb@disroot.org>
In-Reply-To: <20250501-exynos7870-v7-0-bb579a27e5eb@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746099219; l=16662;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=1t6etv+yzq/k2swtasHTUgsqyK+5AZePSz8OK7woU+M=;
 b=EZ9pIqMQF1VoS0qVEy9M6uqdsOrI/aw4cqf3yZPPqArHUyR4NEjv003LRxzolzJKeC35eYjRN
 szo+Jhgkii+BfHehFynKWL/LpeDOtgSKwqIa+xSw2V+kLVdPxsQOiep
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Add initial devicetree support for Samsung Galaxy A2 Core
(codename: a2corelte), an Exynos7870 device.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 arch/arm64/boot/dts/exynos/Makefile                |   1 +
 .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts | 630 +++++++++++++++++++++
 2 files changed, 631 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
index a8d78d2add05ecf688ffa3a32aa5b8d1a48faf81..e0da4c4972c7344cf957e00ef701d6405a16bdcb 100644
--- a/arch/arm64/boot/dts/exynos/Makefile
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -5,6 +5,7 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
 	exynos5433-tm2.dtb		\
 	exynos5433-tm2e.dtb		\
 	exynos7-espresso.dtb		\
+	exynos7870-a2corelte.dtb	\
 	exynos7870-on7xelte.dtb		\
 	exynos7885-jackpotlte.dtb	\
 	exynos850-e850-96.dtb		\
diff --git a/arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts b/arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts
new file mode 100644
index 0000000000000000000000000000000000000000..eb7b48593187409ce6653b7d857b63f6946aa4f7
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts
@@ -0,0 +1,630 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Samsung Galaxy A2 Core (a2corelte) device tree source
+ *
+ * Copyright (c) 2018 Samsung Electronics Co., Ltd.
+ * Copyright (c) 2025 Kaustabh Chakraborty <kauschluss@disroot.org>
+ */
+
+/dts-v1/;
+#include "exynos7870.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	model = "Samsung Galaxy A2 Core";
+	compatible = "samsung,a2corelte", "samsung,exynos7870";
+	chassis-type = "handset";
+
+	aliases {
+		mmc0 = &mmc0;
+		mmc1 = &mmc1;
+		mmc2 = &mmc2;
+		serial0 = &serial0;
+		serial1 = &serial1;
+		serial2 = &serial2;
+	};
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges;
+
+		stdout-path = &serial2;
+
+		framebuffer@67000000 {
+			compatible = "simple-framebuffer";
+			reg = <0x0 0x67000000 (540 * 960 * 4)>;
+			width = <540>;
+			height = <960>;
+			stride = <(540 * 4)>;
+			format = "a8r8g8b8";
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		label = "GPIO Keys";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&key_power &key_voldown &key_volup>;
+
+		key-power {
+			label = "Power Key";
+			gpios = <&gpa0 0 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
+		};
+
+		key-voldown {
+			label = "Volume Down Key";
+			gpios = <&gpa2 1 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+		};
+
+		key-volup {
+			label = "Volume Up Key";
+			gpios = <&gpa2 0 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0x0 0x40000000 0x3f200000>;
+	};
+
+	pwrseq_mmc1: pwrseq-mmc1 {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpd3 6 GPIO_ACTIVE_LOW>;
+	};
+
+	/* mmc2: vmmc */
+	vdd_fixed_mmc2: regulator-fixed-mmc2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_fixed_mmc2";
+		regulator-max-microvolt = <2800000>;
+		regulator-min-microvolt = <2800000>;
+		gpio = <&gpc0 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vdd_fixed_proxled: regulator-fixed-proxled {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_fixed_proxled";
+		regulator-boot-on;
+		regulator-always-on;
+		gpio = <&gpd4 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges;
+
+		ramoops@46800000 {
+			compatible = "ramoops";
+			reg = <0x0 0x46800000 0x8000>;
+			console-size = <0x4000>;
+			pmsg-size = <0x4000>;
+		};
+
+		framebuffer@67000000 {
+			reg = <0x0 0x67000000 (540 * 960 * 4)>;
+			no-map;
+		};
+	};
+
+	vibrator {
+		compatible = "regulator-haptic";
+		haptic-supply = <&vdd_ldo32>;
+		min-microvolt = <3300000>;
+		max-microvolt = <3300000>;
+	};
+};
+
+&gpu {
+	status = "okay";
+};
+
+&hsi2c0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	pmic@66 {
+		compatible = "samsung,s2mpu05-pmic";
+		reg = <0x66>;
+		interrupt-parent = <&gpa0>;
+		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pmic_irq>;
+
+		regulators {
+			vdd_buck1: buck1 {
+				regulator-name = "vdd_buck1";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <12000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vdd_buck2: buck2 {
+				regulator-name = "vdd_buck2";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <12000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vdd_buck3: buck3 {
+				regulator-name = "vdd_buck3";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <12000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vdd_buck4: buck4 {
+				regulator-name = "vdd_buck4";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1500000>;
+				regulator-ramp-delay = <12000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vdd_buck5: buck5 {
+				regulator-name = "vdd_buck5";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <2100000>;
+				regulator-ramp-delay = <12000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vdd_ldo1: ldo1 {
+				regulator-name = "vdd_ldo1";
+				regulator-min-microvolt = <650000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-ramp-delay = <12000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			/* mmc2: vqmmc */
+			vdd_ldo2: ldo2 {
+				regulator-name = "vdd_ldo2";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-ramp-delay = <12000>;
+			};
+
+			vdd_ldo3: ldo3 {
+				regulator-name = "vdd_ldo3";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <2375000>;
+				regulator-ramp-delay = <12000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vdd_ldo4: ldo4 {
+				regulator-name = "vdd_ldo4";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-ramp-delay = <12000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vdd_ldo5: ldo5 {
+				regulator-name = "vdd_ldo5";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-ramp-delay = <12000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vdd_ldo6: ldo6 {
+				regulator-name = "vdd_ldo6";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-ramp-delay = <12000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vdd_ldo7: ldo7 {
+				regulator-name = "vdd_ldo7";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <2375000>;
+				regulator-ramp-delay = <12000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			/* usbdrd: vdd33 */
+			vdd_ldo8: ldo8 {
+				regulator-name = "vdd_ldo8";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3375000>;
+				regulator-ramp-delay = <12000>;
+			};
+
+			vdd_ldo9: ldo9 {
+				regulator-name = "vdd_ldo9";
+				regulator-min-microvolt = <650000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-ramp-delay = <12000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vdd_ldo10: ldo10 {
+				regulator-name = "vdd_ldo10";
+				regulator-min-microvolt = <650000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-ramp-delay = <12000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vdd_ldo25: ldo25 {
+				regulator-name = "vdd_ldo25";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <2375000>;
+				regulator-ramp-delay = <12000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			/* mmc0: vmmc */
+			vdd_ldo26: ldo26 {
+				regulator-name = "vdd_ldo26";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3375000>;
+				regulator-ramp-delay = <12000>;
+			};
+
+			/* mmc0: vqmmc */
+			vdd_ldo27: ldo27 {
+				regulator-name = "vdd_ldo27";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <2375000>;
+				regulator-ramp-delay = <12000>;
+			};
+
+			vdd_ldo29: ldo29 {
+				regulator-name = "vdd_ldo29";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vdd_ldo30: ldo30 {
+				regulator-name = "vdd_ldo30";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vdd_ldo31: ldo31 {
+				regulator-name = "vdd_ldo31";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-ramp-delay = <12000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			/* vibrator: haptic */
+			vdd_ldo32: ldo32 {
+				regulator-name = "vdd_ldo32";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <12000>;
+			};
+
+			vdd_ldo33: ldo33 {
+				regulator-name = "vdd_ldo33";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-ramp-delay = <12000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vdd_ldo34: ldo34 {
+				regulator-name = "vdd_ldo34";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-ramp-delay = <12000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			/* touchscreen: vdd */
+			vdd_ldo35: ldo35 {
+				regulator-name = "vdd_ldo35";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-ramp-delay = <12000>;
+			};
+		};
+	};
+};
+
+&i2c5 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	samsung,i2c-sda-delay = <100>;
+	samsung,i2c-max-bus-freq = <400000>;
+
+	status = "okay";
+
+	accelerometer@1d {
+		compatible = "st,lis2ds12";
+		reg = <0x1d>;
+		interrupt-parent = <&gpa2>;
+		interrupts = <3 IRQ_TYPE_EDGE_RISING>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&accel_irq>;
+
+		st,drdy-int-pin = <1>;
+	};
+
+	proximity@48 {
+		compatible = "sensortek,stk3013", "sensortek,stk3310";
+		reg = <0x48>;
+		interrupt-parent = <&gpa0>;
+		interrupts = <5 IRQ_TYPE_EDGE_BOTH>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&proxm_irq>;
+
+		proximity-near-level = <25>;
+	};
+};
+
+&i2c6 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	samsung,i2c-sda-delay = <100>;
+	samsung,i2c-max-bus-freq = <400000>;
+
+	status = "okay";
+
+	touchscreen@4b {
+		compatible = "syna,rmi4-i2c";
+		reg = <0x4b>;
+		interrupt-parent = <&gpa0>;
+		interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&touch_irq>;
+
+		vdd-supply = <&vdd_ldo35>;
+
+		syna,reset-delay-ms = <200>;
+		syna,startup-delay-ms = <200>;
+
+		rmi4-f01@1 {
+			reg = <0x01>;
+			syna,nosleep-mode = <1>;
+		};
+
+		rmi4-f12@12 {
+			reg = <0x12>;
+			syna,sensor-type = <1>;
+			syna,rezero-wait-ms = <200>;
+			syna,clip-x-high = <539>;
+			syna,clip-y-high = <959>;
+			touchscreen-x-mm = <62>;
+			touchscreen-y-mm = <110>;
+		};
+	};
+};
+
+&mmc0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_rdqs &sd0_bus1 &sd0_bus4 &sd0_bus8>;
+
+	vmmc-supply = <&vdd_ldo26>;
+	vqmmc-supply = <&vdd_ldo27>;
+
+	fifo-depth = <64>;
+	samsung,dw-mshc-ciu-div = <3>;
+	samsung,dw-mshc-sdr-timing = <0 4>;
+	samsung,dw-mshc-ddr-timing = <2 4>;
+	non-removable;
+
+	status = "okay";
+};
+
+&mmc1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&sd1_clk &sd1_cmd &sd1_bus1 &sd1_bus4>;
+
+	mmc-pwrseq = <&pwrseq_mmc1>;
+
+	bus-width = <4>;
+	fifo-depth = <64>;
+	samsung,dw-mshc-ciu-div = <3>;
+	samsung,dw-mshc-sdr-timing = <0 3>;
+	samsung,dw-mshc-ddr-timing = <1 2>;
+	non-removable;
+	cap-sd-highspeed;
+	cap-sdio-irq;
+
+	status = "okay";
+
+	wifi@1 {
+		compatible = "brcm,bcm43430a1-fmac", "brcm,bcm4329-fmac";
+		reg = <0x1>;
+		interrupt-names = "host-wake";
+		interrupt-parent = <&gpa2>;
+		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+
+		reset-gpios = <&gpd3 6 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&mmc2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_bus1 &sd2_bus4 &dwmmc2_irq>;
+
+	vmmc-supply = <&vdd_fixed_mmc2>;
+	vqmmc-supply = <&vdd_ldo2>;
+
+	bus-width = <4>;
+	card-detect-delay = <200>;
+	fifo-depth = <64>;
+	samsung,dw-mshc-ciu-div = <3>;
+	samsung,dw-mshc-sdr-timing = <0 3>;
+	samsung,dw-mshc-ddr-timing = <1 2>;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	broken-cd;
+	disable-wp;
+
+	status = "okay";
+};
+
+&oscclk {
+	clock-frequency = <26000000>;
+};
+
+&pinctrl_alive {
+	accel_irq: accel-irq-pins {
+		samsung,pins = "gpa2-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	dwmmc2_irq: dwmmc2-irq-pins {
+		samsung,pins = "gpa0-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	fuel_irq: fuel-irq-pins {
+		samsung,pins = "gpa0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	key_power: key-power-pins {
+		samsung,pins = "gpa0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	key_voldown: key-voldown-pins {
+		samsung,pins = "gpa2-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	key_volup: key-volup-pins {
+		samsung,pins = "gpa2-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	pmic_irq: pmic-irq-pins {
+		samsung,pins = "gpa0-2";
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR4>;
+	};
+
+	proxm_irq: proxm-irq-pins {
+		samsung,pins = "gpa0-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	touch_irq: touch-irq-pins {
+		samsung,pins = "gpa0-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	wlan_hostwake: wlan-hostwake-pins {
+		samsung,pins = "gpa2-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+	};
+};
+
+&pinctrl_top {
+	bt_enable: bt-enable-pins {
+		samsung,pins = "gpd4-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+	};
+
+	wlan_enable: wlan-enable-pins {
+		samsung,pins = "gpd3-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR4>;
+		samsung,pin-val = <0>;
+	};
+};
+
+&serial1 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm43430a1-bt";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_btwake &bt_hostwake &bt_enable>;
+
+		device-wakeup-gpios = <&gpa1 2 GPIO_ACTIVE_HIGH>;
+		host-wakeup-gpios = <&gpa1 6 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&gpd4 0 GPIO_ACTIVE_HIGH>;
+
+		max-speed = <3000000>;
+	};
+};
+
+&serial2 {
+	status = "okay";
+};
+
+&usbdrd {
+	vdd33-supply = <&vdd_ldo8>;
+
+	status = "okay";
+};

-- 
2.49.0

