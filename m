From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung board-1 for v3.6
Date: Tue, 10 Jul 2012 11:20:49 +0900
Message-ID: <0c5101cd5e42$9f7415d0$de5c4170$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:20858 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755456Ab2GJCUv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Jul 2012 22:20:51 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M6X001TUAI8MFI0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 10 Jul 2012 11:20:50 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M6X00GTFAIPXO60@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 10 Jul 2012 11:20:50 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Sachin Kamat' <sachin.kamat@linaro.org>

Hi Arnd, Olof

Please pull Samsung boards update for v3.6.

If any problems, please let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit cfaf025112d3856637ff34a767ef785ef5cf2ca9:

  Linux 3.5-rc2 (2012-06-08 18:40:09 -0700)

are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
next/board-samsung

Dimitris Papastamos (1):
      ARM: S3C64XX: Add IRQ mapping for wm0010 on Cragganmore

Mark Brown (4):
      ARM: S3C64XX: Add module identification for Balblair Cragganmore
module
      ARM: S3C64XX: Add WM5102 EVM to Cragganmore modules
      ARM: S3C64XX: Dynamically allocate the IRQ range for WM8994 on
Cragganmore
      ARM: S3C64XX: Dynamically assign interrupts for CPU PMIC on
Cragganmore

Sachin Kamat (4):
      ARM: EXYNOS: Add HSOTG support to Origen
      ARM: EXYNOS: Add HSOTG support to SMDKV310
      ARM: EXYNOS: Update keypad entries for SMDK4X12
      ARM: S5PV210: Add HSOTG support to SMDKV210

 arch/arm/mach-exynos/Kconfig                  |    2 ++
 arch/arm/mach-exynos/mach-origen.c            |    6 ++++++
 arch/arm/mach-exynos/mach-smdk4x12.c          |   10 ++++++----
 arch/arm/mach-exynos/mach-smdkv310.c          |    6 ++++++
 arch/arm/mach-s3c64xx/include/mach/crag6410.h |    4 +---
 arch/arm/mach-s3c64xx/mach-crag6410-module.c  |   10 +++++++++-
 arch/arm/mach-s3c64xx/mach-crag6410.c         |    1 -
 arch/arm/mach-s5pv210/Kconfig                 |    2 ++
 arch/arm/mach-s5pv210/mach-smdkv210.c         |    9 +++++++++
 9 files changed, 41 insertions(+), 9 deletions(-)
