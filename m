From: Ben Dooks <ben-linux@fluff.org>
Subject: request pull of bjdooks' for-linus/2634-git-updates
Date: Wed, 26 May 2010 11:16:59 +0100
Message-ID: <20100526101659.GH4720@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:49012 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757160Ab0EZKRQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 May 2010 06:17:16 -0400
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: linux-arm-kernel@lists.infradead.org, Linux Samsung SoC <linux-samsung-soc@vger.kernel.org>

Two cleanups for post merging to mainline and a defconfig update
for all the defconfigs to bring them up to latest kernel.

The following changes since commit b1cdc4670b9508fcd47a15fbd12f70d269880b37:
  Linus Torvalds (1):
        Merge git://git.kernel.org/.../davem/net-2.6

are available in the git repository at:

  git://git.fluff.org/bjdooks/linux.git for-linus/2634-git-updates

Ben Dooks (9):
      ARM: s3c2410_defconfig: Update s3c2410_defconfig to v2.6.34-git
      ARM: s3c6400_defconfig: Update s3c6400_defconfig to v2.6.34-git
      ARM: s5p6440_defconfig: Update s5p6440_defconfig to v2.6.34-git
      ARM: s5p6442_defconfig: Update s5p6442_defconfig to v2.6.34-git
      ARM: s5pc100_defconfig: Update s5pc100_defconfig to v2.6.34-git
      ARM: s5pc110_defconfig: Update s5pc110_defconfig to v2.6.34-git
      ARM: s5pv210_defconfig: Update s5pv210_defconfig to v2.6.34-git
      ARM: S5PC100: Fixup cross tree merge problems
      ARM: Merge next-samsung

Pannaga Bhushan (1):
      ARM: S5P: Fix the platform external interrupt issues.

 arch/arm/configs/s3c2410_defconfig             |   70 ++++++-
 arch/arm/configs/s3c6400_defconfig             |   35 +++-
 arch/arm/configs/s5p6440_defconfig             |   29 +++-
 arch/arm/configs/s5p6442_defconfig             |   24 ++-
 arch/arm/configs/s5pc100_defconfig             |  233 +++++++++++++++++++-----
 arch/arm/configs/s5pc110_defconfig             |   30 +++-
 arch/arm/configs/s5pv210_defconfig             |   33 +++-
 arch/arm/mach-s5p6440/include/mach/irqs.h      |    9 +-
 arch/arm/mach-s5p6442/include/mach/irqs.h      |    5 +-
 arch/arm/mach-s5pc100/include/mach/irqs.h      |    3 -
 arch/arm/mach-s5pc100/include/mach/regs-gpio.h |    7 +-
 arch/arm/mach-s5pv210/include/mach/irqs.h      |   14 +--
 arch/arm/mach-s5pv210/include/mach/regs-gpio.h |   14 +-
 arch/arm/plat-s5p/Kconfig                      |    1 +
 arch/arm/plat-s5p/include/plat/irqs.h          |    7 +
 arch/arm/plat-s5p/irq-eint.c                   |   15 +-
 16 files changed, 407 insertions(+), 122 deletions(-)

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
