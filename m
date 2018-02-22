From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 2/2] ARM: dts: exynos: Fix unit addresses of PDMA nodes in
 Exynos5410
Date: Thu, 22 Feb 2018 20:11:11 +0100
Message-ID: <20180222191111.23747-2-krzk@kernel.org>
References: <20180222191111.23747-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180222191111.23747-1-krzk@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Marian Mihailescu <mihailescu2m@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Fix the unit addresses of PDMA nodes in Exynos5410 (the reg property is
correct) to get rid of DTC warnings like:

    arch/arm/boot/dts/exynos5410-odroidxu.dtb: Warning (simple_bus_reg):
        Node /soc/amba/pdma@12680000 simple-bus unit address format error, expected "121a0000"

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos5410.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5410.dtsi b/arch/arm/boot/dts/exynos5410.dtsi
index 1e6b57d013c4..55509c690328 100644
--- a/arch/arm/boot/dts/exynos5410.dtsi
+++ b/arch/arm/boot/dts/exynos5410.dtsi
@@ -196,9 +196,9 @@
 			interrupt-parent = <&gic>;
 			ranges;
 
-			pdma0: pdma@12680000 {
+			pdma0: pdma@121a0000 {
 				compatible = "arm,pl330", "arm,primecell";
-				reg = <0x121A0000 0x1000>;
+				reg = <0x121a0000 0x1000>;
 				interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clock CLK_PDMA0>;
 				clock-names = "apb_pclk";
@@ -207,9 +207,9 @@
 				#dma-requests = <32>;
 			};
 
-			pdma1: pdma@12690000 {
+			pdma1: pdma@121b0000 {
 				compatible = "arm,pl330", "arm,primecell";
-				reg = <0x121B0000 0x1000>;
+				reg = <0x121b0000 0x1000>;
 				interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clock CLK_PDMA1>;
 				clock-names = "apb_pclk";
-- 
2.14.1
