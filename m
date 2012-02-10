From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung EXYNOS pm domains for devel
Date: Fri, 10 Feb 2012 19:53:46 +0900
Message-ID: <010a01cce7e2$438f6d40$caae47c0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:38601 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758719Ab2BJKxu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Feb 2012 05:53:50 -0500
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZ600FE5BLIZ4U0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Feb 2012 19:53:49 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZ600F6JBLMU270@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Fri, 10 Feb 2012 19:53:48 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: arnd@arndb.de, 'Olof Johansson' <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, "'Rafael J. Wysocki'" <rjw@sisk.pl>

Hi Arnd, Olof,

Please pull samsung exynos pm domains.

It has been merged into linux-pm tree by Rafael and I think it should be
pulled into arm-soc.

Following is regarding reply about that.

http://lists.infradead.org/pipermail/linux-arm-kernel/2012-February/082909.h
tml

If any problems, please kindly let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit 62aa2b537c6f5957afd98e29f96897419ed5ebab:

  Linux 3.3-rc2 (2012-01-31 13:31:54 -0800)

are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
v3.4-for-rafael

Thomas Abraham (2):
      PM / Domains: Add OF support
      ARM: EXYNOS: Hook up power domains to generic power domain
infrastructure

 .../bindings/arm/exynos/power_domain.txt           |   21 ++
 arch/arm/mach-exynos/Kconfig                       |   10 +-
 arch/arm/mach-exynos/Makefile                      |    2 +-
 arch/arm/mach-exynos/dev-pd.c                      |  139 --------------
 arch/arm/mach-exynos/mach-nuri.c                   |   11 -
 arch/arm/mach-exynos/mach-origen.c                 |   14 --
 arch/arm/mach-exynos/mach-smdkv310.c               |   12 --
 arch/arm/mach-exynos/mach-universal_c210.c         |   17 --
 arch/arm/mach-exynos/pm_domains.c                  |  195
++++++++++++++++++++
 drivers/base/power/domain.c                        |   32 ++++
 include/linux/pm_domain.h                          |   12 ++
 11 files changed, 262 insertions(+), 203 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/arm/exynos/power_domain.txt
 delete mode 100644 arch/arm/mach-exynos/dev-pd.c
 create mode 100644 arch/arm/mach-exynos/pm_domains.c
