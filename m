From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH] ARM: dts: exynos: remove display-port node from Arndale
Date: Thu, 06 Dec 2018 15:16:35 +0100
Message-ID: <20181206141635.15610-1-a.hajda@samsung.com>
References: <CGME20181206141638eucas1p17743a2bf7d02fce13825007938e07340@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Arndale boards have wires for DSI and eDP panels, but in-kernel support
for eDP panels is broken for long time and breaks display support even on
boards with DSI panels.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 arch/arm/boot/dts/exynos5250-arndale.dts | 25 ------------------------
 1 file changed, 25 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index e2e5b3f28686..2ca9319f48f2 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -181,31 +181,6 @@
 	};
 };
 
-&dp {
-	status = "okay";
-	samsung,color-space = <0>;
-	samsung,color-depth = <1>;
-	samsung,link-rate = <0x0a>;
-	samsung,lane-count = <4>;
-
-	display-timings {
-		native-mode = <&timing0>;
-
-		timing0: timing {
-			/* 2560x1600 DP panel */
-			clock-frequency = <50000>;
-			hactive = <2560>;
-			vactive = <1600>;
-			hfront-porch = <48>;
-			hback-porch = <80>;
-			hsync-len = <32>;
-			vback-porch = <16>;
-			vfront-porch = <8>;
-			vsync-len = <6>;
-		};
-	};
-};
-
 &fimd {
 	status = "okay";
 };
-- 
2.17.1
