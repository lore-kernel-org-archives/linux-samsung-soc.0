Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA87120F071;
	Mon,  3 Feb 2025 20:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738615630; cv=none; b=NRTwTXo5pyj7Yp16Ww4tNmuRTPhfWokAdZv8shoTa5+9gaFw7YmnIHxSgTQfXtJu0xMGS1zMRZtC4cuJ1a34BUpJFPKbH3MV8LIs/GuMUOyEvydMkCMyjAj4KNz6KT1Dg9uYCSex12by0WCFGyHQ+oBcBu1pCIPdSLkV3tkWyfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738615630; c=relaxed/simple;
	bh=MeO7B5awIqvRKVZXS7/DmFbWhryQXIaXkNrYqqxruzs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oRpyprzB/NCg1x02L5xQCRtyUtgz1UdF2NXfhL2w5B5PX08FZp09C42dm5Bz+6NCQt2/b9hNo7mvv4NPxU3wDJjbOMQlQpajjzufyZt0y/77BIRd4+zvHz7gJEvSSku1KuqYIBrSaOvLrVFU74okx77bxRPrxktHaFx4rCPEfrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=kgbdz2th; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="kgbdz2th"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 1BB7220529;
	Mon,  3 Feb 2025 21:47:05 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w3UyeAuxAODB; Mon,  3 Feb 2025 21:47:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738615612; bh=MeO7B5awIqvRKVZXS7/DmFbWhryQXIaXkNrYqqxruzs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=kgbdz2thtPaVbYVNzNZgNNuZbb60Lm+nnfldo0PzxtiRtbSIPcUAFTQl955sMwf7t
	 2IrFd//64Jpa+CoeyWmyR3nvzFprTiYgvI27rqtSSffnyIwp3wsT16UgLEec2B2tuv
	 ybF6lj7d+Sqn1W2me/106d8Wl0deNmkT9IfLGhS7Q7Dod0+g+Su4LLbiyqmWsBjuiV
	 N5+w5QpFIA0EQyKcUFI7ySZKW0zALaHALAfSo+gXaBVM7YNvEfegpF1uA1ZfryBhJy
	 wCkHhN4FlITvO332v+i6d9qMjtE/meQlE4GnXyaTnjq2oZw/F/xoSF4sV37rUNSf2y
	 KrvCEPaqFP2HA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 04 Feb 2025 02:16:10 +0530
Subject: [PATCH v2 2/5] arm64: dts: exynos: add initial devicetree support
 for exynos7870
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-exynos7870-v2-2-56313165ef0c@disroot.org>
References: <20250204-exynos7870-v2-0-56313165ef0c@disroot.org>
In-Reply-To: <20250204-exynos7870-v2-0-56313165ef0c@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738615584; l=49897;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=MeO7B5awIqvRKVZXS7/DmFbWhryQXIaXkNrYqqxruzs=;
 b=QsAf5hZYwy/y/9Y7jGCKlVNmFQgY/kwYMVDu3kWrPQq702002ejvnlFFIC0n8ymtQgXYLBjMY
 uh9npdO2SVADVsh14Wvyk7V6BX8NbVDl7sURb79Kv25D0xVazzMtVXz
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Exynos7870 is an arm64 SoC manufactured by Samsung and announced in
2016. It is present in multiple mid-range Samsung phones and tablets.

Add basic devicetree support for the SoC, which includes CMUs, pin
controllers, I2C, UART, DW-MMC, and USB-DRD.

