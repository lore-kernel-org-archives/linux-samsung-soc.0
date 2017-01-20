From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v2 1/3] arm64: dts: exynos: Fix drive strength of sd0_xxx pin
 definitions
Date: Fri, 20 Jan 2017 09:49:55 +0530
Message-ID: <1484885997-21004-2-git-send-email-pankaj.dubey@samsung.com>
References: <1484885997-21004-1-git-send-email-pankaj.dubey@samsung.com>
 <CGME20170120041718epcas5p18cfaaaf19279744af1522fee5b739c3f@epcas5p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:42677 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751121AbdATERV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 Jan 2017 23:17:21 -0500
In-reply-to: <1484885997-21004-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: krzk@kernel.org, kgene@kernel.org, robh+dt@kernel.org, sanath@samsung.com, javier@osg.samsung.com, s.nawrocki@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>

As per Exynos7 datasheet FSYS1 pinctrl block does not support drive
strength value of 0x3. This patch fixes this and update the correct
drive strength for sd0_xxx pin definitions.

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi
index 8232198..7ebb939 100644
--- a/arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi
@@ -497,49 +497,49 @@
 		samsung,pins = "gpr0-0";
 		samsung,pin-function = <2>;
 		samsung,pin-pud = <0>;
-		samsung,pin-drv = <3>;
+		samsung,pin-drv = <4>;
 	};
 
 	sd0_cmd: sd0-cmd {
 		samsung,pins = "gpr0-1";
 		samsung,pin-function = <2>;
 		samsung,pin-pud = <3>;
-		samsung,pin-drv = <3>;
+		samsung,pin-drv = <4>;
 	};
 
 	sd0_ds: sd0-ds {
 		samsung,pins = "gpr0-2";
 		samsung,pin-function = <2>;
 		samsung,pin-pud = <1>;
-		samsung,pin-drv = <3>;
+		samsung,pin-drv = <4>;
 	};
 
 	sd0_qrdy: sd0-qrdy {
 		samsung,pins = "gpr0-3";
 		samsung,pin-function = <2>;
 		samsung,pin-pud = <1>;
-		samsung,pin-drv = <3>;
+		samsung,pin-drv = <4>;
 	};
 
 	sd0_bus1: sd0-bus-width1 {
 		samsung,pins = "gpr1-0";
 		samsung,pin-function = <2>;
 		samsung,pin-pud = <3>;
-		samsung,pin-drv = <3>;
+		samsung,pin-drv = <4>;
 	};
 
 	sd0_bus4: sd0-bus-width4 {
 		samsung,pins = "gpr1-1", "gpr1-2", "gpr1-3";
 		samsung,pin-function = <2>;
 		samsung,pin-pud = <3>;
-		samsung,pin-drv = <3>;
+		samsung,pin-drv = <4>;
 	};
 
 	sd0_bus8: sd0-bus-width8 {
 		samsung,pins = "gpr1-4", "gpr1-5", "gpr1-6", "gpr1-7";
 		samsung,pin-function = <2>;
 		samsung,pin-pud = <3>;
-		samsung,pin-drv = <3>;
+		samsung,pin-drv = <4>;
 	};
 
 	sd1_clk: sd1-clk {
-- 
2.7.4
