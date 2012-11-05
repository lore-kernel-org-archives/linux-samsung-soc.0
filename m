From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH 2/2] ARM: dts: Add device tree node for DP controller for
 Samsung Exynos5250 platforms
Date: Mon, 05 Nov 2012 18:49:38 +0900
Message-ID: <004901cdbb3a$dec6cc00$9c546400$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:36889 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753471Ab2KEJtj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Nov 2012 04:49:39 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MD000DOQDYLV150@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 05 Nov 2012 18:49:38 +0900 (KST)
Received: from DOJG1HAN02 ([12.23.120.99])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MD0009BFDYQ7O20@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 05 Nov 2012 18:49:38 +0900 (KST)
References: 
In-reply-to: 
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, 'Ajay Kumar' <ajaykumar.rs@samsung.com>, 'Jingoo Han' <jg1.han@samsung.com>

Add device tree node for DP controller in Exynos5250 and enable
the instance for the smdk5250 board.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 arch/arm/boot/dts/exynos5250-smdk5250.dts |    9 +++++++++
 arch/arm/boot/dts/exynos5250.dtsi         |   14 ++++++++++++++
 2 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 405009c..a4ee49e 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -193,4 +193,13 @@
 	hdmi {
 		hpd-gpio = <&gpx3 7 0xf 1 3>;
 	};
+
+	display-port-controller {
+		samsung,color-space = <0>;
+		samsung,dynamic-range = <0>;
+		samsung,ycbcr-coeff = <0>;
+		samsung,color-depth = <1>;
+		samsung,link-rate = <0x0a>;
+		samsung,lane-count = <4>;
+	};
 };
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index cf6a02d..4603b72 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -552,4 +552,18 @@
 		reg = <0x14450000 0x10000>;
 		interrupts = <0 94 0>;
 	};
+
+	display-port-controller {
+		compatible = "samsung,exynos5-dp";
+		reg = <0x145b0000 0x1000>;
+		interrupts = <10 3>;
+		interrupt-parent = <&combiner>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dptx-phy {
+			reg = <0x10040720>;
+			samsung,enable-mask = <1>;
+		};
+	};
 };
-- 
1.7.1
