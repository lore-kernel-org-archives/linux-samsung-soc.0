From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH 1/3] ARM: EXYNOS5: Add fimd node to the exynos5250 dtsi file
Date: Tue, 18 Sep 2012 23:52:09 +0530
Message-ID: <1347992531-27279-2-git-send-email-l.krishna@samsung.com>
References: <1347992531-27279-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:24947 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932461Ab2IRMXy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Sep 2012 08:23:54 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAJ00K21P3QI341@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 Sep 2012 21:23:53 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAJ004DPP1JBZB0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 Sep 2012 21:23:52 +0900 (KST)
In-reply-to: <1347992531-27279-1-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, jg1.han@samsung.com

This patch adds the fimd node with compatibility string, hardware address,
interrupt line numbers to the exynos5250 dtsi file.

Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index b55794b..6d27ca4 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -488,4 +488,11 @@
 		reg = <0x13e30000 0x1000>;
 		interrupts = <0 88 0>;
 	};
+
+	fimd {
+		compatible = "samsung,exynos5-drm";
+		interrupt-parent = <&combiner>;
+		reg = <0x14400000 0x40000>;
+		interrupts = <18 5>, <18 4>, <18 6>;
+	};
 };
-- 
1.7.0.4
