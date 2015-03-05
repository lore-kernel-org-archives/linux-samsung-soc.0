From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v5 2/9] arm64: dts: exynos: Add MSHC dt node for Exynos5433
Date: Thu, 05 Mar 2015 14:38:24 +0900
Message-ID: <1425533911-14800-3-git-send-email-cw00.choi@samsung.com>
References: <1425533911-14800-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1425533911-14800-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kgene@kernel.org
Cc: mark.rutland@arm.com, marc.zyngier@arm.com, arnd@arndb.de, olof@lixom.net, catalin.marinas@arm.com, will.deacon@arm.com, inki.dae@samsung.com, chanho61.park@samsung.com, sw0312.kim@samsung.com, jh80.chung@samsung.com, ideal.song@samsung.com, cw00.choi@samsung.com, a.kesavan@samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

From: Jaehoon Chung <jh80.chung@samsung.com>

This patch adds MSHC (Mobile Storage Host Controller) dt node for Exynos5433
SoC. MSHC is an interface between the system the SD/MMC card.

Cc: Kukjin Kim <kgene@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Olof Johansson <olof@lixom.net>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will.deacon@arm.com>
Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 39 ++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index ecdb0eb..9b96bdf 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -655,6 +655,45 @@
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
 			interrupts = <1 13 0xff04>,
-- 
1.8.5.5
