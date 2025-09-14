Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998312C375E
	for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 15:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757862224; cv=none; b=FKqTsWpwpc+O8Ow/NwY2886TDO3XvZqlyXYh/qzKfZe/M6jL3BLUIftim2Z6Zxycvl9nwlEV5UQgIZAY5NZIFJHQR0/lykKDuVkOBJDxVAC/634aLMINh/IqTOCcMzVrVsk0gMClVEFYAPJxw7cwiq0CsTsrBvBNTj8s6rhqN/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757862224; c=relaxed/simple;
	bh=JTZpsFfg8mMYzOntXaLFvYSBtIAnGHyo/0eMeSrGBBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X1+s2bfUnWvsggIBB42toG5jYKvMGv6RSctstuXTbFCzlIIiK0jzesDtrmkHWsxHGsXZoKHsmkWIzNT48e8tpHlsNHBzjpuvfBKnBwBeqkyh2cVLIez7zI/SyY18A9LYtG1c8dCC+TjHBn1qBWYK0ZxiDrpXrdZvcyWPr0Wh+J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MjilFXjp; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MjilFXjp"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45dd7b15a64so30050005e9.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 08:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757862219; x=1758467019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxeaK6lx2PuCeUQ4i+jd/u97smzovcfXRmTlVlgUFKk=;
        b=MjilFXjpGGuPBHmEVj1MfrqzMGGInq5Bl/1tTEfc8mhPXntRSpJKYOQ7ELYkPaGxT9
         eFHxpGhThmV+xyJvnQz/M3TC1w2mBj0dc+cKK4SXOJgrDuQ3tZQfttyip5Y8kZXl4oG1
         c0jQa8ETOtsuLCWab5g3uqoruTx4+PtOI3E5nmxF4hl+QkFlTEIEVgKkfEFGizf5lTnt
         IrqSO6wMZSHGsvrNCtLt82/vdndv4WMsBF5lwuV7sAxgy6jH4YeNMVU7FY7w5BBqCIA0
         Zw9Yk544gm9eWTSbibsoaqJtFaXKNv4Zi9Y20rJjnJwQmaWOGdM3KNT9dAcuZVdmW53h
         uUwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757862219; x=1758467019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jxeaK6lx2PuCeUQ4i+jd/u97smzovcfXRmTlVlgUFKk=;
        b=Qu3pf63wNskxInspdbERLwALC4zf9tUmKkEpch1SXfhFslQhXLu24P7VAERMwYy6n5
         iOUWER5gLtUuZUhbxRcA0skTgohBdOJCL/13yNTi+bdNjAn6F5qgzMl88OB3IB/rvvz9
         s9a/RnibtzWGYmM74x/wA3wHk4BSEz4YToaS31VK/FPhswDfr1ABr8UB1IzUyB6tx8jK
         YTNVUGiJMUavicSxbcPiEBfeKyk7vMEccQepnyJjR7kIKfhM8CUrkDHD0PA/z6Pz8uaT
         L1qiOANcVzz9ryKrnjZn89oy0YlXwRBEabXwrEqsQ9qTDADjFjHPn0s6ubMyYUhFupAW
         ceGQ==
X-Gm-Message-State: AOJu0YxDdFpVpU/8TI9lBDv4s4sT4qTes29gRgK+M7M2SnPuOIXm0Qrb
	O4gkSprSwAB7/C24pHtYzkWitcvFXpJpBIksGGEHHipmmAhDEmZJwgYG
X-Gm-Gg: ASbGnctE8hbuZS6La5L2leqc92iUrqE1093vRNyXKomyAv1OFYLy5ksV4FhBV6uODB5
	JDt+7yexqazSEnofk4ygwVfi3zP7DgEB4k1DfvvWSO8QXZ9f+cHozSTbYbaATs7vqsyRYlmTY++
	zvZ/IshBqI7KN9d8/9L5zt3gEUNGgC+3YrBHHTl2gNN8raotNLFcLpFW77+pLQls3f1ZaxSqU1f
	ZS8AFlscCJiB6pm2PTKHpSyJkG0hIYr7IIRZBvErB5eLEZ4AgYbnfraiRYADBwG+hlDdFO6F8YB
	v5LomIyOBK+2TH8CxTVlMleXThSUUZsBdpEk4Fxfu////k1bBa8o1La/i6fLgT1bTmkpv1grrqU
	utgUmByGBzEoPR0GscadMaUDUFcBCBS3Ysx3N9TY/wZ9SA+6Os14UpHPJCxjDGKnNWjElhrNkCA
	==
X-Google-Smtp-Source: AGHT+IF/a3C3jjq1my76771O6fnvZ2M/r8eoYKJj7xvDw9UBWUpCiUlPBz3NlnGzKXO3z1j+/lX5tA==
X-Received: by 2002:a05:600c:1f8e:b0:45d:f7df:2735 with SMTP id 5b1f17b1804b1-45f21294a42mr75641675e9.16.1757862218614;
        Sun, 14 Sep 2025 08:03:38 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f2acbeee0sm32780385e9.0.2025.09.14.08.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 08:03:38 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] arm64: dts: exynos: add initial support for exynos8890 SoC
Date: Sun, 14 Sep 2025 18:03:20 +0300
Message-ID: <20250914150321.2632019-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914150321.2632019-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914150321.2632019-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exynos 8890 SoC is an ARMv8 mobile SoC found in mobile devices like the
Samsung Galaxy S7 (herolte), S7 Edge (hero2lte), Note 7 (gracelte) and
Meizu Pro 6 Plus (M96). Add minimal support for that SoC, including psci,
pmu, chipid, architecture timer and mct, pinctrl, clocks, usb, mmc, i2c
and serial buses.

The first generation of Mongoose cores (M1) have an errata, where memory
accesses to certain virtual addresses can trigger a TLB conflict abort,
even when running Linux in EL2. Only include the Cortex-A53 cores for
now.

The devices using this SoC suffer from an issue caused by the stock
Samsung bootloader, as it doesn't configure CNTFRQ_EL0. Hence it's
needed to hardcode the adequate frequency in the timer node, otherwise
the kernel panics.

