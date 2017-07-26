From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2] ARM: dts: exynos: fix PCI bus dtc warnings
Date: Wed, 26 Jul 2017 16:09:38 -0500
Message-ID: <20170726210943.6875-2-robh@kernel.org>
References: <20170726210943.6875-1-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170726210943.6875-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

dtc recently added PCI bus checks. Fix these warnings.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
v2:
- rebase on v4.13-rc2

 arch/arm/boot/dts/exynos5440.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5440.dtsi b/arch/arm/boot/dts/exynos5440.dtsi
index bc4954e69f7b..7a00be7ea6d7 100644
--- a/arch/arm/boot/dts/exynos5440.dtsi
+++ b/arch/arm/boot/dts/exynos5440.dtsi
@@ -317,6 +317,7 @@
 		phys = <&pcie_phy0>;
 		ranges = <0x81000000 0 0	  0x40001000 0 0x00010000   /* downstream I/O */
 			  0x82000000 0 0x40011000 0x40011000 0 0x1ffef000>; /* non-prefetchable memory */
+		bus-range = <0x00 0xff>;
 		#interrupt-cells = <1>;
 		interrupt-map-mask = <0 0 0 0>;
 		interrupt-map = <0x0 0 &gic 53>;
@@ -339,6 +340,7 @@
 		phys = <&pcie_phy1>;
 		ranges = <0x81000000 0 0	  0x60001000 0 0x00010000   /* downstream I/O */
 			  0x82000000 0 0x60011000 0x60011000 0 0x1ffef000>; /* non-prefetchable memory */
+		bus-range = <0x00 0xff>;
 		#interrupt-cells = <1>;
 		interrupt-map-mask = <0 0 0 0>;
 		interrupt-map = <0x0 0 &gic 56>;
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
