From: Andi Shyti <andi.shyti@samsung.com>
Subject: [PATCH 4/4] ARM64: dts: exynos5433: remove unused code
Date: Thu, 29 Dec 2016 17:42:11 +0900
Message-ID: <20161229084211.20442-5-andi.shyti@samsung.com>
References: <20161229084211.20442-1-andi.shyti@samsung.com>
 <CGME20161229084222epcas5p41dacaeed3e2d4f10b07eee3930f7531c@epcas5p4.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20161229084211.20442-1-andi.shyti@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, Andi Shyti <andi@etezian.org>
List-Id: linux-samsung-soc@vger.kernel.org

Because the pinctrl DTS is using the samsung.h macros, the
previously pin defines are anused. Remove them.

Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi
index 9afed9fcf7e1..3c821e5c241e 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi
@@ -14,19 +14,6 @@
 
 #include <dt-bindings/pinctrl/samsung.h>
 
-#define PIN_PULL_NONE		0
-#define PIN_PULL_DOWN		1
-#define PIN_PULL_UP		3
-
-#define PIN_DRV_LV1		0
-#define PIN_DRV_LV2		2
-#define PIN_DRV_LV3		1
-#define PIN_DRV_LV4		3
-
-#define PIN_IN			0
-#define PIN_OUT			1
-#define PIN_FUNC1		2
-
 #define PIN(_func, _pin, _pull, _drv)					\
 	_pin {								\
 		samsung,pins = #_pin;					\
-- 
2.11.0
