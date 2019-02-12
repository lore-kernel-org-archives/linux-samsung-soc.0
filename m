From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] ARM: dts: exynos: Document regulator used by ADC on Odroid U3
Date: Tue, 12 Feb 2019 18:46:38 +0100
Message-ID: <20190212174638.4582-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Add ADC node to Odroid U3 with its regulator, purely for documentation
purposes.  The ADC stays disabled because it is not used (all inputs
grounded).

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos4412-odroidu3.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-odroidu3.dts b/arch/arm/boot/dts/exynos4412-odroidu3.dts
index 2bdf899df436..88891ff5f238 100644
--- a/arch/arm/boot/dts/exynos4412-odroidu3.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidu3.dts
@@ -66,6 +66,11 @@
 	};
 };
 
+&adc {
+	vdd-supply = <&ldo10_reg>;
+	/* Nothing connected to ADC inputs, keep it disabled */
+};
+
 /* Supply for LAN9730/SMSC95xx */
 &buck8_reg {
 	regulator-name = "BUCK8_P3V3";
-- 
2.17.1
