From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung cleanup-2 for v3.6
Date: Tue, 17 Jul 2012 06:44:31 +0900
Message-ID: <142c01cd639c$2f081800$8d184800$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:50149 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753346Ab2GPVod (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Jul 2012 17:44:33 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M79005EUWE7MA70@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 17 Jul 2012 06:44:32 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M79004F5WE72W70@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 17 Jul 2012 06:44:31 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: arnd@arndb.de, 'Olof Johansson' <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>

Hi Arnd, Olof,

Here is second Samsung cleanup pull request for v3.6.
Please pull from: 
  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
next/cleanup-samsung-2

It is related in using common GPIO API and removing unused GPIOs.

If any problems, please let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit bd0a521e88aa7a06ae7aabaed7ae196ed4ad867a:

  Linux 3.5-rc6 (2012-07-07 17:23:56 -0700)

are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
next/cleanup-samsung-2

Sylwester Nawrocki (8):
      ARM: S3C24XX: Free the backlight gpio requested in Mini2440 board code
      ARM: S3C24XX: Convert SMDK board file to the gpiolib API
      ARM: S3C24XX: Convert QT2410 board file to the gpiolib API
      ARM: S3C24XX: Convert the PM code to gpiolib API
      ARM: S3C24XX: Convert the touchscreen setup code to common GPIO API
      ARM: S3C24XX: Remove unused GPA, GPE, GPH bank GPIO aliases
      ARM: S3C24XX: Remove unused GPIO definitions for port J
      ARM: S3C24XX: Remove unused GPIO definitions for Openmoko GTA02 board

 arch/arm/mach-s3c24xx/common-smdk.c             |   20 ++++---
 arch/arm/mach-s3c24xx/include/mach/gpio-nrs.h   |   21 -------
 arch/arm/mach-s3c24xx/include/mach/gta02.h      |   69
----------------------
 arch/arm/mach-s3c24xx/include/mach/regs-gpio.h  |   17 +++++-
 arch/arm/mach-s3c24xx/include/mach/regs-gpioj.h |   70
-----------------------
 arch/arm/mach-s3c24xx/mach-gta02.c              |    1 -
 arch/arm/mach-s3c24xx/mach-mini2440.c           |    4 +-
 arch/arm/mach-s3c24xx/mach-qt2410.c             |    6 +-
 arch/arm/mach-s3c24xx/mach-rx1950.c             |    1 -
 arch/arm/mach-s3c24xx/pm-s3c2410.c              |   12 +++-
 arch/arm/mach-s3c24xx/pm-s3c2412.c              |    1 -
 arch/arm/mach-s3c24xx/s3c2412.c                 |    1 -
 arch/arm/mach-s3c24xx/s3c244x.c                 |    1 -
 arch/arm/mach-s3c24xx/setup-ts.c                |    6 +--
 14 files changed, 40 insertions(+), 190 deletions(-)
 delete mode 100644 arch/arm/mach-s3c24xx/include/mach/regs-gpioj.h
