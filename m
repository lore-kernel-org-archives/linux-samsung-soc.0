From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 3/4] ARM: dts: exynos4210-origen: Update sdhci nodes for
 current bindings
Date: Mon, 19 Nov 2012 15:46:35 +0100
Message-ID: <1353336396-21161-4-git-send-email-t.figa@samsung.com>
References: <1353336396-21161-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:38107 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751994Ab2KSOq7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Nov 2012 09:46:59 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MDQ0007LP1XFW40@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 Nov 2012 23:46:58 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MDQ009FTP1R53A0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 Nov 2012 23:46:57 +0900 (KST)
In-reply-to: <1353336396-21161-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, thomas.abraham@linaro.org, jhkim@insignal.co.kr, m.szyprowski@samsung.com, t.figa@samsung.com, tomasz.figa@gmail.com

This patch modifies sdhci nodes present in Origen device tree source
to use current generic mmc bindings.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos4210-origen.dts | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
index 2eb1332..5395875 100644
--- a/arch/arm/boot/dts/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/exynos4210-origen.dts
@@ -33,18 +33,14 @@
 	};
 
 	sdhci@12530000 {
-		samsung,sdhci-bus-width = <4>;
-		linux,mmc_cap_4_bit_data;
-		samsung,sdhci-cd-internal;
+		bus-width = <4>;
 		pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_bus4 &sd2_cd>;
 		pinctrl-names = "default";
 		status = "okay";
 	};
 
 	sdhci@12510000 {
-		samsung,sdhci-bus-width = <4>;
-		linux,mmc_cap_4_bit_data;
-		samsung,sdhci-cd-internal;
+		bus-width = <4>;
 		pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus4 &sd0_cd>;
 		pinctrl-names = "default";
 		status = "okay";
-- 
1.8.0
