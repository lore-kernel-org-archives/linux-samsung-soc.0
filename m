From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v1 0/6] arm: exynos: add dt based support for exynos5 hdmi
Date: Fri, 12 Oct 2012 00:27:41 +0530
Message-ID: <1349981868-2116-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:13710 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756695Ab2JKJhH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Oct 2012 05:37:07 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MBQ0047X2PTYFZ0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 11 Oct 2012 18:37:05 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MBQ009N02PK5640@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 11 Oct 2012 18:37:05 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, t.stanislaws@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, jy0922.shim@samsung.com, kyungmin.park@samsung.com, thomas.ab@samsung.com, prashanth.g@samsung.com, joshi@samsung.com, s.shirish@samsung.com, r.sh.open@gmail.com, rahul.sharma@samsung.com

This patch set adds the DT based support for Samsung's Exynos5250. It adds
device tree nodes for hdmi, mixer, hdmiphy and hdmiddc. The name of these
devices are changed to the one matching with drivers. Exynos-drm and exynos
hdmi-drm-commmon devices are removed from machine init code.

Exynos-drm and exynos hdmi-drm-commmon devices are removed from machine
init code. Patch set which adds this code is "add exynos-drm platform device
registration to driver" is posted to dri-devel mailing list.

This patchset is based on linux v3.6-rc5, branch dt-samsung-new at
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git

Rahul Sharma (6):
  dts: exynos: add device tree support for exynos5 hdmi
  dts: exynos: add device tree support for exynos5 mixer
  dts: exynos: add device tree support for exynos5 hdmiphy
  dts: exynos: add device tree support for exynos5 hdmiddc
  arm: exynos: add clocks for exynos5 hdmi
  arm: exynos: removing exynos-drm device registration from non-dt
    platforms

 arch/arm/boot/dts/exynos5250-smdk5250.dts  |   24 ++++++++++++++++++++++-
 arch/arm/boot/dts/exynos5250.dtsi          |   23 ++++++++++++++++++++++
 arch/arm/mach-exynos/Makefile              |    1 -
 arch/arm/mach-exynos/clock-exynos5.c       |   14 +++++++++++-
 arch/arm/mach-exynos/dev-drm.c             |   29 ----------------------------
 arch/arm/mach-exynos/include/mach/map.h    |    2 +
 arch/arm/mach-exynos/mach-exynos5-dt.c     |    8 +++++++
 arch/arm/mach-exynos/mach-nuri.c           |    3 --
 arch/arm/mach-exynos/mach-origen.c         |    3 --
 arch/arm/mach-exynos/mach-smdk4x12.c       |    3 --
 arch/arm/mach-exynos/mach-smdkv310.c       |    3 --
 arch/arm/mach-exynos/mach-universal_c210.c |    3 --
 arch/arm/plat-samsung/include/plat/devs.h  |    2 -
 13 files changed, 68 insertions(+), 50 deletions(-)
 delete mode 100644 arch/arm/mach-exynos/dev-drm.c
