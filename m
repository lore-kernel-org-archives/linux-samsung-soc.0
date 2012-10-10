From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH 0/4 v2] Adding usb2.0 host-phy support for exynos5250
Date: Wed, 10 Oct 2012 16:12:56 +0530
Message-ID: <1349865780-7701-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:22826 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755138Ab2JJKiF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Oct 2012 06:38:05 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, gregkh@linuxfoundation.org, stern@rowland.harvard.edu, balbi@ti.com, rob.herring@calxeda.com, kgene.kim@samsung.com, jg1.han@samsung.com, thomas.abraham@linaro.org, kishon@ti.com, p.paneri@samsung.com, yulgon.kim@samsung.com

This patchset is based on the work by Praveen Paneri for
samsung-usbphy driver:
http://comments.gmane.org/gmane.linux.kernel.samsung-soc/12653

Changes from v1:
 - squashed the patch "ARM: S3C64XX: Add phy_type to pmu_isolation" into
   "usb: phy: samsung: Add host phy support to samsung-phy driver".
 - moved similar change of adding phy_type to pmu_isolation for exynos from
   "ARM: Exynos5250: Enabling samsung-usbphy driver" to
   "usb: phy: samsung: Add host phy support to samsung-phy driver".
 - moved s5p_usb_phy_pmu_isolation() declaration from
   "ARM: Exynos5250: Enabling samsung-usbphy driver" to
   "usb: phy: samsung: Add host phy support to samsung-phy driver".
 - moved phy_cfg_sel function pointer declaration from
   "usb: phy: samsung: Add host phy support to samsung-phy driver" to
   "ARM: Exynos5250: Enabling samsung-usbphy driver".
 - Replaced the patch subject "usb: s5p-ehci: Adding phy driver support" and
   "usb: exynos-ohci: Adding phy driver support" with
   "USB: ehci-s5p: Add phy driver support" and
   "USB: ohci-exynos: Add phy driver support" respectively.
 - Corrected the header include order in ehci-s5p and ohci-exynos.
 - Corrected wrong error path for s5p_ehci_phy_disable() and
   exynos_ohci_phy_disable() in ehci-s5p and ohci-exynos respectively.

Tested on smdk5250 target with usb-next branch along with arch patches
for exynos5250:
http://thread.gmane.org/gmane.linux.kernel.samsung-soc/13042
http://thread.gmane.org/gmane.linux.kernel.samsung-soc/13048

Vivek Gautam (4):
  usb: phy: samsung: Add host phy support to samsung-phy driver
  ARM: Exynos5250: Enabling samsung-usbphy driver
  USB: ehci-s5p: Add phy driver support
  USB: ohci-exynos: Add phy driver support

 .../devicetree/bindings/usb/samsung-usbphy.txt     |   12 +-
 arch/arm/boot/dts/exynos5250.dtsi                  |    5 +
 arch/arm/mach-exynos/Kconfig                       |    1 +
 arch/arm/mach-exynos/include/mach/map.h            |    1 +
 arch/arm/mach-exynos/mach-exynos5-dt.c             |   10 +
 arch/arm/mach-exynos/setup-usb-phy.c               |   45 ++-
 arch/arm/mach-s3c64xx/setup-usb-phy.c              |    2 +-
 arch/arm/plat-samsung/include/plat/usb-phy.h       |    3 +-
 drivers/usb/host/ehci-s5p.c                        |   65 +++-
 drivers/usb/host/ohci-exynos.c                     |   65 +++-
 drivers/usb/phy/Kconfig                            |    1 -
 drivers/usb/phy/samsung-usbphy.c                   |  368 ++++++++++++++++++--
 include/linux/platform_data/samsung-usbphy.h       |    9 +-
 13 files changed, 507 insertions(+), 80 deletions(-)

-- 
1.7.6.5
