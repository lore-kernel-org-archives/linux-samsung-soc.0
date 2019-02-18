From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 1/3] ARM: dts: exynos: Use stdout path property on Arndale Octa board
Date: Mon, 18 Feb 2019 18:32:56 +0100
Message-ID: <20190218173258.7071-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Markus Reichl <reichl@t-online.de>
List-Id: linux-samsung-soc@vger.kernel.org

Replacing bootargs with stdout-path property in chosen node allows using
early console by adding just 'earlycon' parameter to kernel command
line.

Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos5420-arndale-octa.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
index 3447160e1fbf..832757999e4f 100644
--- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
+++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
@@ -24,7 +24,7 @@
 	};
 
 	chosen {
-		bootargs = "console=ttySAC3,115200";
+		stdout-path = "serial3:115200n8";
 	};
 
 	firmware@2073000 {
-- 
2.17.1
