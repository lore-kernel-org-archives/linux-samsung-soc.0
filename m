From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v2 0/2] ARM: EXYNOS: Trivial cleanup samsung mach files
Date: Thu, 25 Feb 2016 09:39:58 +0530
Message-ID: <1456373400-10633-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:50812 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758513AbcBYEIo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Feb 2016 23:08:44 -0500
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0O3302XYR4UI9520@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 25 Feb 2016 13:08:42 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, k.kozlowski@samsung.com, b.zolnierkie@samsung.com, daniel.lezcano@linaro.org, thomas.ab@samsung.com, linux@arm.linux.org.uk, Pankaj Dubey <pankaj.dubey@samsung.com>

This patch series cleans up mach-exynos, mach-s3c24xx, plat-samsung include
header files with resepct to unused header file inclusion, removes redundant
register offset definition. Also corrects comment section at few places.

Changes since v1:
 - Keeping back inclusion of header "platform_device.h" in exynos.c.
 - Removing all unused instances of S3C_UART_OFFSET from mach-exynos,
   mach-s3c24xx, and plat-samsung, in single patch.
 - Patch 1/3 is already merged in maintainer tree so not included in v2. 

Pankaj Dubey (2):
  ARM: EXYNOS: cleanup header files inclusion
  ARM: SAMSUNG: remove unused register offset definition

 arch/arm/mach-exynos/common.h                |  1 -
 arch/arm/mach-exynos/exynos.c                |  4 ----
 arch/arm/mach-exynos/firmware.c              |  2 --
 arch/arm/mach-exynos/include/mach/map.h      |  9 +--------
 arch/arm/mach-exynos/platsmp.c               |  1 -
 arch/arm/mach-exynos/pm.c                    |  4 +---
 arch/arm/mach-exynos/s5p-dev-mfc.c           |  1 -
 arch/arm/mach-s3c24xx/include/mach/map.h     | 11 -----------
 arch/arm/plat-samsung/include/plat/map-s3c.h |  4 ----
 arch/arm/plat-samsung/include/plat/map-s5p.h |  5 -----
 10 files changed, 2 insertions(+), 40 deletions(-)

-- 
2.4.5
