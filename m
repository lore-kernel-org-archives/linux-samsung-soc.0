From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH] ARM: dts: smdk5250: Specify MAX77686 pmic interrupt
Date: Tue, 29 Jul 2014 09:57:09 +0530
Message-ID: <1406608029-8538-1-git-send-email-thomas.ab@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:12388 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750782AbaG2EaV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jul 2014 00:30:21 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N9G00HTDHUJ2UC0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 29 Jul 2014 13:30:19 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org

The IRQB interrupt pin of MAX77686 PMIC is connected to GPX3[2] pin of
Exynos5250 on the Exynos5250 SMDK board. Specify this connection using
interrupts property for the max77686 pmic node.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 arch/arm/boot/dts/exynos5250-smdk5250.dts |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 695f5ad..cf38808 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -50,6 +50,8 @@
 		max77686@09 {
 			compatible = "maxim,max77686";
 			reg = <0x09>;
+			interrupt-parent = <&gpx3>;
+			interrupts = <2 0>;
 
 			voltage-regulators {
 				ldo1_reg: LDO1 {
-- 
1.7.9.5
