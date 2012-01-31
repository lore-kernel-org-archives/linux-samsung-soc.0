From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v2] ARM: Exynos4: Add cpu-offset property in gic device tree
 node
Date: Tue, 31 Jan 2012 20:59:49 +0530
Message-ID: <1328023789-4672-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:51062 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753601Ab2AaPYF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Jan 2012 10:24:05 -0500
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LYO006UR5G34440@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 01 Feb 2012 00:24:03 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LYO000GQ5FUPU70@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Wed, 01 Feb 2012 00:24:03 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org

Commit db0d4db22a78 ('ARM: gic: allow GIC to support non-banked setups)
requires a cpu-offset property to be specified for non-banked gic
controllers, which is the case for Exynos4.

Reported-by: Karol Lewandowski <k.lewandowski@samsung.com>
Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
This patch solves the issue of boot failure with SMP enabled kernel for
Exynos4 device tree enabled machine.

 arch/arm/boot/dts/exynos4210.dtsi |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index 63d7578..a1dd2ee 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -29,6 +29,7 @@
 		compatible = "arm,cortex-a9-gic";
 		#interrupt-cells = <3>;
 		interrupt-controller;
+		cpu-offset = <0x8000>;
 		reg = <0x10490000 0x1000>, <0x10480000 0x100>;
 	};
 
-- 
1.6.6.rc2
