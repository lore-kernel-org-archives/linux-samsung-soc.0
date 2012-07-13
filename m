From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung fixes-2 for v3.5
Date: Sat, 14 Jul 2012 08:38:55 +0900
Message-ID: <11fd01cd6150$aaf8ea50$00eabef0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:21198 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756182Ab2GMXi6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Jul 2012 19:38:58 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7400DG8HORAM80@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 14 Jul 2012 08:38:56 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M7400E87HOWL240@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 14 Jul 2012 08:38:56 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: arnd@arndb.de, 'Olof Johansson' <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Arnd, Olof,

Please pull second samsung fixes for v3.5 from:
  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
v3.5-samsung-fixes-2

Correcting some values, fixing race and fixing regarding pm_domains are
included in.

If any problems, please kindly let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit bd0a521e88aa7a06ae7aabaed7ae196ed4ad867a:

  Linux 3.5-rc6 (2012-07-07 17:23:56 -0700)

are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
v3.5-samsung-fixes-2

Marek Szyprowski (2):
      ARM: EXYNOS: read initial state of power domain from hw registers
      ARM: EXYNOS: register devices in 'need_restore' state for pm_domains

Sylwester Nawrocki (2):
      ARM: S3C24XX: Correct AC97 clock control bit for S3C2440
      ARM: S3C24XX: Correct CAMIF interrupt definitions

Todd Poynor (1):
      ARM: SAMSUNG: fix race in s3c_adc_start for ADC

Tushar Behera (1):
      ARM: SAMSUNG: Update default rate for xusbxti clock

 arch/arm/mach-exynos/pm_domains.c     |   13 +++++++++----
 arch/arm/mach-s3c24xx/clock-s3c2440.c |    2 +-
 arch/arm/plat-samsung/adc.c           |    8 +++++---
 arch/arm/plat-samsung/devs.c          |    3 ++-
 arch/arm/plat-samsung/s5p-clock.c     |    1 +
 5 files changed, 18 insertions(+), 9 deletions(-)
