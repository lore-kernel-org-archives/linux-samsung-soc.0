Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356A62E717C;
	Sun, 14 Sep 2025 21:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757884809; cv=none; b=toQzo2KvOLA+BFJcsD1D8D8h/ueE0FMoq2WMSR3xUe1/+NsViOtUSz0v614HlmsZZSaLCsZeF3l2lLS5wzY+aAJ6N9RXC8f7dORnazSvpclByjpCk7qjNN459hMchd/nPNl7TRiTbHj19nOQt9fu2rtABTvlT3+KahVqWs7eLVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757884809; c=relaxed/simple;
	bh=9xBHetlyUrobi2XPbkzo7wzDxeEYes8wkO71U/Sqz5A=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WyrXMepzl9w5E8qEkZdoebK9VENPCw7JOx761v0x487peK4RTgWqe5pqt45wtXLmNQnV24nGemIUt0GUciUameWLu/GrJg6hMoYailcAv8gbEMAW58V/lQs4PXLjUJB5jmlrhQc1EEjgV5mg8Wm1BsqBZKIZ5Avur/qgV3NDPg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro; spf=pass smtp.mailfrom=chimac.ro; dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b=JYM8vV2C; arc=none smtp.client-ip=185.70.43.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chimac.ro
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b="JYM8vV2C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail; t=1757884803; x=1758144003;
	bh=1EaguFJG3EwdqxLOzj/lIvUP3qDQ9JAhvQikWa36Nr4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=JYM8vV2CWrCgcOVDN9MlGimqWOPYRDl2Djc71AzdipWFvhEDiol+wcdZXOFixjH2Q
	 FCuCQ5pu7kmRGLub+CCINydStERdi8P/lcThKD1uz2D60cLDssdQM8gvtZXEq5bSkS
	 +klNWGAjaKUBZqlEODvRnkbC2ov+Fp7lZkrB7awlPwszKk7eufADz4FYJofXMHxK6r
	 8IVg17Cia2qyV1AEQiwY8F9ngetrZQYjAAl43leOQK0ubYiS9pWQ+l/5MiD6M8zVuL
	 PhTFyIKZ79ELi1OzYqSzvfM3scNcSsEjjvaOa3l1pQGjN1Ki+hFtZE2rJP8ujEgsGT
	 JvPFvV1B10Egg==
Date: Sun, 14 Sep 2025 21:19:57 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alexandru Chimac <alexchimac@protonmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
From: Alexandru Chimac <alex@chimac.ro>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Alexandru Chimac <alex@chimac.ro>
Subject: [PATCH 4/8] arm64: dts: exynos9610: Enable clock support
Message-ID: <20250915-exynos9610-clocks-v1-4-3f615022b178@chimac.ro>
In-Reply-To: <20250915-exynos9610-clocks-v1-0-3f615022b178@chimac.ro>
References: <20250915-exynos9610-clocks-v1-0-3f615022b178@chimac.ro>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: 5451127c6ce1cf9b66b10cf80d71c9691606530d
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add CMU (Clock Management Unit) nodes and required
fixed clocks.

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
 arch/arm64/boot/dts/exynos/exynos9610-gta4xl.dts |   1 +
 arch/arm64/boot/dts/exynos/exynos9610.dtsi       | 205 +++++++++++++++++++=
++++
 2 files changed, 206 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos9610-gta4xl.dts b/arch/arm64/=
boot/dts/exynos/exynos9610-gta4xl.dts
index f455af22ff872c6f07b9bcfc68b1ae1f45d0def3..1a09d5e8ebaa130e9cd0b7f3266=
ee2c9dac4cf9a 100644
--- a/arch/arm64/boot/dts/exynos/exynos9610-gta4xl.dts
+++ b/arch/arm64/boot/dts/exynos/exynos9610-gta4xl.dts
@@ -10,6 +10,7 @@
 #include "exynos9610.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/clock/samsung,exynos9610.h>
