From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH V2 1/3] ARM: dts: Add FIMD node to exynos5
Date: Wed, 27 Feb 2013 04:40:45 -0500
Message-ID: <1361958047-21994-2-git-send-email-l.krishna@samsung.com>
References: <1361958047-21994-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:28882 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755648Ab3B0JUQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Feb 2013 04:20:16 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MIV00H5VGLMHRV0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Feb 2013 18:20:14 +0900 (KST)
In-reply-to: <1361958047-21994-1-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

This adds common FIMD device node for all Exynos5 SoCs.

Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 3acf594..fc3d236 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -583,4 +583,11 @@
 		reg = <0x14450000 0x10000>;
 		interrupts = <0 94 0>;
 	};
+
+	fimd {
+		compatible = "samsung,exynos5250-fimd";
+		interrupt-parent = <&combiner>;
+		reg = <0x14400000 0x40000>;
+		interrupts = <18 5>, <18 4>, <18 6>;
+	};
 };
-- 
1.8.0
