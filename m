From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCHv2 1/5] ARM: dts: exynos4x12: Add ADC's dt data to read raw data
Date: Wed, 12 Mar 2014 15:19:12 +0900
Message-ID: <1394605156-7768-2-git-send-email-cw00.choi@samsung.com>
References: <1394605156-7768-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1394605156-7768-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kgene.kim@samsung.com, t.figa@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kyungmin.park@samsung.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ijc+devicetree@hellion.org.uk, linux@arm.linux.org.uk, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch add ADC(Analog to Digital Converter)'s dt data to get raw data
with IIO subsystem. Usually, ADC is used to check temperature, jack type
and so on.

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos4x12.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
index e0eb6bb..eec1e30 100644
--- a/arch/arm/boot/dts/exynos4x12.dtsi
+++ b/arch/arm/boot/dts/exynos4x12.dtsi
@@ -80,6 +80,18 @@
 		};
 	};
 
+	adc: adc@126C0000 {
+		compatible = "samsung,exynos-adc-v1";
+		reg = <0x126C0000 0x100>, <0x10020718 0x4>;
+		interrupt-parent = <&combiner>;
+		interrupts = <10 3>;
+		clocks = <&clock CLK_TSADC>;
+		clock-names = "adc";
+		#io-channel-cells = <1>;
+		io-channel-ranges;
+		status = "disabled";
+	};
+
 	pinctrl_2: pinctrl@03860000 {
 		compatible = "samsung,exynos4x12-pinctrl";
 		reg = <0x03860000 0x1000>;
-- 
1.8.0