Co-developed-by: Sergey Lisov <sleirsgoevy@gmail.com>
Signed-off-by: Sergey Lisov <sleirsgoevy@gmail.com>
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 arch/arm64/boot/dts/exynos/exynos7870-pinctrl.dtsi | 1035 ++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos7870.dtsi         |  722 ++++++++++++++
 2 files changed, 1757 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7870-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos7870-pinctrl.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..28ff409c4fdc5f766d92617ea2df7be2112c28d1
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos7870-pinctrl.dtsi
@@ -0,0 +1,1035 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Samsung Exynos7870 SoC pin-mux and pin-config device tree source
+ *
+ * Copyright (c) 2015 Samsung Electronics Co., Ltd.
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include "exynos-pinctrl.h"
+
+&pinctrl0 {
+	etc0: etc0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	etc1: etc1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpa0: gpa0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpa1: gpa1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpa2: gpa2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpq0: gpq0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	uart2_bus: uart2-bus-pins {
+		samsung,pins = "gpa1-1", "gpa1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart2_sleep: uart2-sleep-pins {
+		samsung,pins = "gpa1-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+	};
+
+	bt_btwake: bt-btwake-pins {
+		samsung,pins = "gpa1-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	bt_hostwake: bt-hostwake-pins {
+		samsung,pins = "gpa1-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	gnss_sensor_irq: gnss-sensor-irq-pins {
+		samsung,pins = "gpa2-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_6>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+	};
+
+	gnss_sensor_i2c: gnss-sensor-i2c-pins {
+		samsung,pins = "gpa2-5", "gpa2-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_6>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	nfc_int: nfc-int-pins {
+		samsung,pins = "gpa2-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+	};
+};
+
+&pinctrl1 {
+	gpz0: gpz0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpz1: gpz1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpz2: gpz2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	i2s_bt_bus: i2s-bt-bus-pins {
+		samsung,pins = "gpz0-0", "gpz0-1", "gpz0-2", "gpz0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	i2s_bt_bus_idle: i2s-bt-bus-idle-pins {
+		samsung,pins = "gpz0-0", "gpz0-1", "gpz0-2", "gpz0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	i2s_pmic_bus: i2s-pmic-bus-pins {
+		samsung,pins = "gpz1-0", "gpz1-2", "gpz1-3", "gpz1-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR6>;
+	};
+
+	i2s_pmic_bus_idle: i2s-pmic-bus-idle-pins {
+		samsung,pins = "gpz1-0", "gpz1-2", "gpz1-3", "gpz1-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR6>;
+	};
+
+	i2s_pmic_amp_bus: i2s-pmic-amp-bus-pins {
+		samsung,pins = "gpz1-0", "gpz1-1", "gpz1-2", "gpz1-3", "gpz1-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR6>;
+	};
+
+	i2s_pmic_amp_bus_idle: i2s-pmic-amp-bus-idle-pins {
+		samsung,pins = "gpz1-0", "gpz1-1", "gpz1-2", "gpz1-3", "gpz1-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR6>;
+	};
+
+	i2s_amp_bus: i2s-amp-bus-pins {
+		samsung,pins = "gpz1-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	i2s_amp_bus_idle: i2s-amp-bus-idle-pins {
+		samsung,pins = "gpz1-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	i2s_fm_bus: i2s-fm-bus-pins {
+		samsung,pins = "gpz2-0", "gpz2-1", "gpz2-2", "gpz2-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	i2s-fm-bus-idle-pins {
+		samsung,pins = "gpz2-0", "gpz2-1", "gpz2-2", "gpz2-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+};
+
+&pinctrl2 {
+	gpc7: gpc7-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	spi1_bus: spi1-bus-pins {
+		samsung,pins = "gpc7-3", "gpc7-2", "gpc7-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	spi1_cs0: spi1-cs0-pins {
+		samsung,pins = "gpc7-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	spi1_cs1: spi1-cs1-pins {
+		samsung,pins = "gpc7-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+};
+
+&pinctrl3 {
+	gpr0: gpr0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpr1: gpr1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpr2: gpr2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpr3: gpr3-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpr4: gpr4-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	sd0_clk: sd0-clk-pins {
+		samsung,pins = "gpr0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	sd0_cmd: sd0-cmd-pins {
+		samsung,pins = "gpr0-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	sd0_rdqs: sd0-rdqs-pins {
+		samsung,pins = "gpr0-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	sd0_bus1: sd0-bus-width1-pins {
+		samsung,pins = "gpr1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	sd0_bus4: sd0-bus-width4-pins {
+		samsung,pins = "gpr1-1", "gpr1-2", "gpr1-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	sd0_bus8: sd0-bus-width8-pins {
+		samsung,pins = "gpr1-4", "gpr1-5", "gpr1-6", "gpr1-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	sd0_clk_fast_slew_rate_1x: sd0-clk-fast-slew-rate-1x-pins {
+		samsung,pins = "gpr0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	sd0_clk_fast_slew_rate_2x: sd0-clk-fast-slew-rate-2x-pins {
+		samsung,pins = "gpr0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR2>;
+	};
+
+	sd0_clk_fast_slew_rate_3x: sd0-clk-fast-slew-rate-3x-pins {
+		samsung,pins = "gpr0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	sd0_clk_fast_slew_rate_4x: sd0-clk-fast-slew-rate-4x-pins {
+		samsung,pins = "gpr0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR4>;
+	};
+
+	sd0_clk_fast_slew_rate_5x: sd0-clk-fast-slew-rate-5x-pins {
+		samsung,pins = "gpr0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR5>;
+	};
+
+	sd0_clk_fast_slew_rate_6x: sd0-clk-fast-slew-rate-6x-pins {
+		samsung,pins = "gpr0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR6>;
+	};
+
+	sd1_clk: sd1-clk-pins {
+		samsung,pins = "gpr2-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	sd1_cmd: sd1-cmd-pins {
+		samsung,pins = "gpr2-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	sd1_bus1: sd1-bus-width1-pins {
+		samsung,pins = "gpr3-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	sd1_bus4: sd1-bus-width4-pins {
+		samsung,pins = "gpr3-1", "gpr3-2", "gpr3-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	sd2_clk: sd2-clk-pins {
+		samsung,pins = "gpr4-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	sd2_cmd: sd2-cmd-pins {
+		samsung,pins = "gpr4-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	sd2_bus1: sd2-bus-width1-pins {
+		samsung,pins = "gpr4-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	sd2_bus4: sd2-bus-width4-pins {
+		samsung,pins = "gpr4-3", "gpr4-4", "gpr4-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	sd2_clk_fast_slew_rate_1x: sd2-clk-fast-slew-rate-1x-pins {
+		samsung,pins = "gpr4-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	sd2_clk_fast_slew_rate_2x: sd2-clk-fast-slew-rate-2x-pins {
+		samsung,pins = "gpr4-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR2>;
+	};
+
+	sd2_clk_fast_slew_rate_3x: sd2-clk-fast-slew-rate-3x-pins {
+		samsung,pins = "gpr4-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	sd2_clk_fast_slew_rate_4x: sd2-clk-fast-slew-rate-4x-pins {
+		samsung,pins = "gpr4-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR4>;
+	};
+};
+
+&pinctrl4 {
+	gpm0: gpm0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	hs_i2c0_bus: hs-i2c0-bus-pins {
+		samsung,pins = "gpm0-1", "gpm0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+};
+
+&pinctrl5 {
+	gpc2: gpc2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	i2c2_bus: i2c2-bus-pins {
+		samsung,pins = "gpc2-1", "gpc2-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	gpio_nfc: gpio-nfc-pins {
+		samsung,pins = "gpc2-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+		samsung,pin-val = <1>;
+	};
+
+	nfc_pd: nfc-pd-pins {
+		samsung,pins = "gpc2-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	nfc_n5_clk_req: nfc-n5-clk-req-pins {
+		samsung,pins = "gpc2-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+};
+
+&pinctrl6 {
+	gpb0: gpb0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpc0: gpc0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpc1: gpc1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpc4: gpc4-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpc5: gpc5-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpc6: gpc6-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpc8: gpc8-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpc9: gpc9-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpd1: gpd1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpd2: gpd2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpd3: gpd3-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpd4: gpd4-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpe0: gpe0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpf0: gpf0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpf1: gpf1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpf2: gpf2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpf3: gpf3-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpf4: gpf4-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	uart0_bus: uart0-bus-pins {
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pins = "gpb0-3", "gpb0-2", "gpb0-1", "gpb0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+	};
+
+	uart1_bus: uart1-bus-pins {
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pins = "gpd2-3", "gpd2-2", "gpd2-1", "gpd2-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+	};
+
+	decon_te_on: decon-te-on-pins {
+		samsung,pins = "gpe0-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+	};
+
+	decon_te_off: decon-te-off-pins {
+		samsung,pins = "gpe0-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+	};
+
+	hs_i2c1_bus: hs-i2c1-bus-pins {
+		samsung,pins = "gpf3-0", "gpf3-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	hs_i2c2_bus: hs-i2c2-bus-pins {
+		samsung,pins = "gpf3-2", "gpf3-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	hs_i2c3_bus: hs-i2c3-bus-pins {
+		samsung,pins = "gpf0-1", "gpf0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	hs_i2c4_bus: hs-i2c4-bus-pins {
+		samsung,pins = "gpf1-1", "gpf1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	hs_i2c5_bus: hs-i2c5-bus-pins {
+		samsung,pins = "gpf0-3", "gpf0-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	hs_i2c6_bus: hs-i2c6-bus-pins {
+		samsung,pins = "gpf2-1", "gpf2-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	i2c0_bus: i2c0-bus-pins {
+		samsung,pins = "gpc1-1", "gpc1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	i2c1_bus: i2c1-bus-pins {
+		samsung,pins = "gpc1-3", "gpc1-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	i2c4_bus: i2c4-bus-pins {
+		samsung,pins = "gpc4-1", "gpc4-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	i2c5_bus: i2c5-bus-pins {
+		samsung,pins = "gpc4-3", "gpc4-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	i2c6_bus: i2c6-bus-pins {
+		samsung,pins = "gpc5-1", "gpc5-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	i2c7_bus: i2c7-bus-pins {
+		samsung,pins = "gpc8-1", "gpc8-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	i2c8_bus: i2c8-bus-pins {
+		samsung,pins = "gpc9-1", "gpc9-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	spi0_bus: spi0-bus-pins {
+		samsung,pins = "gpc6-0", "gpc6-2", "gpc6-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	spi0_bus_suspend: spi0-bus-suspend-pins {
+		samsung,pins = "gpc6-0", "gpc6-2", "gpc6-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	spi0_cs: spi0-cs-pins {
+		samsung,pins = "gpc6-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	spi2_bus: spi2-bus-pins {
+		samsung,pins = "gpc4-2", "gpc5-0", "gpc5-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	spi2_cs_func: spi2-cs-func-pins {
+		samsung,pins = "gpc4-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	spi2_cs: spi2-cs-pins {
+		samsung,pins = "gpc4-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	spi3_bus: spi3-bus-pins {
+		samsung,pins = "gpf3-3", "gpf3-2", "gpf3-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	spi3_cs0: spi3-cs0-pins {
+		samsung,pins = "gpf3-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	spi3_cs1: spi3-cs1-pins {
+		samsung,pins = "gpd1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	spi4_bus: spi4-bus-pins {
+		samsung,pins = "gpf4-3", "gpf4-2", "gpf4-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	spi4_cs0: spi4-cs0-pins {
+		samsung,pins = "gpf4-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	spi4_cs1: spi4-cs1-pins {
+		samsung,pins = "gpd1-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	pwm_tout0: pwm-tout0-pins {
+		samsung,pins = "gpc0-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	pwm_tout1: pwm-tout1-pins {
+		samsung,pins = "gpc0-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	fimc_is_mclk0_in: fimc-is-mclk0-in-pins {
+		samsung,pins = "gpe0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	fimc_is_mclk0_fn: fimc-is-mclk0-fn-pins {
+		samsung,pins = "gpe0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR2>;
+	};
+
+	fimc_is_mclk0_out: fimc-is-mclk0-out-pins {
+		samsung,pins = "gpe0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	fimc_is_mclk1_in: fimc-is-mclk1-in-pins {
+		samsung,pins = "gpe0-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	fimc_is_mclk1_fn: fimc-is-mclk1-fn-pins {
+		samsung,pins = "gpe0-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR2>;
+	};
+
+	fimc_is_mclk1_out: fimc-is-mclk1-out-pins {
+		samsung,pins = "gpe0-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	fimc_is_mclk2_fn: fimc-is-mclk2-fn-pins {
+		samsung,pins = "gpf4-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	fimc_is_mclk2_out: fimc-is-mclk2-out-pins {
+		samsung,pins = "gpf4-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+		samsung,pin-val = <0>;
+	};
+
+	fimc_is_flash: fimc-is-flash-pins {
+		samsung,pins = "gpd3-2", "gpd3-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	bt_en: bt-en-pins {
+		samsung,pins = "gpd4-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+	};
+
+	nfc_n5_firm: nfc-n5-firm-pins {
+		samsung,pins = "gpd4-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-val = <1>;
+	};
+
+	nfc_pvdd_en: nfc-pvdd-en-pins {
+		samsung,pins = "gpd2-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR4>;
+	};
+
+	ese_pvdd_en: ese-pvdd-en-pins {
+		samsung,pins = "gpf4-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR4>;
+	};
+
+	spi2_mosi_sck_ssn: spi2-mosi-sck-ssn-pins {
+		samsung,pins = "gpc5-1", "gpc4-2", "gpc4-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR4>;
+	};
+
+	spi2_miso: spi2-miso-pins {
+		samsung,pins = "gpc5-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR4>;
+	};
+
+	hs_i2c2_2_bus: hs-i2c2-2-bus-pins {
+		samsung,pins = "gpf4-2", "gpf4-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+};
+
+&pinctrl7 {
+	gpc3: gpc3-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	i2c3_bus: i2c3-bus-pins {
+		samsung,pins = "gpc3-1", "gpc3-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	ese_cs_func: ese-cs-func-pins {
+		samsung,pins = "gpc3-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+		samsung,pin-val = <1>;
+	};
+
+	ese_cs_func_suspend: ese-cs-func-suspend-pins {
+		samsung,pins = "gpc3-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+};
diff --git a/arch/arm64/boot/dts/exynos/exynos7870.dtsi b/arch/arm64/boot/dts/exynos/exynos7870.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..11129e37fc86ebaee01684ed6841c932dd6cbc8a
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos7870.dtsi
@@ -0,0 +1,722 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Samsung Exynos7870 SoC device tree source
+ *
+ * Copyright (c) 2015 Samsung Electronics Co., Ltd.
+ */
+
+#include <dt-bindings/clock/exynos7870.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/soc/samsung,boot-mode.h>
+
+/ {
+	compatible = "samsung,exynos7870";
+	#address-cells = <2>;
+	#size-cells = <1>;
+
+	/* Samsung's bootloader (S-BOOT) checks for these DT properties */
+	model_info-hw_rev = <0>;
+	model_info-hw_rev_end = <255>;
+	model_info-chip = <7870>;
+
+	interrupt-parent = <&gic>;
+
+	aliases {
+		pinctrl0 = &pinctrl0;
+		pinctrl1 = &pinctrl1;
+		pinctrl2 = &pinctrl2;
+		pinctrl3 = &pinctrl3;
+		pinctrl4 = &pinctrl4;
+		pinctrl5 = &pinctrl5;
+		pinctrl6 = &pinctrl6;
+		pinctrl7 = &pinctrl7;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+				core1 {
+					cpu = <&cpu1>;
+				};
+				core2 {
+					cpu = <&cpu2>;
+				};
+				core3 {
+					cpu = <&cpu3>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&cpu4>;
+				};
+				core1 {
+					cpu = <&cpu5>;
+				};
+				core2 {
+					cpu = <&cpu6>;
+				};
+				core3 {
+					cpu = <&cpu7>;
+				};
+			};
+		};
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0>;
+			enable-method = "psci";
+		};
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x1>;
+			enable-method = "psci";
+		};
+
+		cpu2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x2>;
+			enable-method = "psci";
+		};
+
+		cpu3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x3>;
+			enable-method = "psci";
+		};
+
+		cpu4: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x100>;
+			enable-method = "psci";
+		};
+
+		cpu5: cpu@101 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x101>;
+			enable-method = "psci";
+		};
+
+		cpu6: cpu@102 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x102>;
+			enable-method = "psci";
+		};
+
+		cpu7: cpu@103 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x103>;
+			enable-method = "psci";
+		};
+	};
+
+	psci {
+		compatible = "arm,psci";
+		method = "smc";
+		cpu_suspend = <0xc4000001>;
+		cpu_off = <0x84000002>;
+		cpu_on = <0xc4000003>;
+	};
+
+	oscclk: oscclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+
+		clock-frequency = <26000000>;
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		/* Hypervisor Virtual Timer interrupt is not wired to GIC */
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+
+		/* Samsung's bootloader (S-BOOT) doesn't set CNTFRQ_EL0 */
+		clock-frequency = <26000000>;
+	};
+
+	gic: interrupt-controller@104e0000 {
+		compatible = "arm,cortex-a15-gic";
+		reg = <0x0 0x104e1000 0x1000>,
+		      <0x0 0x104e2000 0x1000>,
+		      <0x0 0x104e4000 0x2000>,
+		      <0x0 0x104e6000 0x2000>;
+		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
+		interrupt-controller;
+		#address-cells = <0>;
+		#interrupt-cells = <3>;
+	};
+
+	soc: soc@0 {
+		compatible = "simple-bus";
+		ranges = <0x0 0x0 0x0 0x20000000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		chipid@10100000 {
+			compatible = "samsung,exynos7870-chipid",
+				     "samsung,exynos4210-chipid";
+			reg = <0x10100000 0x100>;
+		};
+
+		pmu_system_controller: system-controller@10480000 {
+			compatible = "samsung,exynos7870-pmu",
+				     "samsung,exynos7-pmu", "syscon";
+			reg = <0x10480000 0x10000>;
+			#clock-cells = <1>;
+
+			clock-names = "clkout8",
+				      "clkout9",
+				      "clkout10",
+				      "clkout11",
+				      "clkout12";
+			clocks = <&oscclk>,
+				 <&oscclk>,
+				 <&oscclk>,
+				 <&oscclk>,
+				 <&oscclk>;
+
+			reboot-mode {
+				compatible = "syscon-reboot-mode";
+				offset = <0x080c>;
+				mode-bootloader = <EXYNOS7870_BOOT_BOOTLOADER>;
+				mode-download = <EXYNOS7870_BOOT_DOWNLOAD>;
+				mode-recovery = <EXYNOS7870_BOOT_RECOVERY>;
+			};
+		};
+
+		cmu_mif: clock-controller@10460000 {
+			compatible = "samsung,exynos7870-cmu-mif";
+			reg = <0x10460000 0x1000>;
+			#clock-cells = <1>;
+
+			clock-names = "oscclk";
+			clocks = <&oscclk>;
+		};
+
+		cmu_dispaud: clock-controller@148d0000 {
+			compatible = "samsung,exynos7870-cmu-dispaud";
+			reg = <0x148d0000 0x1000>;
+			#clock-cells = <1>;
+
+			clock-names = "oscclk",
+				      "gout_mif_cmu_dispaud_bus",
+				      "gout_mif_cmu_dispaud_decon_eclk",
+				      "gout_mif_cmu_dispaud_decon_vclk";
+			clocks = <&oscclk>,
+				 <&cmu_mif CLK_GOUT_MIF_CMU_DISPAUD_BUS>,
+				 <&cmu_mif CLK_GOUT_MIF_CMU_DISPAUD_DECON_ECLK>,
+				 <&cmu_mif CLK_GOUT_MIF_CMU_DISPAUD_DECON_VCLK>;
+		};
+
+		cmu_fsys: clock-controller@13730000 {
+			compatible = "samsung,exynos7870-cmu-fsys";
+			reg = <0x13730000 0x1000>;
+			#clock-cells = <1>;
+
+			clock-names = "oscclk",
+				      "gout_mif_cmu_fsys_bus",
+				      "gout_mif_cmu_fsys_usb20drd_refclk";
+			clocks = <&oscclk>,
+				 <&cmu_mif CLK_GOUT_MIF_CMU_FSYS_BUS>,
+				 <&cmu_mif CLK_GOUT_MIF_CMU_FSYS_USB20DRD_REFCLK>;
+		};
+
+		cmu_g3d: clock-controller@11460000 {
+			compatible = "samsung,exynos7870-cmu-g3d";
+			reg = <0x11460000 0x1000>;
+			#clock-cells = <1>;
+
+			clock-names = "oscclk",
+				      "gout_mif_cmu_g3d_switch";
+			clocks = <&oscclk>,
+				 <&cmu_mif CLK_GOUT_MIF_CMU_G3D_SWITCH>;
+		};
+
+		cmu_isp: clock-controller@144d0000 {
+			compatible = "samsung,exynos7870-cmu-isp";
+			reg = <0x144d0000 0x1000>;
+			#clock-cells = <1>;
+
+			clock-names = "oscclk",
+				      "gout_mif_cmu_isp_cam",
+				      "gout_mif_cmu_isp_isp",
+				      "gout_mif_cmu_isp_vra";
+			clocks = <&oscclk>,
+				 <&cmu_mif CLK_GOUT_MIF_CMU_ISP_CAM>,
+				 <&cmu_mif CLK_GOUT_MIF_CMU_ISP_ISP>,
+				 <&cmu_mif CLK_GOUT_MIF_CMU_ISP_VRA>;
+		};
+
+		cmu_mfcmscl: clock-controller@12cb0000 {
+			compatible = "samsung,exynos7870-cmu-mfcmscl";
+			reg = <0x12cb0000 0x1000>;
+			#clock-cells = <1>;
+
+			clock-names = "oscclk",
+				      "gout_mif_cmu_mfcmscl_mfc",
+				      "gout_mif_cmu_mfcmscl_mscl";
+			clocks = <&oscclk>,
+				 <&cmu_mif CLK_GOUT_MIF_CMU_MFCMSCL_MFC>,
+				 <&cmu_mif CLK_GOUT_MIF_CMU_MFCMSCL_MSCL>;
+		};
+
+		cmu_peri: clock-controller@101f0000 {
+			compatible = "samsung,exynos7870-cmu-peri";
+			reg = <0x101f0000 0x1000>;
+			#clock-cells = <1>;
+
+			clock-names = "oscclk",
+				      "gout_mif_cmu_peri_bus",
+				      "gout_mif_cmu_peri_spi0",
+				      "gout_mif_cmu_peri_spi1",
+				      "gout_mif_cmu_peri_spi2",
+				      "gout_mif_cmu_peri_spi3",
+				      "gout_mif_cmu_peri_spi4",
+				      "gout_mif_cmu_peri_uart0",
+				      "gout_mif_cmu_peri_uart1",
+				      "gout_mif_cmu_peri_uart2";
+			clocks = <&oscclk>,
+				 <&cmu_mif CLK_GOUT_MIF_CMU_PERI_BUS>,
+				 <&cmu_mif CLK_GOUT_MIF_CMU_PERI_SPI0>,
+				 <&cmu_mif CLK_GOUT_MIF_CMU_PERI_SPI1>,
+				 <&cmu_mif CLK_GOUT_MIF_CMU_PERI_SPI2>,
+				 <&cmu_mif CLK_GOUT_MIF_CMU_PERI_SPI3>,
+				 <&cmu_mif CLK_GOUT_MIF_CMU_PERI_SPI4>,
+				 <&cmu_mif CLK_GOUT_MIF_CMU_PERI_UART0>,
+				 <&cmu_mif CLK_GOUT_MIF_CMU_PERI_UART1>,
+				 <&cmu_mif CLK_GOUT_MIF_CMU_PERI_UART2>;
+		};
+
+		gpu: gpu@11400000 {
+			compatible = "samsung,exynos7870-mali", "arm,mali-t830";
+			reg = <0x11400000 0x5000>;
+			interrupt-names = "job", "mmu", "gpu";
+			interrupts = <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+
+			clock-names = "core", "bus";
+			clocks = <&cmu_g3d CLK_GOUT_G3D_CLK>,
+				 <&cmu_g3d CLK_GOUT_G3D_ASYNCS_D0_CLK>;
+		};
+
+		pinctrl0: pinctrl@139f0000 {
+			compatible = "samsung,exynos7870-pinctrl";
+			reg = <0x139f0000 0x1000>;
+
+			wakeup-interrupt-controller {
+				compatible = "samsung,exynos7870-wakeup-eint",
+					     "samsung,exynos7-wakeup-eint";
+				interrupt-parent = <&gic>;
+				interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		pinctrl1: pinctrl@148c0000 {
+			compatible = "samsung,exynos7870-pinctrl";
+			reg = <0x148c0000 0x1000>;
+			interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pinctrl2: pinctrl@139e0000 {
+			compatible = "samsung,exynos7870-pinctrl";
+			reg = <0x139e0000 0x1000>;
+			interrupts = <GIC_SPI 441 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pinctrl3: pinctrl@13750000 {
+			compatible = "samsung,exynos7870-pinctrl";
+			reg = <0x13750000 0x1000>;
+			interrupts = <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pinctrl4: pinctrl@10530000 {
+			compatible = "samsung,exynos7870-pinctrl";
+			reg = <0x10530000 0x1000>;
+			interrupts = <GIC_SPI 392 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pinctrl5: pinctrl@139c0000 {
+			compatible = "samsung,exynos7870-pinctrl";
+			reg = <0x139c0000 0x1000>;
+			interrupts = <GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pinctrl6: pinctrl@139b0000 {
+			compatible = "samsung,exynos7870-pinctrl";
+			reg = <0x139b0000 0x1000>;
+			interrupts = <GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pinctrl7: pinctrl@139d0000 {
+			compatible = "samsung,exynos7870-pinctrl";
+			reg = <0x139d0000 0x1000>;
+			interrupts = <GIC_SPI 440 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		i2c0: i2c@13870000 {
+			compatible = "samsung,exynos7870-i2c",
+				     "samsung,s3c2440-i2c";
+			reg = <0x13870000 0x100>;
+			interrupts = <GIC_SPI 428 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c0_bus>;
+
+			clock-names = "i2c";
+			clocks = <&cmu_peri CLK_GOUT_PERI_I2C0_PCLK>;
+		};
+
+		i2c1: i2c@13880000 {
+			compatible = "samsung,exynos7870-i2c",
+				     "samsung,s3c2440-i2c";
+			reg = <0x13880000 0x100>;
+			interrupts = <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c1_bus>;
+
+			clock-names = "i2c";
+			clocks = <&cmu_peri CLK_GOUT_PERI_I2C1_PCLK>;
+		};
+
+		i2c2: i2c@13890000 {
+			compatible = "samsung,exynos7870-i2c",
+				     "samsung,s3c2440-i2c";
+			reg = <0x13890000 0x100>;
+			interrupts = <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c2_bus>;
+
+			clock-names = "i2c";
+			clocks = <&cmu_peri CLK_GOUT_PERI_I2C2_PCLK>;
+		};
+
+		i2c3: i2c@13840000 {
+			compatible = "samsung,exynos7870-i2c",
+				     "samsung,s3c2440-i2c";
+			reg = <0x13840000 0x100>;
+			interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c3_bus>;
+
+			clock-names = "i2c";
+			clocks = <&cmu_peri CLK_GOUT_PERI_I2C3_PCLK>;
+		};
+
+		i2c4: i2c@13830000 {
+			compatible = "samsung,exynos7870-i2c",
+				     "samsung,s3c2440-i2c";
+			reg = <0x13830000 0x100>;
+			interrupts = <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c4_bus>;
+
+			clock-names = "i2c";
+			clocks = <&cmu_peri CLK_GOUT_PERI_I2C4_PCLK>;
+		};
+
+		i2c5: i2c@138d0000 {
+			compatible = "samsung,exynos7870-i2c",
+				     "samsung,s3c2440-i2c";
+			reg = <0x138d0000 0x100>;
+			interrupts = <GIC_SPI 453 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c5_bus>;
+
+			clock-names = "i2c";
+			clocks = <&cmu_peri CLK_GOUT_PERI_I2C5_PCLK>;
+		};
+
+		i2c6: i2c@138e0000 {
+			compatible = "samsung,exynos7870-i2c",
+				     "samsung,s3c2440-i2c";
+			reg = <0x138e0000 0x100>;
+			interrupts = <GIC_SPI 454 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c6_bus>;
+
+			clock-names = "i2c";
+			clocks = <&cmu_peri CLK_GOUT_PERI_I2C6_PCLK>;
+		};
+
+		i2c7: i2c@13850000 {
+			compatible = "samsung,exynos7870-i2c",
+				     "samsung,s3c2440-i2c";
+			reg = <0x13850000 0x100>;
+			interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c7_bus>;
+
+			clock-names = "i2c";
+			clocks = <&cmu_peri CLK_GOUT_PERI_I2C7_PCLK>;
+		};
+
+		i2c8: i2c@13860000 {
+			compatible = "samsung,exynos7870-i2c",
+				     "samsung,s3c2440-i2c";
+			reg = <0x13860000 0x100>;
+			interrupts = <GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c8_bus>;
+
+			clock-names = "i2c";
+			clocks = <&cmu_peri CLK_GOUT_PERI_I2C8_PCLK>;
+		};
+
+		hsi2c0: i2c@10510000 {
+			compatible = "samsung,exynos7870-hsi2c",
+				     "samsung,exynos7-hsi2c";
+			reg = <0x10510000 0x2000>;
+			interrupts = <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&hs_i2c0_bus>;
+
+			clock-names = "hsi2c";
+			clocks = <&cmu_mif CLK_GOUT_MIF_HSI2C_IPCLK>;
+		};
+
+		hsi2c1: i2c@13950000 {
+			compatible = "samsung,exynos7870-hsi2c",
+				     "samsung,exynos7-hsi2c";
+			reg = <0x13950000 0x1000>;
+			interrupts = <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&hs_i2c1_bus>;
+
+			clock-names = "hsi2c";
+			clocks = <&cmu_peri CLK_GOUT_PERI_HSI2C1_IPCLK>;
+		};
+
+		hsi2c2: i2c@13960000 {
+			compatible = "samsung,exynos7870-hsi2c",
+				     "samsung,exynos7-hsi2c";
+			reg = <0x13960000 0x1000>;
+			interrupts = <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&hs_i2c2_bus>;
+
+			clock-names = "hsi2c";
+			clocks = <&cmu_peri CLK_GOUT_PERI_HSI2C2_IPCLK>;
+		};
+
+		hsi2c3: i2c@138a0000 {
+			compatible = "samsung,exynos7870-hsi2c",
+				     "samsung,exynos7-hsi2c";
+			reg = <0x138a0000 0x1000>;
+			interrupts = <GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&hs_i2c3_bus>;
+
+			clock-names = "hsi2c";
+			clocks = <&cmu_peri CLK_GOUT_PERI_HSI2C3_IPCLK>;
+		};
+
+		hsi2c4: i2c@138b0000 {
+			compatible = "samsung,exynos7870-hsi2c",
+				     "samsung,exynos7-hsi2c";
+			reg = <0x138b0000 0x1000>;
+			interrupts = <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&hs_i2c4_bus>;
+
+			clock-names = "hsi2c";
+			clocks = <&cmu_peri CLK_GOUT_PERI_HSI2C4_IPCLK>;
+		};
+
+		hsi2c5: i2c@138c0000 {
+			compatible = "samsung,exynos7870-hsi2c",
+				     "samsung,exynos7-hsi2c";
+			reg = <0x138c0000 0x1000>;
+			interrupts = <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&hs_i2c5_bus>;
+
+			clock-names = "hsi2c";
+			clocks = <&cmu_peri CLK_GOUT_PERI_HSI2C5_IPCLK>;
+		};
+
+		hsi2c6: i2c@138f0000 {
+			compatible = "samsung,exynos7870-hsi2c",
+				     "samsung,exynos7-hsi2c";
+			reg = <0x138f0000 0x1000>;
+			interrupts = <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&hs_i2c6_bus>;
+
+			clock-names = "hsi2c";
+			clocks = <&cmu_peri CLK_GOUT_PERI_HSI2C6_IPCLK>;
+		};
+
+		serial0: serial@13810000 {
+			compatible = "samsung,exynos7870-uart";
+			reg = <0x13810000 0x100>;
+			interrupts = <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart0_bus>;
+
+			clock-names = "uart", "clk_uart_baud0";
+			clocks = <&cmu_peri CLK_GOUT_PERI_UART0_PCLK>,
+				 <&cmu_peri CLK_GOUT_PERI_UART0_EXT_UCLK>;
+
+			samsung,uart-fifosize = <256>;
+		};
+
+		serial1: serial@13800000 {
+			compatible = "samsung,exynos7870-uart";
+			reg = <0x13800000 0x100>;
+			interrupts = <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart1_bus>;
+
+			clock-names = "uart", "clk_uart_baud0";
+			clocks = <&cmu_peri CLK_GOUT_PERI_UART1_PCLK>,
+				 <&cmu_peri CLK_GOUT_PERI_UART1_EXT_UCLK>;
+
+			samsung,uart-fifosize = <16>;
+		};
+
+		serial2: serial@13820000 {
+			compatible = "samsung,exynos7870-uart";
+			reg = <0x13820000 0x100>;
+			interrupts = <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart2_bus>;
+
+			clock-names = "uart", "clk_uart_baud0";
+			clocks = <&cmu_peri CLK_GOUT_PERI_UART2_PCLK>,
+				 <&cmu_peri CLK_GOUT_PERI_UART2_EXT_UCLK>;
+
+			samsung,uart-fifosize = <256>;
+		};
+
+		mmc0: mmc@13540000 {
+			compatible = "samsung,exynos7870-dw-mshc-smu";
+			reg = <0x13540000 0x2000>;
+			interrupts = <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+
+			clock-names = "biu", "ciu";
+			clocks = <&cmu_fsys CLK_GOUT_FSYS_MMC0_ACLK>,
+				 <&cmu_mif CLK_GOUT_MIF_CMU_FSYS_MMC0>;
+		};
+
+		mmc1: mmc@13550000 {
+			compatible = "samsung,exynos7870-dw-mshc-smu";
+			reg = <0x13550000 0x2000>;
+			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+
+			clock-names = "biu", "ciu";
+			clocks = <&cmu_fsys CLK_GOUT_FSYS_MMC1_ACLK>,
+				 <&cmu_mif CLK_GOUT_MIF_CMU_FSYS_MMC1>;
+		};
+
+		mmc2: mmc@13560000 {
+			compatible = "samsung,exynos7870-dw-mshc-smu";
+			reg = <0x13560000 0x2000>;
+			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+
+			clock-names = "biu", "ciu";
+			clocks = <&cmu_fsys CLK_GOUT_FSYS_MMC2_ACLK>,
+				 <&cmu_mif CLK_GOUT_MIF_CMU_FSYS_MMC2>;
+		};
+
+		usbdrd_phy: phy@135c0000 {
+			compatible = "samsung,exynos7870-usbdrd-phy";
+			reg = <0x135c0000 0x100>;
+			#phy-cells = <1>;
+
+			clock-names = "phy", "ref";
+			clocks = <&cmu_fsys CLK_GOUT_FSYS_MUX_USB20DRD_PHYCLOCK_USER>,
+				 <&cmu_fsys CLK_GOUT_FSYS_MUX_USB_PLL>;
+
+			samsung,pmu-syscon = <&pmu_system_controller>;
+		};
+
+		usbdrd: usb {
+			compatible = "samsung,exynos7870-dwusb2";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			clock-names = "usbdrd20",
+				      "usbdrd20_ctrl_clk",
+				      "usbdrd20_ref_clk";
+			clocks = <&cmu_fsys CLK_GOUT_FSYS_USB20DRD_ACLK_HSDRD>,
+				 <&cmu_fsys CLK_GOUT_FSYS_USB20DRD_HCLK_USB20_CTRL>,
+				 <&cmu_fsys CLK_GOUT_FSYS_USB20DRD_HSDRD_REF_CLK>;
+
+			usb@13600000 {
+				compatible = "snps,dwc3";
+				reg = <0x13600000 0x10000>;
+				interrupts = <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH>;
+
+				phy-names = "usb2-phy";
+				phys = <&usbdrd_phy 0>;
+
+				usb-role-switch;
+			};
+		};
+	};
+};
+
+#include "exynos7870-pinctrl.dtsi"
+#include "arm/samsung/exynos-syscon-restart.dtsi"

-- 
2.48.1

