From: Prasanna Kumar <prasanna.ps@samsung.com>
Subject: [PATCH 1/3] ARM: dts: exynos5: Add power domain clocks to pd node of
 Gscaler and MFC
Date: Wed, 09 Jan 2013 18:24:39 +0530
Message-ID: <1357736081-19390-2-git-send-email-prasanna.ps@samsung.com>
References: <1357736081-19390-1-git-send-email-prasanna.ps@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:18286 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757478Ab3AIMuy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Jan 2013 07:50:54 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGC00IFOZOBZ6H0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 Jan 2013 21:50:52 +0900 (KST)
Received: from user-ubuntu.sisodomain.com ([107.108.83.235])
 by mmp2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MGC00CPHZLNZ970@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 Jan 2013 21:50:52 +0900 (KST)
In-reply-to: <1357736081-19390-1-git-send-email-prasanna.ps@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, t.figa@samsung.com, jhbird.choi@samsung.com
Cc: Prasanna Kumar <prasanna.ps@samsung.com>

Power domain clks are added to Gscaler and MFC pd nodes.
These clocks are saved during power off.

Signed-off-by: Prasanna Kumar <prasanna.ps@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 6d0e87c..8043be3 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -558,11 +558,13 @@
 	pd_gsc: gsc-power-domain@0x10044000 {
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x10044000 0x20>;
+		samsung,exynos-pd-clks ="aclk_266_gscl","aclk_300_gscl";
 	};
 
 	pd_mfc: mfc-power-domain@0x10044040 {
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x10044040 0x20>;
+		samsung,exynos-pd-clks ="aclk_333";
 	};
 
 	gsc_0:  gsc@0x13e00000 {
-- 
1.7.5.4
