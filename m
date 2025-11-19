Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07319364E9D
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Nov 2025 13:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763558107; cv=none; b=NH+3/bFzGmMiTtEx3Qlf7Pj7zuFu+Q8HNCqHNOD7jmXjdEJbB0TCB8oMc7pUuls1cmxTKxd51QNiMdGJNjmJBKDnkFrhA+XiLRyxAuUvGVkT9i/p7Q6iim6zdFsiAzqHs5IBNdHWO4pf//f6C4V8aTfXYYM9ZlhiegvGFilWnRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763558107; c=relaxed/simple;
	bh=O1bPiZ/n+jyK8bLSwXZqfATAZ+GIJNEzS+x6h2ejZ18=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:Content-Type:
	 References; b=FNb0ZLjJTwZESFsWOrY5yEWmGNauubMr6XPNCtVy2I58nBC3vLu+WIamKnjCPqlDhnj59qh8+itI44Vr1m31FM5bQMDwO1POSRU6n/hFEwP9MtNgIz+YGlXjpCbeDYr6Ot+ENWmaBq78jqR2UU7cTzun1QFNIxSQMJfzsIEqLv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=rmHADN4R; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="rmHADN4R"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20251119131458epoutp03efca3032785d4ac3f4d1d26aad365dcc~5ar8WJWab3261932619epoutp037
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Nov 2025 13:14:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20251119131458epoutp03efca3032785d4ac3f4d1d26aad365dcc~5ar8WJWab3261932619epoutp037
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763558098;
	bh=yXbEDgg+316t6ITgX9K7EEXM2JsXlAJWF3W6wz5170A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rmHADN4RvKCjbpYzpK4XBCb9xBHku3ztdxNmOOjpygK7acPZ8YiPJ6b6byUS3FQ7t
	 oq0SPxrbkLD9ENloUoNkuO74ipcrdcvdH3LTX/Kq03Cgkj95O5L75GYoJQ5EY+EdeQ
	 byKNemDjuGNNHytDzlOkonhaIjp6xotaCcArs1T8=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20251119131456epcas5p400c974c9b7007d1cac0baeeb165ebfd7~5ar7UvMoU2561525615epcas5p41;
	Wed, 19 Nov 2025 13:14:56 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.95]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4dBMQl6z8Kz3hhT3; Wed, 19 Nov
	2025 13:14:55 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20251119131454epcas5p151c07f5fc43d16d773a0c9282f2d59f3~5ar5B6lsm0455404554epcas5p1j;
	Wed, 19 Nov 2025 13:14:54 +0000 (GMT)
