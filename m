From: Stuart Menefy <stuart.menefy@mathembedded.com>
Subject: [PATCH v2 2/4] ARM: dts: exynos: Add high speed I2C ports for
 exynos5260
Date: Tue, 19 Feb 2019 13:03:35 +0000
Message-ID: <20190219130337.21353-3-stuart@menefy.org>
References: <20190219130337.21353-1-stuart@menefy.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190219130337.21353-1-stuart@menefy.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

From: Stuart Menefy <stuart.menefy@mathembedded.com>

Most of the work to support the high speed I2C ports on the Exynos 5260
was added in commit 218e1496135e ("i2c: exynos5: add support for HSI2C
on Exynos5260 SoC") and the pinctrl nodes have always been available.
All that is missing to get them working is the additon of the DT bindings.

Signed-off-by: Stuart Menefy <stuart.menefy@mathembedded.com>
---

Changes since v1:
- Removed unused attribute: samsung,check-transdone-int
- Reordered additions so they now appear in address order
- Changed hex addresses to lower case

 arch/arm/boot/dts/exynos5260.dtsi | 56 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5260.dtsi b/arch/arm/boot/dts/exynos5260.dtsi
index 14b423de9137..a8c7c6e589a0 100644
--- a/arch/arm/boot/dts/exynos5260.dtsi
+++ b/arch/arm/boot/dts/exynos5260.dtsi
@@ -17,6 +17,10 @@
 	#size-cells = <1>;
 
 	aliases {
+		i2c0 = &hsi2c_0;
+		i2c1 = &hsi2c_1;
+		i2c2 = &hsi2c_2;
+		i2c3 = &hsi2c_3;
 		pinctrl0 = &pinctrl_0;
 		pinctrl1 = &pinctrl_1;
 		pinctrl2 = &pinctrl_2;
@@ -339,6 +343,58 @@
 			fifo-depth = <64>;
 			status = "disabled";
 		};
+
+		hsi2c_0: hsi2c@12da0000 {
+			compatible = "samsung,exynos5260-hsi2c";
+			reg = <0x12DA0000 0x1000>;
+			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c0_hs_bus>;
+			clocks = <&clock_peri PERI_CLK_HSIC0>;
+			clock-names = "hsi2c";
+			status = "disabled";
+		};
+
+		hsi2c_1: hsi2c@12db0000 {
+			compatible = "samsung,exynos5260-hsi2c";
+			reg = <0x12DB0000 0x1000>;
+			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c1_hs_bus>;
+			clocks = <&clock_peri PERI_CLK_HSIC1>;
+			clock-names = "hsi2c";
+			status = "disabled";
+		};
+
+		hsi2c_2: hsi2c@12dc0000 {
+			compatible = "samsung,exynos5260-hsi2c";
+			reg = <0x12DC0000 0x1000>;
+			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c2_hs_bus>;
+			clocks = <&clock_peri PERI_CLK_HSIC2>;
+			clock-names = "hsi2c";
+			status = "disabled";
+		};
+
+		hsi2c_3: hsi2c@12dd0000 {
+			compatible = "samsung,exynos5260-hsi2c";
+			reg = <0x12DD0000 0x1000>;
+			interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c3_hs_bus>;
+			clocks = <&clock_peri PERI_CLK_HSIC3>;
+			clock-names = "hsi2c";
+			status = "disabled";
+		};
 	};
 };
 
-- 
2.13.6
