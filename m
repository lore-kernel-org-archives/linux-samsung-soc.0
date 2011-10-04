From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung board-2 for v3.2
Date: Tue, 04 Oct 2011 22:21:25 +0900
Message-ID: <019b01cc8298$846170c0$8d245240$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:35917 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757047Ab1JDNV1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Oct 2011 09:21:27 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LSJ001MMMFFW470@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 04 Oct 2011 22:21:25 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LSJ0053LMFPP480@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Tue, 04 Oct 2011 22:21:25 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Russell King' <rmk+kernel@arm.linux.org.uk>, 'Ben Dooks' <ben-linux@fluff.org>

Hi Arnd,

This is a second Samsung board stuff for v3.2 and includes new board,
SMDK4412.

Please pull from:
  git://github.com/kgene/linux-samsung.git next-samsung-board-2

As a note, since supporting SMDK4412 needs previous next-samsung-board
branch so this is based on next-samsung-board which has been already merged
into arm-soc and this includes converting boot_params to atag_offset for
adding/changing boards in this time.

If any problems, please let me know.

One more as a note, the next-samsung-devel and next-samsung-devel-2 will be
sent to you soon after testing ;)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit 2520123382e97271e932377c83bca010c265be55:

  Merge branch 'next-samsung-board-v3.1' into next-samsung-board (2011-09-16
17:13:09 +0900)

are available in the git repository at:

 git://github.com/kgene/linux-samsung.git next-samsung-board-2

Changhwan Youn (7):
      ARM: EXYNOS4: Add support PPI in external GIC
      ARM: EXYNOS4: Add support MCT PPI for EXYNOS4212
      ARM: EXYNOS4: Add support new EXYNOS4412 SoC
      ARM: EXYNOS4: Add support clock for EXYNOS4412
      ARM: EXYNOS4: Add functions for gic interrupt handling
      ARM: EXYNOS4: Add MCT support for EXYNOS4412
      ARM: EXYNOS4: Add support SMDK4412 Board

Tushar Behera (1):
      ARM: EXYNOS4: convert boot_params to atag_offset

 arch/arm/mach-exynos4/Kconfig                      |   14 ++
 arch/arm/mach-exynos4/Makefile                     |    3 +-
 arch/arm/mach-exynos4/clock.c                      |    4 +-
 arch/arm/mach-exynos4/cpu.c                        |   21 ++-
 arch/arm/mach-exynos4/include/mach/entry-macro.S   |   29 +++-
 arch/arm/mach-exynos4/include/mach/irqs.h          |    2 +
 arch/arm/mach-exynos4/include/mach/map.h           |    1 -
 arch/arm/mach-exynos4/include/mach/regs-mct.h      |    5 +-
 arch/arm/mach-exynos4/mach-origen.c                |    2 +-
 .../{mach-smdk4212.c => mach-smdk4x12.c}           |  128 ++++++++-------
 arch/arm/mach-exynos4/mach-smdkv310.c              |    4 +-
 arch/arm/mach-exynos4/mct.c                        |  166
++++++++++++--------
 arch/arm/mach-exynos4/platsmp.c                    |    5 +-
 arch/arm/plat-s5p/cpu.c                            |    9 +
 arch/arm/plat-samsung/include/plat/cpu.h           |    8 +
 15 files changed, 251 insertions(+), 150 deletions(-)
 rename arch/arm/mach-exynos4/{mach-smdk4212.c => mach-smdk4x12.c} (61%)
