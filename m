From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung cleanup for v3.5
Date: Sun, 13 May 2012 06:56:02 +0900
Message-ID: <4FAEDC72.60206@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:41754 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756452Ab2ELU4I (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 12 May 2012 16:56:08 -0400
Received: by pbbrp8 with SMTP id rp8so4608869pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 12 May 2012 13:56:08 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi Arnd, Olof

Here is cleanup samsung stuff for v3.5.
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
next/cleanup-samsung

Mostly it is using common macro to define resources and clean up useless 
codes.

If any problems, please kindly let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit d48b97b403d23f6df0b990cee652bdf9a52337a3:

   Linux 3.4-rc6 (2012-05-06 15:07:32 -0700)

are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
next/cleanup-samsung

Amit Daniel Kachhap (1):
       ARM: EXYNOS: Adapt to cpuidle core time keeping and irq enable

Kukjin Kim (1):
       Merge branch 'next/cleanup-samsung-macro' into next/cleanup-samsung

Thomas Abraham (1):
       ARM: SAMSUNG: remove all uses of clk_type member in sdhci 
platform data

Tushar Behera (32):
       ARM: SAMSUNG: Use common macro to define resources on devs.c
       ARM: EXYNOS: Use common macro to define resources on dev-ahci.c
       ARM: EXYNOS: Use common macro to define resources on dev-audio.c
       ARM: EXYNOS: Use common macro to define resources on 
mach-armlex4210.c
       ARM: EXYNOS: Use common macro to define resources on mach-smdkv310.c
       ARM: S3C24XX: Use common macro to define resources on bast-ide.c
       ARM: S3C24XX: Use common macro to define resources on mach-amlm5900.c
       ARM: S3C24XX: Use common macro to define resources on mach-anubis.c
       ARM: S3C24XX: Use common macro to define resources on 
mach-at2440evb.c
       ARM: S3C24XX: Use common macro to define resources on mach-bast.c
       ARM: S3C24XX: Use common macro to define resources on mach-gta02.c
       ARM: S3C24XX: Use common macro to define resources on mach-h1940.c
       ARM: S3C24XX: Use common macro to define resources on mach-mini2440.c
       ARM: S3C24XX: Use common macro to define resources on mach-nexcoder.c
       ARM: S3C24XX: Use common macro to define resources on mach-otom.c
       ARM: S3C24XX: Use common macro to define resources on mach-rx1950.c
       ARM: S3C24XX: Use common macro to define resources on 
mach-tct_hammer.c
       ARM: S3C24XX: Use common macro to define resources on mach-vr1000.c
       ARM: S3C24XX: Use common macro to define resources on simtec-nor.c
       ARM: S3C64XX: Use common macro to define resources on dev-audio.c
       ARM: S3C64XX: Use common macro to define resources on dev-uart.c
       ARM: S3C64XX: Use common macro to define resources on mach-anw6410.c
       ARM: S3C64XX: Use common macro to define resources on mach-crag6410.c
       ARM: S3C64XX: Use common macro to define resources on mach-mini6410.c
       ARM: S3C64XX: Use common macro to define resources on mach-real6410.c
       ARM: S3C64XX: Use common macro to define resources on mach-smdk6410.c
       ARM: S5P64X0: Use common macro to define resources on dev-audio.c
       ARM: S5PC100: Use common macro to define resources on dev-audio.c
       ARM: S5PV210: Use common macro to define resources on dev-audio.c
       ARM: S5PV210: Use common macro to define resources on mach-smdkv210.c
       ARM: S3C24XX: Use common macro to define resources on mach-osiris.c
       ARM: S3C24XX: Use common macro to define resources on mach-qt2410.c

  arch/arm/mach-exynos/cpuidle.c             |   53 +---------
  arch/arm/mach-exynos/dev-ahci.c            |   12 +--
  arch/arm/mach-exynos/dev-audio.c           |  156 
+++++-----------------------
  arch/arm/mach-exynos/mach-armlex4210.c     |   16 +---
  arch/arm/mach-exynos/mach-nuri.c           |    3 -
  arch/arm/mach-exynos/mach-origen.c         |    2 -
  arch/arm/mach-exynos/mach-smdk4x12.c       |    2 -
  arch/arm/mach-exynos/mach-smdkv310.c       |   17 +---
  arch/arm/mach-exynos/mach-universal_c210.c |    2 -
  arch/arm/mach-s3c24xx/bast-ide.c           |   36 +------
  arch/arm/mach-s3c24xx/mach-amlm5900.c      |    9 +--
  arch/arm/mach-s3c24xx/mach-anubis.c        |   62 ++---------
  arch/arm/mach-s3c24xx/mach-at2440evb.c     |   19 +---
  arch/arm/mach-s3c24xx/mach-bast.c          |   45 ++-------
  arch/arm/mach-s3c24xx/mach-gta02.c         |    7 +-
  arch/arm/mach-s3c24xx/mach-h1940.c         |    9 +--
  arch/arm/mach-s3c24xx/mach-mini2440.c      |   19 +---
  arch/arm/mach-s3c24xx/mach-nexcoder.c      |    6 +-
  arch/arm/mach-s3c24xx/mach-osiris.c        |   12 +--
  arch/arm/mach-s3c24xx/mach-otom.c          |    6 +-
  arch/arm/mach-s3c24xx/mach-qt2410.c        |   12 +--
  arch/arm/mach-s3c24xx/mach-rx1950.c        |    9 +--
  arch/arm/mach-s3c24xx/mach-tct_hammer.c    |    7 +-
  arch/arm/mach-s3c24xx/mach-vr1000.c        |   39 ++------
  arch/arm/mach-s3c24xx/simtec-nor.c         |    6 +-
  arch/arm/mach-s3c64xx/dev-audio.c          |  120 ++++------------------
  arch/arm/mach-s3c64xx/dev-uart.c           |   48 ++-------
  arch/arm/mach-s3c64xx/mach-anw6410.c       |   19 +---
  arch/arm/mach-s3c64xx/mach-crag6410.c      |   26 +----
  arch/arm/mach-s3c64xx/mach-mini6410.c      |   19 +---
  arch/arm/mach-s3c64xx/mach-real6410.c      |   19 +---
  arch/arm/mach-s3c64xx/mach-smdk6410.c      |   13 +--
  arch/arm/mach-s5p64x0/dev-audio.c          |   72 ++-----------
  arch/arm/mach-s5pc100/dev-audio.c          |  138 ++++--------------------
  arch/arm/mach-s5pv210/dev-audio.c          |  156 
+++++-----------------------
  arch/arm/mach-s5pv210/mach-smdkv210.c      |   19 +---
  arch/arm/plat-samsung/devs.c               |   16 +---
  arch/arm/plat-samsung/include/plat/sdhci.h |    7 --
  arch/arm/plat-samsung/platformdata.c       |    2 -
  39 files changed, 214 insertions(+), 1026 deletions(-)
