From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] ARM: dts: Fix CLK_UART_ISP_SCLK clock assignment in
 exynos4x12.dtsi
Date: Fri, 31 Oct 2014 14:34:16 +0100
Message-ID: <1414762456-7203-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:25519 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758302AbaJaNec (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 31 Oct 2014 09:34:32 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NEB00GZB9PID920@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 31 Oct 2014 22:34:30 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

Assign proper FIMC-IS UART gate clock in the device DT node and not
use the SRC_MASK gate. This fixes regression introduced in commit
a37c82a3b3c0910019abfd22a97be1f ("clk: samsung: exynos4: Remove
SRC_MASK_ISP gates").

Without this change exynos4 fimc-is driver fails to probe with an
error log:

[    1.842447] ERROR: could not get clock /camera/fimc-is@12000000:uart(13)
[    1.848529] exynos4-fimc-is 12000000.fimc-is: failed to get clock: uart
[    1.855275] exynos4-fimc-is: probe of 12000000.fimc-is failed with error -2

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 arch/arm/boot/dts/exynos4x12.dtsi |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
index 861bb91..dd98768 100644
--- a/arch/arm/boot/dts/exynos4x12.dtsi
+++ b/arch/arm/boot/dts/exynos4x12.dtsi
@@ -224,7 +224,7 @@
 				 <&clock CLK_DIV_ISP0>,<&clock CLK_DIV_ISP1>,
 				 <&clock CLK_DIV_MCUISP0>,
 				 <&clock CLK_DIV_MCUISP1>,
-				 <&clock CLK_SCLK_UART_ISP>,
+				 <&clock CLK_UART_ISP_SCLK>,
 				 <&clock CLK_ACLK200>, <&clock CLK_DIV_ACLK200>,
 				 <&clock CLK_ACLK400_MCUISP>,
 				 <&clock CLK_DIV_ACLK400_MCUISP>;
-- 
1.7.9.5
