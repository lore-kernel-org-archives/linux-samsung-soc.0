From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 1/6] Samsung cleanup for v3.13
Date: Mon, 21 Oct 2013 07:14:35 +0900
Message-ID: <526455CB.6050507@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f48.google.com ([209.85.160.48]:58383 "EHLO
	mail-pb0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751861Ab3JTWOk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 20 Oct 2013 18:14:40 -0400
Received: by mail-pb0-f48.google.com with SMTP id ma3so6053381pbc.7
        for <linux-samsung-soc@vger.kernel.org>; Sun, 20 Oct 2013 15:14:39 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, arm@kernel.org

The following changes since commit 4a10c2ac2f368583138b774ca41fac4207911983:

   Linux 3.12-rc2 (2013-09-23 15:41:09 -0700)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/samsung-cleanup

for you to fetch changes up to ae3c5d74ea0d5e2f1c32c527e5de36c7614525af:

   ARM: EXYNOS: remove CONFIG_MACH_EXYNOS[4, 5]_DT config options 
(2013-10-21 06:35:47 +0900)

----------------------------------------------------------------
Samsung Cleanup for v3.13
- remove unnecessary config options and header inclusions
- use CONFIG_ARCH_S3C64XX instead of PLAT_S3C64XX

----------------------------------------------------------------
Bartlomiej Zolnierkiewicz (1):
       ARM: EXYNOS: remove CONFIG_MACH_EXYNOS[4, 5]_DT config options

Jingoo Han (1):
       ARM: EXYNOS: remove unnecessary header inclusions from exynos4/5 
dt machine file

Tomasz Figa (5):
       ARM: S3C64XX: Move if ARCH_S3C64XX statement into mach-s3c64xx
       gpio: samsung: Use CONFIG_ARCH_S3C64XX to check for S3C64XX support
       s3c-camif: Use CONFIG_ARCH_S3C64XX to check for S3C64XX support
       ASoC: samsung: Use CONFIG_ARCH_S3C64XX to check for S3C64XX support
       ARM: S3C64XX: Kill CONFIG_PLAT_S3C64XX

  arch/arm/Kconfig                       |  4 ++--
  arch/arm/mach-exynos/Kconfig           | 38 
++++++++--------------------------
  arch/arm/mach-exynos/Makefile          |  4 ++--
  arch/arm/mach-exynos/mach-exynos4-dt.c |  4 ----
  arch/arm/mach-exynos/mach-exynos5-dt.c |  4 ----
  arch/arm/mach-s3c64xx/Kconfig          | 13 +++---------
  drivers/gpio/gpio-samsung.c            |  8 +++----
  drivers/media/platform/Kconfig         |  2 +-
  sound/soc/samsung/s3c-i2s-v2.c         |  6 +-----
  9 files changed, 22 insertions(+), 61 deletions(-)
