From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH V2 2/2] ARM: dts: Add device tree node for DP controller for
 exynos5250
Date: Thu, 29 Nov 2012 18:43:06 +0900
Message-ID: <004c01cdce15$ef5df640$ce19e2c0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:63117 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752897Ab2K2Jnk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Nov 2012 04:43:40 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0ME80013ATNVXJ40@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 29 Nov 2012 18:43:08 +0900 (KST)
Received: from DOJG1HAN02 ([12.23.120.99])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0ME8006EGTNU9130@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 29 Nov 2012 18:43:06 +0900 (KST)
References: 
In-reply-to: 
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, 'Ajay Kumar' <ajaykumar.rs@samsung.com>, 'Jingoo Han' <jg1.han@samsung.com>

Add device tree node for DP controller in EXYNOS5250 and
enable the instance for the SMDK5250 board.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
Changes since v1:
- change the property name from 'display-port-controller' to 'dp-controller'

 arch/arm/boot/dts/exynos5250-smdk5250.dts |    9 +++++++++
 arch/arm/boot/dts/exynos5250.dtsi         |   14 ++++++++++++++
 2 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 711b55f..cdeb4f2 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -218,4 +218,13 @@
 	i2s_2: i2s@12D70000 {
 		status = "disabled";
 	};
+
+	dp-controller {
+		samsung,color-space = <0>;
+		samsung,dynamic-range = <0>;
+		samsung,ycbcr-coeff = <0>;
+		samsung,color-depth = <1>;
+		samsung,link-rate = <0x0a>;
+		samsung,lane-count = <4>;
+	};
 };
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 581e57a..8f46227 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -613,4 +613,18 @@
 		reg = <0x14450000 0x10000>;
 		interrupts = <0 94 0>;
 	};
+
+	dp-controller {
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
1.7.2.5
