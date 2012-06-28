From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung fixes-1 for v3.5
Date: Fri, 29 Jun 2012 08:39:44 +0900
Message-ID: <02c401cd5587$4bbff670$e33fe350$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:56039 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753178Ab2F1Xjp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Jun 2012 19:39:45 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M6C00MUVPQ7HQ50@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 29 Jun 2012 08:39:44 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M6C005CBPQ88CB0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 29 Jun 2012 08:39:44 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Arnd, Olof,

Please pull Samsung fixes for v3.5 from:
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
v3.5-samsung-fixes-1

These are small fixes for wrong address, config and clk check.

If any problems, please kindly let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit 485802a6c524e62b5924849dd727ddbb1497cc71:

  Linux 3.5-rc3 (2012-06-16 17:25:17 -0700)

are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
v3.5-samsung-fixes-1

Jonghwan Choi (1):
      ARM: SAMSUNG: Should check for IS_ERR(clk) instead of NULL

Jose Miguel Goncalves (1):
      ARM: SAMSUNG: Fix for S3C2412 EBI memory mapping

Sachin Kamat (1):
      ARM: EXYNOS: Fix EXYNOS_DEV_DMA Kconfig entry

 arch/arm/mach-exynos/Kconfig                       |    8 ++++----
 arch/arm/plat-samsung/include/plat/map-s3c.h       |    2 +-
 .../arm/plat-samsung/include/plat/watchdog-reset.h |    2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)
