From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH] ARM: dts: exynos4210-trats: Split memory into 4 sections
Date: Tue, 09 Oct 2012 12:39:59 +0200
Message-ID: <1349779199-30665-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:30478 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750780Ab2JIKkM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Oct 2012 06:40:12 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MBM0099QGAUENL0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 09 Oct 2012 19:40:10 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MBM00HNLGAPB390@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 09 Oct 2012 19:40:10 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, t.figa@samsung.com, tomasz.figa@gmail.com

Since the maximum section size on mach-exynos is set to 256MiB, boards
with memory configuration defined using sections bigger than 256MiB will
fail to boot with a kernel panic.

This patch modifies the dts file of Samsung Trats board to define four
sections of 256MiB instead of two of 512MiB to fix the boot problem.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
---
 arch/arm/boot/dts/exynos4210-trats.dts | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-trats.dts b/arch/arm/boot/dts/exynos4210-trats.dts
index 73567b8..a21511c 100644
--- a/arch/arm/boot/dts/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/exynos4210-trats.dts
@@ -20,8 +20,10 @@
 	compatible = "samsung,trats", "samsung,exynos4210";
 
 	memory {
-		reg =  <0x40000000 0x20000000
-			0x60000000 0x20000000>;
+		reg =  <0x40000000 0x10000000
+			0x50000000 0x10000000
+			0x60000000 0x10000000
+			0x70000000 0x10000000>;
 	};
 
 	chosen {
-- 
1.7.12
