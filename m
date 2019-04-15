From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RFT] ARM: dts: s5pv210: Fix camera clock provider for Goni board
Date: Mon, 15 Apr 2019 21:02:22 +0200
Message-ID: <20190415190222.9665-1-krzk@kernel.org>
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
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>, Tomasz Figa <tomasz.figa@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jonathan Bakker <xc-racer2@live.ca>
List-Id: linux-samsung-soc@vger.kernel.org

The camera driver (according also to bindings) registers a clock
provider if clock-output-names property is present and later the sensors
use registered clocks.

The DTS for S5Pv210 Goni board was incorrectly adding a child node with
clock output cells but without clock-output-names property.  Although
the DTS was compiling (with "/soc/camera/clock-controller: missing or
empty reg/ranges property" warning), the clock provider was not
registered.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Not tested.
---
 arch/arm/boot/dts/s5pv210-goni.dts | 2 +-
 arch/arm/boot/dts/s5pv210.dtsi     | 6 ++----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/s5pv210-goni.dts b/arch/arm/boot/dts/s5pv210-goni.dts
index eb6d1926c0d6..fbbd93707404 100644
--- a/arch/arm/boot/dts/s5pv210-goni.dts
+++ b/arch/arm/boot/dts/s5pv210-goni.dts
@@ -376,7 +376,7 @@
 		vdd_core-supply = <&ldo14_reg>;
 
 		clock-frequency = <16000000>;
-		clocks = <&clock_cam 0>;
+		clocks = <&camera 0>;
 		clock-names = "mclk";
 		nreset-gpios = <&gpb 2 0>;
 		nstby-gpios = <&gpb 0 0>;
diff --git a/arch/arm/boot/dts/s5pv210.dtsi b/arch/arm/boot/dts/s5pv210.dtsi
index a44d5eb56bed..2ad642f51fd9 100644
--- a/arch/arm/boot/dts/s5pv210.dtsi
+++ b/arch/arm/boot/dts/s5pv210.dtsi
@@ -585,12 +585,10 @@
 			clock-names = "sclk_cam0", "sclk_cam1";
 			#address-cells = <1>;
 			#size-cells = <1>;
+			#clock-cells = <1>;
+			clock-output-names = "cam_a_clkout", "cam_b_clkout";
 			ranges;
 
-			clock_cam: clock-controller {
-				#clock-cells = <1>;
-			};
-
 			csis0: csis@fa600000 {
 				compatible = "samsung,s5pv210-csis";
 				reg = <0xfa600000 0x4000>;
-- 
2.17.1
