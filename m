From: "R. Chandrasekar" <rcsekar@samsung.com>
Subject: [PATCH 0/3] add mie driver for exynos
Date: Thu, 06 Dec 2012 17:38:12 +0530
Message-ID: <1354795695-28009-1-git-send-email-rcsekar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:55380 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752672Ab2LFMKR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Dec 2012 07:10:17 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MEL00JQ5Z53O1L0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 06 Dec 2012 21:10:15 +0900 (KST)
Received: from sekar-ubuntu.sisodomain.com ([107.108.73.178])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MEL008T3Z2ZPL00@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 06 Dec 2012 21:10:15 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, kyungmin.park@samsung.com, joshi@samsung.com, rcsekar.samsung@gmail.com, rcsekar@samsung.com

From: "R. Chandrasekar" <rcsekar@samsung.com>

this patch set adds the driver support for the dithering functionality of the
mobile image enhancement (mie) module.
 
device tree support is added for mie.

fimd adds the mie module as plugin and calls the dithering function. dithere is
required when the panels bpp is less then fimd output.
 
though mie mie has other functionalities, current system uses only dithereing.

R. Chandrasekar (3):
  DTS: exynos: add device tree support for exynos mie
  drm: fimd: add mie plugin support for dithering
  drm: mie: add mie driver for exynos

 arch/arm/boot/dts/exynos5250.dtsi               |    7 +-
 drivers/gpu/drm/exynos/Kconfig                  |    7 +
 drivers/gpu/drm/exynos/Makefile                 |    1 +
 drivers/gpu/drm/exynos/exynos_drm_fimd.c        |   58 +++++-
 drivers/gpu/drm/exynos/exynos_drm_fimd_common.h |   20 ++
 drivers/gpu/drm/exynos/exynos_drm_mie.c         |  250 +++++++++++++++++++++++
 drivers/gpu/drm/exynos/exynos_drm_mie.h         |   50 +++++
 drivers/gpu/drm/exynos/exynos_regs-mie.h        |   75 +++++++
 8 files changed, 465 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/exynos/exynos_drm_fimd_common.h
 create mode 100644 drivers/gpu/drm/exynos/exynos_drm_mie.c
 create mode 100644 drivers/gpu/drm/exynos/exynos_drm_mie.h
 create mode 100644 drivers/gpu/drm/exynos/exynos_regs-mie.h

-- 
1.7.9.5
