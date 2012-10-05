From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH 0/2] Enable ehci and ohci devices for exynos5250
Date: Fri, 05 Oct 2012 15:40:16 +0530
Message-ID: <1349431818-15639-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:38312 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755265Ab2JEKFG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 5 Oct 2012 06:05:06 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MBF00DBP00BN010@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 05 Oct 2012 19:05:05 +0900 (KST)
Received: from vivekkumarg-linuxpc.sisodomain.com ([107.108.73.134])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MBF00HBA008FE50@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 05 Oct 2012 19:05:04 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, thomas.abraham@linaro.org, kyungmin.park@samsung.com, jg1.han@samsung.com

Based on for-next branch of linux-samsung.

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
