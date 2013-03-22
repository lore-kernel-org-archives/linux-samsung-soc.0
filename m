From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH V4 2/2] ARM: dts: Add display timing node to
 exynos5250-smdk5250.dts
Date: Fri, 22 Mar 2013 03:14:39 -0400
Message-ID: <1363936479-4905-3-git-send-email-l.krishna@samsung.com>
References: <1363936479-4905-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:16973 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932110Ab3CVGyr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 Mar 2013 02:54:47 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MK100MOHV6K8L80@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 22 Mar 2013 15:54:43 +0900 (KST)
In-reply-to: <1363936479-4905-1-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, s.nawrocki@samsung.com

Add display timing node to exynos5250-smdk5250.dts

Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
---
 arch/arm/boot/dts/exynos5250-smdk5250.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 872ae1f..9dbdc1e 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -251,4 +251,20 @@
 			clock-frequency = <24000000>;
 		};
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
