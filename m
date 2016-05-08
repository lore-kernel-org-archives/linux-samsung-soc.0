From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 11/22] ARM: dts: exynos: Configure Exynos5410 pinctrl for
 eMMC and SD card
Date: Sun,  8 May 2016 21:05:56 +0200
Message-ID: <1462734367-5619-12-git-send-email-krzk@kernel.org>
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

Configure the pinctrl for MMC0 (eMMC) and MMC2 (microSD card).

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos5410-pinctrl.dtsi | 77 +++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5410-pinctrl.dtsi b/arch/arm/boot/dts/exynos5410-pinctrl.dtsi
index f9aa6bb55464..72fc659d0637 100644
--- a/arch/arm/boot/dts/exynos5410-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos5410-pinctrl.dtsi
@@ -277,6 +277,83 @@
 		interrupt-controller;
 		#interrupt-cells = <2>;
 	};
+
+	sd0_clk: sd0-clk {
+		samsung,pins = "gpc0-0";
+		samsung,pin-function = <2>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <3>;
+	};
+
+	sd0_cmd: sd0-cmd {
+		samsung,pins = "gpc0-1";
+		samsung,pin-function = <2>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <3>;
+	};
+
+	sd0_cd: sd0-cd {
+		samsung,pins = "gpc0-2";
+		samsung,pin-function = <2>;
+		samsung,pin-pud = <3>;
+		samsung,pin-drv = <3>;
+	};
+
+	sd0_bus1: sd0-bus-width1 {
+		samsung,pins = "gpc0-3";
+		samsung,pin-function = <2>;
+		samsung,pin-pud = <3>;
+		samsung,pin-drv = <3>;
+	};
+
+	sd0_bus4: sd0-bus-width4 {
+		samsung,pins = "gpc0-4", "gpc0-5", "gpc0-6";
+		samsung,pin-function = <2>;
+		samsung,pin-pud = <3>;
+		samsung,pin-drv = <3>;
+	};
+
+	sd0_bus8: sd0-bus-width8 {
+		samsung,pins = "gpc3-0", "gpc3-1", "gpc3-2", "gpc3-3";
+		samsung,pin-function = <2>;
+		samsung,pin-pud = <3>;
+		samsung,pin-drv = <3>;
+	};
+
+	sd2_clk: sd2-clk {
+		samsung,pins = "gpc2-0";
+		samsung,pin-function = <2>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <3>;
+	};
+
+	sd2_cmd: sd2-cmd {
+		samsung,pins = "gpc2-1";
+		samsung,pin-function = <2>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <3>;
+	};
+
+	sd2_cd: sd2-cd {
+		samsung,pins = "gpc2-2";
+		samsung,pin-function = <2>;
+		samsung,pin-pud = <3>;
+		samsung,pin-drv = <3>;
+	};
+
+	sd2_bus1: sd2-bus-width1 {
+		samsung,pins = "gpc2-3";
+		samsung,pin-function = <2>;
+		samsung,pin-pud = <3>;
+		samsung,pin-drv = <3>;
+	};
+
+	sd2_bus4: sd2-bus-width4 {
+		samsung,pins = "gpc2-4", "gpc2-5", "gpc2-6";
+		samsung,pin-function = <2>;
+		samsung,pin-pud = <3>;
+		samsung,pin-drv = <3>;
+	};
 };
 
 &pinctrl_1 {
-- 
2.5.0
