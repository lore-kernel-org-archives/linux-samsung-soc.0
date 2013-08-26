From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 1/3] 2nd Round Samsung defconfig for v3.12
Date: Mon, 26 Aug 2013 09:14:31 +0900
Message-ID: <1f7501cea1f1$3c7edb60$b57c9220$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:61862 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754270Ab3HZAOe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 25 Aug 2013 20:14:34 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MS40046Z3C923D0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 26 Aug 2013 09:14:33 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, arm@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>

The following changes since commit ad81f0545ef01ea651886dddac4bef6cec930092:

  Linux 3.11-rc1 (2013-07-14 15:18:27 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
tags/samsung-defconfig-v2

for you to fetch changes up to c3e566d941636c6b1f8849d403b23d83c0e10901:

  ARM: exynos4_defconfig: remove obsolete exynos4_defconfig (2013-07-24
17:41:50 +0900)

----------------------------------------------------------------
Remove exynos4_defconfig because,
- No more used after disabling exynos non-DT
- exynos_defconfig can support exynos SoCs

----------------------------------------------------------------
Bartlomiej Zolnierkiewicz (1):
      ARM: exynos4_defconfig: remove obsolete exynos4_defconfig

 arch/arm/configs/exynos4_defconfig |   68
------------------------------------
 1 file changed, 68 deletions(-)
 delete mode 100644 arch/arm/configs/exynos4_defconfig
