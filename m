From: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH] ARM: Exynos5420: dt: Fixed the checkpatch.pl WARNING misspelled
Date: Sat, 21 Mar 2015 06:53:51 +1030
Message-ID: <1426883031-3518-1-git-send-email-linux.amoon@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f67.google.com ([209.85.220.67]:34755 "EHLO
	mail-pa0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751064AbbCTUYZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Mar 2015 16:24:25 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>

Changes fixes the misspelled of #interrups-cell.

arch/arm/boot/dts/exynos5420.dtsi:224: WARNING: 'interrups'
	 may be misspelled - perhaps 'interrupts'?

Tested on OdroidXU3 board.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm/boot/dts/exynos5420.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index c0e98cf..a78ac1f 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -221,7 +221,7 @@
 		compatible = "samsung,exynos4210-mct";
 		reg = <0x101C0000 0x800>;
 		interrupt-controller;
-		#interrups-cells = <1>;
+		#interrupt-cells = <1>;
 		interrupt-parent = <&mct_map>;
 		interrupts = <0>, <1>, <2>, <3>, <4>, <5>, <6>, <7>,
 				<8>, <9>, <10>, <11>;
-- 
1.9.1
