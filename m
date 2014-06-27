From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V3 0/7] drm/exynos: Support DP CLKCON register in FIMD driver
Date: Fri, 27 Jun 2014 15:42:19 +0530
Message-ID: <1403863946-15492-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:33859 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752827AbaF0KO5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Jun 2014 06:14:57 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N7T009HKOGVFQ50@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 27 Jun 2014 19:14:55 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

This series is based on exynos-drm-next branch of Inki Dae's tree at:
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git

Changes since V2:
	Add DT property to know the type of FIMD output interface
	as per Inki's suggestion.
	Add samsung,output-type DT property in FIMD node for all boards
	supporting DP interface.

Ajay Kumar (7):
  [PATCH V3 1/7] drm/exynos: Support DP CLKCON register in FIMD driver
  [PATCH V3 2/7] ARM: dts: Add FIMD output property for snow
  [PATCH V3 3/7] ARM: dts: Add FIMD output property for peach_pit
  [PATCH V3 4/7] ARM: dts: Add FIMD output property for peach_pi
  [PATCH V3 5/7] ARM: dts: Add FIMD output property for smdk5250
  [PATCH V3 6/7] ARM: dts: Add FIMD output property for smdk5420
  [PATCH V3 7/7] ARM: dts: Add FIMD output property for arndale

 .../devicetree/bindings/video/samsung-fimd.txt     |    1 +
 arch/arm/boot/dts/exynos5250-arndale.dts           |    1 +
 arch/arm/boot/dts/exynos5250-smdk5250.dts          |    1 +
 arch/arm/boot/dts/exynos5250-snow.dts              |    1 +
 arch/arm/boot/dts/exynos5420-peach-pit.dts         |    1 +
 arch/arm/boot/dts/exynos5420-smdk5420.dts          |    1 +
 arch/arm/boot/dts/exynos5800-peach-pi.dts          |    1 +
 drivers/gpu/drm/exynos/exynos_drm_fimd.c           |   23 ++++++++++++++++++++
 include/video/samsung_fimd.h                       |    4 ++++
 9 files changed, 34 insertions(+)

-- 
1.7.9.5
