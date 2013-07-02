From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH V4 1/4] ARM: dts: Add DP PHY node to exynos5250.dtsi
Date: Tue, 02 Jul 2013 17:39:11 +0900
Message-ID: <000a01ce76ff$a02a7c40$e07f74c0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:15655 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932466Ab3GBIjN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Jul 2013 04:39:13 -0400
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: 'Kishon Vijay Abraham I' <kishon@ti.com>, linux-media@vger.kernel.org, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Felipe Balbi' <balbi@ti.com>, 'Tomasz Figa' <t.figa@samsung.com>, devicetree-discuss@lists.ozlabs.org, 'Inki Dae' <inki.dae@samsung.com>, 'Donghwa Lee' <dh09.lee@samsung.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Jean-Christophe PLAGNIOL-VILLARD' <plagnioj@jcrosoft.com>, 'Tomi Valkeinen' <tomi.valkeinen@ti.com>, linux-fbdev@vger.kernel.org, 'Hui Wang' <jason77.wang@gmail.com>, Jingoo Han <jg1.han@samsung.com>

Add PHY provider node for the DP PHY.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
Acked-by: Felipe Balbi <balbi@ti.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |   13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 41cd625..7e397c6 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -614,6 +614,12 @@
 		interrupts = <0 94 0>;
 	};
 
+	dp_phy: video-phy@10040720 {
+		compatible = "samsung,exynos5250-dp-video-phy";
+		reg = <0x10040720 4>;
+		#phy-cells = <0>;
+	};
+
 	dp-controller {
 		compatible = "samsung,exynos5-dp";
 		reg = <0x145b0000 0x1000>;
@@ -623,11 +629,8 @@
 		clock-names = "dp";
 		#address-cells = <1>;
 		#size-cells = <0>;
-
-		dptx-phy {
-			reg = <0x10040720>;
-			samsung,enable-mask = <1>;
-		};
+		phys = <&dp_phy>;
+		phy-names = "dp";
 	};
 
 	fimd {
-- 
1.7.10.4
