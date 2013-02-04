From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 2/5] Samsung cleanup-s3c24xx for v3.9
Date: Mon, 04 Feb 2013 15:41:55 -0800
Message-ID: <120c01ce0331$389e43a0$a9dacae0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:38832 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755485Ab3BDXmO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Feb 2013 18:42:14 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHP003NPZ5AKTA0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 05 Feb 2013 08:42:07 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MHP001C1Z65V280@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 05 Feb 2013 08:42:07 +0900 (KST)
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Arnd and Olof,

Here is 2nd cleanup for Samsung S3C24XX stuff and based on previous
pull-request branch, 'next/cleanup-header'.
Basically, this patch merges mach-s3c2410, mach-s3c2412 and mach-s3c2440
into mach-s3c24xx.

Note, this is 2nd pull request and first is 'next/cleanup-header' branch.
If any problems, please let me know.

Thanks.

- Kukjin


The following changes since commit 3a71c5c375e29fc9c1493b5ead1cf36572139c3e:

  ARM: S3C64XX: Fix missing header error with CONFIG_CPU_IDLE enabled
(2013-01-10 10:45:41 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
next/cleanup-s3c24xx

for you to fetch changes up to acf2d41d8595829eb0ac7bf6891f4875a78d4d6e:

  ARM: S3C24XX: Move mach-s3c2440/ pll into mach-s3c24xx/ (2013-01-21
17:05:23 -0800)

----------------------------------------------------------------
Kukjin Kim (6):
      ARM: S3C24XX: Move mach-s3c2410/ cpufreq into mach-s3c24xx/
      ARM: S3C24XX: Move mach-s3c2410/ pll into mach-s3c24xx/
      ARM: S3C2412: Remove useless codes mach-s3c2412/gpio.c
      ARM: S3C24XX: Move mach-s3c2412/ cpufreq driver into mach-s3c24xx/
      ARM: S3C24XX: Move mach-s3c2440/ cpufreq driver into mach-s3c24xx/
      ARM: S3C24XX: Move mach-s3c2440/ pll into mach-s3c24xx/

 arch/arm/Kconfig
|    4 ----
 arch/arm/Makefile
|    2 +-
 arch/arm/mach-s3c2410/Kconfig
|   20 ----------------
 arch/arm/mach-s3c2410/Makefile
|   14 -----------
 arch/arm/mach-s3c2412/Kconfig
|   13 ----------
 arch/arm/mach-s3c2412/Makefile
|   12 ----------
 arch/arm/mach-s3c2412/gpio.c
|   62 ------------------------------------------------
 arch/arm/mach-s3c2440/Kconfig
|   37 -----------------------------
 arch/arm/mach-s3c2440/Makefile
|   15 ------------
 arch/arm/mach-s3c24xx/Kconfig
|   56 +++++++++++++++++++++++++++++++++++++++++++
 arch/arm/mach-s3c24xx/Makefile
|    6 +++++
 arch/arm/{mach-s3c2410/cpu-freq.c => mach-s3c24xx/cpufreq-s3c2410.c}
|    7 ++----
 arch/arm/{mach-s3c2412/cpu-freq.c => mach-s3c24xx/cpufreq-s3c2412.c}
|    6 ++---
 arch/arm/{mach-s3c2440/s3c2440-cpufreq.c => mach-s3c24xx/cpufreq-s3c2440.c}
|    4 +---
 arch/arm/mach-s3c24xx/include/mach/hardware.h
|    6 -----
 arch/arm/{mach-s3c2410/pll.c => mach-s3c24xx/pll-s3c2410.c}
|    5 +---
 arch/arm/{mach-s3c2440/s3c2440-pll-12000000.c =>
mach-s3c24xx/pll-s3c2440-12000000.c} |    5 +---
 arch/arm/{mach-s3c2440/s3c2440-pll-16934400.c =>
mach-s3c24xx/pll-s3c2440-16934400.c} |    5 +---
 18 files changed, 71 insertions(+), 208 deletions(-)
 delete mode 100644 arch/arm/mach-s3c2410/Kconfig
 delete mode 100644 arch/arm/mach-s3c2410/Makefile
 delete mode 100644 arch/arm/mach-s3c2412/Kconfig
 delete mode 100644 arch/arm/mach-s3c2412/Makefile
 delete mode 100644 arch/arm/mach-s3c2412/gpio.c
 delete mode 100644 arch/arm/mach-s3c2440/Kconfig
 delete mode 100644 arch/arm/mach-s3c2440/Makefile
 rename arch/arm/{mach-s3c2410/cpu-freq.c => mach-s3c24xx/cpufreq-s3c2410.c}
(98%)
 rename arch/arm/{mach-s3c2412/cpu-freq.c => mach-s3c24xx/cpufreq-s3c2412.c}
(99%)
 rename arch/arm/{mach-s3c2440/s3c2440-cpufreq.c =>
mach-s3c24xx/cpufreq-s3c2440.c} (99%)
 rename arch/arm/{mach-s3c2410/pll.c => mach-s3c24xx/pll-s3c2410.c} (99%)
 rename arch/arm/{mach-s3c2440/s3c2440-pll-12000000.c =>
mach-s3c24xx/pll-s3c2440-12000000.c} (98%)
 rename arch/arm/{mach-s3c2440/s3c2440-pll-16934400.c =>
mach-s3c24xx/pll-s3c2440-16934400.c} (99%)
