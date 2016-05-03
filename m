From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RFC PATCH 08/12] ARM: dts: exynos: Prepare for inclusion of exynos5.dtsi in exynos5410.dtsi
Date: Tue,  3 May 2016 19:52:25 +0200
Message-ID: <1462297949-13824-9-git-send-email-krzk@kernel.org>
References: <1462297949-13824-1-git-send-email-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462297949-13824-1-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Inki Dae <inki.dae@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Add 'sromc' label to SROM memory controller in common exynos5.dtsi so it
can be referenced by ihneriting DTSI.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos5.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
index fe901152f3ea..7c83dc6ef972 100644
--- a/arch/arm/boot/dts/exynos5.dtsi
+++ b/arch/arm/boot/dts/exynos5.dtsi
@@ -31,7 +31,7 @@
 		reg = <0x10000000 0x100>;
 	};
 
-	memory-controller@12250000 {
+	sromc: memory-controller@12250000 {
 		compatible = "samsung,exynos4210-srom";
 		reg = <0x12250000 0x14>;
 	};
-- 
2.5.0
