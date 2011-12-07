From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung fixes-2 for v3.2
Date: Wed, 07 Dec 2011 17:48:33 +0900
Message-ID: <03f401ccb4bd$00421090$00c631b0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:60313 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752902Ab1LGIse (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Dec 2011 03:48:34 -0500
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LVT00NSKSET3RU0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 07 Dec 2011 17:48:33 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LVT007U9SGXA510@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Wed, 07 Dec 2011 17:48:33 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, ben-linux@fluff.org, rmk+kernel@arm.linux.org.uk

Hi Arnd,

Please pull samsung-fixes-2 for v3.2.
It includes small fixes for S3C64XX and update the Samsung field of MAINTAINERS.

If any problems, please let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit 5611cc4572e889b62a7b4c72a413536bf6a9c416:

  Linux 3.2-rc4 (2011-12-01 14:56:01 -0800)

are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git samsung-fixes-2

Heiko Stuebner (1):
      MAINTAINERS: Consolidate Samsung MAINTAINERS

Kukjin Kim (1):
      Merge branch 'next/topic-update-maintainer' into samsung-fixes-2

Mark Brown (5):
      MAINTAINERS: Add linux-samsung-soc mailing list for Samsung
      MAINTAINERS: Extend Samsung patterns to cover SPI and ASoC drivers
      ARM: S3C64XX: Remove extern from definition of framebuffer setup call
      ARM: S3C64XX: Add linux/export.h to dev-spi.c
      ARM: S3C64XX: Staticise s3c6400_sysclass

 MAINTAINERS                            |   27 +++++----------------------
 arch/arm/mach-s3c64xx/dev-spi.c        |    1 +
 arch/arm/mach-s3c64xx/s3c6400.c        |    2 +-
 arch/arm/mach-s3c64xx/setup-fb-24bpp.c |    2 +-
 4 files changed, 8 insertions(+), 24 deletions(-)
