From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung regarding board developing for v3.4
Date: Fri, 10 Feb 2012 21:39:01 +0900
Message-ID: <013a01cce7f0$f71e57f0$e55b07d0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:65224 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758675Ab2BJMjE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Feb 2012 07:39:04 -0500
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZ60065HGGY1KX0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Feb 2012 21:39:03 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZ600HQSGH1JM50@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Fri, 10 Feb 2012 21:39:03 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: arnd@arndb.de, 'Olof Johansson' <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Arnd, Olof,

Please pull regarding board patches for samsung from following:
  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
next/board-samsung

This is including S3C64XX Cragganmore, EXYNOS4 SMDKV310, Origen boards and
so on.

As a note, there is no conflict with merging arm-soc/depends/rmk/for-armsoc.
And I will send other board specific branch later again. This is a just
first next/board branch for v3.4.

If any problems, please kindly let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit dcd6c92267155e70a94b3927bce681ce74b80d1f:

  Linux 3.3-rc1 (2012-01-19 15:04:48 -0800)

are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
next/board-samsung

Kamil Debski (2):
      ARM: EXYNOS: add G2D to mach-nuri
      ARM: EXYNOS: add G2D to mach-universal

Mark Brown (6):
      ARM: S3C64XX: Support GPIO LEDs on Cragganmore
      ARM: S3C64XX: Fix build of Cragganmore after SPI changes
      ARM: S3C64XX: Enable power management for disk on Cragganmore
      ARM: S3C64XX: Enable power management for WiFi on Cragganmore
      ARM: S3C64XX: Add hookup for Tomatin module on Cragganmore
      ARM: S3C64XX: Add a SPKVDD supply for CODECs on Cragganmore

Sachin Kamat (4):
      ARM: EXYNOS: Enable G2D on ORIGEN
      ARM: S5PV210: Add missing FIMC media device to Aquila
      ARM: EXYNOS: Add missing FIMC media device to SMDKV310
      ARM: EXYNOS: Add missing FIMC media device to Origen

Sangwook Lee (1):
      ARM: EXYNOS: Enable Bluetooth on ORIGEN

Sylwester Nawrocki (3):
      ARM: EXYNOS: Increase virtual framebuffer size on Universal C210 board
      ARM: EXYNOS: Add support for S5K6AAFX image sensor on Universal C210
board
      ARM: SAMSUNG: Add support for S5K6AAFX camera on Nuri board

 arch/arm/mach-exynos/Kconfig                 |    5 ++
 arch/arm/mach-exynos/mach-nuri.c             |   66 ++++++++++++++++++++++
 arch/arm/mach-exynos/mach-origen.c           |   36 ++++++++++++
 arch/arm/mach-exynos/mach-smdkv310.c         |    1 +
 arch/arm/mach-exynos/mach-universal_c210.c   |   77
++++++++++++++++++++++++-
 arch/arm/mach-s3c64xx/Kconfig                |    1 +
 arch/arm/mach-s3c64xx/mach-crag6410-module.c |   27 +++++++++-
 arch/arm/mach-s3c64xx/mach-crag6410.c        |   67 ++++++++++++++++++++++-
 arch/arm/mach-s5pv210/mach-aquila.c          |    1 +
 9 files changed, 275 insertions(+), 6 deletions(-)
