From: Andrzej Pietrasiewicz <andrzej.p-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/2] dwc3 on XU3 and XU4
Date: Mon, 18 Sep 2017 12:02:12 +0200
Message-ID: <1505728934-6200-1-git-send-email-andrzej.p@samsung.com>
References: <CGME20170918100229eucas1p24733d7108dfbcf16a59476c1efd7d56a@eucas1p2.samsung.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Andrzej Pietrasiewicz <andrzej.p-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi all,

this short series addresses two issues.

The first issue is devices not enumerating when connected to an Odroid XU4,
to its 3.0 root hub. The interplay between refactoring certain parts of
dwc3's code and handling the SUSPHY quirk results in the said problem.
Please see: https://patchwork.kernel.org/patch/9535235/
Actually using the quirk solves it.

The second issue is devices not enumerating and/or wrongly enumerating
as high speed instead of super speed on an Odroid XU3. There was a patch
series from Vivek Gautam in circulation, but it got lost somehow.
Please see:

https://lkml.org/lkml/2014/9/2/166
https://lkml.org/lkml/2015/2/2/257

I adapted his patch so that it does not use a hacky solution to force
additional initialization in order for calibration to happen.
Instead I used the .reset() in phy_ops. I could have used the .set_mode(),
but the calibration must happen only after dwc3_host_init() but
phy_set_mode() is called either after of before it. With this patch
enumeration happens correctly and a super speed device is recognized as such.

Rebased onto v4.13. It also applies cleanly to Felipe's testing/next.

Andrzej Pietrasiewicz (1):
  ARM: dts: exynos: Add dwc3 SUSPHY quirk

Vivek Gautam (1):
  phy: exynos5-usbdrd: Calibrate LOS levels for exynos5420/5800

 arch/arm/boot/dts/exynos54xx.dtsi        |   2 +
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 183 +++++++++++++++++++++++++++++++
 drivers/usb/dwc3/core.c                  |   8 +-
 3 files changed, 191 insertions(+), 2 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
