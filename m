From: Stuart Menefy <stuart.menefy@mathembedded.com>
Subject: [PATCH v2 4/4] ARM: dts: exynos: Fix interrupt for shared EINTs on Exynos5260
Date: Tue, 19 Feb 2019 13:03:37 +0000
Message-ID: <20190219130337.21353-5-stuart@menefy.org>
References: <20190219130337.21353-1-stuart@menefy.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190219130337.21353-1-stuart@menefy.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

From: Stuart Menefy <stuart.menefy@mathembedded.com>

Fix the interrupt information for the GPIO lines with a shared EINT
interrupt.

Signed-off-by: Stuart Menefy <stuart.menefy@mathembedded.com>
---
 arch/arm/boot/dts/exynos5260.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5260.dtsi b/arch/arm/boot/dts/exynos5260.dtsi
index a8c7c6e589a0..3581b57fbbf7 100644
--- a/arch/arm/boot/dts/exynos5260.dtsi
+++ b/arch/arm/boot/dts/exynos5260.dtsi
@@ -227,7 +227,7 @@
 			wakeup-interrupt-controller {
 				compatible = "samsung,exynos4210-wakeup-eint";
 				interrupt-parent = <&gic>;
-				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
 			};
 		};
 
-- 
2.13.6
