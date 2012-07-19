From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung board-3 for v3.6
Date: Fri, 20 Jul 2012 07:42:37 +0900
Message-ID: <195101cd65ff$cc0a8600$641f9200$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:10614 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751287Ab2GSWmj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Jul 2012 18:42:39 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7F00G1DJ2X5L30@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 Jul 2012 07:42:37 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M7F00IF2J31TY80@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 Jul 2012 07:42:37 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Arnd, Olof

Please pull 3rd updates for samsung stuff v3.6 from:
  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git next/board-samsung-3

It is including several changes for samsung boards.

If any problems, please kindly let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit 23c7301d74ac2d80d0dafd6f84a6d11a0fc15ce5:

  Merge branch 'next/board-samsung-2' into next/board-samsung-3 (2012-07-19 14:29:30 +0900)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git next/board-samsung-3

Kukjin Kim (1):
      ARM: SAMSUNG: no need to set the value for clk_xusbxti when it is 24Mhz

Mark Brown (2):
      ARM: S3C64XX: Clean up after SPI driver platform data updates
      ARM: S3C64XX: Mark most Cragganmore initdata devinitdata

Ricardo Salveti de Araujo (1):
      ARM: EXYNOS: Add leds status1 and status2 on Origen board

Sachin Kamat (2):
      ARM: EXYNOS: Add DRM device to SMDK4X12 board
      ARM: EXYNOS: Add missing .reserve field to SMDKC210

 arch/arm/mach-exynos/Kconfig                 |    1 +
 arch/arm/mach-exynos/mach-nuri.c             |    3 +-
 arch/arm/mach-exynos/mach-origen.c           |   33 ++++++++++++-
 arch/arm/mach-exynos/mach-smdk4x12.c         |   32 +++++++++++-
 arch/arm/mach-exynos/mach-smdkv310.c         |    4 +-
 arch/arm/mach-exynos/mach-universal_c210.c   |    3 +-
 arch/arm/mach-s3c64xx/mach-crag6410-module.c |    1 -
 arch/arm/mach-s3c64xx/mach-crag6410.c        |   68 +++++++++++++-------------
 arch/arm/mach-s5pv210/mach-goni.c            |    4 +-
 arch/arm/mach-s5pv210/mach-smdkv210.c        |    3 +-
 10 files changed, 102 insertions(+), 50 deletions(-)
