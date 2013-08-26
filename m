From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 3/3] 2nd Round Samsung mach-exynos for v3.12
Date: Mon, 26 Aug 2013 09:14:42 +0900
Message-ID: <1f7701cea1f1$431f2d30$c95d8790$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:9798 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754270Ab3HZAOp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 25 Aug 2013 20:14:45 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MS4004OP3BJRZ20@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 26 Aug 2013 09:14:44 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, arm@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>

The following changes since commit ad81f0545ef01ea651886dddac4bef6cec930092:

  Linux 3.11-rc1 (2013-07-14 15:18:27 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
tags/samsung-mach-exynos

for you to fetch changes up to f52616f4233d71d0fb00f06f86d046d18d2b7f3b:

  ARM: EXYNOS: always enable PM domains support for EXYNOS4X12 (2013-08-19
05:05:16 +0900)

----------------------------------------------------------------
update mach-exynos
- enable ARCH_HAS_BANDGAP for exynos SoCs
- skip C1 cpuidle for exynos5440 because non-supporting
- always enable PM domains for exynos4x12

----------------------------------------------------------------
Amit Daniel Kachhap (2):
      ARM: EXYNOS: enable ARCH_HAS_BANDGAP
      ARM: EXYNOS: Skip C1 cpuidle state for exynos5440

Bartlomiej Zolnierkiewicz (1):
      ARM: EXYNOS: always enable PM domains support for EXYNOS4X12

 arch/arm/mach-exynos/Kconfig   |    7 +++++++
 arch/arm/mach-exynos/cpuidle.c |    2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)
