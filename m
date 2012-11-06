From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH v4 0/5] Adding usb2.0 host-phy support for exynos5250
Date: Tue, 06 Nov 2012 20:24:54 +0530
Message-ID: <1352213699-11112-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:42980 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751108Ab2KFOuX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Nov 2012 09:50:23 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: gregkh@linuxfoundation.org, stern@rowland.harvard.edu, balbi@ti.com, rob.herring@calxeda.com, kgene.kim@samsung.com, jg1.han@samsung.com, yulgon.kim@samsung.com, thomas.abraham@linaro.org, kishon@ti.com, p.paneri@samsung.com

This patchset is based on the work by Praveen Paneri for
samsung-usbphy driver:
http://www.spinics.net/lists/linux-usb/msg73518.html

Changes from v3:
 - Moved enums S5P_USB_PHY_DEVICE, S5P_USB_PHY_HOST from machine to file
   include/linux/usb/samsung_usb_phy.h as USB_PHY_TYPE_DEVICE and
   USB_PHY_TYPE_HOST to make it more generic. Further resolve its
   dependencies.
 - Introduced a function 'samsung_usbphy_set_type()' which takes
   care of setting up the phy_type: HOST/DEVICE. This function
   can be called by host/otg drivers to setup phy_type prior to
   handling the respective PHYs.
 - Added an error-path for HOST type phy in s5p_usb_phy_pmu_isolation()
   for 'mach-s3c64xx'.
 - Moving to PHY driver as default for ehci-s5p and ohci-exynos, and only
   when failed fall back to plat-data.
 - Added samsung_usbphy_set_type() prior to doing usb_phy_init() or
   usb_phy_shutdown() so that appropriate PHY gets init or shutdown.

Tested on smdk5250 target with usb-next branch along with arch patches
for exynos5250:
http://thread.gmane.org/gmane.linux.kernel.samsung-soc/13042
http://thread.gmane.org/gmane.linux.kernel.samsung-soc/13048

Vivek Gautam (5):
  ARM: EXYNOS: Update & move usb-phy types to generic include layer
  usb: phy: samsung: Add host phy support to samsung-phy driver
  ARM: Exynos5250: Enabling samsung-usbphy driver
  USB: ehci-s5p: Add phy driver support
  USB: ohci-exynos: Add phy driver support

 .../devicetree/bindings/usb/samsung-usbphy.txt     |   12 +-
 arch/arm/boot/dts/exynos5250.dtsi                  |    5 +
 arch/arm/mach-exynos/Kconfig                       |    1 +
 arch/arm/mach-exynos/include/mach/map.h            |    1 +
 arch/arm/mach-exynos/mach-exynos5-dt.c             |    9 +
 arch/arm/mach-exynos/setup-usb-phy.c               |   52 ++-
 arch/arm/mach-s3c64xx/setup-usb-phy.c              |   18 +-
 arch/arm/mach-s5pv210/setup-usb-phy.c              |    5 +-
 arch/arm/plat-samsung/include/plat/usb-phy.h       |    8 +-
 drivers/usb/host/ehci-s5p.c                        |   71 +++-
 drivers/usb/host/ohci-exynos.c                     |   71 +++-
 drivers/usb/phy/Kconfig                            |    2 +-
 drivers/usb/phy/samsung-usbphy.c                   |  383 ++++++++++++++++++--
 include/linux/platform_data/samsung-usbphy.h       |    4 +-
 include/linux/usb/samsung_usb_phy.h                |   30 ++
 15 files changed, 571 insertions(+), 101 deletions(-)
 create mode 100644 include/linux/usb/samsung_usb_phy.h

-- 
1.7.6.5
