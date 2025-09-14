Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E691E515;
	Sun, 14 Sep 2025 20:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757882660; cv=none; b=SP0F1dlwEg55rz5GZoVNZ9Gy8L60oHEAVBbOn0dnUNDV7WydVlIhynW/32Yy2DXMU+lCyyrPApD7MewiRAKPIFXKpcIm52/BwRqW7x5XC/wJaRws2WOiO9O/7froXIG51uauARbVsr62SjnP14A0+W0tOZ1eRvrINJV4g930GJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757882660; c=relaxed/simple;
	bh=0wUspdY+M+Ez5V3YoMgHUs4+ASlTB6ZBwb3NRLcYThY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XfKLXhaAX8ACXir9XwFm9RADlLd35uvd7wojokV0/ljbEFbvaylhZbP0XELVEUYkW6eWaLsRRyZ5hKjYXqa5CGAu3fZqPxzK50fnb33Rtxv8eF7mtcJMZpsKss01RtgOSAkckBmh8Wk/7bnJc+h1wSzvc1aLp7UyWiD/btkZHi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro; spf=pass smtp.mailfrom=chimac.ro; dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b=o1Oj8PkV; arc=none smtp.client-ip=185.70.43.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chimac.ro
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b="o1Oj8PkV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail; t=1757882654; x=1758141854;
	bh=I0oZCjAslYJsmaLEZcSbKhlGfPqb/30qFq3pqSgzpyg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=o1Oj8PkVKUu/kQ0O+hBxOeGCj0U8S+b63gjSDowwrLmzKoeTc/H92pP36FkjYp68C
	 UmX4XJ8yfle1B736QUNFipcKQywEJjYfVr8rIdQJTf3FFQhbPjHh/JfRvMd2jtjT+4
	 FZXUd1ETPl3XHstlqScPQRf729QfJCnG2YLJnWnmIWqQ1kNhV9hJ+OW5w47xd976J6
	 ZVjexEWE+ahWaDOEx89O25iForHj5fpmiGyunCMDTD7NPRLt9dyiLsU6eCMRkso6KK
	 OuqtuuRUSwJyrT+4MBHqk9CoOn1ITZg+63oTYQR9vk1q9Tzu+QWr2+kSH8iwkTzx2W
	 //TQwbUDgWfug==
Date: Sun, 14 Sep 2025 20:44:09 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>
From: Alexandru Chimac <alex@chimac.ro>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, Alexandru Chimac <alex@chimac.ro>
Subject: [PATCH 2/3] arm64: dts: exynos: Add initial support for the Exynos9610 SoC
Message-ID: <20250914-exynos9610-devicetree-v1-2-2000fc3bbe0b@chimac.ro>
In-Reply-To: <20250914-exynos9610-devicetree-v1-0-2000fc3bbe0b@chimac.ro>
References: <20250914-exynos9610-devicetree-v1-0-2000fc3bbe0b@chimac.ro>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: 8f6d7e8e1e74d26a521e975337a61aa46435b7ad
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The Exynos9610 SoC is found in 2020-2021 Samsung Galaxy A/M-series devices.
Add basic support for this SoC, including:

- All 8 cores
- ChipID
- Generic timer
- pinctrl

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
 arch/arm64/boot/dts/exynos/exynos9610-pinctrl.dtsi | 1180 ++++++++++++++++=
++++
 arch/arm64/boot/dts/exynos/exynos9610.dtsi         |  263 +++++
 2 files changed, 1443 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos9610-pinctrl.dtsi b/arch/arm6=
