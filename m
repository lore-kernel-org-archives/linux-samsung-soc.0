From: Prathyush K <prathyush.k@samsung.com>
Subject: [PATCH] ARM: exynos: Revise HDMI resource size
Date: Thu, 27 Dec 2012 03:22:21 -0500
Message-ID: <1356596541-20457-1-git-send-email-prathyush.k@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:28643 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751075Ab2L0IAE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 Dec 2012 03:00:04 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MFO008KQJJFI8T0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 27 Dec 2012 16:59:58 +0900 (KST)
Received: from chrome-ubuntu.sisodomain.com ([107.108.73.106])
 by mmp2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MFO00DZNJJU5W50@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 27 Dec 2012 16:59:58 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

From: Sean Paul <seanpaul@chromium.org>

Reduce the HDMI resource size from 0x100000 to 0x70000 so it
doesn't overlap the Displayport resource space.
HDMI: (0x14530000 - 0x145A0000
DP: (0x145B0000 - 0x145B1000)

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Prathyush K <prathyush.k@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 45799e8..30485de 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -580,7 +580,7 @@
 
 	hdmi {
 		compatible = "samsung,exynos5-hdmi";
-		reg = <0x14530000 0x100000>;
+		reg = <0x14530000 0x70000>;
 		interrupts = <0 95 0>;
 	};
 
-- 
1.8.0
