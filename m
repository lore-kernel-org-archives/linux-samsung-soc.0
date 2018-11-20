From: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCHv2] ARM: dts: exynos: update the usbdrd_phy suspend clk
Date: Tue, 20 Nov 2018 18:55:36 +0000
Message-ID: <20181120185536.1159-1-linux.amoon@gmail.com>
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
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

As per FSYS usbdrd_phy clk setting CLK_SCLK_USBD300/1 binds
to SUSPEND_CLK so correct update the suspend clk.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
[0] https://lkml.org/lkml/2017/10/6/12
changes from previous patch
fix the order of clk and update the commit message

FSYS block show in user manual

CLKMUX_USBDRD300/1----CLKDIV_USBDRD300/1----SCLK_USBDRD300/1-----SUSPEND_CLK
                   |
                   |--CLKDIV_USBPHY300/1----SCLK_USBPHY300/1-----USBDRD30_PHY_0/1
---
 arch/arm/boot/dts/exynos5410.dtsi | 4 ++--
 arch/arm/boot/dts/exynos5420.dtsi | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5410.dtsi b/arch/arm/boot/dts/exynos5410.dtsi
index 57fc9c949e54..a92c765a7a84 100644
--- a/arch/arm/boot/dts/exynos5410.dtsi
+++ b/arch/arm/boot/dts/exynos5410.dtsi
@@ -395,7 +395,7 @@
 };
 
 &usbdrd_phy0 {
-	clocks = <&clock CLK_USBD300>, <&clock CLK_SCLK_USBPHY300>;
+	clocks = <&clock CLK_SCLK_USBD300>, <&clock CLK_SCLK_USBPHY300>;
 	clock-names = "phy", "ref";
 	samsung,pmu-syscon = <&pmu_system_controller>;
 };
@@ -410,7 +410,7 @@
 };
 
 &usbdrd_phy1 {
-	clocks = <&clock CLK_USBD301>, <&clock CLK_SCLK_USBPHY301>;
+	clocks = <&clock CLK_SCLK_USBD301>, <&clock CLK_SCLK_USBPHY301>;
 	clock-names = "phy", "ref";
 	samsung,pmu-syscon = <&pmu_system_controller>;
 };
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index aaff15880761..b84b44556efc 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -1509,7 +1509,7 @@
 };
 
 &usbdrd_phy0 {
-	clocks = <&clock CLK_USBD300>, <&clock CLK_SCLK_USBPHY300>;
+	clocks = <&clock CLK_SCLK_USBD300>, <&clock CLK_SCLK_USBPHY300>;
 	clock-names = "phy", "ref";
 	samsung,pmu-syscon = <&pmu_system_controller>;
 };
@@ -1524,7 +1524,7 @@
 };
 
 &usbdrd_phy1 {
-	clocks = <&clock CLK_USBD301>, <&clock CLK_SCLK_USBPHY301>;
+	clocks = <&clock CLK_SCLK_USBD301>, <&clock CLK_SCLK_USBPHY301>;
 	clock-names = "phy", "ref";
 	samsung,pmu-syscon = <&pmu_system_controller>;
 };
-- 
2.17.1
