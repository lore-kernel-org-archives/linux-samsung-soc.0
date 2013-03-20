From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH V3 1/2] ARM: dts: Add FIMD node to exynos5
Date: Wed, 20 Mar 2013 06:22:34 -0400
Message-ID: <1363774955-22784-2-git-send-email-l.krishna@samsung.com>
References: <1363774955-22784-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:41677 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751239Ab3CTKCj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Mar 2013 06:02:39 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MJY00DGLEJX3V30@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 20 Mar 2013 19:02:38 +0900 (KST)
Received: from chrome-ubuntu.sisodomain.com ([107.108.73.106])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MJY00DPMEK4HJ70@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 20 Mar 2013 19:02:37 +0900 (KST)
In-reply-to: <1363774955-22784-1-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, s.nawrocki@samsung.com

This adds common FIMD device node for all Exynos5 SoCs

Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 24c52e6..bd270b7 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -775,4 +775,14 @@
 			samsung,enable-mask = <1>;
 		};
 	};
+
+	fimd {
+		compatible = "samsung,exynos5250-fimd";
+		interrupt-parent = <&combiner>;
+		reg = <0x14400000 0x40000>;
+		interrupt-names = "fifo", "vsync", "lcd_sys";
+		interrupts = <18 4>, <18 5>, <18 6>;
+		clocks = <&clock 133>, <&clock 339>;
+		clock-names = "sclk_fimd1", "fimd1";
+	};
 };
-- 
1.8.0
