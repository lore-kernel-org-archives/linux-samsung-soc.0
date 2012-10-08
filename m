From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH 0/5] Adding usb2.0 host-phy support for exynos5250
Date: Mon, 08 Oct 2012 19:42:23 +0530
Message-ID: <1349705548-15207-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:26639 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752967Ab2JHOIE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Oct 2012 10:08:04 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, gregkh@linuxfoundation.org, stern@rowland.harvard.edu, balbi@ti.com, rob.herring@calxeda.com, kgene.kim@samsung.com, jg1.han@samsung.com, thomas.abraham@linaro.org, kishon@ti.com, p.paneri@samsung.com, yulgon.kim@samsung.com

This patchset is based on the work by Praveen Paneri for
samsung-usbphy driver:
http://comments.gmane.org/gmane.linux.kernel.samsung-soc/12653

Tested on smdk5250 target with usb-next branch along with
arch patches for exynos5250:
http://thread.gmane.org/gmane.linux.kernel.samsung-soc/13042
http://thread.gmane.org/gmane.linux.kernel.samsung-soc/13048

Also tested successfully on smdkv310 for any break.

Vivek Gautam (5):
  usb: phy: samsung: Add host phy support to samsung-phy driver
  ARM: S3C64XX: Add phy_type to pmu_isolation
  ARM: Exynos5250: Enabling samsung-usbphy driver
  usb: s5p-ehci: Adding phy driver support
  usb: exynos-ohci: Adding phy driver support

 .../devicetree/bindings/usb/samsung-usbphy.txt     |   12 +-
 arch/arm/boot/dts/exynos5250.dtsi                  |    5 +
 arch/arm/mach-exynos/Kconfig                       |    1 +
 arch/arm/mach-exynos/include/mach/map.h            |    1 +
 arch/arm/mach-exynos/mach-exynos5-dt.c             |   10 +
 arch/arm/mach-exynos/setup-usb-phy.c               |   45 ++-
 arch/arm/mach-s3c64xx/setup-usb-phy.c              |    2 +-
 arch/arm/plat-samsung/include/plat/usb-phy.h       |    3 +-
 drivers/usb/host/ehci-s5p.c                        |   62 +++-
 drivers/usb/host/ohci-exynos.c                     |   62 +++-
 drivers/usb/phy/Kconfig                            |    1 -
 drivers/usb/phy/samsung-usbphy.c                   |  362 ++++++++++++++++++--
 include/linux/platform_data/samsung-usbphy.h       |    9 +-
 13 files changed, 497 insertions(+), 78 deletions(-)

-- 
1.7.6.5
