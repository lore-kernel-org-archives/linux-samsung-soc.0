From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 15/19] arm64: dts: exynos: Add MSHC dt node for Exynos5433
Date: Tue, 02 Dec 2014 17:49:52 +0900
Message-ID: <1417510196-6714-16-git-send-email-cw00.choi@samsung.com>
References: <1417510196-6714-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:13699 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753490AbaLBIuK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Dec 2014 03:50:10 -0500
In-reply-to: <1417510196-6714-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kgene.kim@samsung.com, mark.rutland@arm.com, marc.zyngier@arm.com, arnd@arndb.de, olof@lixom.net, catalin.marinas@arm.com, will.deacon@arm.com, s.nawrocki@samsung.com, tomasz.figa@gmail.com, kyungmin.park@samsung.com, inki.dae@samsung.com, chanho61.park@samsung.com, geunsik.lim@samsung.com, sw0312.kim@samsung.com, jh80.chung@samsung.com, cw00.choi@samsung.com, a.kesavan@samsung.com, pankaj.dubey@samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org

From: Jaehoon Chung <jh80.chung@samsung.com>

This patch adds MSHC (Mobile Storage Host Controller) dt node for Exynos5433
SoC. MSHC is an interface between the system the SD/MMC card.

Cc: Kukjin Kim <kgene.kim@samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Olof Johansson <olof@lixom.net>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will.deacon@arm.com>
Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
Acked-by: Geunsik Lim <geunsik.lim@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 42 ++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 5637086..fef9bbc 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -52,6 +52,9 @@
 		i2c9 = &hsi2c_9;
 		i2c10 = &hsi2c_10;
 		i2c11 = &hsi2c_11;
+		mshc0 = &mshc_0;
+		mshc1 = &mshc_1;
+		mshc2 = &mshc_2;
 	};
 
 	cpus {
@@ -502,6 +505,45 @@
 			status = "disabled";
 		};
 
+		mshc_0: mshc@15540000 {
+			compatible = "samsung,exynos7-dw-mshc-smu";
+			interrupts = <0 225 0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x15540000 0x2000>;
+			clocks = <&cmu_fsys CLK_ACLK_MMC0>,
+				 <&cmu_fsys CLK_SCLK_MMC0>;
+			clock-names = "biu", "ciu";
+			fifo-depth = <0x40>;
+			status = "disabled";
+		};
+
+		mshc_1: mshc@15550000 {
+			compatible = "samsung,exynos7-dw-mshc-smu";
+			interrupts = <0 226 0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x15550000 0x2000>;
+			clocks = <&cmu_fsys CLK_ACLK_MMC1>,
+				 <&cmu_fsys CLK_SCLK_MMC1>;
+			clock-names = "biu", "ciu";
+			fifo-depth = <0x40>;
+			status = "disabled";
+		};
+
+		mshc_2: mshc@15560000 {
+			compatible = "samsung,exynos7-dw-mshc-smu";
+			interrupts = <0 227 0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x15560000 0x2000>;
+			clocks = <&cmu_fsys CLK_ACLK_MMC2>,
+				 <&cmu_fsys CLK_SCLK_MMC2>;
+			clock-names = "biu", "ciu";
+			fifo-depth = <0x40>;
+			status = "disabled";
+		};
+
 		timer {
 			compatible = "arm,armv8-timer";
 			interrupts = <4 13 0xff01>,
-- 
1.8.5.5
