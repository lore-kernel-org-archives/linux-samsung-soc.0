From: Andrzej Pietrasiewicz <andrzej.p-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 1/2] ARM: dts: exynos: Add dwc3 SUSPHY quirk
Date: Mon, 18 Sep 2017 12:02:13 +0200
Message-ID: <1505728934-6200-2-git-send-email-andrzej.p@samsung.com>
References: <1505728934-6200-1-git-send-email-andrzej.p@samsung.com>
        <CGME20170918100230eucas1p29fae00c53f1106af1961a6e269740b2f@eucas1p2.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1505728934-6200-1-git-send-email-andrzej.p-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Andrzej Pietrasiewicz <andrzej.p-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Odroid XU4 board does not enumerate SuperSpeed devices.
This patch makes exynos5 series chips use USB SUSPHY quirk,
which solves the problem.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/exynos54xx.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/exynos54xx.dtsi b/arch/arm/boot/dts/exynos54xx.dtsi
index 0389e8a..8ca4fef 100644
--- a/arch/arm/boot/dts/exynos54xx.dtsi
+++ b/arch/arm/boot/dts/exynos54xx.dtsi
@@ -134,6 +134,7 @@
 				interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
 				phys = <&usbdrd_phy0 0>, <&usbdrd_phy0 1>;
 				phy-names = "usb2-phy", "usb3-phy";
+				snps,dis_u3_susphy_quirk;
 			};
 		};
 
@@ -154,6 +155,7 @@
 				reg = <0x12400000 0x10000>;
 				phys = <&usbdrd_phy1 0>, <&usbdrd_phy1 1>;
 				phy-names = "usb2-phy", "usb3-phy";
+				snps,dis_u3_susphy_quirk;
 			};
 		};
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
