Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAC84E2F05
	for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Sep 2026 20:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789592176; cv=none; b=q8cX2xxD87PqfFBhRosNUHbRPgeyP2SU9KP86rGD1fL4qsc4x8Bi2qLA7NSRxuV5eW77glp2zVAKQWMN/aXZkGFOOrJjX+rU/NPOmTHv3Sk5hwKPYJXF3ZeEOv9JCXBkLJP6y6/1l6xzrwIXrImb5a9wrcZ4FGMuTcbfDOb6MC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789592176; c=relaxed/simple;
	bh=nFyiR39UMicVX9aYUjGi+ni+w6eRx60kOl5YoyeLqMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rkoy+aV5uE1eTgo1dMncsuSz22758SxaNoJ6XcyorinccYu+KST6Sit1r2k/PE37cDqjb0XYAfZsogRviFPdMGMOnTQyct7jK+T7JtzucFhZKLmdXbInlTRSwQlscoWr5d9FMql7M6bxma3kVf9QPamVWdcOWSAKcMiwYJzg7Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org; dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b=G1mRJR4V; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b="G1mRJR4V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineageos.org;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-2eefaa527c;
 t=1789592135; bh=0fKQ3LgrFx8+J421uQJCrt69RgRQl0uYZ6P+iMcW8dk=;
 b=G1mRJR4VTSqxcFM/CvExuKdQddBKvz+jQnHRyn52t3kg3leKs6V1cT4O8Tw+wgxd0n4vU0NZm
 RxzKzxd9NNlNs/87fn/2/wYzI9u+YyR7/SmQKgb6pwuEhd9AjwwTAgphRhTaXjJGNLSwSahdDjJ
 CYSj0I++1hUx18FtDUpOFcQ=
X-Forward-Email-ID: 6aab024707c281602cddbf67
X-Forward-Email-Sender: rfc822; tturner@lineageos.org,
 smtp.forwardemail.net, 121.127.44.73
X-Forward-Email-Version: 2.14.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Thomas Turner <tturner@lineageos.org>
To: krzk@kernel.org,
	peter.griffin@linaro.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	semen.protsenko@linaro.org,
	alexey.klimov@linaro.org
Cc: alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] arm64: dts: exynos: Add initial support for Samsung Galaxy A21s (SM-A217F)
Date: Wed, 16 Sep 2026 21:55:22 +0100
Message-ID: <20260916205522.159393-3-tturner@lineageos.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916205522.159393-1-tturner@lineageos.org>
References: <20260916205522.159393-1-tturner@lineageos.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial support for the Samsung Galaxy A21s (a21s) phone. It was
launched in 2020, and it's based on the Exynos 850 SoC. It has multiple
RAM configurations: 3GB, 4GB and 6GB.

Since our bootloader does not set up memory nodes beforehand, default to
the 3GB variant. Custom bootloaders can be used to initialise other
nodes per RAM configuration.

The Exynos DPU clocks required by simple-framebuffer are not kept
enabled during boot. Add the DECON, DMA, DPP, PPMU and SSMU DPU clocks
to the simple-framebuffer node so simpledrm maintains references to
them. Without these clocks, the framebuffer fails to remain operational
further into boot.

This device tree adds support for the following:

- SimpleFB
- Buttons
- 3GB RAM
- Ramoops
- GPU
- MMC
- USB
- Watchdog

Signed-off-by: Thomas Turner <tturner@lineageos.org>
---
Changes in v3:
 - Add gpu node with dummy regulator
 - Re-order feature list in patch msg and mention GPU
 - Rebase patch on top of for-next

Changes in v2:
 - Re-order properties/nodes to pass dt-check-style --mode strict

 arch/arm64/boot/dts/exynos/Makefile           |   1 +
 .../arm64/boot/dts/exynos/exynos850-a217f.dts | 200 ++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos850.dtsi     |   2 +-
 3 files changed, 202 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos850-a217f.dts

diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
index 8c48ce2e02e5..7534b773d28f 100644
--- a/arch/arm64/boot/dts/exynos/Makefile
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -13,6 +13,7 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
 	exynos7870-j7xelte.dtb		\
 	exynos7870-on7xelte.dtb		\
 	exynos7885-jackpotlte.dtb	\
+	exynos850-a217f.dtb		\
 	exynos850-e850-96.dtb		\
 	exynos8855-smdk.dtb		\
 	exynos8895-dreamlte.dtb		\
