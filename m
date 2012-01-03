From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung cleanup for v3.3
Date: Wed, 04 Jan 2012 08:30:03 +0900
Message-ID: <018701ccca6f$9e6f80f0$db4e82d0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:62466 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753680Ab2ACXaI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Jan 2012 18:30:08 -0500
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LX800IJMX9NPOJ0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 04 Jan 2012 08:30:05 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LX800HWGXA3SM10@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Wed, 04 Jan 2012 08:30:05 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Hi Arnd,

Please pull Samsung cleanup for v3.3 from:
  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
next-samsung-cleanup-samsung

There are cleanups for Samsung stuff and there is no dependency with other
branches.

Sorry for late, I thought sent 'pull request' this :( if any problems,
please let me know.

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
next-samsung-cleanup-samsung

Jingoo Han (2):
      ARM: S5PV210: Use gpio_request_one
      ARM: EXYNOS: Use gpio_request_one

Shawn Guo (1):
      ARM: EXYNOS: remove exynos4_scu_enable()

Thomas Meyer (1):
      ARM: SAMSUNG: Use kmemdup rather than duplicating its implementation

 arch/arm/mach-exynos/mach-nuri.c           |    9 ++-------
 arch/arm/mach-exynos/mach-smdkv310.c       |    4 +---
 arch/arm/mach-exynos/mach-universal_c210.c |   10 +++-------
 arch/arm/mach-exynos/pm.c                  |   24 ++----------------------
 arch/arm/mach-s5pv210/mach-aquila.c        |    3 +--
 arch/arm/mach-s5pv210/mach-goni.c          |    6 ++----
 arch/arm/mach-s5pv210/mach-smdkv210.c      |   10 +++-------
 arch/arm/plat-s3c24xx/dma.c                |    3 +--
 8 files changed, 15 insertions(+), 54 deletions(-)
