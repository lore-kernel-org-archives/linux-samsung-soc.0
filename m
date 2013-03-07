From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 1/5] Samsung cleanup-s3c for v3.10
Date: Thu, 07 Mar 2013 11:23:25 +0900
Message-ID: <016601ce1ada$bf9ad0b0$3ed07210$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:49795 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754404Ab3CGCX1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Mar 2013 21:23:27 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MJ900020QLZ28G0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 07 Mar 2013 11:23:26 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, =?ISO-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>

Hi Arnd, Olof,

Here is cleanup for s3c stuff.

This is including cleanup soc specific header files and plat/irqs.h.

If any problems, please let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit 6dbe51c251a327e012439c4772097a13df43c5b8:

  Linux 3.9-rc1 (2013-03-03 15:11:05 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
next/cleanup-s3c

for you to fetch changes up to 7488335dcf382574c47fb27fcbad3f04a9841db6:

  ARM: S3C24XX: cleanup the included soc init functions in common.h (2013-03-05
10:42:48 +0900)

----------------------------------------------------------------
Heiko Stuebner (3):
      ARM: S3C24XX: remove plat/irq.h in plat-samsung
      ARM: S3C24XX: move plat-samsung/s3c24XX headers to local common.h
      ARM: S3C24XX: cleanup the included soc init functions in common.h

Kukjin Kim (2):
      mmc: s3cmci: moved mach/regs-sdi.h into s3cmci device driver
      ARM: S3C24XX: plat/common-smdk.h local

 arch/arm/mach-s3c24xx/bast-irq.c                   |    2 -
 arch/arm/mach-s3c24xx/clock-s3c2410.c              |    1 -
 arch/arm/mach-s3c24xx/clock-s3c2412.c              |    1 -
 arch/arm/mach-s3c24xx/clock-s3c2416.c              |    1 -
 arch/arm/mach-s3c24xx/clock-s3c2443.c              |    1 -
 arch/arm/mach-s3c24xx/common-smdk.c                |    3 +-
 .../include/plat => mach-s3c24xx}/common-smdk.h    |    3 +-
 arch/arm/mach-s3c24xx/common.c                     |    7 +-
 arch/arm/mach-s3c24xx/common.h                     |   90 +++++++++++++-
 arch/arm/mach-s3c24xx/dma-s3c2410.c                |    1 -
 arch/arm/mach-s3c24xx/dma-s3c2412.c                |    1 -
 arch/arm/mach-s3c24xx/dma-s3c2440.c                |    1 -
 arch/arm/mach-s3c24xx/dma-s3c2443.c                |    1 -
 arch/arm/mach-s3c24xx/include/mach/regs-sdi.h      |  127 --------------------
 arch/arm/mach-s3c24xx/irq-pm.c                     |    7 +-
 arch/arm/mach-s3c24xx/irq.c                        |    8 +-
 arch/arm/mach-s3c24xx/mach-jive.c                  |    2 +-
 arch/arm/mach-s3c24xx/mach-n30.c                   |    1 -
 arch/arm/mach-s3c24xx/mach-nexcoder.c              |    2 -
 arch/arm/mach-s3c24xx/mach-otom.c                  |    1 -
 arch/arm/mach-s3c24xx/mach-qt2410.c                |    2 +-
 arch/arm/mach-s3c24xx/mach-smdk2410.c              |    3 +-
 arch/arm/mach-s3c24xx/mach-smdk2413.c              |    5 +-
 arch/arm/mach-s3c24xx/mach-smdk2416.c              |    4 +-
 arch/arm/mach-s3c24xx/mach-smdk2440.c              |    5 +-
 arch/arm/mach-s3c24xx/mach-smdk2443.c              |    5 +-
 arch/arm/mach-s3c24xx/mach-vstms.c                 |    3 +-
 arch/arm/mach-s3c24xx/pm-s3c2412.c                 |    1 -
 arch/arm/mach-s3c24xx/s3c2410.c                    |    1 -
 arch/arm/mach-s3c24xx/s3c2412.c                    |    1 -
 arch/arm/mach-s3c24xx/s3c2416.c                    |    1 -
 arch/arm/mach-s3c24xx/s3c2440.c                    |    1 -
 arch/arm/mach-s3c24xx/s3c2442.c                    |    1 -
 arch/arm/mach-s3c24xx/s3c2443.c                    |    1 -
 arch/arm/mach-s3c24xx/s3c244x.c                    |    2 -
 arch/arm/plat-samsung/include/plat/irq.h           |  116 ------------------
 arch/arm/plat-samsung/include/plat/s3c2410.h       |   31 -----
 arch/arm/plat-samsung/include/plat/s3c2412.h       |   32 -----
 arch/arm/plat-samsung/include/plat/s3c2416.h       |   37 ------
 arch/arm/plat-samsung/include/plat/s3c2443.h       |   36 ------
 arch/arm/plat-samsung/include/plat/s3c244x.h       |   42 -------
 drivers/mmc/host/s3cmci.c                          |   83 ++++++++++++-
 42 files changed, 194 insertions(+), 480 deletions(-)
 rename arch/arm/{plat-samsung/include/plat => mach-s3c24xx}/common-smdk.h (86%)
 delete mode 100644 arch/arm/mach-s3c24xx/include/mach/regs-sdi.h
 delete mode 100644 arch/arm/plat-samsung/include/plat/irq.h
 delete mode 100644 arch/arm/plat-samsung/include/plat/s3c2410.h
 delete mode 100644 arch/arm/plat-samsung/include/plat/s3c2412.h
 delete mode 100644 arch/arm/plat-samsung/include/plat/s3c2416.h
 delete mode 100644 arch/arm/plat-samsung/include/plat/s3c2443.h
 delete mode 100644 arch/arm/plat-samsung/include/plat/s3c244x.h
