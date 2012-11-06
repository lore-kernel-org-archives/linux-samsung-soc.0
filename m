From: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/2] Adding USB 3.0 DRD-phy support for exynos5250
Date: Tue, 06 Nov 2012 21:06:35 +0530
Message-ID: <1352216197-11828-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, yulgon.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, av.tikhomirov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

This patchset is based on the work for USB 2.0 host phy support
for exynos5250
https://lists.ozlabs.org/pipermail/devicetree-discuss/2012-November/021915.html

Based on 'usb-next' branch.
Tested on smdk5250 with following patch-series:
https://lists.ozlabs.org/pipermail/devicetree-discuss/2012-November/021923.html
http://www.spinics.net/lists/linux-usb/msg73857.html

Vivek Gautam (2):
  USB: PHY: Add support for USB 3.0 phy for exynos5250
  ARM: Exynos5250: Enabling USB 3.0 phy for samsung-usbphy driver

 arch/arm/boot/dts/exynos5250.dtsi            |    3 +-
 arch/arm/mach-exynos/include/mach/regs-pmu.h |    4 +
 arch/arm/mach-exynos/setup-usb-phy.c         |    9 +
 drivers/usb/phy/samsung-usbphy.c             |  337 ++++++++++++++++++++++++++
 include/linux/usb/samsung_usb_phy.h          |    1 +
 5 files changed, 353 insertions(+), 1 deletions(-)

-- 
1.7.6.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
