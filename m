From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [GIT PULL 1/4] ARM: exynos: SoC/Mach for v4.9
Date: Tue, 30 Aug 2016 11:18:59 +0200
Message-ID: <1472548739-20050-5-git-send-email-k.kozlowski@samsung.com>
References: <1472548739-20050-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:39316 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757635AbcH3JT3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 30 Aug 2016 05:19:29 -0400
In-reply-to: <1472548739-20050-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>


The following changes since commit 29b4817d4018df78086157ea3a55c1d9424a7cfc:

  Linux 4.8-rc1 (2016-08-07 18:18:00 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-4.9

for you to fetch changes up to a36289756212a79a1b32c02e66ddf11ba33ec7db:

  ARM: EXYNOS: Remove unused DMC and CMU offsets and their mappings (2016-08-24 06:42:27 +0200)

----------------------------------------------------------------
Samsung mach/soc update for v4.9:
1. Fix for DMA on S3C24xx. This was probably broken for long time, nobody runs
   this code... till now.
2. After fixes from Matthew Leach and Ben Dooks, most of our mach code
   and drivers is now endian-safe. Mark the platform as supporting big endian.
3. Cleanups.

----------------------------------------------------------------
Ben Dooks (1):
      ARM: EXYNOS: Enable ARCH_SUPPORTS_BIG_ENDIAN explicitly

Markus Elfring (1):
      ARM: s3c64xx: Delete unnecessary assignment for the field "owner"

Pankaj Dubey (1):
      ARM: EXYNOS: Remove unused DMC and CMU offsets and their mappings

Sylwester Nawrocki (2):
      ARM: S3C24XX: Add dma_mask assignments for DMA devices
      ARM: S3C24XX: Add missing DMA device for Mini2440 board

 arch/arm/mach-exynos/Kconfig                 |  1 +
 arch/arm/mach-exynos/exynos.c                | 15 ---------------
 arch/arm/mach-exynos/include/mach/map.h      |  5 -----
 arch/arm/mach-s3c24xx/common.c               | 20 +++++++++++++++-----
 arch/arm/mach-s3c24xx/mach-mini2440.c        |  1 +
 arch/arm/mach-s3c64xx/mach-crag6410-module.c |  3 +--
 arch/arm/plat-samsung/include/plat/map-s5p.h |  4 ----
 7 files changed, 18 insertions(+), 31 deletions(-)
