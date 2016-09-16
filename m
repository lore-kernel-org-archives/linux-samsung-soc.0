From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [RFC PATCH 00/10] ARM: dts: exynos: Fix invalid GIC interrupt flags
Date: Fri, 16 Sep 2016 21:42:41 +0200
Message-ID: <1474054971-16831-1-git-send-email-krzk@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Alban Browaeys <alban.browaeys-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

Marek (internally), Geert and Alban reported errors like:
	genirq: Setting trigger mode 0 for irq 16 failed (gic_set_type+0x0/0x68)
The patchset fixes this issue.

Tested on:
1. Exynos4412: Odroid U3,
2. Exynos5410: Odroid XU,
3. Exynos5422: Odroid XU3.

Other platforms not tested so testing would be highly appreciated.

Best regards,
Krzysztof

Krzysztof Kozlowski (10):
  ARM: dts: exynos: Fix invalid GIC interrupt flags in exynos4
  ARM: dts: exynos: Fix invalid GIC interrupt flags in exynos4210
  ARM: dts: exynos: Fix invalid GIC interrupt flags in exynos4x12
  ARM: dts: exynos: Fix invalid GIC interrupt flags in exynos4415
  ARM: dts: exynos: Fix invalid GIC interrupt flags in exynos3250
  ARM: dts: exynos: Fix invalid GIC interrupt flags in exynos5
  ARM: dts: exynos: Fix invalid GIC interrupt flags in exynos5250
  ARM: dts: exynos: Fix invalid GIC interrupt flags in
    exynos5410/exynos542x
  ARM: dts: exynos: Fix invalid GIC interrupt flags in exynos5260
  ARM: dts: exynos: Fix invalid GIC interrupt flags in exynos5440

 arch/arm/boot/dts/exynos3250-pinctrl.dtsi | 20 +++++--
 arch/arm/boot/dts/exynos3250.dtsi         | 93 +++++++++++++++++-------------
 arch/arm/boot/dts/exynos4.dtsi            | 94 ++++++++++++++++---------------
 arch/arm/boot/dts/exynos4210-pinctrl.dtsi | 20 +++++--
 arch/arm/boot/dts/exynos4210.dtsi         | 36 ++++++++----
 arch/arm/boot/dts/exynos4415-pinctrl.dtsi | 20 +++++--
 arch/arm/boot/dts/exynos4415.dtsi         | 92 +++++++++++++++++-------------
 arch/arm/boot/dts/exynos4x12-pinctrl.dtsi | 20 +++++--
 arch/arm/boot/dts/exynos4x12.dtsi         | 48 ++++++++++------
 arch/arm/boot/dts/exynos5.dtsi            | 60 ++++++++++++++------
 arch/arm/boot/dts/exynos5250.dtsi         | 80 +++++++++++++-------------
 arch/arm/boot/dts/exynos5260.dtsi         | 39 ++++++++-----
 arch/arm/boot/dts/exynos5410.dtsi         | 26 ++++-----
 arch/arm/boot/dts/exynos5420.dtsi         | 78 ++++++++++++-------------
 arch/arm/boot/dts/exynos5440.dtsi         | 48 ++++++++++------
 arch/arm/boot/dts/exynos54xx.dtsi         | 34 +++++------
 16 files changed, 485 insertions(+), 323 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
