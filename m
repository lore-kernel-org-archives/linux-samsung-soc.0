From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 0/5] add dt based support for iommu for hdmi
Date: Mon, 05 Nov 2012 13:01:20 +0530
Message-ID: <1352100685-7695-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:57006 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751027Ab2KEHON (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Nov 2012 02:14:13 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MD000H326RGAUQ0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 05 Nov 2012 16:14:11 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MD0000R36MFH8E0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 05 Nov 2012 16:14:11 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: tomasz.figa@gmail.com, kgene.kim@samsung.com, t.stanislaws@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, jy0922.shim@samsung.com, kyungmin.park@samsung.com, thomas.ab@samsung.com, prashanth.g@samsung.com, joshi@samsung.com, s.shirish@samsung.com, r.sh.open@gmail.com, rahul.sharma@samsung.com

This patchset enables the DT based iommu support for exynos5 platform
and iommu for drm hdmi driver. it
1) Adds iommu support for Exynos5250_DT platform.
2) Enables helper functions for dt platforms
3) Adds support for TV Iommu device for hdmi

based on "for-next" branch at
http://git.kernel.org/?p=linux/kernel/git/kgene/linux-samsung.git

Rahul Sharma (5):
  arm: exynos5: add tv iommu device to aux data lookup table
  arm: exynos5: add clock information for tv iommu device
  dts: exynos5: add dt node for tv iommu device
  arm: exynos5: add iommu support for exynos5250_DT platform
  arm: exynos: enable helper functions for dt based platforms

 arch/arm/boot/dts/exynos5250.dtsi          |   10 ++++++++++
 arch/arm/mach-exynos/Kconfig               |    1 +
 arch/arm/mach-exynos/clock-exynos5.c       |    4 ++--
 arch/arm/mach-exynos/include/mach/sysmmu.h |    9 +++++----
 arch/arm/mach-exynos/mach-exynos5-dt.c     |    2 ++
 5 files changed, 20 insertions(+), 6 deletions(-)
