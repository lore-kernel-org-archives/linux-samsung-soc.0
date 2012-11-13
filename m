From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH] ARM: dts: exynos4210-trats: Remove broken-voltage property
 from sdhci node
Date: Tue, 13 Nov 2012 10:27:50 +0100
Message-ID: <1604189.yDsqlPMQyl@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:32972 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753177Ab2KMJ1y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Nov 2012 04:27:54 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MDF00C8U6A1GOV0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 13 Nov 2012 18:27:53 +0900 (KST)
Received: from amdc1227.localnet ([106.116.147.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MDF00LIA6AFZI50@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 13 Nov 2012 18:27:53 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>

The broken voltage property has been replaced with auto detection based
on voltages available on vmmc voltage regulator, so there is no use for
it now.

This patch removes the now unused property from Trats Device Tree
sources.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos4210-trats.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4210-trats.dts b/arch/arm/boot/dts/exynos4210-trats.dts
index a21511c..9d5d27a 100644
--- a/arch/arm/boot/dts/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/exynos4210-trats.dts
@@ -42,7 +42,6 @@
 	sdhci_emmc: sdhci@12510000 {
 		bus-width = <8>;
 		non-removable;
-		broken-voltage;
 		gpios = <&gpk0 0 2 0 3>,
 			<&gpk0 1 2 0 3>,
 			<&gpk0 3 2 2 3>,
-- 
1.8.0
