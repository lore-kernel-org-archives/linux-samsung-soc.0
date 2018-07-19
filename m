From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RFT 07/10] ARM: dts: s5pv210: Switch to S5Pv210 specific pinctrl wakeup compatible
Date: Thu, 19 Jul 2018 18:00:47 +0200
Message-ID: <20180719160050.22566-8-krzk@kernel.org>
References: <20180719160050.22566-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180719160050.22566-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Alim Akhtar <alim.akhtar@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The pin controller block of S5Pv210 for handling external wakeup
interrupts is different than in newer designs (Exynos).

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/s5pv210.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/s5pv210.dtsi b/arch/arm/boot/dts/s5pv210.dtsi
index 67358562a6ea..75f454a210d6 100644
--- a/arch/arm/boot/dts/s5pv210.dtsi
+++ b/arch/arm/boot/dts/s5pv210.dtsi
@@ -120,7 +120,7 @@
 			interrupts = <30>;
 
 			wakeup-interrupt-controller {
-				compatible = "samsung,exynos4210-wakeup-eint";
+				compatible = "samsung,s5pv210-wakeup-eint";
 				interrupts = <16>;
 				interrupt-parent = <&vic0>;
 			};
-- 
2.14.1
