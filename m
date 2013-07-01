From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v3 01/13] ARM: dts: Correct camera pinctrl nodes for Exynos4x12
 SoCs
Date: Mon, 01 Jul 2013 17:22:23 +0200
Message-ID: <1372692155-17653-2-git-send-email-s.nawrocki@samsung.com>
References: <1372692155-17653-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:41307 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751171Ab3GAPZB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 1 Jul 2013 11:25:01 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MP900955K5NTSS0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 02 Jul 2013 00:24:59 +0900 (KST)
In-reply-to: <1372692155-17653-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: t.figa@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, myungjoo.ham@samsung.com, m.szyprowski@samsung.com, phil.carmody@partner.samsung.com, j.anaszewski@samsung.com, kyungmin.park@samsung.com, devicetree-discuss@lists.ozlabs.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

Add separate nodes for the CAMCLK pin and turn off pull-up on camera
ports A, B. The video bus pins and the clock output (CAMCLK) pin need
separate nodes since full camera port is not used in some configurations,
e.g. for MIPI CSI-2 bus only CAMCLK is required and data/clock signal
use separate dedicated pins.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos4x12-pinctrl.dtsi |   40 ++++++++++++++++++++++++-----
 1 file changed, 33 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi b/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
index 704290f..55ff73b 100644
--- a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
@@ -401,13 +401,26 @@
 			samsung,pin-drv = <0>;
 		};
 
-		cam_port_a: cam-port-a {
+		cam_port_a_io: cam-port-a-io {
 			samsung,pins = "gpj0-0", "gpj0-1", "gpj0-2", "gpj0-3",
 					"gpj0-4", "gpj0-5", "gpj0-6", "gpj0-7",
-					"gpj1-0", "gpj1-1", "gpj1-2", "gpj1-3",
-					"gpj1-4";
+					"gpj1-0", "gpj1-1", "gpj1-2", "gpj1-4";
 			samsung,pin-function = <2>;
-			samsung,pin-pud = <3>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <0>;
+		};
+
+		cam_port_a_clk_active: cam-port-a-clk-active {
+			samsung,pins = "gpj1-3";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <3>;
+		};
+
+		cam_port_a_clk_idle: cam-port-a-clk-idle {
+			samsung,pins = "gpj1-3";
+			samsung,pin-function = <0>;
+			samsung,pin-pud = <1>;
 			samsung,pin-drv = <0>;
 		};
 	};
@@ -778,16 +791,29 @@
 			samsung,pin-drv = <3>;
 		};
 
-		cam_port_b: cam-port-b {
+		cam_port_b_io: cam-port-b-io {
 			samsung,pins = "gpm0-0", "gpm0-1", "gpm0-2", "gpm0-3",
 					"gpm0-4", "gpm0-5", "gpm0-6", "gpm0-7",
-					"gpm1-0", "gpm1-1", "gpm2-0", "gpm2-1",
-					"gpm2-2";
+					"gpm1-0", "gpm1-1", "gpm2-0", "gpm2-1";
 			samsung,pin-function = <3>;
 			samsung,pin-pud = <3>;
 			samsung,pin-drv = <0>;
 		};
 
+		cam_port_b_clk_active: cam-port-b-clk-active {
+			samsung,pins = "gpm2-2";
+			samsung,pin-function = <3>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <3>;
+		};
+
+		cam_port_b_clk_idle: cam-port-b-clk-idle {
+			samsung,pins = "gpm2-2";
+			samsung,pin-function = <0>;
+			samsung,pin-pud = <1>;
+			samsung,pin-drv = <0>;
+		};
+
 		eint0: ext-int0 {
 			samsung,pins = "gpx0-0";
 			samsung,pin-function = <0xf>;
-- 
1.7.9.5
