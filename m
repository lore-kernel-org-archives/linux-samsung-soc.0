From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 3/5] Samsung irq-s3c24xx for v3.9
Date: Mon, 04 Feb 2013 15:41:58 -0800
Message-ID: <120d01ce0331$39efc9e0$adcf5da0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:38832 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754748Ab3BDXmP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Feb 2013 18:42:15 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHP003NPZ5AKTA0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 05 Feb 2013 08:42:09 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MHP001C1Z65V280@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 05 Feb 2013 08:42:09 +0900 (KST)
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, =?iso-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>

Hi Arnd and Olof,

This is redoing the s3c24xx irqs in a generic way by using a declarative
approach.
Note, this is based on previous pull-request, ' next/cleanup-s3c24xx'
branch.

If any problems, please kindly let me know.

Thanks.

- Kukjin


The following changes since commit acf2d41d8595829eb0ac7bf6891f4875a78d4d6e:

  ARM: S3C24XX: Move mach-s3c2440/ pll into mach-s3c24xx/ (2013-01-21
17:05:23 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
next/irq-s3c24xx

for you to fetch changes up to f44ddba3635e35317057e976888d4a12dcb0f842:

  ARM: S3C24XX: transform s3c2443 subirqs into new structure (2013-02-03
15:52:50 -0800)

----------------------------------------------------------------
Heiko Stuebner (9):
      ARM: S3C24XX: transform irq handling into a declarative form
      ARM: S3C24XX: Move irq syscore-ops to irq-pm
      ARM: S3C24XX: Modify s3c_irq_wake to use the hwirq property
      ARM: S3C24XX: move s3c2416 irq init to common irq code
      ARM: S3C24XX: modify s3c2416 irq init to initialize all irqs
      ARM: S3C24XX: transform s3c2416 irqs into new structure
      ARM: S3C24XX: move s3c2443 irq code to irq.c
      ARM: S3C24XX: modify s3c2443 irq init to initialize all irqs
      ARM: S3C24XX: transform s3c2443 subirqs into new structure

 arch/arm/mach-s3c24xx/Makefile               |    4 +-
 arch/arm/mach-s3c24xx/common.h               |    2 +
 arch/arm/mach-s3c24xx/irq-pm.c               |   41 +++-
 arch/arm/mach-s3c24xx/irq-s3c2416.c          |  348
----------------------------
 arch/arm/mach-s3c24xx/irq-s3c2443.c          |  281 -----------------------
 arch/arm/mach-s3c24xx/mach-smdk2416.c        |    2 +-
 arch/arm/mach-s3c24xx/mach-smdk2443.c        |    2 +-
 arch/arm/mach-s3c24xx/s3c2410.c              |    4 +-
 arch/arm/mach-s3c24xx/s3c2412.c              |    3 +-
 arch/arm/mach-s3c24xx/s3c2416.c              |    4 +-
 arch/arm/mach-s3c24xx/s3c2440.c              |    4 +-
 arch/arm/mach-s3c24xx/s3c2442.c              |    4 +-
 arch/arm/plat-s3c24xx/Kconfig                |    1 +
 arch/arm/plat-s3c24xx/irq.c                  | 1110
++++++++++++++++++++++++++++++++++++++++++++++++++--------------------------
-------------
 arch/arm/plat-samsung/include/plat/pm.h      |    6 -
 arch/arm/plat-samsung/include/plat/s3c2416.h |    1 +
 arch/arm/plat-samsung/include/plat/s3c2443.h |    2 +
 17 files changed, 687 insertions(+), 1132 deletions(-)
 delete mode 100644 arch/arm/mach-s3c24xx/irq-s3c2416.c
 delete mode 100644 arch/arm/mach-s3c24xx/irq-s3c2443.c
