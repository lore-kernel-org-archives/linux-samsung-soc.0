From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH 3/3] ARM: EXYNOS: Add drm-device node to the dtsi file
Date: Tue, 18 Sep 2012 23:52:11 +0530
Message-ID: <1347992531-27279-4-git-send-email-l.krishna@samsung.com>
References: <1347992531-27279-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:63302 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932928Ab2IRMZQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Sep 2012 08:25:16 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAJ008EBP63CVL0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 Sep 2012 21:25:15 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAJ004DPP1JBZB0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 Sep 2012 21:25:15 +0900 (KST)
In-reply-to: <1347992531-27279-1-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, jg1.han@samsung.com

This patch adds platform drm-device node to the dtsi file

Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 6d27ca4..b1fa93e 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -495,4 +495,8 @@
 		reg = <0x14400000 0x40000>;
 		interrupts = <18 5>, <18 4>, <18 6>;
 	};
+
+	drm-device {
+		compatible = "samsung,exynos-drm-device";
+	};
 };
-- 
1.7.0.4
