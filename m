From: Jaehoon Chung <jh80.chung@samsung.com>
Subject: [PATCH] ARM: dts: Add sd0_rst pinctrl node to exynos5420
Date: Fri, 23 Jan 2015 23:23:58 +0900
Message-ID: <1422023038-11842-1-git-send-email-jh80.chung@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jaehoon Chung <jh80.chung@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add sd0_rst node to exynos5420-pinctrl.dtsi.
(It's used on odroid-xu3 board)

Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
---
 arch/arm/boot/dts/exynos5420-pinctrl.dtsi |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
index ba686e4..315cad7 100644
--- a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
@@ -194,6 +194,11 @@
 			samsung,pin-drv = <3>;
 		};
 
+		sd0_rst: sd0-rst {
+			samsung,pins = "gpd1-0";
+			samsung,pin-function = <1>;
+		};
+
 		sd1_clk: sd1-clk {
 			samsung,pins = "gpc1-0";
 			samsung,pin-function = <2>;
-- 
1.7.9.5
