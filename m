From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung devel-2 for v3.6
Date: Fri, 20 Jul 2012 07:33:14 +0900
Message-ID: <194f01cd65fe$7c865790$759306b0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:45749 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751853Ab2GSWdP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Jul 2012 18:33:15 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7F00FKOINCV000@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 Jul 2012 07:33:13 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M7F00MKRIND1PA0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 Jul 2012 07:33:13 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, "'Rafael J. Wysocki'" <rjw@sisk.pl>

Hi Arnd, Olof

Here is second of development for samsung stuff v3.6.

Please pull it from:
  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git next/devel-samsung-2

The updating cpufreq for 1.7GHz of exynos5250 has been included in samsung tree because Rafael
thought it was more related in samsung platform and I agreed. And it is including new
exynos_defconfig for DT configuration of exynos4 and exynos5 together. The old exynos4_defconfig
will be used for non-DT for a while and we will try to move on using exynos_defconfig for only DT.
And others are adding G2D clock for exynos4x12 Socs.

If any problems, please let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit 84a1caf1453c3d44050bd22db958af4a7f99315c:

  Linux 3.5-rc7 (2012-07-14 15:40:28 -0700)

are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git next/devel-samsung-2

Jaecheol Lee (1):
      [CPUFREQ] EXYNOS5250: Add support max 1.7GHz for EXYNOS5250

Olof Johansson (1):
      ARM: exynos_defconfig: enable more platforms in defconfig

Sachin Kamat (3):
      ARM: EXYNOS: Move G2D clock entries to clock-exynos4210.c file
      ARM: EXYNOS: Add G2D related clock entries for SMDK4X12
      ARM: S3C64XX: Add header file protection macros in pm-core.h

 arch/arm/configs/exynos_defconfig            |   92 ++++++++++++++++++++++++++
 arch/arm/mach-exynos/clock-exynos4.c         |   41 +-----------
 arch/arm/mach-exynos/clock-exynos4.h         |    3 +
 arch/arm/mach-exynos/clock-exynos4210.c      |   37 ++++++++++
 arch/arm/mach-exynos/clock-exynos4212.c      |   41 +++++++++++-
 arch/arm/mach-s3c64xx/include/mach/pm-core.h |    4 +
 drivers/cpufreq/exynos5250-cpufreq.c         |   55 +++++++---------
 7 files changed, 201 insertions(+), 72 deletions(-)
 create mode 100644 arch/arm/configs/exynos_defconfig