Received: from Jaguar.samsungds.net (unknown [107.109.115.6]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251119131440epsmtip132e3273b510765bed3c068e857f7ef9a~5arsE2yu72743227432epsmtip1p;
	Wed, 19 Nov 2025 13:14:39 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jesper.nilsson@axis.com, lars.persson@axis.com, alim.akhtar@samsung.com
Cc: ravi.patel@samsung.com, ksk4725@coasia.com, smn1196@coasia.com,
	linux-arm-kernel@axis.com, krzk@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, pjsin865@coasia.com, gwk1013@coasia.com,
	bread@coasia.com, jspark@coasia.com, limjh0823@coasia.com,
	lightwise@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com,
	shradha.t@samsung.com, swathi.ks@samsung.com, kenkim@coasia.com,
	kitak81.kim@samsung.com
Subject: [PATCH v2 2/3] arm64: dts: exynos: axis: Add initial ARTPEC-9 SoC
 support
Date: Wed, 19 Nov 2025 18:43:01 +0530
Message-Id: <20251119131302.79088-3-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251119131302.79088-1-ravi.patel@samsung.com>
X-CMS-MailID: 20251119131454epcas5p151c07f5fc43d16d773a0c9282f2d59f3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251119131454epcas5p151c07f5fc43d16d773a0c9282f2d59f3
References: <20251119131302.79088-1-ravi.patel@samsung.com>
	<CGME20251119131454epcas5p151c07f5fc43d16d773a0c9282f2d59f3@epcas5p1.samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>

From: SungMin Park <smn1196@coasia.com>

Add initial device tree support for Axis ARTPEC-9 SoC.

This SoC contains 6 Cortex-A55 CPUs and several other peripheral IPs.

Signed-off-by: SungMin Park <smn1196@coasia.com>
Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
---
 .../boot/dts/exynos/axis/artpec9-pinctrl.dtsi | 115 ++++++++
 arch/arm64/boot/dts/exynos/axis/artpec9.dtsi  | 277 ++++++++++++++++++
 2 files changed, 392 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec9-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec9.dtsi

diff --git a/arch/arm64/boot/dts/exynos/axis/artpec9-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/axis/artpec9-pinctrl.dtsi
new file mode 100644
index 000000000000..a9fbdf7734d4
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/axis/artpec9-pinctrl.dtsi
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Axis ARTPEC-9 SoC pin-mux and pin-config device tree source
+ *
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *             https://www.samsung.com
+ * Copyright (c) 2025  Axis Communications AB.
+ *             https://www.axis.com
+ */
+
+#include "artpec-pinctrl.h"
+
+&pinctrl_fsys0 {
+	gpe0: gpe0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpe1: gpe1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpe2: gpe2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpe3: gpe3-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpe4: gpe4-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpf0: gpf0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpf1: gpf1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpi0: gpi0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gps0: gps0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gps1: gps1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+};
+
+&pinctrl_fsys1 {
+	gpu0: gpu0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	serial0_bus: serial0-bus-pins {
+		samsung,pins = "gpu0-0", "gpu0-1";
+		samsung,pin-function = <ARTPEC_PIN_FUNC_2>;
+		samsung,pin-pud = <ARTPEC_PIN_PULL_UP>;
+		samsung,pin-drv = <ARTPEC_PIN_DRV_SR3>;
+	};
+};
+
+&pinctrl_peric {
+	gpa0: gpa0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpa1: gpa1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+};
diff --git a/arch/arm64/boot/dts/exynos/axis/artpec9.dtsi b/arch/arm64/boot/dts/exynos/axis/artpec9.dtsi
new file mode 100644
index 000000000000..f644198fa80f
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/axis/artpec9.dtsi
@@ -0,0 +1,277 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Axis ARTPEC-9 SoC device tree source
+ *
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *             https://www.samsung.com
+ * Copyright (c) 2025  Axis Communications AB.
+ *             https://www.axis.com
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/axis,artpec9-clk.h>
+
+/ {
+	compatible = "axis,artpec9";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		pinctrl0 = &pinctrl_fsys0;
+		pinctrl1 = &pinctrl_fsys1;
+		pinctrl2 = &pinctrl_peric;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x0>;
+			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep>;
+			clocks = <&cmu_cpucl CLK_GOUT_CPUCL_CLUSTER_CPU>;
+			clock-names = "cpu";
+		};
+
+		cpu1: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x100>;
+			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep>;
+		};
+
+		cpu2: cpu@200 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x200>;
+			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep>;
+		};
+
+		cpu3: cpu@300 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x300>;
+			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep>;
+		};
+
+		cpu4: cpu@400 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x400>;
+			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep>;
+		};
+
+		cpu5: cpu@500 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x500>;
+			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep>;
+		};
+
+		idle-states {
+			entry-method = "psci";
+
+			cpu_sleep: cpu-sleep {
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x0010000>;
+				local-timer-stop;
+				entry-latency-us = <300>;
+				exit-latency-us = <1200>;
+				min-residency-us = <2000>;
+			};
+		};
+	};
+
+	fin_pll: clock-finpll {
+		compatible = "fixed-factor-clock";
+		clocks = <&osc_clk>;
+		#clock-cells = <0>;
+		clock-div = <2>;
+		clock-mult = <1>;
+		clock-output-names = "fin_pll";
+	};
+
+	osc_clk: clock-osc {
+		/* XXTI */
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-output-names = "osc_clk";
+	};
+
+	pmu {
+		compatible = "arm,cortex-a55-pmu";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>, <&cpu4>, <&cpu5>;
+	};
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
+	soc: soc {
+		compatible = "simple-bus";
+		ranges = <0x0 0x0 0x0 0x0 0x0 0x17000000>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		cmu_imem: clock-controller@10010000 {
+			compatible = "axis,artpec9-cmu-imem";
+			reg = <0x0 0x10010000 0x0 0x4000>;
+			#clock-cells = <1>;
+			clocks = <&fin_pll>,
+				 <&cmu_cmu CLK_DOUT_CMU_IMEM_ACLK>,
+				 <&cmu_cmu CLK_DOUT_CMU_IMEM_CA5>,
+				 <&cmu_cmu CLK_DOUT_CMU_IMEM_JPEG>,
+				 <&cmu_cmu CLK_DOUT_CMU_IMEM_SSS>;
+			clock-names = "fin_pll", "aclk", "ca5", "jpeg", "sss";
+		};
+
+		timer@10040000 {
+			compatible = "axis,artpec9-mct", "samsung,exynos4210-mct";
+			reg = <0x0 0x10040000 0x0 0x1000>;
+			clocks = <&fin_pll>, <&cmu_imem CLK_GOUT_IMEM_MCT0_PCLK>;
+			clock-names = "fin_pll", "mct";
+			interrupts = <GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		gic: interrupt-controller@10400000 {
+			compatible = "arm,gic-v3";
+			reg = <0x0 0x10400000 0x0 0x00040000>,
+			      <0x0 0x10440000 0x0 0x000c0000>;
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			redistributor-stride = <0x0 0x20000>;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		cmu_cpucl: clock-controller@12810000 {
+			compatible = "axis,artpec9-cmu-cpucl";
+			reg = <0x0 0x12810000 0x0 0x4000>;
+			#clock-cells = <1>;
+			clocks = <&fin_pll>,
+				 <&cmu_cmu CLK_DOUT_CMU_CPUCL_SWITCH>;
+			clock-names = "fin_pll", "switch";
+		};
+
+		cmu_cmu: clock-controller@12c00000 {
+			compatible = "axis,artpec9-cmu-cmu";
+			reg = <0x0 0x12c00000 0x0 0x4000>;
+			#clock-cells = <1>;
+			clocks = <&fin_pll>;
+			clock-names = "fin_pll";
+		};
+
+		cmu_core: clock-controller@12c10000 {
+			compatible = "axis,artpec9-cmu-core";
+			reg = <0x0 0x12c10000 0x0 0x4000>;
+			#clock-cells = <1>;
+			clocks = <&fin_pll>,
+				 <&cmu_cmu CLK_DOUT_CMU_CORE_MAIN>;
+			clock-names = "fin_pll", "main";
+		};
+
+		cmu_bus: clock-controller@13410000 {
+			compatible = "axis,artpec9-cmu-bus";
+			reg = <0x0 0x13410000 0x0 0x4000>;
+			#clock-cells = <1>;
+			clocks = <&fin_pll>,
+				 <&cmu_cmu CLK_DOUT_CMU_BUS>;
+			clock-names = "fin_pll", "bus";
+		};
+
+		cmu_peri: clock-controller@14010000 {
+			compatible = "axis,artpec9-cmu-peri";
+			reg = <0x0 0x14010000 0x0 0x4000>;
+			#clock-cells = <1>;
+			clocks = <&fin_pll>,
+				 <&cmu_cmu CLK_DOUT_CMU_PERI_IP>,
+				 <&cmu_cmu CLK_DOUT_CMU_PERI_DISP>;
+			clock-names = "fin_pll", "ip", "disp";
+		};
+
+		pinctrl_peric: pinctrl@141f0000 {
+			compatible = "axis,artpec9-pinctrl";
+			reg = <0x0 0x141f0000 0x0 0x1000>;
+			interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		cmu_fsys0: clock-controller@14410000 {
+			compatible = "axis,artpec9-cmu-fsys0";
+			reg = <0x0 0x14410000 0x0 0x4000>;
+			#clock-cells = <1>;
+			clocks = <&fin_pll>,
+				 <&cmu_cmu CLK_DOUT_CMU_FSYS0_BUS>,
+				 <&cmu_cmu CLK_DOUT_CMU_FSYS0_IP>;
+			clock-names = "fin_pll", "bus", "ip";
+		};
+
+		pinctrl_fsys0: pinctrl@14430000 {
+			compatible = "axis,artpec9-pinctrl";
+			reg = <0x0 0x14430000 0x0 0x1000>;
+			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		cmu_fsys1: clock-controller@14c10000 {
+			compatible = "axis,artpec9-cmu-fsys1";
+			reg = <0x0 0x14c10000 0x0 0x4000>;
+			#clock-cells = <1>;
+			clocks = <&fin_pll>,
+				 <&cmu_cmu CLK_DOUT_CMU_FSYS1_SCAN0>,
+				 <&cmu_cmu CLK_DOUT_CMU_FSYS1_SCAN1>,
+				 <&cmu_cmu CLK_DOUT_CMU_FSYS1_BUS>;
+			clock-names = "fin_pll", "scan0", "scan1", "bus";
+		};
+
+		pinctrl_fsys1: pinctrl@14c30000 {
+			compatible = "axis,artpec9-pinctrl";
+			reg = <0x0 0x14c30000 0x0 0x1000>;
+			interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pmu_system_controller: system-controller@14c40000 {
+			compatible = "axis,artpec9-pmu", "samsung,exynos7-pmu", "syscon";
+			reg = <0x0 0x14c40000 0x0 0x10000>;
+		};
+
+		serial_0: serial@14c70000 {
+			compatible = "axis,artpec9-uart", "samsung,exynos8895-uart";
+			reg = <0x0 0x14c70000 0x0 0x100>;
+			clocks = <&cmu_fsys1 CLK_GOUT_FSYS1_UART0_PCLK>,
+				 <&cmu_fsys1 CLK_GOUT_FSYS1_UART0_SCLK_UART>;
+			clock-names = "uart", "clk_uart_baud0";
+			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&serial0_bus>;
+			samsung,uart-fifosize = <64>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
-- 
2.17.1