=20
 / {
 =09compatible =3D "samsung,gta4xl", "samsung,exynos9610";
diff --git a/arch/arm64/boot/dts/exynos/exynos9610.dtsi b/arch/arm64/boot/d=
ts/exynos/exynos9610.dtsi
index 852f7111e5cdfd82b5afc350792e8b539fe87d39..2a15986c459d6af9f83362c27cd=
cc3a2646c256b 100644
--- a/arch/arm64/boot/dts/exynos/exynos9610.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos9610.dtsi
@@ -6,6 +6,7 @@
  */
=20
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/samsung,exynos9610.h>
=20
 / {
 =09compatible =3D "samsung,exynos9610";
@@ -161,6 +162,41 @@ oscclk: clock-osc {
 =09=09clock-frequency =3D <26000000>;
 =09};
=20
+=09dll_dco: clock-dll-dco {
+=09=09compatible =3D "fixed-clock";
+=09=09#clock-cells =3D <0>;
+=09=09clock-output-names =3D "dll_dco";
+=09=09clock-frequency =3D <360000000>;
+=09};
+
+=09oscclk_rco_cmgp: clock-osc-rco {
+=09=09compatible =3D "fixed-clock";
+=09=09#clock-cells =3D <0>;
+=09=09clock-output-names =3D "oscclk_rco";
+=09=09clock-frequency =3D <30000000>;
+=09};
+
+=09ioclk_audiocdclk0: clock-audiocdclk0 {
+=09=09compatible =3D "fixed-clock";
+=09=09#clock-cells =3D <0>;
+=09=09clock-output-names =3D "ioclk_audiocdclk0";
+=09=09clock-frequency =3D <10000000>;
+=09};
+
+=09ioclk_audiocdclk1: clock-audiocdclk1 {
+=09=09compatible =3D "fixed-clock";
+=09=09#clock-cells =3D <0>;
+=09=09clock-output-names =3D "ioclk_audiocdclk1";
+=09=09clock-frequency =3D <100000000>;
+=09};
+
+=09tick_usb: clock-tick-usb {
+=09=09compatible =3D "fixed-clock";
+=09=09#clock-cells =3D <0>;
+=09=09clock-output-names =3D "tick_usb";
+=09=09clock-frequency =3D <60000000>;
+=09};
+
 =09soc: soc@0 {
 =09=09compatible =3D "simple-bus";
 =09=09ranges =3D <0x0 0x0 0x0 0x20000000>;
@@ -174,12 +210,81 @@ chipid@10000000 {
 =09=09=09reg =3D <0x10000000 0x100>;
 =09=09};
=20
+=09=09cmu_peri: clock-controller@10030000 {
+=09=09=09compatible =3D "samsung,exynos9610-cmu-peri";
+=09=09=09reg =3D <0x10030000 0x8000>;
+=09=09=09#clock-cells =3D <1>;
+
+=09=09=09clocks =3D <&oscclk>,
+=09=09=09=09 <&cmu_top CLK_DOUT_CMU_PERI_BUS>,
+=09=09=09=09 <&cmu_top CLK_DOUT_CMU_PERI_IP>,
+=09=09=09=09 <&cmu_top CLK_DOUT_CMU_PERI_UART>;
+=09=09=09clock-names =3D "oscclk",
+=09=09=09=09      "dout_cmu_peri_bus",
+=09=09=09=09      "dout_cmu_peri_ip",
+=09=09=09=09      "dout_cmu_peri_uart";
+=09=09};
+
+=09=09cmu_cpucl1: clock-controller@0x10800000 {
+=09=09=09compatible =3D "samsung,exynos9610-cmu-cpucl1";
+=09=09=09reg =3D <0x10800000 0x8000>;
+=09=09=09#clock-cells =3D <1>;
+
+=09=09=09clocks =3D <&oscclk>,
+=09=09=09=09 <&cmu_top CLK_DOUT_CMU_CPUCL1_SWITCH>,
+=09=09=09=09 <&cmu_top CLK_DOUT_CMU_HPM>;
+=09=09=09clock-names =3D "oscclk",
+=09=09=09=09      "dout_cmu_cpucl1_switch",
+=09=09=09=09      "dout_cmu_hpm";
+=09=09};
+
+=09=09cmu_cpucl0: clock-controller@0x10900000 {
+=09=09=09compatible =3D "samsung,exynos9610-cmu-cpucl0";
+=09=09=09reg =3D <0x10900000 0x8000>;
+=09=09=09#clock-cells =3D <1>;
+
+=09=09=09clocks =3D <&oscclk>,
+=09=09=09=09 <&cmu_top CLK_DOUT_CMU_CPUCL0_DBG>,
+=09=09=09=09 <&cmu_top CLK_DOUT_CMU_CPUCL0_SWITCH>,
+=09=09=09=09 <&cmu_top CLK_DOUT_CMU_HPM>;
+=09=09=09clock-names =3D "oscclk",
+=09=09=09=09      "dout_cmu_cpucl0_dbg",
+=09=09=09=09      "dout_cmu_cpucl0_switch",
+=09=09=09=09      "dout_cmu_hpm";
+=09=09};
+
 =09=09pinctrl_shub: pinctrl@11080000 {
 =09=09=09compatible =3D "samsung,exynos9610-pinctrl";
 =09=09=09reg =3D <0x11080000 0x1000>;
 =09=09=09interrupts =3D <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
 =09=09};
=20
+=09=09cmu_g3d: clock-controller@11430000 {
+=09=09=09compatible =3D "samsung,exynos9610-cmu-g3d";
+=09=09=09reg =3D <0x11430000 0x8000>;
+=09=09=09#clock-cells =3D <1>;
+
+=09=09=09clocks =3D <&oscclk>,
+=09=09=09=09 <&cmu_top CLK_DOUT_CMU_G3D_SWITCH>,
+=09=09=09=09 <&cmu_top CLK_DOUT_CMU_HPM>;
+=09=09=09clock-names =3D "oscclk",
+=09=09=09=09      "dout_cmu_g3d_switch",
+=09=09=09=09      "dout_cmu_hpm";
+=09=09};
+
+=09=09cmu_apm: clock-controller@11800000 {
+=09=09=09compatible =3D "samsung,exynos9610-cmu-apm";
+=09=09=09reg =3D <0x11800000 0x8000>;
+=09=09=09#clock-cells =3D <1>;
+
+=09=09=09clocks =3D <&oscclk>,
+=09=09=09=09 <&dll_dco>,
+=09=09=09=09 <&cmu_top CLK_DOUT_CMU_APM_BUS>;
+=09=09=09clock-names =3D "oscclk",
+=09=09=09=09      "dll_dco",
+=09=09=09=09      "dout_cmu_apm_bus";
+=09=09};
+
 =09=09pinctrl_alive: pinctrl@11850000 {
 =09=09=09compatible =3D "samsung,exynos9610-pinctrl";
 =09=09=09reg =3D <0x11850000 0x1000>;
@@ -191,11 +296,48 @@ wakeup-interrupt-controller {
 =09=09=09};
 =09=09};
=20
+=09=09cmu_cmgp: clock-controller@11c00000 {
+=09=09=09compatible =3D "samsung,exynos9610-cmu-cmgp";
+=09=09=09reg =3D <0x11c00000 0x8000>;
+=09=09=09#clock-cells =3D <1>;
+
+=09=09=09clocks =3D <&oscclk>,
+=09=09=09=09 <&oscclk_rco_cmgp>,
+=09=09=09=09 <&cmu_apm CLK_GOUT_CMU_CMGP_BUS>;
+=09=09=09clock-names =3D "oscclk",
+=09=09=09=09      "oscclk_rco",
+=09=09=09=09      "gout_cmu_cmgp_bus";
+=09=09};
+
 =09=09pinctrl_cmgp: pinctrl@11c20000 {
 =09=09=09compatible =3D "samsung,exynos9610-pinctrl";
 =09=09=09reg =3D <0x11c20000 0x1000>;
 =09=09};
=20
+=09=09cmu_core: clock-controller@120f0000 {
+=09=09=09compatible =3D "samsung,exynos9610-cmu-core";
+=09=09=09reg =3D <0x120f0000 0x8000>;
+=09=09=09#clock-cells =3D <1>;
+
+=09=09=09clocks =3D <&oscclk>,
+=09=09=09=09 <&cmu_top CLK_DOUT_CMU_CORE_BUS>,
+=09=09=09=09 <&cmu_top CLK_DOUT_CMU_CORE_CCI>,
+=09=09=09=09 <&cmu_top CLK_DOUT_CMU_CORE_G3D>;
+=09=09=09clock-names =3D "oscclk",
+=09=09=09=09      "dout_cmu_core_bus",
+=09=09=09=09      "dout_cmu_core_cci",
+=09=09=09=09      "dout_cmu_core_g3d";
+=09=09};
+
+=09=09cmu_top: clock-controller@12100000 {
+=09=09=09compatible =3D "samsung,exynos9610-cmu-top";
+=09=09=09reg =3D <0x12100000 0x8000>;
+=09=09=09#clock-cells =3D <1>;
+
+=09=09=09clocks =3D <&oscclk>;
+=09=09=09clock-names =3D "oscclk";
+=09=09};
+
 =09=09gic: interrupt-controller@12300000 {
 =09=09=09compatible =3D "arm,gic-400";
 =09=09=09#interrupt-cells =3D <3>;
@@ -209,6 +351,37 @@ gic: interrupt-controller@12300000 {
 =09=09=09=09=09=09 IRQ_TYPE_LEVEL_HIGH)>;
 =09=09};
=20
+=09=09cmu_g2d: clock-controller@12e00000 {
+=09=09=09compatible =3D "samsung,exynos9610-cmu-g2d";
+=09=09=09reg =3D <0x12e00000 0x8000>;
+=09=09=09#clock-cells =3D <1>;
+
+=09=09=09clocks =3D <&oscclk>,
+=09=09=09=09 <&cmu_top CLK_DOUT_CMU_G2D_G2D>,
+=09=09=09=09 <&cmu_top CLK_DOUT_CMU_G2D_MSCL>;
+
+=09=09=09clock-names =3D "oscclk",
+=09=09=09=09      "dout_cmu_g2d_g2d",
+=09=09=09=09      "dout_cmu_g2d_mscl";
+=09=09};
+
+=09=09cmu_fsys: clock-controller@13400000 {
+=09=09=09compatible =3D "samsung,exynos9610-cmu-fsys";
+=09=09=09reg =3D <0x13400000 0x8000>;
+=09=09=09#clock-cells =3D <1>;
+
+=09=09=09clocks =3D <&oscclk>,
+=09=09=09=09 <&cmu_top CLK_DOUT_CMU_FSYS_BUS>,
+=09=09=09=09 <&cmu_top CLK_DOUT_CMU_FSYS_MMC_CARD>,
+=09=09=09=09 <&cmu_top CLK_DOUT_CMU_FSYS_MMC_EMBD>,
+=09=09=09=09 <&cmu_top CLK_DOUT_CMU_FSYS_UFS_EMBD>;
+=09=09=09clock-names =3D "oscclk",
+=09=09=09=09      "dout_cmu_fsys_bus",
+=09=09=09=09      "dout_cmu_fsys_mmc_card",
+=09=09=09=09      "dout_cmu_fsys_mmc_embd",
+=09=09=09=09      "dout_cmu_fsys_ufs_embd";
+=09=09};
+
 =09=09pinctrl_fsys: pinctrl@13490000 {
 =09=09=09compatible =3D "samsung,exynos9610-pinctrl";
 =09=09=09reg =3D <0x13490000 0x1000>;
@@ -221,6 +394,38 @@ pinctrl_top: pinctrl@139b0000 {
 =09=09=09interrupts =3D <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
 =09=09};
=20
+=09=09cmu_cam: clock-controller@14500000 {
+=09=09=09compatible =3D "samsung,exynos9610-cmu-cam";
+=09=09=09reg =3D <0x14500000 0x8000>;
+=09=09=09#clock-cells =3D <1>;
+
+=09=09=09clocks =3D <&oscclk>,
+=09=09=09=09 <&cmu_top CLK_DOUT_CMU_CAM_BUS>;
+=09=09=09clock-names =3D "oscclk",
+=09=09=09=09      "dout_cmu_cam_bus";
+=09=09};
+
+=09=09cmu_dispaud: clock-controller@14980000 {
+=09=09=09compatible =3D "samsung,exynos9610-cmu-dispaud";
+=09=09=09reg =3D <0x14980000 0x8000>;
+=09=09=09#clock-cells =3D <1>;
+
+=09=09=09clocks =3D <&oscclk>,
+=09=09=09=09 <&ioclk_audiocdclk0>,
+=09=09=09=09 <&ioclk_audiocdclk1>,
+=09=09=09=09 <&tick_usb>,
+=09=09=09=09 <&cmu_top CLK_DOUT_CMU_DISPAUD_AUD>,
+=09=09=09=09 <&cmu_top CLK_DOUT_CMU_DISPAUD_CPU>,
+=09=09=09=09 <&cmu_top CLK_DOUT_CMU_DISPAUD_DISP>;
+=09=09=09clock-names =3D "oscclk",
+=09=09=09=09      "ioclk_audiocdclk0",
+=09=09=09=09      "ioclk_audiocdclk1",
+=09=09=09=09      "tick_usb",
+=09=09=09=09      "dout_cmu_dispaud_aud",
+=09=09=09=09      "dout_cmu_dispaud_cpu",
+=09=09=09=09      "dout_cmu_dispaud_disp";
+=09=09};
+
 =09=09pinctrl_dispaud: pinctrl@14a60000 {
 =09=09=09compatible =3D "samsung,exynos9610-pinctrl";
 =09=09=09reg =3D <0x14a60000 0x1000>;

--=20
2.47.3


