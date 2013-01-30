From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH V3 2/2] ARM: dts: Add device tree node for DP controller for
 exynos5250
Date: Wed, 30 Jan 2013 12:44:00 +0900
Message-ID: <00c301cdfe9c$0aa63370$1ff29a50$%han@samsung.com>
References: <00c201cdfe9b$d992b970$8cb82c50$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:22145 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753141Ab3A3DoD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jan 2013 22:44:03 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHF007NQ6BL1AL0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 30 Jan 2013 12:44:01 +0900 (KST)
Received: from DOJG1HAN02 ([12.23.120.99])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MHF00NLZ6DD2XB0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 30 Jan 2013 12:44:01 +0900 (KST)
In-reply-to: <00c201cdfe9b$d992b970$8cb82c50$%han@samsung.com>
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
Tested with SMDK5250 board

Changes since v2:
- rebase on linux-samsung for-next branch

Changes since v1:
- change the property name from 'display-port-controller' to 'dp-controller'

 arch/arm/boot/dts/exynos5250-smdk5250.dts |    9 +++++++++
 arch/arm/boot/dts/exynos5250.dtsi         |   14 ++++++++++++++
 2 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index e05b18f..e2fe2af 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -204,4 +204,13 @@
 		samsung,mfc-r = <0x43000000 0x800000>;
 		samsung,mfc-l = <0x51000000 0x800000>;
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
index 30485de..b482d8e 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -732,4 +732,18 @@
 		interrupt-parent = <&combiner>;
 		interrupts = <24 1>;
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
