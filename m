From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH v1 2/2] ARM: dts: exynos5250: Add clocks to DISP1 domain
Date: Wed, 14 Oct 2015 12:44:17 +0200
Message-ID: <1444819457-27519-3-git-send-email-tomeu.vizoso@collabora.com>
References: <1444819457-27519-1-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444819457-27519-1-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Javier Martinez Canillas <javier@osg.samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kukjin Kim <kgene@kernel.org>, Inki Dae <inki.dae@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Adds to the node of the DISP1 power domain the two clocks that need to
be reparented while the domain is powered off:
CLK_MOUT_ACLK200_DISP1_SUB and CLK_MOUT_ACLK300_DISP1_SUB.

Otherwise the state is unknown at power up and the mixer's clocks are
all messed up.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Link: http://lkml.kernel.org/g/561CDC33.7050103@collabora.com
---

 arch/arm/boot/dts/exynos5250.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index b24610ea8c2a..88b9cf5f226f 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -130,6 +130,10 @@
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x100440A0 0x20>;
 		#power-domain-cells = <0>;
+		clocks = <&clock CLK_FIN_PLL>,
+			 <&clock CLK_MOUT_ACLK200_DISP1_SUB>,
+			 <&clock CLK_MOUT_ACLK300_DISP1_SUB>;
+		clock-names = "oscclk", "clk0", "clk1";
 	};
 
 	clock: clock-controller@10010000 {
-- 
2.5.0
