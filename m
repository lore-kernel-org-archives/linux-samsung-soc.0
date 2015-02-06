From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [RFC PATCH v2 3/3] ARM: dts: exynos5420: add async-bridge clocks to
 disp1 power domain
Date: Fri, 06 Feb 2015 11:55:54 +0100
Message-ID: <1423220154-5333-1-git-send-email-a.hajda@samsung.com>
References: <54D48701.10105@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <54D48701.10105@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, javier.martinez@collabora.co.uk, Liquid.Acid@gmx.net, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org

FIMD and MIXER IPs in disp1 power domain have async-bridges (to GSCALER),
therefore their clocks should be enabled during power domain switch.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
Hi,

This is 2nd version of the patch. After decrypting manual and discussion
with Marek I guess this set of clocks is more apropriate - async-bridges
are present in MIXER and FIMD, so their clocks should be enabled.

The 1st version worked for me due to fact I have forgot to remove
clk_ignore_unused kernel boot option during tests ;)

Regards
Andrzej
---
 arch/arm/boot/dts/exynos5420.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index e1fa800..58579f5 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -293,9 +293,11 @@
 			 <&clock CLK_MOUT_SW_ACLK300>,
 			 <&clock CLK_MOUT_USER_ACLK300_DISP1>,
 			 <&clock CLK_MOUT_SW_ACLK400>,
-			 <&clock CLK_MOUT_USER_ACLK400_DISP1>;
+			 <&clock CLK_MOUT_USER_ACLK400_DISP1>,
+			 <&clock CLK_FIMD1>, <&clock CLK_MIXER>;
 		clock-names = "oscclk", "pclk0", "clk0",
-			      "pclk1", "clk1", "pclk2", "clk2";
+			      "pclk1", "clk1", "pclk2", "clk2",
+			      "asb0", "asb1";
 	};
 
 	pinctrl_0: pinctrl@13400000 {
-- 
1.9.1
