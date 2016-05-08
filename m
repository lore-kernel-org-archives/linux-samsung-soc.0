From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 15/22] ARM: dts: exynos: Use phandle to get parent node in exynos5250-snow
Date: Sun,  8 May 2016 21:06:00 +0200
Message-ID: <1462734367-5619-16-git-send-email-krzk@kernel.org>
References: <1462734367-5619-1-git-send-email-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462734367-5619-1-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

The i2c-arbitrator node in exynos5250-snow-common used absolute path to
reference other node (the i2c parent). Use phandle instead, because the
depth of the other node may be changed (like moving it under 'soc'
node).

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos5250-snow-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5250-snow-common.dtsi b/arch/arm/boot/dts/exynos5250-snow-common.dtsi
index ddfe1f558c10..419d59da1751 100644
--- a/arch/arm/boot/dts/exynos5250-snow-common.dtsi
+++ b/arch/arm/boot/dts/exynos5250-snow-common.dtsi
@@ -61,7 +61,7 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		i2c-parent = <&{/i2c@12CA0000}>;
+		i2c-parent = <&i2c_4>;
 
 		our-claim-gpio = <&gpf0 3 GPIO_ACTIVE_LOW>;
 		their-claim-gpios = <&gpe0 4 GPIO_ACTIVE_LOW>;
-- 
2.5.0
