From: Daniel Drake <drake@endlessm.com>
Subject: [PATCH] ARM: dts: Enable temperature sensor on exynos4412 & ODROID
Date: Mon, 29 Sep 2014 15:42:14 -0600
Message-ID: <1412026934-25947-1-git-send-email-drake@endlessm.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f169.google.com ([209.85.160.169]:38504 "EHLO
	mail-yk0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751335AbaI2VmX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Sep 2014 17:42:23 -0400
Received: by mail-yk0-f169.google.com with SMTP id 10so5629909ykt.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Sep 2014 14:42:22 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: ben-linux@fluff.org, kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org

The Exynos4412 has a Thermal Management Unit (TMU) which provides
a temperature sensor and related functionality.

This must be enabled on a per-board basis, as it requires a 100k
resistance to ground on the XtsRES_EXT pin, as well as a 1.8V input on
VDD18_TS pin. If that voltage is not supplied, the machine immediately
reports a maximum temperature of 255C and triggers the thermal subsystem
to shut down the system.

This patch also enables the TMU on the ODROID boards via the appropriate
power supply.

Signed-off-by: Daniel Drake <drake@endlessm.com>
---
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi |  5 +++++
 arch/arm/boot/dts/exynos4412.dtsi               | 10 ++++++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
index 3d8c623..9994a44 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -400,3 +400,8 @@
 		samsung,pin-drv = <0>;
 	};
 };
+
+&tmu {
+	status = "okay";
+	vtmu-supply = <&ldo10_reg>;
+};
diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
index 0f6ec93..ee58e7f 100644
--- a/arch/arm/boot/dts/exynos4412.dtsi
+++ b/arch/arm/boot/dts/exynos4412.dtsi
@@ -66,4 +66,14 @@
 	pmu_system_controller: system-controller@10020000 {
 		compatible = "samsung,exynos4412-pmu", "syscon";
 	};
+
+	tmu: tmu@100C0000 {
+		compatible = "samsung,exynos4412-tmu";
+		interrupt-parent = <&combiner>;
+		reg = <0x100C0000 0x100>;
+		interrupts = <2 4>;
+		clocks = <&clock CLK_TMU_APBIF>;
+		clock-names = "tmu_apbif";
+		status = "disabled";
+	};
 };
-- 
1.9.1
