From: Maciej Purski <m.purski@samsung.com>
Subject: [PATCH 09/12] ARM: dts: exynos5250: add mipi-phy node
Date: Mon, 28 May 2018 11:47:13 +0200
Message-ID: <1527500833-16005-10-git-send-email-m.purski@samsung.com>
References: <1527500833-16005-1-git-send-email-m.purski@samsung.com>
        <CGME20180528094729eucas1p1cc26ea191a4ee1ba9daa06fae93037bf@eucas1p1.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1527500833-16005-1-git-send-email-m.purski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Maciej Purski <m.purski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The patch adds phy node, required by MIPI devices.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
Signed-off-by: Maciej Purski <m.purski@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 2daf505..a63b655 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -733,6 +733,12 @@
 			#phy-cells = <0>;
 		};
 
+		mipi_phy: video-phy@10040710 {
+			compatible = "samsung,s5pv210-mipi-video-phy";
+			#phy-cells = <1>;
+			syscon = <&pmu_system_controller>;
+		};
+
 		adc: adc@12d10000 {
 			compatible = "samsung,exynos-adc-v1";
 			reg = <0x12D10000 0x100>;
-- 
2.7.4
