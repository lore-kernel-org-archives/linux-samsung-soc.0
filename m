From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V6 05/10] ARM: dts: Add nodes for i2s controllers for Samsung
 Exynos5 platforms
Date: Fri, 18 Jan 2013 17:17:04 +0530
Message-ID: <1358509629-20471-6-git-send-email-padma.v@samsung.com>
References: <1358509629-20471-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:48187 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750957Ab3ARL4M (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Jan 2013 06:56:12 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGT007J1L53WQ01@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Jan 2013 20:56:11 +0900 (KST)
Received: from padma-linuxpc.sisodomain.com ([107.108.83.35])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MGT00LG7KPYX890@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Jan 2013 20:56:11 +0900 (KST)
In-reply-to: <1358509629-20471-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: padma.v@samsung.com, padma.kvr@gmail.com, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org
Cc: sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, vinod.koul@intel.com, grant.likely@secretlab.ca, swarren@nvidia.com, boojin.kim@samsung.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, thomas.abraham@linaro.org, lrg@ti.com, tiwai@suse.de, ben-linux@fluff.org

Add device nodes for the three instances of i2s controllers in Exynos5
platforms. Enable instance i2s 0 for exynos5250 board and disable all
other i2s instances.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 arch/arm/boot/dts/exynos5250-smdk5250.dts |   14 ++++++++++++++
 arch/arm/boot/dts/exynos5250.dtsi         |   29 +++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index e05b18f..9516da8 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -204,4 +204,18 @@
 		samsung,mfc-r = <0x43000000 0x800000>;
 		samsung,mfc-l = <0x51000000 0x800000>;
 	};
+
+	i2s@03830000 {
+		gpios = <&gpz 0 2 0 0>, <&gpz 1 2 0 0>, <&gpz 2 2 0 0>,
+			<&gpz 3 2 0 0>, <&gpz 4 2 0 0>, <&gpz 5 2 0 0>,
+			<&gpz 6 2 0 0>;
+	};
+
+	i2s@12D60000 {
+		status = "disabled";
+	};
+
+	i2s@12D70000 {
+		status = "disabled";
+	};
 };
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 46bae01..7e51e69 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -275,6 +275,35 @@
 		#size-cells = <0>;
 	};
 
+	i2s@03830000 {
+		compatible = "samsung,i2s-v5";
+		reg = <0x03830000 0x100>;
+		dmas = <&pdma0 10
+			&pdma0 9
+			&pdma0 8>;
+		dma-names = "tx", "rx", "tx-sec";
+		samsung,supports-6ch;
+		samsung,supports-rstclr;
+		samsung,supports-secdai;
+		samsung,idma-addr = <0x03000000>;
+	};
+
+	i2s@12D60000 {
+		compatible = "samsung,i2s-v5";
+		reg = <0x12D60000 0x100>;
+		dmas = <&pdma1 12
+			&pdma1 11>;
+		dma-names = "tx", "rx";
+	};
+
+	i2s@12D70000 {
+		compatible = "samsung,i2s-v5";
+		reg = <0x12D70000 0x100>;
+		dmas = <&pdma0 12
+			&pdma0 11>;
+		dma-names = "tx", "rx";
+	};
+
 	amba {
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
1.7.4.4