4/boot/dts/exynos/exynos9610-pinctrl.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..a7cc40d0ea84676d0f19c9912bb=
a521a0162575a
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos9610-pinctrl.dtsi
@@ -0,0 +1,1180 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Samsung Exynos9610 pinmux and pinconf
+ *
+ * Copyright (c) 2025, Alexandru Chimac <alexchimac@protonmail.com>
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include "exynos-pinctrl.h"
+
+&pinctrl_alive {
+=09etc0: etc0-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+=09=09interrupt-parent =3D <&gic>;
+=09};
+
+=09gpa0: gpa0-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <3>;
+=09=09interrupt-parent =3D <&gic>;
+=09=09interrupts =3D <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+=09=09=09     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+=09=09=09     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+=09=09=09     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+=09=09=09     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+=09=09=09     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
+=09=09=09     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+=09=09=09     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+=09};
+
+=09gpa1: gpa1-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <3>;
+=09=09interrupt-parent =3D <&gic>;
+=09=09interrupts =3D <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+=09=09=09     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
+=09=09=09     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
+=09=09=09     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
+=09=09=09     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
+=09=09=09     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
+=09=09=09     <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
+=09=09=09     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+=09};
+
+=09gpa2: gpa2-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <3>;
+=09=09interrupt-parent =3D <&gic>;
+=09=09interrupts =3D <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+=09=09=09     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
+=09=09=09     <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
+=09=09=09     <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
+=09=09=09     <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
+=09=09=09     <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
+=09=09=09     <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>,
+=09=09=09     <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+=09};
+
+=09gpq0: gpq0-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+=09};
+
+=09speedy_bus: speedy-bus-pins {
+=09=09samsung,pins =3D "gpq0-2";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_UP>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09uart0_bus: uart0-bus-pins {
+=09=09samsung,pins =3D "gpq0-3", "gpq0-4";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_UP>;
+=09};
+
+=09xclkout1: xclkout1 {
+=09=09samsung,pins =3D "gpq0-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09};
+
+=09xclkout0: xclkout0 {
+=09=09samsung,pins =3D "gpq0-1";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09};
+};
+
+&pinctrl_cmgp {
+=09gpm0: gpm0-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+=09=09interrupt-parent =3D <&gic>;
+=09=09interrupts =3D <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
+=09};
+
+=09gpm1: gpm1-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+=09=09interrupt-parent =3D <&gic>;
+=09=09interrupts =3D <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
+=09};
+
+=09gpm2: gpm2-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+=09=09interrupt-parent =3D <&gic>;
+=09=09interrupts =3D <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
+=09};
+
+=09gpm3: gpm3-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+=09=09interrupt-parent =3D <&gic>;
+=09=09interrupts =3D <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
+=09};
+
+=09gpm4: gpm4-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+=09=09interrupt-parent =3D <&gic>;
+=09};
+
+=09gpm5: gpm5-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+=09=09interrupt-parent =3D <&gic>;
+=09};
+
+=09gpm6: gpm6-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+=09=09interrupt-parent =3D <&gic>;
+=09=09interrupts =3D <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
+=09};
+
+=09gpm7: gpm7-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+=09=09interrupt-parent =3D <&gic>;
+=09=09interrupts =3D <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
+=09};
+
+=09gpm8: gpm8-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+=09=09interrupt-parent =3D <&gic>;
+=09=09interrupts =3D <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
+=09};
+
+=09gpm9: gpm9-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+=09=09interrupt-parent =3D <&gic>;
+=09=09interrupts =3D <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
+=09};
+
+=09gpm10: gpm10-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+=09=09interrupt-parent =3D <&gic>;
+=09};
+
+=09gpm11: gpm11-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+=09=09interrupt-parent =3D <&gic>;
+=09};
+
+=09gpm12: gpm12-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+=09=09interrupt-parent =3D <&gic>;
+=09=09interrupts =3D <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
+=09};
+
+=09gpm13: gpm13-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+=09=09interrupt-parent =3D <&gic>;
+=09=09interrupts =3D <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+=09};
+
+=09gpm14: gpm14-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+=09=09interrupt-parent =3D <&gic>;
+=09=09interrupts =3D <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>;
+=09};
+
+=09gpm15: gpm15-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+=09=09interrupt-parent =3D <&gic>;
+=09};
+
+=09gpm16: gpm16-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+=09=09interrupt-parent =3D <&gic>;
+=09=09interrupts =3D <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
+=09};
+
+=09gpm17: gpm17-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+=09=09interrupt-parent =3D <&gic>;
+=09=09interrupts =3D <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>;
+=09};
+
+=09gpm18: gpm18-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+=09=09interrupt-parent =3D <&gic>;
+=09=09interrupts =3D <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
+=09};
+
+=09gpm19: gpm19-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+=09=09interrupt-parent =3D <&gic>;
+=09=09interrupts =3D <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>;
+=09};
+
+=09gpm20: gpm20-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+=09=09interrupt-parent =3D <&gic>;
+=09};
+
+=09gpm21: gpm21-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+=09=09interrupt-parent =3D <&gic>;
+=09};
+
+=09gpm22: gpm22-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+=09=09interrupt-parent =3D <&gic>;
+=09=09interrupts =3D <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+=09};
+
+
+=09gpm23: gpm23-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+=09=09interrupt-parent =3D <&gic>;
+=09};
+
+=09gpm24: gpm24-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+=09=09interrupt-parent =3D <&gic>;
+=09};
+
+=09gpm25: gpm25-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+=09=09interrupt-parent =3D <&gic>;
+=09};
+
+=09hsi2c2_bus: hsi2c2-bus-pins {
+=09=09samsung,pins =3D "gpm0-0", "gpm1-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09hsi2c3_bus: hsi2c3-bus-pins {
+=09=09samsung,pins =3D "gpm2-0", "gpm3-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_3>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09hsi2c4_bus: hsi2c4-bus-pins {
+=09=09samsung,pins =3D "gpm4-0", "gpm5-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_3>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09hsi2c5_bus: hsi2c5-bus-pins {
+=09=09samsung,pins =3D "gpm6-0", "gpm7-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_3>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09hsi2c6_bus: hsi2c6-bus-pins {
+=09=09samsung,pins =3D "gpm8-0", "gpm9-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09hsi2c7_bus: hsi2c7-bus-pins {
+=09=09samsung,pins =3D "gpm10-0", "gpm11-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_3>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09hsi2c8_bus: hsi2c8-bus-pins {
+=09=09samsung,pins =3D "gpm12-0", "gpm13-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09hsi2c9_bus: hsi2c9-bus-pins {
+=09=09samsung,pins =3D "gpm14-0", "gpm15-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_3>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09hsi2c10_bus: hsi2c10-bus-pins {
+=09=09samsung,pins =3D "gpm16-0", "gpm17-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09hsi2c11_bus: hsi2c11-bus-pins {
+=09=09samsung,pins =3D "gpm18-0", "gpm19-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_3>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09spi1_bus: spi1-bus-pins {
+=09=09samsung,pins =3D "gpm0-0", "gpm1-0", "gpm2-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09spi1_cs: spi1-cs-pins {
+=09=09samsung,pins =3D "gpm3-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_OUTPUT>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09spi1_cs_func: spi1-cs-func-pins {
+=09=09samsung,pins =3D "gpm3-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09spi2_bus: spi2-bus-pins {
+=09=09samsung,pins =3D "gpm4-0", "gpm5-0", "gpm6-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09spi2_cs: spi2-cs-pins {
+=09=09samsung,pins =3D "gpm7-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_OUTPUT>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09spi2_cs_func: spi2-cs-func-pins {
+=09=09samsung,pins =3D "gpm7-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09spi3_bus: spi3-bus-pins {
+=09=09samsung,pins =3D "gpm8-0", "gpm9-0", "gpm10-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09spi3_cs: spi3-cs-pins {
+=09=09samsung,pins =3D "gpm11-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_OUTPUT>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09spi3_cs_func: spi3-cs-func-pins {
+=09=09samsung,pins =3D "gpm11-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09spi4_bus: spi4-bus-pins {
+=09=09samsung,pins =3D "gpm12-0", "gpm13-0", "gpm14-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09spi4_cs: spi4-cs-pins {
+=09=09samsung,pins =3D "gpm15-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_OUTPUT>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09spi4_cs_func: spi4-cs-func-pins {
+=09=09samsung,pins =3D "gpm15-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09spi5_bus: spi5-bus-pins {
+=09=09samsung,pins =3D "gpm16-0", "gpm17-0", "gpm18-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09spi5_cs: spi5-cs-pins {
+=09=09samsung,pins =3D "gpm19-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_OUTPUT>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09spi5_cs_func: spi5-cs-func-pins {
+=09=09samsung,pins =3D "gpm19-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09uart2_bus_single: uart2-bus-pins {
+=09=09samsung,pins =3D "gpm0-0", "gpm1-0", "gpm2-0", "gpm3-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09};
+
+=09uart3_bus_single: uart3-bus-pins {
+=09=09samsung,pins =3D "gpm4-0", "gpm5-0", "gpm6-0", "gpm7-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09};
+
+=09uart4_bus_single: uart4-bus-pins {
+=09=09samsung,pins =3D "gpm8-0", "gpm9-0", "gpm10-0", "gpm11-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09};
+
+=09uart5_bus_single: uart5-bus-pins {
+=09=09samsung,pins =3D "gpm12-0", "gpm13-0", "gpm14-0", "gpm15-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09};
+
+=09uart6_bus_single: uart6-bus-pins {
+=09=09samsung,pins =3D "gpm16-0", "gpm17-0", "gpm18-0", "gpm19-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09};
+};
+
+&pinctrl_dispaud {
+=09gpb0: gpb0-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+=09};
+
+=09gpb1: gpb1-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+=09};
+
+=09gpb2: gpb2-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+=09};
+
+=09aud_codec_mclk: aud-codec-mclk-pins {
+=09=09samsung,pins =3D "gpb0-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_DOWN>;
+=09};
+
+=09aud_codec_mclk_idle: aud-codec-mclk-idle-pins {
+=09=09samsung,pins =3D "gpb0-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_INPUT>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_DOWN>;
+=09};
+
+=09aud_i2s0_bus: aud-i2s0-bus-pins {
+=09=09samsung,pins =3D "gpb0-1", "gpb0-2", "gpb0-3", "gpb0-4";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_DOWN>;
+=09};
+
+=09aud_i2s0_idle: aud-i2s0-idle-pins {
+=09=09samsung,pins =3D "gpb0-1", "gpb0-2", "gpb0-3", "gpb0-4";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_INPUT>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_DOWN>;
+=09};
+
+=09aud_i2s1_bus: aud-i2s1-bus-pins {
+=09=09samsung,pins =3D "gpb1-0", "gpb1-1", "gpb1-2", "gpb1-3";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_DOWN>;
+=09};
+
+=09aud_i2s1_idle: aud-i2s1-idle-pins {
+=09=09samsung,pins =3D "gpb1-0", "gpb1-1", "gpb1-2", "gpb1-3";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_INPUT>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_DOWN>;
+=09};
+
+=09aud_i2s2_bus: aud-i2s2-bus-pins {
+=09=09samsung,pins =3D "gpb2-0", "gpb2-1", "gpb2-2", "gpb2-3";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_DOWN>;
+=09};
+
+=09aud_i2s2_idle: aud-i2s2-idle-pins {
+=09=09samsung,pins =3D "gpb2-0", "gpb2-1", "gpb2-2", "gpb2-3";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_INPUT>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_DOWN>;
+=09};
+
+=09aud_dsd_bus: aud-dsd-bus-pins {
+=09=09samsung,pins =3D "gpb2-0", "gpb2-1", "gpb2-2";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_3>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_DOWN>;
+=09};
+
+=09aud_dsd_idle: aud-dsd-idle-pins {
+=09=09samsung,pins =3D "gpb2-0", "gpb2-1", "gpb2-2";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_INPUT>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_DOWN>;
+=09};
+
+=09aud_fm_bus: aud-fm-bus-pins {
+=09=09samsung,pins =3D "gpb2-4";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_DOWN>;
+=09};
+
+=09aud_fm_idle: aud-fm-idle-pins {
+=09=09samsung,pins =3D "gpb2-4";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_INPUT>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_DOWN>;
+=09};
+};
+
+&pinctrl_fsys {
+=09gpf0: gpf0-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+=09};
+
+=09gpf1: gpf1-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+=09};
+
+=09gpf2: gpf2-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+=09};
+
+=09ufs_rst_n: ufs-rst-n-pins {
+=09=09samsung,pins =3D "gpf0-1";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_3>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-con-pdn =3D <EXYNOS_PIN_PDN_PREV>;
+=09};
+
+=09ufs_refclk_out: ufs-refclk-out-pins {
+=09=09samsung,pins =3D "gpf0-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_3>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-con-pdn =3D <EXYNOS_PIN_PDN_PREV>;
+=09};
+
+=09sd0_clk: sd0-clk-pins {
+=09=09samsung,pins =3D "gpf0-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung.pin-drv =3D <EXYNOS850_HSI_PIN_DRV_LV2_5>;
+=09};
+
+=09sd0_cmd: sd0-cmd-pins {
+=09=09samsung,pins =3D "gpf0-1";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung.pin-pud =3D <EXYNOS_PIN_PULL_UP>;
+=09=09samsung.pin-drv =3D <EXYNOS850_HSI_PIN_DRV_LV2_5>;
+=09};
+
+=09sd0_rdqs: sd0-rdqs-pins {
+=09=09samsung,pins =3D "gpf0-2";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung.pin-pud =3D <EXYNOS_PIN_PULL_DOWN>;
+=09=09samsung.pin-drv =3D <EXYNOS850_HSI_PIN_DRV_LV2_5>;
+=09};
+
+=09sd0_clk_fast_slew_rate_1x: sd0-clk-fast-slew-rate-1x-pins {
+=09=09samsung,pins =3D "gpf0-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung.pin-drv =3D <EXYNOS850_HSI_PIN_DRV_LV1>;
+=09};
+
+=09sd0_clk_fast_slew_rate_1_5x: sd0-clk-fast-slew-rate-1-5x-pins {
+=09=09samsung,pins =3D "gpf0-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung.pin-drv =3D <EXYNOS850_HSI_PIN_DRV_LV1_5>;
+=09};
+
+=09sd0_clk_fast_slew_rate_2x: sd0-clk-fast-slew-rate-2x-pins {
+=09=09samsung,pins =3D "gpf0-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung.pin-drv =3D <EXYNOS850_HSI_PIN_DRV_LV2>;
+=09};
+
+=09sd0_clk_fast_slew_rate_2_5x: sd0-clk-fast-slew-rate-2-5x-pins {
+=09=09samsung,pins =3D "gpf0-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung.pin-drv =3D <EXYNOS850_HSI_PIN_DRV_LV2_5>;
+=09};
+
+=09sd0_clk_fast_slew_rate_3x: sd0-clk-fast-slew-rate-3x-pins {
+=09=09samsung,pins =3D "gpf0-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung.pin-drv =3D <EXYNOS850_HSI_PIN_DRV_LV3>;
+=09};
+
+=09sd0_clk_fast_slew_rate_4x: sd0-clk-fast-slew-rate-4x-pins {
+=09=09samsung,pins =3D "gpf0-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung.pin-drv =3D <EXYNOS850_HSI_PIN_DRV_LV4>;
+=09};
+
+=09sd0_bus1: sd0-bus-width1-pins {
+=09=09samsung,pins =3D "gpf1-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung.pin-pud =3D <EXYNOS_PIN_PULL_UP>;
+=09=09samsung.pin-drv =3D <EXYNOS850_HSI_PIN_DRV_LV2_5>;
+=09};
+
+=09sd0_bus4: sd0-bus-width4-pins {
+=09=09samsung,pins =3D "gpf1-1", "gpf1-2", "gpf1-3";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung.pin-pud =3D <EXYNOS_PIN_PULL_UP>;
+=09=09samsung.pin-drv =3D <EXYNOS850_HSI_PIN_DRV_LV2_5>;
+=09};
+
+=09sd0_bus8: sd0-bus-width8-pins {
+=09=09samsung,pins =3D "gpf1-4", "gpf1-5", "gpf1-6", "gpf1-7";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung.pin-pud =3D <EXYNOS_PIN_PULL_UP>;
+=09=09samsung.pin-drv =3D <EXYNOS850_HSI_PIN_DRV_LV2_5>;
+=09};
+
+=09sd2_clk: sd2-clk-pins {
+=09=09samsung,pins =3D "gpf2-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung.pin-drv =3D <EXYNOS850_HSI_PIN_DRV_LV3>;
+=09};
+
+=09sd2_cmd: sd2-cmd-pins {
+=09=09samsung,pins =3D "gpf2-1";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung.pin-pud =3D <EXYNOS_PIN_PULL_UP>;
+=09=09samsung.pin-drv =3D <EXYNOS850_HSI_PIN_DRV_LV3>;
+=09};
+
+=09sd2_bus1: sd2-bus-width1-pins {
+=09=09samsung,pins =3D "gpf2-2";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung.pin-pud =3D <EXYNOS_PIN_PULL_UP>;
+=09=09samsung.pin-drv =3D <EXYNOS850_HSI_PIN_DRV_LV3>;
+=09};
+
+=09sd2_bus4: sd2-bus-width4-pins {
+=09=09samsung,pins =3D "gpf2-3", "gpf2-4", "gpf2-5";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung.pin-pud =3D <EXYNOS_PIN_PULL_UP>;
+=09=09samsung.pin-drv =3D <EXYNOS850_HSI_PIN_DRV_LV3>;
+=09};
+
+=09sd2_clk_fast_slew_rate_1x: sd2-clk-fast-slew-rate-1x-pins {
+=09=09samsung,pins =3D "gpf2-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung.pin-drv =3D <EXYNOS850_HSI_PIN_DRV_LV1>;
+=09};
+
+=09sd2_clk_fast_slew_rate_2x: sd2-clk-fast-slew-rate-2x-pins {
+=09=09samsung,pins =3D "gpf2-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung.pin-drv =3D <EXYNOS850_HSI_PIN_DRV_LV2>;
+=09};
+
+=09sd2_clk_fast_slew_rate_3x: sd2-clk-fast-slew-rate-3x-pins {
+=09=09samsung,pins =3D "gpf2-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung.pin-drv =3D <EXYNOS850_HSI_PIN_DRV_LV3>;
+=09};
+
+=09sd2_clk_fast_slew_rate_4x: sd2-clk-fast-slew-rate-4x-pins {
+=09=09samsung,pins =3D "gpf2-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS_PIN_FUNC_6>;
+=09};
+};
+
+&pinctrl_top {
+=09gpp0: gpp0-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+=09};
+
+=09gpp1: gpp1-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+=09};
+
+=09gpp2: gpp2-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+=09};
+
+=09gpc0: gpc0-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+=09};
+
+=09gpc1: gpc1-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+=09};
+
+=09gpc2: gpc2-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+=09};
+
+=09gpg0: gpg0-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+=09};
+
+=09gpg1: gpg1-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+=09};
+
+=09gpg2: gpg2-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+=09};
+
+=09gpg3: gpg3-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+=09};
+
+=09gpg4: gpg4-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+=09};
+
+=09decon_f_te_on: decon-f-te-on-pins {
+=09=09samsung,pins =3D "gpc2-3";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_F>;
+=09};
+
+=09decon_f_te_off: decon-f-te-off-pins {
+=09=09samsung,pins =3D "gpc2-3";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_INPUT>;
+=09};
+
+=09hsi2c12_bus: hsi2c12-bus-pins {
+=09=09samsung,pins =3D "gpc0-0", "gpc0-1";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung.pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09hsi2c13_bus: hsi2c13-bus-pins {
+=09=09samsung,pins =3D "gpc0-2", "gpc0-3";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung.pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09hsi2c14_bus: hsi2c14-bus-pins {
+=09=09samsung,pins =3D "gpc0-4", "gpc0-5";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung.pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09hsi2c15_bus: hsi2c15-bus-pins {
+=09=09samsung,pins =3D "gpc0-6", "gpc0-7";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung.pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09hsi2c16_bus: hsi2c16-bus-pins {
+=09=09samsung,pins =3D "gpc1-0", "gpc1-1";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung.pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09hsi2c17_bus: hsi2c17-bus-pins {
+=09=09samsung,pins =3D "gpc1-2", "gpc1-3";
+=09=09samsung,pin-function =3D <3>;
+=09=09samsung.pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09i2c0_bus: i2c0-bus-pins {
+=09=09samsung,pins =3D "gpp0-1", "gpp0-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung.pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09i2c1_bus: i2c1-bus-pins {
+=09=09samsung,pins =3D "gpp0-3", "gpp0-2";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung.pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09i2c2_bus: i2c2-bus-pins {
+=09=09samsung,pins =3D "gpp0-5", "gpp0-4";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung.pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09i2c3_bus: i2c3-bus-pins {
+=09=09samsung,pins =3D "gpp0-7", "gpp0-6";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung.pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09i2c4_bus: i2c4-bus-pins {
+=09=09samsung,pins =3D "gpp1-1", "gpp1-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung.pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09i2c5_bus: i2c5-bus-pins {
+=09=09samsung,pins =3D "gpp1-3", "gpp1-2";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung.pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09i2c6_bus: i2c6-bus-pins {
+=09=09samsung,pins =3D "gpp1-5", "gpp1-4";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung.pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09spi6_bus: spi6-bus-pins {
+=09=09samsung,pins =3D "gpp2-0", "gpp2-1", "gpp2-2";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung.pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09spi6_cs: spi6-cs-pins {
+=09=09samsung,pins =3D "gpp2-3";
+=09=09samsung,pin-function =3D <1>;
+=09=09samsung.pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09spi6_cs_func: spi6-cs-func-pins {
+=09=09samsung,pins =3D "gpp2-3";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung.pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09spi7_bus: spi7-bus-pins {
+=09=09samsung,pins =3D "gpp2-4", "gpp2-5", "gpp2-6";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung.pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09spi7_cs: spi7-cs-pins {
+=09=09samsung,pins =3D "gpp2-7";
+=09=09samsung,pin-function =3D <1>;
+=09=09samsung.pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09spi7_cs_func: spi7-cs-func-pins {
+=09=09samsung,pins =3D "gpp2-7";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung.pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09spi8_bus: spi8-bus-pins {
+=09=09samsung,pins =3D "gpc1-0", "gpc1-1", "gpc1-2";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung.pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09spi8_cs: spi8-cs-pins {
+=09=09samsung,pins =3D "gpc1-3";
+=09=09samsung,pin-function =3D <1>;
+=09=09samsung.pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09spi8_cs_func: spi8-cs-func-pins {
+=09=09samsung,pins =3D "gpc1-3";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung.pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09spi9_bus: spi9-bus-pins {
+=09=09samsung,pins =3D "gpc1-4", "gpc1-5", "gpc1-6";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung.pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09spi9_cs: spi9-cs-pins {
+=09=09samsung,pins =3D "gpc1-7";
+=09=09samsung,pin-function =3D <1>;
+=09=09samsung.pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09spi9_cs_func: spi9-cs-func-pins {
+=09=09samsung,pins =3D "gpc1-7";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung.pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09uart7_bus_single: uart7-bus-pins {
+=09=09samsung,pins =3D "gpc1-0", "gpc1-1", "gpc1-2", "gpc1-3";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung.pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09};
+};
+
+&pinctrl_shub {
+=09gph0: gph0-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+=09};
+
+=09gph1: gph1-gpio-bank {
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+=09};
+
+=09hsi2c0_bus: hsi2c0-bus-pins {
+=09=09samsung,pins =3D "gph0-0", "gph0-1";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09hsi2c1_bus: hsi2c1-bus-pins {
+=09=09samsung,pins =3D "gph0-2", "gph0-3";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_3>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09spi0_bus: spi0-bus-pins {
+=09=09samsung,pins =3D "gph0-2", "gph0-1", "gph0-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09spi0_cs: spi0-cs-pins {
+=09=09samsung,pins =3D "gph0-3";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_OUTPUT>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09spi0_cs_func: spi0-cs-func-pins {
+=09=09samsung,pins =3D "gph0-3";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09uart1_bus_single: uart1-bus-pins {
+=09=09samsung,pins =3D "gph0-3", "gph0-2", "gph0-1", "gph0-0";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09};
+};
diff --git a/arch/arm64/boot/dts/exynos/exynos9610.dtsi b/arch/arm64/boot/d=
ts/exynos/exynos9610.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..852f7111e5cdfd82b5afc350792=
e8b539fe87d39
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos9610.dtsi
@@ -0,0 +1,263 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Samsung Exynos9610 common device tree
+ *
+ * Copyright (c) 2025, Alexandru Chimac <alexchimac@protonmail.com>
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+=09compatible =3D "samsung,exynos9610";
+=09#address-cells =3D <2>;
+=09#size-cells =3D <1>;
+
+=09interrupt-parent =3D <&gic>;
+
+=09aliases {
+=09=09pinctrl0 =3D &pinctrl_alive;
+=09=09pinctrl1 =3D &pinctrl_cmgp;
+=09=09pinctrl2 =3D &pinctrl_dispaud;
+=09=09pinctrl3 =3D &pinctrl_fsys;
+=09=09pinctrl4 =3D &pinctrl_top;
+=09=09pinctrl5 =3D &pinctrl_shub;
+=09};
+
+=09cpus {
+=09=09#address-cells =3D <1>;
+=09=09#size-cells =3D <0>;
+
+=09=09cpu-map {
+=09=09=09cluster0 {
+=09=09=09=09core0 {
+=09=09=09=09=09cpu =3D <&cpu0>;
+=09=09=09=09};
+
+=09=09=09=09core1 {
+=09=09=09=09=09cpu =3D <&cpu1>;
+=09=09=09=09};
+
+=09=09=09=09core2 {
+=09=09=09=09=09cpu =3D <&cpu2>;
+=09=09=09=09};
+
+=09=09=09=09core3 {
+=09=09=09=09=09cpu =3D <&cpu3>;
+=09=09=09=09};
+=09=09=09};
+
+=09=09=09cluster1 {
+=09=09=09=09core0 {
+=09=09=09=09=09cpu =3D <&cpu100>;
+=09=09=09=09};
+
+=09=09=09=09core1 {
+=09=09=09=09=09cpu =3D <&cpu101>;
+=09=09=09=09};
+
+=09=09=09=09core2 {
+=09=09=09=09=09cpu =3D <&cpu102>;
+=09=09=09=09};
+
+=09=09=09=09core3 {
+=09=09=09=09=09cpu =3D <&cpu103>;
+=09=09=09=09};
+=09=09=09};
+=09=09};
+
+=09=09cpu0: cpu@0 {
+=09=09=09device_type =3D "cpu";
+=09=09=09compatible =3D "arm,cortex-a53";
+=09=09=09reg =3D <0x0>;
+=09=09=09enable-method =3D "psci";
+=09=09};
+
+=09=09cpu1: cpu@1 {
+=09=09=09device_type =3D "cpu";
+=09=09=09compatible =3D "arm,cortex-a53";
+=09=09=09reg =3D <0x1>;
+=09=09=09enable-method =3D "psci";
+=09=09};
+
+=09=09cpu2: cpu@2 {
+=09=09=09device_type =3D "cpu";
+=09=09=09compatible =3D "arm,cortex-a53";
+=09=09=09reg =3D <0x2>;
+=09=09=09enable-method =3D "psci";
+=09=09};
+
+=09=09cpu3: cpu@3 {
+=09=09=09device_type =3D "cpu";
+=09=09=09compatible =3D "arm,cortex-a53";
+=09=09=09reg =3D <0x3>;
+=09=09=09enable-method =3D "psci";
+=09=09};
+
+=09=09cpu100: cpu@100 {
+=09=09=09device_type =3D "cpu";
+=09=09=09compatible =3D "arm,cortex-a73";
+=09=09=09reg =3D <0x100>;
+=09=09=09enable-method =3D "psci";
+=09=09};
+
+=09=09cpu101: cpu@101 {
+=09=09=09device_type =3D "cpu";
+=09=09=09compatible =3D "arm,cortex-a73";
+=09=09=09reg =3D <0x101>;
+=09=09=09enable-method =3D "psci";
+=09=09};
+
+=09=09cpu102: cpu@102 {
+=09=09=09device_type =3D "cpu";
+=09=09=09compatible =3D "arm,cortex-a73";
+=09=09=09reg =3D <0x102>;
+=09=09=09enable-method =3D "psci";
+=09=09};
+
+=09=09cpu103: cpu@103 {
+=09=09=09device_type =3D "cpu";
+=09=09=09compatible =3D "arm,cortex-a73";
+=09=09=09reg =3D <0x103>;
+=09=09=09enable-method =3D "psci";
+=09=09};
+=09};
+
+=09psci {
+=09=09compatible =3D "arm,psci";
+=09=09method =3D "smc";
+=09=09cpu_suspend =3D <0xc4000001>;
+=09=09cpu_off =3D <0x84000002>;
+=09=09cpu_on =3D <0xc4000003>;
+=09};
+
+=09arm-a53-pmu {
+=09=09compatible =3D "arm,cortex-a53-pmu";
+=09=09interrupts =3D <0 82 4>,
+=09=09=09     <0 83 4>,
+=09=09=09     <0 84 4>,
+=09=09=09     <0 85 4>;
+=09=09interrupt-affinity =3D <&cpu0>,
+=09=09=09=09     <&cpu1>,
+=09=09=09=09     <&cpu2>,
+=09=09=09=09     <&cpu3>;
+=09};
+
+=09arm-a73-pmu {
+=09=09compatible =3D "arm,cortex-a73-pmu";
+=09=09interrupts =3D <0 96 4>,
+=09=09=09     <0 97 4>,
+=09=09=09     <0 98 4>,
+=09=09=09     <0 99 4>;
+=09=09interrupt-affinity =3D <&cpu100>,
+=09=09=09=09     <&cpu101>,
+=09=09=09=09     <&cpu102>,
+=09=09=09=09     <&cpu103>;
+=09};
+
+=09oscclk: clock-osc {
+=09=09compatible =3D "fixed-clock";
+=09=09#clock-cells =3D <0>;
+=09=09clock-output-names =3D "oscclk";
+=09=09clock-frequency =3D <26000000>;
+=09};
+
+=09soc: soc@0 {
+=09=09compatible =3D "simple-bus";
+=09=09ranges =3D <0x0 0x0 0x0 0x20000000>;
+
+=09=09#address-cells =3D <1>;
+=09=09#size-cells =3D <1>;
+
+=09=09chipid@10000000 {
+=09=09=09compatible =3D "samsung,exynos9610-chipid",
+=09=09=09=09     "samsung,exynos850-chipid";
+=09=09=09reg =3D <0x10000000 0x100>;
+=09=09};
+
+=09=09pinctrl_shub: pinctrl@11080000 {
+=09=09=09compatible =3D "samsung,exynos9610-pinctrl";
+=09=09=09reg =3D <0x11080000 0x1000>;
+=09=09=09interrupts =3D <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
+=09=09};
+
+=09=09pinctrl_alive: pinctrl@11850000 {
+=09=09=09compatible =3D "samsung,exynos9610-pinctrl";
+=09=09=09reg =3D <0x11850000 0x1000>;
+
+=09=09=09wakeup-interrupt-controller {
+=09=09=09=09compatible =3D "samsung,exynos9610-wakeup-eint",
+=09=09=09=09=09     "samsung,exynos850-wakeup-eint",
+=09=09=09=09=09     "samsung,exynos7-wakeup-eint";
+=09=09=09};
+=09=09};
+
+=09=09pinctrl_cmgp: pinctrl@11c20000 {
+=09=09=09compatible =3D "samsung,exynos9610-pinctrl";
+=09=09=09reg =3D <0x11c20000 0x1000>;
+=09=09};
+
+=09=09gic: interrupt-controller@12300000 {
+=09=09=09compatible =3D "arm,gic-400";
+=09=09=09#interrupt-cells =3D <3>;
+=09=09=09#address-cells =3D <0>;
+=09=09=09interrupt-controller;
+=09=09=09reg =3D <0x12301000 0x1000>,
+=09=09=09      <0x12302000 0x1000>,
+=09=09=09      <0x12304000 0x2000>,
+=09=09=09      <0x12306000 0x2000>;
+=09=09=09interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) |
+=09=09=09=09=09=09 IRQ_TYPE_LEVEL_HIGH)>;
+=09=09};
+
+=09=09pinctrl_fsys: pinctrl@13490000 {
+=09=09=09compatible =3D "samsung,exynos9610-pinctrl";
+=09=09=09reg =3D <0x13490000 0x1000>;
+=09=09=09interrupts =3D <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
+=09=09};
+
+=09=09pinctrl_top: pinctrl@139b0000 {
+=09=09=09compatible =3D "samsung,exynos9610-pinctrl";
+=09=09=09reg =3D <0x139b0000 0x1000>;
+=09=09=09interrupts =3D <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
+=09=09};
+
+=09=09pinctrl_dispaud: pinctrl@14a60000 {
+=09=09=09compatible =3D "samsung,exynos9610-pinctrl";
+=09=09=09reg =3D <0x14a60000 0x1000>;
+=09=09};
+=09};
+
+=09timer {
+=09=09compatible =3D "arm,armv8-timer";
+=09=09interrupts =3D <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_=
LOW)>,
+=09=09=09     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+=09=09=09     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+=09=09=09     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+
+=09=09/* Stock Samsung bootloader doesn't configure CNTFRQ_EL0 */
+=09=09clock-frequency =3D <26000000>;
+=09};
+
+=09reserved-memory {
+=09=09#address-cells =3D <2>;
+=09=09#size-cells =3D <1>;
+=09=09ranges;
+
+=09=09abox_rmem: abox@e9400000 {
+=09=09=09compatible =3D "reserved-memory";
+=09=09=09reg =3D <0x0 0xe9400000 0x2800000>;
+=09=09=09no-map;
+=09=09};
+
+=09=09ramoops@f9d10000 {
+=09=09=09compatible =3D "ramoops";
+=09=09=09reg =3D <0x0 0xf9d10000 0x200000>;
+=09=09=09record-size =3D <0x80000>;
+=09=09=09console-size =3D <0x80000>;
+=09=09=09ftrace-size =3D <0x80000>;
+=09=09=09pmsg-size =3D <0x80000>;
+=09=09};
+=09};
+};
+
+#include "exynos9610-pinctrl.dtsi"

--=20
2.47.3


