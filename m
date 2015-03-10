From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v6 7/9] arm64: dts: exynos: Add I2S dt node for Exynos5433 SoC
Date: Tue, 10 Mar 2015 10:57:33 +0900
Message-ID: <1425952655-21654-8-git-send-email-cw00.choi@samsung.com>
References: <1425952655-21654-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1425952655-21654-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kgene@kernel.org
Cc: mark.rutland@arm.com, marc.zyngier@arm.com, arnd@arndb.de, olof@lixom.net, catalin.marinas@arm.com, will.deacon@arm.com, inki.dae@samsung.com, chanho61.park@samsung.com, sw0312.kim@samsung.com, jh80.chung@samsung.com, ideal.song@samsung.com, cw00.choi@samsung.com, a.kesavan@samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

From: Inha Song <ideal.song@samsung.com>

This patch adds I2S device tree node for Exynos5433 SoC.
In Exynos5433 SoC, I2S0 is used for audio interface.

Signed-off-by: Inha Song <ideal.song@samsung.com>
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 23d9018..fea4e32 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -475,6 +475,23 @@
 			status = "disabled";
 		};
 
+		i2s0: i2s0@11440000 {
+			compatible = "samsung,exynos7-i2s";
+			reg = <0x11440000 0x100>;
+			dmas = <&adma 0 &adma 2>;
+			dma-names = "tx", "rx";
+			interrupts = <0 70 0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&cmu_aud CLK_PCLK_AUD_I2S>,
+				 <&cmu_aud CLK_SCLK_AUD_I2S>,
+				 <&cmu_aud CLK_SCLK_I2S_BCLK>;
+			clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2s0_bus>;
+			status = "disabled";
+		};
+
 		pinctrl_alive: pinctrl@10580000 {
 			compatible = "samsung,exynos5433-pinctrl";
 			reg = <0x10580000 0x1000>;
-- 
1.8.5.5
