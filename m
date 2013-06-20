From: Arun Kumar K <arun.kk@samsung.com>
Subject: [PATCH v2 4/5] ARM: dts: Add MFC node for exynos 5420
Date: Thu, 20 Jun 2013 12:23:41 +0530
Message-ID: <1371711222-9232-5-git-send-email-arun.kk@samsung.com>
References: <1371711222-9232-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:12644 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752800Ab3FTGaG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Jun 2013 02:30:06 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOO00JUJI163HJ0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Jun 2013 15:30:05 +0900 (KST)
In-reply-to: <1371711222-9232-1-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, k.debski@samsung.com, s.nawrocki@samsung.com, sachin.kamat@linaro.org, arunkk.samsung@gmail.com

The patch adds MFC nodes for exynos 5420 and for
smdk 5420 board.

Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
---
 arch/arm/boot/dts/exynos5420-smdk5420.dts |    6 ++++++
 arch/arm/boot/dts/exynos5420.dtsi         |    7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
index 08607df..09ebecf 100644
--- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
+++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
@@ -30,4 +30,10 @@
 			clock-frequency = <24000000>;
 		};
 	};
+
+	codec@11000000 {
+		samsung,mfc-r = <0x43000000 0x800000>;
+		samsung,mfc-l = <0x51000000 0x800000>;
+		status = "okay";
+	};
 };
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 8474d63..3ef604d 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -100,4 +100,11 @@
 		clocks = <&clock 260>, <&clock 131>;
 		clock-names = "uart", "clk_uart_baud0";
 	};
+
+	codec@11000000 {
+		compatible = "samsung,mfc-v7";
+		clocks = <&clock 401>;
+		clock-names = "mfc";
+		status = "disabled";
+	};
 };
-- 
1.7.9.5
