From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH V2 2/3] ARM: dts: Add display timing node to
 exynos5250-smdk5250.dts
Date: Wed, 27 Feb 2013 04:40:46 -0500
Message-ID: <1361958047-21994-3-git-send-email-l.krishna@samsung.com>
References: <1361958047-21994-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:28882 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756115Ab3B0JUR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Feb 2013 04:20:17 -0500
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

Add display timing node to exynos5250-smdk5250.dts

Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
---
 arch/arm/boot/dts/exynos5250-smdk5250.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index e05b18f..2d8c577 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -204,4 +204,20 @@
 		samsung,mfc-r = <0x43000000 0x800000>;
 		samsung,mfc-l = <0x51000000 0x800000>;
 	};
+
+	display-timings {
+		native-mode = <&timing0>;
+		timing0: timing@0 {
+			/* 1280x800 */
+			clock-frequency = <50000>;
+			hactive = <1280>;
+			vactive = <800>;
+			hfront-porch = <4>;
+			hback-porch = <4>;
+			hsync-len = <4>;
+			vback-porch = <4>;
+			vfront-porch = <4>;
+			vsync-len = <4>;
+		};
+	};
 };
-- 
1.8.0
