From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] ARM: dts: exynos: Add #sound-dai-cells property to
 exynos5250 i2s nodes
Date: Tue, 13 Mar 2018 18:12:20 +0100
Message-ID: <20180313171220.26333-1-s.nawrocki@samsung.com>
References: <CGME20180313171232epcas1p4425993ba6042b06051cc7590d3dbeab4@epcas1p4.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: krzk@kernel.org
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, kgene@kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

The #sound-dai-cells property may be required to reference the CPU DAI
properly. This change is required for Snow HDMI audio.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index ebc79114b0ce..45283a6c5eee 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -499,6 +499,7 @@
 			pinctrl-0 = <&i2s0_bus>;
 			power-domains = <&pd_mau>;
 			#clock-cells = <1>;
+			#sound-dai-cells = <1>;
 		};
 
 		i2s1: i2s@12d60000 {
@@ -513,6 +514,7 @@
 			pinctrl-names = "default";
 			pinctrl-0 = <&i2s1_bus>;
 			power-domains = <&pd_mau>;
+			#sound-dai-cells = <1>;
 		};
 
 		i2s2: i2s@12d70000 {
@@ -527,6 +529,7 @@
 			pinctrl-names = "default";
 			pinctrl-0 = <&i2s2_bus>;
 			power-domains = <&pd_mau>;
+			#sound-dai-cells = <1>;
 		};
 
 		usb_dwc3 {
-- 
2.14.2
