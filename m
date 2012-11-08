From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH v2 0/2] Enable ehci and ohci devices for exynos5250
Date: Thu, 08 Nov 2012 12:24:23 +0530
Message-ID: <1352357665-7435-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:36811 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751427Ab2KHGtk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 Nov 2012 01:49:40 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
Cc: linux-usb@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, jg1.han@samsung.com, thomas.abraham@linaro.org

Changes from v1:
 - Changed the device node names from 'ehci' and 'ohci' to
   'usb@12110000' and 'usb@12120000' as per discussion for the
   change 'http://www.spinics.net/lists/linux-usb/msg73993.html'
 - Rebased on for-next branch of linux-samsung.

Vivek Gautam (2):
  ARM: Exynos5250: Enabling ehci-s5p driver
  ARM: Exynos5250: Enabling ohci-exynos driver

 .../devicetree/bindings/usb/exynos-usb.txt         |   40 ++++++++++++++++++++
 arch/arm/boot/dts/exynos5250-smdk5250.dts          |    4 ++
 arch/arm/boot/dts/exynos5250.dtsi                  |   12 ++++++
 arch/arm/mach-exynos/include/mach/map.h            |    2 +
 arch/arm/mach-exynos/mach-exynos5-dt.c             |    4 ++
 5 files changed, 62 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/exynos-usb.txt

-- 
1.7.6.5
