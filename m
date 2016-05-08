From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 09/22] ARM: dts: exynos: Re-order alphabetically Exynos5420
 SD0/SD1 pinctrl nodes
Date: Sun,  8 May 2016 21:05:54 +0200
Message-ID: <1462734367-5619-10-git-send-email-krzk@kernel.org>
References: <1462734367-5619-1-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1462734367-5619-1-git-send-email-krzk@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

The 'sd0_rclk' was put in the middle of SD1 nodes. Remove the confusion.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos5420-pinctrl.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
index 130563b2ca95..14beb7e07323 100644
--- a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
@@ -193,17 +193,17 @@
 		samsung,pin-drv = <3>;
 	};
 
-	sd1_clk: sd1-clk {
-		samsung,pins = "gpc1-0";
+	sd0_rclk: sd0-rclk {
+		samsung,pins = "gpc0-7";
 		samsung,pin-function = <2>;
-		samsung,pin-pud = <0>;
+		samsung,pin-pud = <1>;
 		samsung,pin-drv = <3>;
 	};
 
-	sd0_rclk: sd0-rclk {
-		samsung,pins = "gpc0-7";
+	sd1_clk: sd1-clk {
+		samsung,pins = "gpc1-0";
 		samsung,pin-function = <2>;
-		samsung,pin-pud = <1>;
+		samsung,pin-pud = <0>;
 		samsung,pin-drv = <3>;
 	};
 
-- 
2.5.0
