From: Beomho Seo <beomho.seo@samsung.com>
Subject: [PATCH 1/3] ARM: dts: replace number by macro in clock binding for
 exynos4
Date: Wed, 21 May 2014 17:39:42 +0900
Message-ID: <537C664E.6060704@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:41797 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751724AbaEUIkH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 May 2014 04:40:07 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>
Cc: Myungjoo Ham <myungjoo.ham@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

This patch replaces magic number of MIPI DSI Master node with
macros in clock binding for exynos4

Signed-off-by: Beomho Seo <beomho.seo@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 2f8bcd0..dc92731 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -117,7 +117,7 @@
 		samsung,power-domain = <&pd_lcd0>;
 		phys = <&mipi_phy 1>;
 		phy-names = "dsim";
-		clocks = <&clock 286>, <&clock 143>;
+		clocks = <&clock CLK_DSIM0>, <&clock CLK_SCLK_MIPI0>;
 		clock-names = "bus_clk", "pll_clk";
 		status = "disabled";
 		#address-cells = <1>;
-- 
1.7.9.5
