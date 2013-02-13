From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL fixes] Samsung-fixes for v3.9
Date: Tue, 12 Feb 2013 16:20:43 -0800
Message-ID: <1dce01ce097f$f7bd2db0$e7378910$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:19082 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754460Ab3BMAVF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Feb 2013 19:21:05 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MI4000ADUAYP780@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 13 Feb 2013 09:21:04 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MI400F2IUB1V760@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 13 Feb 2013 09:21:03 +0900 (KST)
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: olof@lixom.net, arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Arnd and Olof,

Here is Samsung fixes for v3.9 and it is not a critical fixes.

Please pull from:
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
next/fixes-samsung

Thanks.

- Kukjin

The following changes since commit 7d1f9aeff1ee4a20b1aeb377dd0f579fe9647619:

  Linux 3.8-rc4 (2013-01-17 19:25:45 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
next/fixes-samsung

for you to fetch changes up to ebf4762812ebe77ed960543421ec894108315f2f:

  ARM: dts: Correct pin configuration of SD 4 for exynos4x12-pinctrl
(2013-02-12 10:35:50 -0800)

----------------------------------------------------------------
Abhilash Kesavan (1):
      ARM: SAMSUNG: Gracefully exit on suspend failure

Alexander Shiyan (1):
      ARM: S3C24XX: Fix compile breakage for SMDK2410

Alexey Galakhov (1):
      ARM: S5PV210: Fix early uart output in fifo mode

Chen Gang (1):
      ARM: SAMSUNG: using vsnprintf instead of vsprintf for the limit buffer
length 256

Heiko Stuebner (2):
      ARM: S3C24XX: let S3C2412_PM select S3C2412_PM_SLEEP
      ARM: S3C24XX: add missing platform_device.h include for osiris

Sachin Kamat (3):
      ARM: S3C24XX: Make 'clk_msysclk' static
      ARM: SAMSUNG: Silence empty switch warning in sdhci.h
      ARM: SAMSUNG: Silence empty switch warning in fimc-core.h

Shirish S (1):
      ARM: dts: Correct pin configuration of SD 4 for exynos4x12-pinctrl

 arch/arm/boot/dts/exynos4x12-pinctrl.dtsi       |    2 +-
 arch/arm/mach-exynos/pm.c                       |    6 ++++--
 arch/arm/mach-s3c24xx/Kconfig                   |    2 ++
 arch/arm/mach-s3c24xx/common-s3c2443.c          |    2 +-
 arch/arm/mach-s3c24xx/mach-osiris.c             |    1 +
 arch/arm/mach-s3c24xx/pm-s3c2412.c              |    3 ++-
 arch/arm/mach-s3c24xx/pm-s3c2416.c              |    3 ++-
 arch/arm/mach-s3c64xx/pm.c                      |    3 ++-
 arch/arm/mach-s5p64x0/pm.c                      |    4 ++--
 arch/arm/mach-s5pv210/include/mach/uncompress.h |    2 ++
 arch/arm/mach-s5pv210/pm.c                      |    4 ++--
 arch/arm/plat-samsung/include/plat/fimc-core.h  |    2 ++
 arch/arm/plat-samsung/include/plat/sdhci.h      |    2 ++
 arch/arm/plat-samsung/pm.c                      |    7 +++++--
 14 files changed, 30 insertions(+), 13 deletions(-)
