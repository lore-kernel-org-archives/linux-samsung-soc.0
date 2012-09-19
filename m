From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 5/7] Samsung board for v3.7
Date: Thu, 20 Sep 2012 08:18:59 +0900
Message-ID: <099c01cd96bd$263a9050$72afb0f0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:23334 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752868Ab2ISXTB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Sep 2012 19:19:01 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAM006Q9E3O7MB0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Sep 2012 08:19:00 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAM009M3E3N4680@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Sep 2012 08:19:00 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Arnd, Olof,

This is for updating non-DT Samsung board files for v3.7, there are adding
generic PWM lookup support and some updates.

If any problems, please kindly let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit 0d7614f09c1ebdbaa1599a5aba7593f147bf96ee:

  Linux 3.6-rc1 (2012-08-02 16:38:10 -0700)

are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
next/board-samsung

Mark Brown (2):
      ARM: S3C64XX: Update configuration for WM5102 module on Cragganmore
      ARM: S3C64XX: Register audio platform devices for Bells on Cragganmore

Sachin Kamat (4):
      ARM: dts: Use active low flag for gpio-keys on Origen
      ARM: dts: Add heartbeat gpio-leds support to Origen
      ARM: EXYNOS: Add generic PWM lookup support for SMDK4X12
      ARM: EXYNOS: Add generic PWM lookup support for SMDKV310

Tushar Behera (1):
      ARM: EXYNOS: Use generic pwm driver in Origen board

 arch/arm/boot/dts/exynos4210-origen.dts      |   18 +++++++++---
 arch/arm/mach-exynos/Kconfig                 |    3 ++
 arch/arm/mach-exynos/mach-origen.c           |    6 ++++
 arch/arm/mach-exynos/mach-smdk4x12.c         |    6 ++++
 arch/arm/mach-exynos/mach-smdkv310.c         |    7 +++++
 arch/arm/mach-s3c64xx/mach-crag6410-module.c |   36
++++++++++++++++++++++---
 arch/arm/mach-s3c64xx/mach-crag6410.c        |   12 ++++++++
 7 files changed, 78 insertions(+), 10 deletions(-)
