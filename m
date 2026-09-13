Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E163EB818
	for <linux-samsung-soc@vger.kernel.org>; Sun, 13 Sep 2026 12:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789303075; cv=none; b=Jf1NENaMaqA1+hV2PAgU7I4Q75Fw92szZdTU1DFF1Y9LqCZXggsnAP9FlDf1+uIlYsqtmT/wzgwCIv57f1NumkNN2vCvvI5LRGbPBvOR+bzyir4MGeKbu7VDcq4uDENNNlrGDes+CthjresfAoHs7yCR354VGYmSvw4ClQXj+ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789303075; c=relaxed/simple;
	bh=3nJlWNtTtPTDMNWP3xEBsNvDMXxnWH2XWNTAgTusUlU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xm9d/N70UQB8FXMGWEO+LWmQhPQQyqXn8CA19oBsR5epd1tC3mDnFvEl6UY+Yhi68ib3nXtPfl5emPKpIG3MT10KqpuNljWiBqZSrAUKOLPskTu87lN0R8iL+ebnghs7mQhYV97Rw2nsTwIUalnYFaN0WNQGW0jScpAdRm15Us8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org; dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b=kxQaAE04; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b="kxQaAE04"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineageos.org;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-2eefaa527c;
 t=1789303072; bh=u38Y4MoVcXG+fMHlnZeSS+uFlb5f35gSI775Bu9SViU=;
 b=kxQaAE04j8IA37tP8HebFSs6OF0/8X5GoTeYucIfKY/+OSv4S3P+PPckJSf+dMKPnqj9zDVJH
 muG/CeUTRFX9GE1sJvRh+Ujk0LJaHPJM18NEtkwvPR8N6704TsWDb7xIplfIfmJQqg9ufkZmXHi
 vrByV+Px78O81woQUCcJPGs=
X-Forward-Email-ID: 6aa6991e53bb319e9d04cb24
X-Forward-Email-Sender: rfc822; tturner@lineageos.org,
 smtp.forwardemail.net, 121.127.44.73
X-Forward-Email-Version: 2.14.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Thomas Turner <tturner@lineageos.org>
To: semen.protsenko@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	peter.griffin@linaro.org
Cc: alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas_turner@talktalk.net,
	alexey.klimov@linaro.org
Subject: [PATCH v2 2/2] arm64: dts: exynos: Add initial support for Samsung Galaxy A21s (SM-A217F)
Date: Sun, 13 Sep 2026 13:37:40 +0100
Message-ID: <20260913123740.203698-3-tturner@lineageos.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260913123740.203698-1-tturner@lineageos.org>
References: <20260913123740.203698-1-tturner@lineageos.org>
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
- 3GB RAM
- Buttons
- Ramoops
- MMC
- USB
- Watchdog

Signed-off-by: Thomas Turner <tturner@lineageos.org>
---
Changes in v2:
 - Re-order properties/nodes to pass dt-check-style --mode strict

 arch/arm64/boot/dts/exynos/Makefile           |   1 +
 .../arm64/boot/dts/exynos/exynos850-a217f.dts | 194 ++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos850.dtsi     |   2 +-
 3 files changed, 196 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos850-a217f.dts

diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
index 76cc23acb9b2..f197f8eb633b 100644
--- a/arch/arm64/boot/dts/exynos/Makefile
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -13,6 +13,7 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
 	exynos7870-j7xelte.dtb		\
 	exynos7870-on7xelte.dtb		\
 	exynos7885-jackpotlte.dtb	\
+	exynos850-a217f.dtb		\
 	exynos850-e850-96.dtb		\
 	exynos8895-dreamlte.dtb		\
 	exynos9810-starlte.dtb		\
diff --git a/arch/arm64/boot/dts/exynos/exynos850-a217f.dts b/arch/arm64/boot/dts/exynos/exynos850-a217f.dts
new file mode 100644
index 000000000000..8e5cf81b9e12
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos850-a217f.dts
@@ -0,0 +1,194 @@
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
index 3881f573ec08..8de135807aa7 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -147,7 +147,7 @@ psci {
 		method = "smc";
 	};
 
-	timer {
+	timer: timer {
 		compatible = "arm,armv8-timer";
 		/* Hypervisor Virtual Timer interrupt is not wired to GIC */
 		interrupts =
-- 
2.47.3

