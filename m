From: Arun Kumar K <arun.kk@samsung.com>
Subject: [PATCH 2/3] ARM: dts: Add MFC node for exynos 5420
Date: Wed, 19 Jun 2013 14:22:48 +0530
Message-ID: <1371631969-10076-2-git-send-email-arun.kk@samsung.com>
References: <1371631969-10076-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:13994 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933976Ab3FSI3J (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Jun 2013 04:29:09 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOM002SISWJUNG0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Jun 2013 17:29:08 +0900 (KST)
In-reply-to: <1371631969-10076-1-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, k.debski@samsung.com, s.nawrocki@samsung.com, arunkk.samsung@gmail.com

The patch adds MFC nodes for exynos 5420 and for
smdk 5420 board.

Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
---
 arch/arm/boot/dts/exynos5420-smdk5420.dts |    5 +++++
 arch/arm/boot/dts/exynos5420.dtsi         |    8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
index 08607df..682532c 100644
--- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
+++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
@@ -30,4 +30,9 @@
 			clock-frequency = <24000000>;
 		};
 	};
+
+	codec@11000000 {
+		samsung,mfc-r = <0x43000000 0x800000>;
+		samsung,mfc-l = <0x51000000 0x800000>;
+	};
 };
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 8474d63..cb74356 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -100,4 +100,12 @@
 		clocks = <&clock 260>, <&clock 131>;
 		clock-names = "uart", "clk_uart_baud0";
 	};
+
+	codec@11000000 {
+		compatible = "samsung,mfc-v7";
+		reg = <0x11000000 0x10000>;
+		interrupts = <0 96 0>;
+		clocks = <&clock 401>;
+		clock-names = "mfc";
+	};
 };
-- 
1.7.9.5
