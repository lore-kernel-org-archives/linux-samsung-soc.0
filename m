From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH] ARM: dts: use 'status' property for PCIe nodes
Date: Tue, 29 Oct 2013 15:12:34 +0900
Message-ID: <002601ced46d$dbfa97c0$93efc740$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:48227 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750974Ab3J2GMg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Oct 2013 02:12:36 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MVF001J92K7B5R0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 29 Oct 2013 15:12:35 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, 'Olof Johansson' <olof@lixom.net>, 'Jingoo Han' <jg1.han@samsung.com>

Set the default status for PCIe to disabled in the exynos5440.dtsi
file and let the board dts files such as exynos5440-ssdk5440.dts
enable the PCIe. However, keep the PCIe for SD5v1 board disabled,
because there is no PCIe slot on SD5v1 board.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
Tested on SSDK5440 board.

 arch/arm/boot/dts/exynos5440-ssdk5440.dts |    2 ++
 arch/arm/boot/dts/exynos5440.dtsi         |    2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5440-ssdk5440.dts b/arch/arm/boot/dts/exynos5440-ssdk5440.dts
index a7cb848..d58cb78 100644
--- a/arch/arm/boot/dts/exynos5440-ssdk5440.dts
+++ b/arch/arm/boot/dts/exynos5440-ssdk5440.dts
@@ -68,9 +68,11 @@
 
 	pcie@290000 {
 		reset-gpio = <&pin_ctrl 5 0>;
+		status = "okay";
 	};
 
 	pcie@2a0000 {
 		reset-gpio = <&pin_ctrl 22 0>;
+		status = "okay";
 	};
 };
diff --git a/arch/arm/boot/dts/exynos5440.dtsi b/arch/arm/boot/dts/exynos5440.dtsi
index 5d6cf49..8da1070 100644
--- a/arch/arm/boot/dts/exynos5440.dtsi
+++ b/arch/arm/boot/dts/exynos5440.dtsi
@@ -276,6 +276,7 @@
 		interrupt-map-mask = <0 0 0 0>;
 		interrupt-map = <0x0 0 &gic 53>;
 		num-lanes = <4>;
+		status = "disabled";
 	};
 
 	pcie@2a0000 {
@@ -296,5 +297,6 @@
 		interrupt-map-mask = <0 0 0 0>;
 		interrupt-map = <0x0 0 &gic 56>;
 		num-lanes = <4>;
+		status = "disabled";
 	};
 };
-- 
1.7.10.4
