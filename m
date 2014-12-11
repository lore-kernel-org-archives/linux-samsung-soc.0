From: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/4] phy: samsung-usb2: Add support for Vbus regulator
Date: Thu, 11 Dec 2014 17:32:43 +0530
Message-ID: <1418299367-2412-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

This has been on my to-do list for sometime.
Until now the host controller (specifically ehci-exynos) is responsible
for enabling VBUS supply. This opens up one more issue which is, when
only ohci-exynos is enabled and ehci-exynosis disabled then VBUS was
never enabled (since ohci did not have the code to enabled the VBUS supply).

Rather it should be wise to move the VBUS related stuff to phy driver and
let phy take care of enabling it.

This patch series adds that VBUS regulator to phy-samsung-usb2 driver,
adds necessary binding information as well as vbus-supply properties
to phy nodes on exynos5250 systems.
Also we have removed the samsung,vbus-gpio property from usb2 (ehci) node
on exynos5250 systems.

**[The older code in ehci-exynos for vbus setting is left intact to keep
supporting older dt bindings].

Vivek Gautam (4):
  Doc/devicetree: bindings: Update bindings information for USB3.0 DRD
    PHY
  phy: samsung-usb2: Add facility for VBUS supply
  arm: dts: exynos5250: Use regulator for USB 2.0 VBUS supply
  arm: dts: exynos5250: Remove vbus gpio property from usb 2.0 host

 .../devicetree/bindings/phy/samsung-phy.txt        |   12 ++++++++
 arch/arm/boot/dts/exynos5250-smdk5250.dts          |   22 ++++++++++++--
 arch/arm/boot/dts/exynos5250-snow.dts              |   22 ++++++++++++--
 drivers/phy/phy-samsung-usb2.c                     |   30 ++++++++++++++++++++
 drivers/phy/phy-samsung-usb2.h                     |    1 +
 5 files changed, 83 insertions(+), 4 deletions(-)

-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
