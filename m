From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v2 4/5] ARM: dts: exynos5420: Add clock for audss pinctrl
Date: Wed, 26 Nov 2014 15:24:16 +0100
Message-ID: <1417011857-10419-5-git-send-email-k.kozlowski@samsung.com>
References: <1417011857-10419-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1417011857-10419-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Abraham <thomas.abraham@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Vivek Gautam <gautam.vivek@samsung.com>, Kevin Hilman <khilman@kernel.org>
Cc: Russell King <linux@arm.linux.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The pinctrl for audio subsystem needs 'mau_epll' clock to be enabled in
order to properly access memory during GPIO setup.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/arm/boot/dts/exynos5420-pinctrl.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
index ba686e40eac7..c0ca0da36ade 100644
--- a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
@@ -696,6 +696,9 @@
 	};
 
 	pinctrl@03860000 {
+		clocks = <&clock CLK_MAU_EPLL>;
+		clock-names = "block";
+
 		gpz: gpz {
 			gpio-controller;
 			#gpio-cells = <2>;
-- 
1.9.1
