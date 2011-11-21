From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung fixes for v3.2
Date: Mon, 21 Nov 2011 19:25:09 +0900
Message-ID: <03e501cca837$d893e320$89bba960$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:30565 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752591Ab1KUKZL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Nov 2011 05:25:11 -0500
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LV000GN7A950OH0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 21 Nov 2011 19:25:10 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LV0002ILA9XI420@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Mon, 21 Nov 2011 19:25:09 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Arnd,

Please pull samsung-fixes for v3.2 from:

git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
samsung-fixes

This includes fix of inclusion header.
If any problems, please let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit 1ea6b8f48918282bdca0b32a34095504ee65bab5:

  Linux 3.2-rc1 (2011-11-07 16:16:02 -0800)

are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
samsung-fixes

Axel Lin (1):
      ARM: SAMSUNG: include linux/types.h at gpio-cfg.h

Kukjin Kim (2):
      ARM: S5P: Fix export.h inclusion
      ARM: SAMSUNG: inclusion export.h instead of module.h

Kyungmin Park (1):
      ARM: EXYNOS: Fix compiler error with THIS_MODULE

 arch/arm/mach-exynos/cpuidle.c                |    2 ++
 arch/arm/mach-s3c64xx/mach-crag6410-module.c  |    2 +-
 arch/arm/plat-s3c24xx/cpu-freq-debugfs.c      |    2 +-
 arch/arm/plat-s5p/sysmmu.c                    |    1 +
 arch/arm/plat-samsung/include/plat/gpio-cfg.h |    2 ++
 arch/arm/plat-samsung/pd.c                    |    2 +-
 arch/arm/plat-samsung/pwm.c                   |    2 +-
 7 files changed, 9 insertions(+), 4 deletions(-)