diff --git a/arch/arm64/boot/dts/exynos/exynos850-a217f.dts b/arch/arm64/boot/dts/exynos/exynos850-a217f.dts
new file mode 100644
index 000000000000..b5b66c015e1e
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos850-a217f.dts
@@ -0,0 +1,200 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Samsung Galaxy A21s (a21s/SM-A217F) device tree source
+ *
+ * Copyright (c) 2026, Thomas Turner <tturner@lineageos.org>
+ */
+
+/dts-v1/;
+#include "exynos850.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+
+/ {
+	model = "Samsung Galaxy A21s";
+	compatible = "samsung,a217f", "samsung,exynos850";
+
+	chosen {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <1>;
+
+		framebuffer0: framebuffer@fa000000 {
+			compatible = "simple-framebuffer";
+			reg = <0x0 0xfa000000 (720 * 1600 * 4)>;
+			width = <720>;
+			height = <1600>;
+			stride = <(720 * 4)>;
+			format = "a8r8g8b8";
+			clocks = <&cmu_dpu CLK_GOUT_DPU_DECON0_ACLK>,
+				 <&cmu_dpu CLK_GOUT_DPU_DMA_ACLK>,
+				 <&cmu_dpu CLK_GOUT_DPU_DPP_ACLK>,
+				 <&cmu_dpu CLK_GOUT_DPU_PPMU_ACLK>,
+				 <&cmu_dpu CLK_GOUT_DPU_PPMU_PCLK>,
+				 <&cmu_dpu CLK_GOUT_DPU_SMMU_CLK>;
+		};
+	};
+
+	/*
+	 * RTC clock (XrtcXTI); external, must be 32.768 kHz.
+	 *
+	 * TODO: Remove this once RTC clock is implemented properly as part of
+	 *       PMIC driver.
+	 */
+	rtcclk: clock-rtcclk {
+		compatible = "fixed-clock";
+		clock-output-names = "rtcclk";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&key_voldown &key_volup>;
+		pinctrl-names = "default";
+
+		voldown-key {
+			label = "Volume Down";
+			gpios = <&gpa1 0 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+		};
+
+		volup-key {
+			label = "Volume Up";
+			gpios = <&gpa0 7 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x3c900000>,
+		      <0x0 0xc0000000 0x20000000>,
+		      <0x0 0xe0d00000 0x1f300000>,
+		      <0x8 0x80000000 0x20000000>,
+		      <0x8 0xa0000000 0x20000000>;
+	};
+
+	/* TODO: Remove this once PMIC is implemented  */
+	reg_dummy: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "dummy_reg";
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <1>;
+
+		ramoops@f0000000 {
+			compatible = "ramoops";
+			reg = <0x0 0xf0000000 0x200000>;
+			record-size = <0x20000>;
+			console-size = <0x20000>;
+			ftrace-size = <0x100000>;
+			pmsg-size = <0x20000>;
+		};
+
+		cont_splash_mem: framebuffer@fa000000 {
+			reg = <0x0 0xfa000000 (720 * 1600 * 4)>;
+			no-map;
+		};
+	};
+};
+
+&cmu_hsi {
+	clocks = <&oscclk>, <&rtcclk>,
+		 <&cmu_top CLK_DOUT_HSI_BUS>,
+		 <&cmu_top CLK_DOUT_HSI_MMC_CARD>,
+		 <&cmu_top CLK_DOUT_HSI_USB20DRD>;
+	clock-names = "oscclk", "rtcclk", "dout_hsi_bus",
+		      "dout_hsi_mmc_card", "dout_hsi_usb20drd";
+};
+
+&gpu {
+	mali-supply = <&reg_dummy>;
+
+	status = "okay";
+};
+
+&mmc_0 {
+	compatible = "samsung,exynos7-dw-mshc";
+	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	cap-mmc-highspeed;
+	non-removable;
+	mmc-hs400-enhanced-strobe;
+	card-detect-delay = <200>;
+	clock-frequency = <800000000>;
+	bus-width = <8>;
+
+	pinctrl-0 = <&sd0_clk_pins &sd0_cmd_pins &sd0_rdqs_pins &sd0_nreset_pins
+		     &sd0_bus1_pins &sd0_bus4_pins &sd0_bus8_pins>;
+	pinctrl-names = "default";
+
+	samsung,dw-mshc-ciu-div = <3>;
+	samsung,dw-mshc-sdr-timing = <0 4>;
+	samsung,dw-mshc-ddr-timing = <2 4>;
+	samsung,dw-mshc-hs400-timing = <0 2>;
+
+	status = "okay";
+};
+
+&oscclk {
+	clock-frequency = <26000000>;
+};
+
+&pinctrl_alive {
+	key_voldown: key-voldown-pins {
+		samsung,pins = "gpa1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	key_volup: key-volup-pins {
+		samsung,pins = "gpa0-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+};
+
+&rtc {
+	clocks = <&cmu_apm CLK_GOUT_RTC_PCLK>, <&rtcclk>;
+	clock-names = "rtc", "rtc_src";
+
+	status = "disabled";
+};
+
+&timer {
+	/*
+	 * Non-updatable, broken stock Samsung bootloader does not
+	 * configure CNTFRQ_EL0
+	 */
+	clock-frequency = <26000000>;
+};
+
+&usbdrd {
+	vdd10-supply = <&reg_dummy>;
+	vdd33-supply = <&reg_dummy>;
+
+	status = "okay";
+};
+
+&usbdrd_dwc3 {
+	dr_mode = "otg";
+	maximum-speed = "high-speed";
+};
+
+&usbdrd_phy {
+	status = "okay";
+};
+
+&watchdog_cl0 {
+	status = "okay";
+};
+
+&watchdog_cl1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 7fae8888952a..c8e4c234223c 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -160,7 +160,7 @@ psci {
 		method = "smc";
 	};
 
-	timer {
+	timer: timer {
 		compatible = "arm,armv8-timer";
 		/* Hypervisor Virtual Timer interrupt is not wired to GIC */
 		interrupts =
-- 
2.47.3