Further platform support will be added over time.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../boot/dts/exynos/exynos8890-pinctrl.dtsi   |  703 ++++++++++++
 arch/arm64/boot/dts/exynos/exynos8890.dtsi    | 1009 +++++++++++++++++
 2 files changed, 1712 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos8890-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos8890.dtsi

diff --git a/arch/arm64/boot/dts/exynos/exynos8890-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos8890-pinctrl.dtsi
new file mode 100644
index 000000000..b7fb9f698
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos8890-pinctrl.dtsi
@@ -0,0 +1,703 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Samsung's Exynos 8890 SoC pin-mux and pin-config device tree source
+ *
+ * Copyright (c) 2025, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include "exynos-pinctrl.h"
+
+&pinctrl_alive {
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
+
+	gpa2: gpa2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpa3: gpa3-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	pcie_wake: pcie-wake-pins {
+		samsung,pins = "gpa3-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+};
+
+&pinctrl_aud {
+	gph0: gph0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	i2s0_bus: i2s0-bus-pins {
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV3>;
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pins = "gph0-0", "gph0-1", "gph0-2", "gph0-3",
+			       "gph0-4", "gph0-5", "gph0-6";
+	};
+};
+
+&pinctrl_ccore {
+	etc0: etc0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	hsi2c15_bus: hsi2c15-bus-pins {
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pins = "etc0-1", "etc0-0";
+	};
+};
+
+&pinctrl_fp {
+	gpf3: gpf3-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	spi4_bus: spi4-bus-pins {
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV3>;
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pins = "gpf3-3", "gpf3-2", "gpf3-1", "gpf3-0";
+	};
+};
+
+&pinctrl_ese {
+	gpf2: gpf2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	spi3_bus: spi3-bus-pins {
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pins = "gpf2-3", "gpf2-2", "gpf2-0";
+	};
+
+	spi3_cs: spi3-cs-pins {
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pins = "gpf2-1";
+	};
+
+	spi3_cs_func: spi3-cs-func-pins {
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV4>;
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pins = "gpf2-1";
+	};
+};
+
+&pinctrl_fsys0 {
+	gpi1: gpi1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpi2: gpi2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+};
+
+&pinctrl_fsys1 {
+	gpj0: gpj0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	sd2_bus1: sd2-bus1-pins {
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV2>;
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pins = "gpj0-3";
+	};
+
+	sd2_bus4: sd2-bus4-pins {
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV2>;
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pins = "gpj0-4", "gpj0-5", "gpj0-6";
+	};
+
+	sd2_clk: sd2-clk-pins {
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV3>;
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pins = "gpj0-0";
+	};
+
+	sd2_cmd: sd2-cmd-pins {
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV3>;
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pins = "gpj0-1";
+	};
+};
+
+&pinctrl_nfc {
+	gpf0: gpf0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	hsi2c6_bus: hsi2c6-bus-pins {
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pins = "gpf0-1", "gpf0-0";
+	};
+};
+
+&pinctrl_peric0 {
+	gpi0: gpi0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpd0: gpd0-gpio-bank {
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
+	gpb1: gpb1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpb2: gpb2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
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
+	gpc2: gpc2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpc3: gpc3-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+
+	gpk0: gpk0-gpio-bank {
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
+	decon_f_te_on: decon-f-te-on-pins {
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pins = "gpb0-1";
+	};
+
+	decon_s_te_on: decon-s-te-on-pins {
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pins = "gpb0-2";
+	};
+
+	hsi2c0_bus: hsi2c0-bus-pins {
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pins = "gpd1-1", "gpd1-0";
+	};
+
+	hsi2c1_bus: hsi2c1-bus-pins {
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pins = "gpd1-3", "gpd1-2";
+	};
+
+	hsi2c9_bus: hsi2c9-bus-pins {
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pins = "gpd1-5", "gpd1-4";
+	};
+
+	hsi2c10_bus: hsi2c10-bus-pins {
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pins = "gpd2-1", "gpd2-0";
+	};
+
+	hsi2c11_bus: hsi2c11-bus-pins {
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pins = "gpd2-3", "gpd2-2";
+	};
+
+	hsi2c4_bus: hsi2c4-bus-pins {
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pins = "gpd3-1", "gpd3-0";
+	};
+
+	hsi2c5_bus: hsi2c5-bus-pins {
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pins = "gpd3-3", "gpd3-2";
+	};
+
+	pwm_tout0: pwm-tout0-pins {
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pins = "gpd0-4";
+	};
+
+	pwm_tout1: pwm-tout1-pins {
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pins = "gpd0-5";
+	};
+
+	uart0_bus: uart0-bus-pins {
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pins = "gpd0-3", "gpd0-2", "gpd0-1", "gpd0-0";
+	};
+
+
+	ufs_refclk_out: ufs-refclk-out-pins {
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pins = "gpi0-5";
+	};
+
+	ufs_rst_n: ufs-rst-n-pins {
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pins = "gpi0-4";
+	};
+};
+
+&pinctrl_peric1 {
+	gpe0: gpe0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpe5: gpe5-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpe6: gpe6-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpj1: gpj1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpj2: gpj2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpe2: gpe2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpe3: gpe3-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpe4: gpe4-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpe1: gpe1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpe7: gpe7-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpg0: gpg0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+
+	hsi2c2_bus: hsi2c2-bus-pins {
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pins = "gpe5-1", "gpe5-0";
+	};
+
+	hsi2c3_bus: hsi2c3-bus-pins {
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pins = "gpe5-3", "gpe5-2";
+	};
+
+	hsi2c8_bus: hsi2c8-bus-pins {
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pins = "gpe5-5", "gpe5-4";
+	};
+
+	hsi2c12_bus: hsi2c12-bus-pins {
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pins = "gpe5-7", "gpe5-6";
+	};
+
+	hsi2c13_bus: hsi2c13-bus-pins {
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pins = "gpe6-1", "gpe6-0";
+	};
+
+	hsi2c14_bus: hsi2c14-bus-pins {
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV3>;
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pins = "gpe6-3", "gpe6-2";
+	};
+
+	pcie_bus: pcie-bus-pins {
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV4>;
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pins = "gpj1-0", "gpj1-1", "gpj1-2";
+	};
+
+	spi0_bus: spi0-bus-pins {
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pins = "gpe2-3", "gpe2-2", "gpe2-0";
+	};
+
+	spi0_cs: spi0-cs-pins {
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pins = "gpe2-1";
+	};
+
+	spi1_bus: spi1-bus-pins {
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pins = "gpe2-7", "gpe2-6", "gpe2-4";
+	};
+
+	spi1_cs: spi1-cs-pins {
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pins = "gpe2-5";
+	};
+
+	spi2_bus: spi2-bus-pins {
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pins = "gpe3-2", "gpe3-0";
+	};
+
+	spi2_cs: spi2-cs-pins {
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pins = "gpe3-1";
+	};
+
+	spi5_bus: spi5-bus-pins {
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pins = "gpe3-7", "gpe3-6", "gpe3-4";
+	};
+
+	spi5_cs: spi5-cs-pins {
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pins = "gpe3-5";
+	};
+
+	spi6_bus: spi6-bus-pins {
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pins = "gpe4-3", "gpe4-2", "gpe4-0";
+	};
+
+	spi6_cs: spi6-cs-pins {
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pins = "gpe4-1";
+	};
+
+	spi7_bus: spi7-bus-pins {
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pins = "gpe4-7", "gpe4-6", "gpe4-4";
+	};
+
+	spi7_cs: spi7-cs-pins {
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pins = "gpe4-5";
+	};
+
+	uart1_bus: uart1-bus-pins {
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pins = "gpe0-3", "gpe0-2", "gpe0-1", "gpe0-0";
+	};
+
+	uart2_bus: uart2-bus-pins {
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pins = "gpe0-5", "gpe0-4";
+	};
+
+	uart3_bus: uart3-bus-pins {
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pins = "gpe0-7", "gpe0-6";
+	};
+
+	uart4_bus: uart4-bus-pins {
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pins = "gpe1-3", "gpe1-2", "gpe1-1", "gpe1-0";
+	};
+
+	uart5_bus: uart5-bus-pins {
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pins = "gpe1-7", "gpe1-6", "gpe1-5", "gpe1-4";
+	};
+};
+
+&pinctrl_touch {
+	gpf1: gpf1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	hsi2c7_bus: hsi2c7-bus-pins-pins {
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pins = "gpf1-1", "gpf1-0";
+	};
+};
diff --git a/arch/arm64/boot/dts/exynos/exynos8890.dtsi b/arch/arm64/boot/dts/exynos/exynos8890.dtsi
new file mode 100644
index 000000000..f86462604
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos8890.dtsi
@@ -0,0 +1,1009 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Samsung Exynos 8890 SoC device tree source
+ *
+ * Copyright (c) 2025 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+ */
+
+#include <dt-bindings/clock/samsung,exynos8890-cmu.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	compatible = "samsung,exynos8890";
+	#address-cells = <2>;
+	#size-cells = <1>;
+
+	interrupt-parent = <&gic>;
+
+	aliases {
+		pinctrl0 = &pinctrl_alive;
+		pinctrl1 = &pinctrl_aud;
+		pinctrl2 = &pinctrl_ccore;
+		pinctrl3 = &pinctrl_fp;
+		pinctrl4 = &pinctrl_ese;
+		pinctrl5 = &pinctrl_fsys0;
+		pinctrl6 = &pinctrl_fsys1;
+		pinctrl7 = &pinctrl_nfc;
+		pinctrl8 = &pinctrl_peric0;
+		pinctrl9 = &pinctrl_peric1;
+		pinctrl10 = &pinctrl_touch;
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
+		};
+
+		/*
+		 * The Mongoose M1 cores have an errata, where memory accesses
+		 * to certain virtual addresses can trigger a TLB conflict abort,
+		 * even when running Linux in EL2.
+		 */
+
+		cpu0: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x100>;
+			enable-method = "psci";
+		};
+
+		cpu1: cpu@101 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x101>;
+			enable-method = "psci";
+		};
+
+		cpu2: cpu@102 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x102>;
+			enable-method = "psci";
+		};
+
+		cpu3: cpu@103 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x103>;
+			enable-method = "psci";
+		};
+	};
+
+	oscclk: osc-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-output-names = "oscclk";
+	};
+
+	pmu-a53 {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>,
+				     <&cpu1>,
+				     <&cpu2>,
+				     <&cpu3>;
+	};
+
+	psci {
+		compatible = "arm,psci";
+		cpu_off = <0x84000002>;
+		cpu_on = <0xc4000003>;
+		cpu_suspend = <0xc4000001>;
+		method = "smc";
+	};
+
+	soc: soc@0 {
+		compatible = "simple-bus";
+		ranges = <0x0 0x0 0x0 0x20000000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		chipid@10000000 {
+			compatible = "samsung,exynos8890-chipid",
+				     "samsung,exynos4210-chipid";
+			reg = <0x10000000 0x100>;
+		};
+
+		cmu_peris: clock-controller@10040000 {
+			compatible = "samsung,exynos8890-cmu-peris";
+			reg = <0x10040000 0x8000>;
+			#clock-cells = <1>;
+			clocks = <&oscclk>,
+				 <&cmu_top CLK_GOUT_TOP_ACLK_PERIS_66>;
+			clock-names = "oscclk", "peris";
+		};
+
+		mct: mct@101c0000 {
+			compatible = "samsung,exynos8890-mct",
+				     "samsung,exynos4210-mct";
+			reg = <0x101c0000 0x800>;
+
+			clocks = <&oscclk>, <&cmu_peris CLK_GOUT_PERIS_PCLK_MCT>;
+			clock-names = "fin_pll", "mct";
+
+			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		hsi2c_15: i2c@10550000 {
+			compatible = "samsung,exynos8890-hsi2c",
+				     "samsung,exynos8895-hsi2c";
+			reg = <0x10550000 0x1000>;
+
+			clocks = <&cmu_ccore CLK_GOUT_CCORE_PCLK_HSI2C>;
+			clock-names = "hsi2c";
+
+			interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>;
+
+			pinctrl-0 = <&hsi2c15_bus>;
+			pinctrl-names = "default";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
+		cmu_top: clock-controller@10570000 {
+			compatible = "samsung,exynos8890-cmu-top";
+			reg = <0x10570000 0x8000>;
+			#clock-cells = <1>;
+			clocks = <&oscclk>;
+			clock-names = "oscclk";
+		};
+
+		pinctrl_alive: pinctrl@10580000 {
+			compatible = "samsung,exynos8890-pinctrl";
+			reg = <0x10580000 0x1000>;
+			clocks = <&cmu_ccore CLK_GOUT_CCORE_PCLK_GPIO_APBIF_ALIVE>;
+			clock-names = "pclk";
+
+			wakeup-interrupt-controller {
+				compatible = "samsung,exynos8890-wakeup-eint",
+					     "samsung,exynos7-wakeup-eint";
+				interrupt-parent = <&gic>;
+				interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		pinctrl_ccore: pinctrl@105a0000 {
+			compatible = "samsung,exynos8890-pinctrl";
+			reg = <0x105a0000 0x1000>;
+			interrupts = <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu_ccore CLK_GOUT_CCORE_PCLK_GPIO_CCORE>;
+			clock-names = "pclk";
+		};
+
+		cmu_ccore: clock-controller@105b0000 {
+			compatible = "samsung,exynos8890-cmu-ccore";
+			reg = <0x105b0000 0x8000>;
+			#clock-cells = <1>;
+			clocks = <&oscclk>,
+				 <&cmu_top CLK_GOUT_TOP_ACLK_CCORE_800>,
+				 <&cmu_top CLK_GOUT_TOP_ACLK_CCORE_264>,
+				 <&cmu_top CLK_GOUT_TOP_ACLK_CCORE_G3D_800>,
+				 <&cmu_top CLK_GOUT_TOP_ACLK_CCORE_528>,
+				 <&cmu_top CLK_GOUT_TOP_ACLK_CCORE_132>,
+				 <&cmu_top CLK_GOUT_TOP_PCLK_CCORE_66>;
+			clock-names = "oscclk", "800", "264", "g3d", "528",
+				      "132", "66";
+		};
+
+		pmu_system_controller: system-controller@105c0000 {
+			compatible = "samsung,exynos8890-pmu",
+				     "samsung,exynos7-pmu", "syscon";
+			reg = <0x105c0000 0x10000>;
+		};
+
+		cmu_mif0: clock-controller@10850000 {
+			compatible = "samsung,exynos8890-cmu-mif0";
+			reg = <0x10850000 0x8000>;
+			#clock-cells = <1>;
+			clocks = <&oscclk>,
+				 <&cmu_top CLK_GOUT_TOP_SCLK_BUS_PLL_MIF>;
+			clock-names = "oscclk", "bus";
+		};
+
+		cmu_mif1: clock-controller@10950000 {
+			compatible = "samsung,exynos8890-cmu-mif1";
+			reg = <0x10950000 0x8000>;
+			#clock-cells = <1>;
+			clocks = <&oscclk>,
+				 <&cmu_top CLK_GOUT_TOP_SCLK_BUS_PLL_MIF>;
+			clock-names = "oscclk", "bus";
+		};
+
+		cmu_mif2: clock-controller@10a50000 {
+			compatible = "samsung,exynos8890-cmu-mif2";
+			reg = <0x10a50000 0x8000>;
+			#clock-cells = <1>;
+			clocks = <&oscclk>,
+				 <&cmu_top CLK_GOUT_TOP_SCLK_BUS_PLL_MIF>;
+			clock-names = "oscclk", "bus";
+		};
+
+		cmu_mif3: clock-controller@10b50000 {
+			compatible = "samsung,exynos8890-cmu-mif3";
+			reg = <0x10b50000 0x8000>;
+			#clock-cells = <1>;
+			clocks = <&oscclk>,
+				 <&cmu_top CLK_GOUT_TOP_SCLK_BUS_PLL_MIF>;
+			clock-names = "oscclk", "bus";
+		};
+
+		pinctrl_fsys0: pinctrl@10e60000 {
+			compatible = "samsung,exynos8890-pinctrl";
+			reg = <0x10e60000 0x1000>;
+			clocks = <&cmu_fsys0 CLK_GOUT_FSYS0_PCLK_GPIO_FSYS0>;
+			clock-names = "pclk";
+			interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		cmu_fsys0: clock-controller@10e90000 {
+			compatible = "samsung,exynos8890-cmu-fsys0";
+			reg = <0x10e90000 0x8000>;
+			#clock-cells = <1>;
+			clocks = <&oscclk>,
+				 <&cmu_top CLK_GOUT_TOP_ACLK_FSYS0_200>,
+				 <&cmu_top CLK_GOUT_TOP_SCLK_FSYS0_USBDRD30>,
+				 <&cmu_top CLK_GOUT_TOP_SCLK_FSYS0_MMC0>,
+				 <&cmu_top CLK_GOUT_TOP_SCLK_FSYS0_UFSUNIPRO20>,
+				 <&cmu_top CLK_GOUT_TOP_SCLK_FSYS0_PHY_24M>,
+				 <&cmu_top CLK_GOUT_TOP_SCLK_FSYS0_UFSUNIPRO_CFG>;
+			clock-names = "oscclk", "200", "usb", "mmc", "unipro20",
+				      "24m", "unipro_cfg";
+		};
+
+		gic: interrupt-controller@11001000 {
+			compatible = "arm,gic-400";
+			reg = <0x11001000 0x1000>,
+			      <0x11002000 0x1000>,
+			      <0x11004000 0x2000>,
+			      <0x11006000 0x2000>;
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) |
+						 IRQ_TYPE_LEVEL_HIGH)>;
+			#address-cells = <0>;
+			#size-cells = <1>;
+		};
+
+		pinctrl_aud: pinctrl@114b0000 {
+			compatible = "samsung,exynos8890-pinctrl";
+			reg = <0x114b0000 0x1000>;
+			clocks = <&cmu_aud CLK_GOUT_AUD_PCLK_GPIO_AUD>;
+			clock-names = "pclk";
+			interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		cmu_aud: clock-controller@114c0000 {
+			compatible = "samsung,exynos8890-cmu-aud";
+			reg = <0x114c0000 0x8000>;
+			#clock-cells = <1>;
+			clocks = <&oscclk>,
+				 <&cmu_top CLK_FOUT_AUD_PLL>;
+			clock-names = "oscclk", "pll";
+		};
+
+		cmu_mngs: clock-controller@11800000 {
+			compatible = "samsung,exynos8890-cmu-mngs";
+			reg = <0x11800000 0x8000>;
+			#clock-cells = <1>;
+			clocks = <&oscclk>,
+				 <&cmu_top CLK_GOUT_TOP_SCLK_BUS_PLL_MNGS>;
+			clock-names = "oscclk", "bus";
+		};
+
+		cmu_apollo: clock-controller@11900000 {
+			compatible = "samsung,exynos8890-cmu-apollo";
+			reg = <0x11900000 0x8000>;
+			#clock-cells = <1>;
+			clocks = <&oscclk>,
+				 <&cmu_top CLK_GOUT_TOP_SCLK_BUS_PLL_APOLLO>;
+			clock-names = "oscclk", "bus";
+		};
+
+		cmu_bus0: clock-controller@13400000 {
+			compatible = "samsung,exynos8890-cmu-bus0";
+			reg = <0x13400000 0x8000>;
+			#clock-cells = <1>;
+			clocks = <&oscclk>,
+				 <&cmu_top CLK_GOUT_TOP_ACLK_BUS0_528>,
+				 <&cmu_top CLK_GOUT_TOP_ACLK_BUS0_200>,
+				 <&cmu_top CLK_GOUT_TOP_PCLK_BUS0_132>;
+			clock-names = "oscclk", "528", "200", "132";
+		};
+
+		cmu_peric0: clock-controller@13610000 {
+			compatible = "samsung,exynos8890-cmu-peric0";
+			reg = <0x13610000 0x8000>;
+			#clock-cells = <1>;
+			clocks = <&oscclk>,
+				 <&cmu_top CLK_GOUT_TOP_ACLK_PERIC0_66>,
+				 <&cmu_top CLK_GOUT_TOP_SCLK_PERIC0_UART0>;
+			clock-names = "oscclk", "66", "uart0";
+		};
+
+		serial_0: serial@13630000 {
+			compatible = "samsung,exynos8890-uart",
+				     "samsung,exynos8895-uart";
+			reg = <0x13630000 0x100>;
+
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_UART0>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_SCLK_UART0>;
+			clock-names = "uart", "clk_uart_baud0";
+
+			interrupts = <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>;
+
+			pinctrl-0 = <&uart0_bus>;
+			pinctrl-names = "default";
+
+			samsung,uart-fifosize = <256>;
+
+			status = "disabled";
+		};
+
+		hsi2c_0: i2c@13640000 {
+			compatible = "samsung,exynos8890-hsi2c",
+				     "samsung,exynos8895-hsi2c";
+			reg = <0x13640000 0x1000>;
+
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_HSI2C0>;
+			clock-names = "hsi2c";
+
+			interrupts = <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>;
+
+			pinctrl-0 = <&hsi2c0_bus>;
+			pinctrl-names = "default";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
+		hsi2c_1: i2c@13650000 {
+			compatible = "samsung,exynos8890-hsi2c",
+				     "samsung,exynos8895-hsi2c";
+			reg = <0x13650000 0x1000>;
+
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_HSI2C1>;
+			clock-names = "hsi2c";
+
+			interrupts = <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>;
+
+			pinctrl-0 = <&hsi2c1_bus>;
+			pinctrl-names = "default";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
+		hsi2c_4: i2c@13660000 {
+			compatible = "samsung,exynos8890-hsi2c",
+				     "samsung,exynos8895-hsi2c";
+			reg = <0x13660000 0x1000>;
+
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_HSI2C4>;
+			clock-names = "hsi2c";
+
+			interrupts = <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>;
+
+			pinctrl-0 = <&hsi2c4_bus>;
+			pinctrl-names = "default";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
+		hsi2c_5: i2c@13670000 {
+			compatible = "samsung,exynos8890-hsi2c",
+				     "samsung,exynos8895-hsi2c";
+			reg = <0x13670000 0x1000>;
+
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_HSI2C5>;
+			clock-names = "hsi2c";
+
+			interrupts = <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>;
+
+			pinctrl-0 = <&hsi2c5_bus>;
+			pinctrl-names = "default";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
+		hsi2c_9: i2c@13680000 {
+			compatible = "samsung,exynos8890-hsi2c",
+				     "samsung,exynos8895-hsi2c";
+			reg = <0x13680000 0x1000>;
+
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_HSI2C9>;
+			clock-names = "hsi2c";
+
+			interrupts = <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH>;
+
+			pinctrl-0 = <&hsi2c9_bus>;
+			pinctrl-names = "default";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
+		hsi2c_10: i2c@13690000 {
+			compatible = "samsung,exynos8890-hsi2c",
+				     "samsung,exynos8895-hsi2c";
+			reg = <0x13690000 0x1000>;
+
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_HSI2C10>;
+			clock-names = "hsi2c";
+
+			interrupts = <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>;
+
+			pinctrl-0 = <&hsi2c10_bus>;
+			pinctrl-names = "default";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
+		hsi2c_11: i2c@136a0000 {
+			compatible = "samsung,exynos8890-hsi2c",
+				     "samsung,exynos8895-hsi2c";
+			reg = <0x136a0000 0x1000>;
+
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_HSI2C11>;
+			clock-names = "hsi2c";
+
+			interrupts = <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>;
+
+			pinctrl-0 = <&hsi2c11_bus>;
+			pinctrl-names = "default";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
+		pwm: pwm@136c0000 {
+			compatible = "samsung,exynos8890-pwm",
+				     "samsung,exynos4210-pwm";
+			reg = <0x136c0000 0x100>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_PWM>;
+			clock-names = "timers";
+			#pwm-cells = <3>;
+			samsung,pwm-outputs = <0>, <1>, <2>, <3>;
+			status = "disabled";
+		};
+
+		pinctrl_peric0: pinctrl@136d0000 {
+			compatible = "samsung,exynos8890-pinctrl";
+			reg = <0x136d0000 0x1000>;
+			interrupts = <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_GPIO_BUS0>;
+			clock-names = "pclk";
+		};
+
+		cmu_disp0: clock-controller@13ad0000 {
+			compatible = "samsung,exynos8890-cmu-disp0";
+			reg = <0x13ad0000 0x8000>;
+			#clock-cells = <1>;
+			clocks = <&oscclk>,
+				 <&cmu_top CLK_GOUT_TOP_ACLK_DISP0_0_400>,
+				 <&cmu_top CLK_GOUT_TOP_ACLK_DISP0_1_400>,
+				 <&cmu_top CLK_GOUT_TOP_SCLK_DISP0_DECON0_ECLK0>,
+				 <&cmu_top CLK_GOUT_TOP_SCLK_DISP0_DECON0_VCLK0>,
+				 <&cmu_top CLK_GOUT_TOP_SCLK_DISP0_DECON0_VCLK1>,
+				 <&cmu_top CLK_GOUT_TOP_SCLK_DISP0_HDMI_AUDIO>;
+			clock-names = "oscclk", "0_400", "1_400", "eclk0",
+				      "vclk0", "vclk1", "audio";
+		};
+
+		cmu_disp1: clock-controller@13f00000 {
+			compatible = "samsung,exynos8890-cmu-disp1";
+			reg = <0x13f00000 0x8000>;
+			#clock-cells = <1>;
+			clocks = <&oscclk>,
+				 <&cmu_top CLK_GOUT_TOP_ACLK_DISP1_0_400>,
+				 <&cmu_top CLK_GOUT_TOP_ACLK_DISP1_1_400>,
+				 <&cmu_top CLK_GOUT_TOP_SCLK_DISP1_DECON1_ECLK0>,
+				 <&cmu_top CLK_GOUT_TOP_SCLK_DISP1_DECON1_ECLK1>;
+			clock-names = "oscclk", "0_400", "1_400", "eclk0",
+				      "eclk01";
+		};
+
+		cmu_bus1: clock-controller@14800000 {
+			compatible = "samsung,exynos8890-cmu-bus1";
+			reg = <0x14800000 0x8000>;
+			#clock-cells = <1>;
+			clocks = <&oscclk>,
+				 <&cmu_top CLK_GOUT_TOP_ACLK_BUS0_528>,
+				 <&cmu_top CLK_GOUT_TOP_PCLK_BUS1_132>;
+			clock-names = "oscclk", "528", "132";
+		};
+
+		cmu_g3d: clock-controller@14aa0000 {
+			compatible = "samsung,exynos8890-cmu-g3d";
+			reg = <0x14aa0000 0x8000>;
+			#clock-cells = <1>;
+			clocks = <&oscclk>,
+				 <&cmu_top CLK_FOUT_G3D_PLL>,
+				 <&cmu_top CLK_GOUT_TOP_SCLK_BUS_PLL_G3D>;
+			clock-names = "oscclk", "pll", "bus";
+		};
+
+		gpu: gpu@14ac0000 {
+			compatible = "samsung,exynos8890-mali", "arm,mali-t880";
+			reg = <0x14ac0000 0x5000>;
+
+			clocks = <&cmu_g3d CLK_GOUT_G3D_ACLK_G3D>;
+			clock-names = "core";
+
+			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "job", "mmu", "gpu";
+
+			status = "disabled";
+		};
+
+		serial_5: serial@14c10000 {
+			compatible = "samsung,exynos8890-uart",
+				     "samsung,exynos8895-uart";
+			reg = <0x14c10000 0x100>;
+
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_UART5>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_SCLK_UART5>;
+			clock-names = "uart", "clk_uart_baud0";
+
+			interrupts = <GIC_SPI 436 IRQ_TYPE_LEVEL_HIGH>;
+
+			pinctrl-0 = <&uart5_bus>;
+			pinctrl-names = "default";
+
+			samsung,uart-fifosize = <64>;
+
+			status = "disabled";
+		};
+
+		serial_1: serial@14c20000 {
+			compatible = "samsung,exynos8890-uart",
+				     "samsung,exynos8895-uart";
+			reg = <0x14c20000 0x100>;
+
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_UART1>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_SCLK_UART1>;
+			clock-names = "uart", "clk_uart_baud0";
+
+			interrupts = <GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH>;
+
+			pinctrl-0 = <&uart1_bus>;
+			pinctrl-names = "default";
+
+			samsung,uart-fifosize = <256>;
+
+			status = "disabled";
+		};
+
+		serial_2: serial@14c30000 {
+			compatible = "samsung,exynos8890-uart",
+				     "samsung,exynos8895-uart";
+			reg = <0x14c30000 0x100>;
+
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_UART2>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_SCLK_UART2>;
+			clock-names = "uart", "clk_uart_baud0";
+
+			interrupts = <GIC_SPI 433 IRQ_TYPE_LEVEL_HIGH>;
+
+			pinctrl-0 = <&uart2_bus>;
+			pinctrl-names = "default";
+
+			samsung,uart-fifosize = <16>;
+
+			status = "disabled";
+		};
+
+		serial_3: serial@14c40000 {
+			compatible = "samsung,exynos8890-uart",
+				     "samsung,exynos8895-uart";
+			reg = <0x14c40000 0x100>;
+
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_UART3>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_SCLK_UART3>;
+			clock-names = "uart", "clk_uart_baud0";
+
+			interrupts = <GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>;
+
+			pinctrl-0 = <&uart3_bus>;
+			pinctrl-names = "default";
+
+			samsung,uart-fifosize = <64>;
+
+			status = "disabled";
+		};
+
+		serial_4: serial@14c50000 {
+			compatible = "samsung,exynos8890-uart",
+				     "samsung,exynos8895-uart";
+			reg = <0x14c50000 0x100>;
+
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_UART4>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_SCLK_UART4>;
+			clock-names = "uart", "clk_uart_baud0";
+
+			interrupts = <GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH>;
+
+			pinctrl-0 = <&uart4_bus>;
+			pinctrl-names = "default";
+
+			samsung,uart-fifosize = <256>;
+
+			status = "disabled";
+		};
+
+		cmu_peric1: clock-controller@14c80000 {
+			compatible = "samsung,exynos8890-cmu-peric1";
+			reg = <0x14c80000 0x8000>;
+			#clock-cells = <1>;
+			clocks = <&oscclk>,
+				 <&cmu_top CLK_GOUT_TOP_ACLK_PERIC1_66>,
+				 <&cmu_top CLK_GOUT_TOP_SCLK_PERIC1_SPI0>,
+				 <&cmu_top CLK_GOUT_TOP_SCLK_PERIC1_SPI1>,
+				 <&cmu_top CLK_GOUT_TOP_SCLK_PERIC1_SPI2>,
+				 <&cmu_top CLK_GOUT_TOP_SCLK_PERIC1_SPI3>,
+				 <&cmu_top CLK_GOUT_TOP_SCLK_PERIC1_SPI4>,
+				 <&cmu_top CLK_GOUT_TOP_SCLK_PERIC1_SPI5>,
+				 <&cmu_top CLK_GOUT_TOP_SCLK_PERIC1_SPI6>,
+				 <&cmu_top CLK_GOUT_TOP_SCLK_PERIC1_SPI7>,
+				 <&cmu_top CLK_GOUT_TOP_SCLK_PERIC1_UART1>,
+				 <&cmu_top CLK_GOUT_TOP_SCLK_PERIC1_UART2>,
+				 <&cmu_top CLK_GOUT_TOP_SCLK_PERIC1_UART3>,
+				 <&cmu_top CLK_GOUT_TOP_SCLK_PERIC1_UART4>,
+				 <&cmu_top CLK_GOUT_TOP_SCLK_PERIC1_UART5>;
+			clock-names = "oscclk", "66", "spi0", "spi1",
+				      "spi2", "spi3", "spi4", "spi5", "spi6",
+				      "spi7", "uart1", "uart2", "uart3",
+				      "uart4", "uart5";
+		};
+
+		pinctrl_ese: pinctrl@14c90000 {
+			compatible = "samsung,exynos8890-pinctrl";
+			reg = <0x14c90000 0x1000>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_GPIO_ESE>;
+			clock-names = "pclk";
+			interrupts = <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pinctrl_fp: pinctrl@14ca0000 {
+			compatible = "samsung,exynos8890-pinctrl";
+			reg = <0x14ca0000 0x1000>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_GPIO_FF>;
+			clock-names = "pclk";
+			interrupts = <GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pinctrl_peric1: pinctrl@14cc0000 {
+			compatible = "samsung,exynos8890-pinctrl";
+			reg = <0x14cc0000 0x1000>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_GPIO_PERIC1>;
+			clock-names = "pclk";
+			interrupts = <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pinctrl_nfc: pinctrl@14cd0000 {
+			compatible = "samsung,exynos8890-pinctrl";
+			reg = <0x14cd0000 0x1000>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_GPIO_NFC>;
+			clock-names = "pclk";
+			interrupts = <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pinctrl_touch: pinctrl@14ce0000 {
+			compatible = "samsung,exynos8890-pinctrl";
+			reg = <0x14ce0000 0x1000>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_GPIO_TOUCH>;
+			clock-names = "pclk";
+			interrupts = <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		hsi2c_6: i2c@14e00000 {
+			compatible = "samsung,exynos8890-hsi2c",
+				     "samsung,exynos8895-hsi2c";
+			reg = <0x14e00000 0x1000>;
+
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_HSI2C6>;
+			clock-names = "hsi2c";
+
+			interrupts = <GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>;
+
+			pinctrl-0 = <&hsi2c6_bus>;
+			pinctrl-names = "default";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
+		hsi2c_7: i2c@14e10000 {
+			compatible = "samsung,exynos8890-hsi2c",
+				     "samsung,exynos8895-hsi2c";
+			reg = <0x14e10000 0x1000>;
+
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_HSI2C7>;
+			clock-names = "hsi2c";
+
+			interrupts = <GIC_SPI 440 IRQ_TYPE_LEVEL_HIGH>;
+
+			pinctrl-0 = <&hsi2c7_bus>;
+			pinctrl-names = "default";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
+		hsi2c_8: i2c@14e20000 {
+			compatible = "samsung,exynos8890-hsi2c",
+				     "samsung,exynos8895-hsi2c";
+			reg = <0x14e20000 0x1000>;
+
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_HSI2C8>;
+			clock-names = "hsi2c";
+
+			interrupts = <GIC_SPI 441 IRQ_TYPE_LEVEL_HIGH>;
+
+			pinctrl-0 = <&hsi2c8_bus>;
+			pinctrl-names = "default";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
+		hsi2c_12: i2c@14e30000 {
+			compatible = "samsung,exynos8890-hsi2c",
+				     "samsung,exynos8895-hsi2c";
+			reg = <0x14e30000 0x1000>;
+
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_HSI2C12>;
+			clock-names = "hsi2c";
+
+			interrupts = <GIC_SPI 442 IRQ_TYPE_LEVEL_HIGH>;
+
+			pinctrl-0 = <&hsi2c12_bus>;
+			pinctrl-names = "default";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
+		hsi2c_13: i2c@14e40000 {
+			compatible = "samsung,exynos8890-hsi2c",
+				     "samsung,exynos8895-hsi2c";
+			reg = <0x14e40000 0x1000>;
+
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_HSI2C13>;
+			clock-names = "hsi2c";
+
+			interrupts = <GIC_SPI 443 IRQ_TYPE_LEVEL_HIGH>;
+
+			pinctrl-0 = <&hsi2c13_bus>;
+			pinctrl-names = "default";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
+		hsi2c_14: i2c@14e50000 {
+			compatible = "samsung,exynos8890-hsi2c",
+				     "samsung,exynos8895-hsi2c";
+			reg = <0x14e50000 0x1000>;
+
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_HSI2C14>;
+			clock-names = "hsi2c";
+
+			interrupts = <GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>;
+
+			pinctrl-0 = <&hsi2c14_bus>;
+			pinctrl-names = "default";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
+		hsi2c_2: i2c@14e60000 {
+			compatible = "samsung,exynos8890-hsi2c",
+				     "samsung,exynos8895-hsi2c";
+			reg = <0x14e60000 0x1000>;
+
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_HSI2C2>;
+			clock-names = "hsi2c";
+
+			interrupts = <GIC_SPI 437 IRQ_TYPE_LEVEL_HIGH>;
+
+			pinctrl-0 = <&hsi2c2_bus>;
+			pinctrl-names = "default";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
+		hsi2c_3: i2c@14e70000 {
+			compatible = "samsung,exynos8890-hsi2c",
+				     "samsung,exynos8895-hsi2c";
+			reg = <0x14e70000 0x1000>;
+
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_HSI2C3>;
+			clock-names = "hsi2c";
+
+			interrupts = <GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>;
+
+			pinctrl-0 = <&hsi2c3_bus>;
+			pinctrl-names = "default";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
+		usbdrd30: usb@15400000 {
+			compatible = "samsung,exynos8890-dwusb3",
+				     "samsung,exynos7-dwusb3";
+			ranges = <0x0 0x15400000 0x10000>;
+
+			clocks = <&cmu_fsys0 CLK_GOUT_FSYS0_ACLK_USBDRD30>,
+				 <&cmu_fsys0 CLK_GOUT_FSYS0_SCLK_USBDRD30_SUSPEND_CLK>,
+				 <&cmu_fsys0 CLK_GOUT_FSYS0_ACLK_AXI_US_USBDRD30X_FSYS0X>;
+			clock-names = "usbdrd30", "usbdrd30_susp_clk",
+				      "usbdrd30_axius_clk";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			status = "disabled";
+
+			usbdrd30_dwc3: usb@0 {
+				compatible = "snps,dwc3";
+				reg = <0x0 0x10000>;
+
+				clocks = <&cmu_fsys0 CLK_GOUT_FSYS0_SCLK_USBDRD30_REF_CLK>;
+				clock-names = "ref";
+
+				interrupts = <GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH>;
+
+				phys = <&usbdrd30_phy 0>;
+				phy-names = "usb2-phy";
+
+				status = "disabled";
+			};
+		};
+
+		usbdrd30_phy: phy@15500000 {
+			compatible = "samsung,exynos8890-usbdrd-phy";
+			reg = <0x15500000 0x100>;
+			clocks = <&cmu_fsys0 CLK_GOUT_FSYS0_PHYCLK_USBDRD30_UDRD30_PHYCLOCK>,
+				 <&oscclk>,
+				 <&cmu_fsys0 CLK_GOUT_FSYS0_PHYCLK_USBDRD30_UDRD30_PIPE_PCLK>;
+			clock-names = "phy", "ref", "pipe";
+			#phy-cells = <1>;
+			samsung,pmu-syscon = <&pmu_system_controller>;
+			status = "disabled";
+		};
+
+		pinctrl_fsys1: pinctrl@15690000 {
+			compatible = "samsung,exynos8890-pinctrl";
+			reg = <0x15690000 0x1000>;
+			clocks = <&cmu_fsys1 CLK_GOUT_FSYS1_PCLK_GPIO_FSYS1>;
+			clock-names = "pclk";
+			interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		cmu_fsys1: clock-controller@156e0000 {
+			compatible = "samsung,exynos8890-cmu-fsys1";
+			reg = <0x156e0000 0x8000>;
+			#clock-cells = <1>;
+			clocks = <&oscclk>,
+				 <&cmu_top CLK_GOUT_TOP_ACLK_FSYS1_200>,
+				 <&cmu_top CLK_GOUT_TOP_SCLK_FSYS1_MMC2>,
+				 <&cmu_top CLK_GOUT_TOP_SCLK_FSYS1_UFSUNIPRO20>,
+				 <&cmu_top CLK_GOUT_TOP_SCLK_FSYS1_UFSUNIPRO_CFG>,
+				 <&cmu_top CLK_GOUT_TOP_SCLK_FSYS1_PCIE_PHY>,
+				 <&cmu_top CLK_FOUT_PCIE_PLL>;
+			clock-names = "oscclk", "200", "mmc2", "unipro20",
+				      "unipro_cfg", "pcie_phy", "pcie_pll";
+		};
+
+		mmc: mmc@15740000 {
+			compatible = "samsung,exynos8890-dw-mshc-smu",
+				     "samsung,exynos7-dw-mshc-smu";
+			reg = <0x15740000 0x2000>;
+
+			assigned-clocks = <&cmu_top CLK_DOUT_TOP_SCLK_FSYS1_MMC2>;
+			assigned-clock-rates = <800000000>;
+
+			clocks = <&cmu_fsys1 CLK_GOUT_FSYS1_ACLK_MMC2>,
+				 <&cmu_fsys1 CLK_GOUT_FSYS1_SCLK_MMC2>;
+			clock-names = "biu", "ciu";
+
+			fifo-depth = <64>;
+
+			interrupts = <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		/* Hypervisor Virtual Timer interrupt is not wired to GIC */
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+		/*
+		 * Non-updatable, broken stock Samsung bootloader does not
+		 * configure CNTFRQ_EL0
+		 */
+		clock-frequency = <26000000>;
+	};
+};
+
+#include "exynos8890-pinctrl.dtsi"
+#include "arm/samsung/exynos-syscon-restart.dtsi"
-- 
2.43.0

