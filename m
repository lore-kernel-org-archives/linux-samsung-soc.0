From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH v3 0/4] Adding usb2.0 host-phy support for exynos5250
Date: Mon, 29 Oct 2012 19:12:36 +0530
Message-ID: <1351518160-22369-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:47911 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755105Ab2J2Nhr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Oct 2012 09:37:47 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: gregkh@linuxfoundation.org, stern@rowland.harvard.edu, balbi@ti.com, rob.herring@calxeda.com, kgene.kim@samsung.com, jg1.han@samsung.com, yulgon.kim@samsung.com, thomas.abraham@linaro.org, kishon@ti.com, p.paneri@samsung.com

This patchset is based on the work by Praveen Paneri for
samsung-usbphy driver:
http://comments.gmane.org/gmane.linux.kernel.samsung-soc/12653

Changes from v2:
 - Using "EXYNOS5_PHY_" as common prefix along with exact names for
   PHY SFRs for register definitions
 - Using register names with bit macros to make things more clear.
 - Removed parentheses around 0x230 in definition for EXYNOS5_USB_CFG
   in [patch 2/4 v2].

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
 drivers/usb/phy/samsung-usbphy.c                   |  369 ++++++++++++++++++--
 include/linux/platform_data/samsung-usbphy.h       |    9 +-
 13 files changed, 508 insertions(+), 80 deletions(-)

-- 
1.7.6.5
