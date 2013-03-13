From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung fixes for v3.9
Date: Wed, 13 Mar 2013 14:06:26 +0900
Message-ID: <093101ce1fa8$840c52d0$8c24f870$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:36117 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750932Ab3CMFG3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Mar 2013 01:06:29 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MJL00K1Y26HCCJ0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 13 Mar 2013 14:06:27 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Arnd, Olof,

Here is Samsung fixes for v3.9.

Please pull from:
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
v3.9-samsung-fixes-1

There are two commits for fix pl330 dma clkdev entries on s5pv210 and generic
dma binding support on exynos stuff.

If any problems, please kindly let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit 6dbe51c251a327e012439c4772097a13df43c5b8:

  Linux 3.9-rc1 (2013-03-03 15:11:05 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
v3.9-samsung-fixes-1

for you to fetch changes up to 0a96d4d36978c8aeebf5fce1f3041c2d60f23ac0:

  ARM: EXYNOS: Add #dma-cells for generic dma binding support for PL330
(2013-03-07 10:33:07 +0900)

----------------------------------------------------------------
Padmavathi Venna (1):
      ARM: EXYNOS: Add #dma-cells for generic dma binding support for PL330

Sylwester Nawrocki (1):
      ARM: S5PV210: Fix PL330 DMA controller clkdev entries

 arch/arm/boot/dts/exynos4.dtsi    |    9 +++++++++
 arch/arm/boot/dts/exynos5440.dtsi |    6 ++++++
 arch/arm/mach-s5pv210/clock.c     |   36 ++++++++++++++++++------------------
 3 files changed, 33 insertions(+), 18 deletions(-)
