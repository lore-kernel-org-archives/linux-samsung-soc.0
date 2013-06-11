From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 6/6] s3c24xx driver
Date: Wed, 12 Jun 2013 06:09:10 +0900
Message-ID: <51B791F6.4000004@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f182.google.com ([209.85.192.182]:53640 "EHLO
	mail-pd0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754753Ab3FKVJO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Jun 2013 17:09:14 -0400
Received: by mail-pd0-f182.google.com with SMTP id r10so2972725pdi.27
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Jun 2013 14:09:14 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

The following changes since commit 317ddd256b9c24b0d78fa8018f80f1e495481a10:

   Linux 3.10-rc5 (2013-06-08 17:41:04 -0700)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/s3c24xx-driver-1

for you to fetch changes up to ae7b6dccf6711e8d5815688f1572ab55bf5b3069:

   Merge branch 'v3.11-next/driver-cpufreq' into 
v3.11-next/s3c24xx-driver (2013-06-12 05:24:22 +0900)

----------------------------------------------------------------

update driver for s3c24xx
- move cpufreq driver into drivers/
- add pinctrl-s3c24xx driver
- cleanup OF in gpio driver

----------------------------------------------------------------
Heiko Stuebner (1):
       pinctrl: Add pinctrl-s3c24xx driver

Kukjin Kim (3):
       Merge branch 'v3.11-next/driver-gpio' into v3.11-next/s3c24xx-driver
       Merge branch 'v3.11-next/driver-pinctrl' into 
v3.11-next/s3c24xx-driver
       Merge branch 'v3.11-next/driver-cpufreq' into 
v3.11-next/s3c24xx-driver

Sylwester Nawrocki (1):
       gpio: samsung: Remove OF support for s3c24xx

Viresh Kumar (1):
       cpufreq: s3c24xx: move cpufreq driver to drivers/cpufreq

  .../devicetree/bindings/gpio/gpio-samsung.txt      |  43 --
  .../bindings/pinctrl/samsung-pinctrl.txt           |   8 +
  arch/arm/Kconfig                                   |  47 --
  arch/arm/mach-s3c24xx/Kconfig                      |  66 +--
  arch/arm/mach-s3c24xx/Makefile                     |   6 -
  arch/arm/mach-s3c24xx/{ => include/mach}/s3c2412.h |   0
  arch/arm/mach-s3c24xx/iotiming-s3c2412.c           |   2 +-
  arch/arm/plat-samsung/include/plat/cpu-freq-core.h |  10 +-
  arch/arm/plat-samsung/include/plat/cpu-freq.h      |   6 +-
  drivers/cpufreq/Kconfig.arm                        |  58 ++
  drivers/cpufreq/Makefile                           |   5 +
  .../cpufreq/s3c2410-cpufreq.c                      |   0
  .../cpufreq/s3c2412-cpufreq.c                      |   3 +-
  .../cpufreq/s3c2440-cpufreq.c                      |   0
  .../cpufreq/s3c24xx-cpufreq-debugfs.c              |   0
  .../cpufreq.c => drivers/cpufreq/s3c24xx-cpufreq.c |   0
  drivers/gpio/gpio-samsung.c                        |  67 +--
  drivers/pinctrl/Kconfig                            |   5 +
  drivers/pinctrl/Makefile                           |   1 +
  drivers/pinctrl/pinctrl-s3c24xx.c                  | 652 
+++++++++++++++++++++
  drivers/pinctrl/pinctrl-samsung.c                  |  10 +
  drivers/pinctrl/pinctrl-samsung.h                  |   4 +
  22 files changed, 784 insertions(+), 209 deletions(-)
  rename arch/arm/mach-s3c24xx/{ => include/mach}/s3c2412.h (100%)
  rename arch/arm/mach-s3c24xx/cpufreq-s3c2410.c => 
drivers/cpufreq/s3c2410-cpufreq.c (100%)
  rename arch/arm/mach-s3c24xx/cpufreq-s3c2412.c => 
drivers/cpufreq/s3c2412-cpufreq.c (99%)
  rename arch/arm/mach-s3c24xx/cpufreq-s3c2440.c => 
drivers/cpufreq/s3c2440-cpufreq.c (100%)
  rename arch/arm/mach-s3c24xx/cpufreq-debugfs.c => 
drivers/cpufreq/s3c24xx-cpufreq-debugfs.c (100%)
  rename arch/arm/mach-s3c24xx/cpufreq.c => 
drivers/cpufreq/s3c24xx-cpufreq.c (100%)
  create mode 100644 drivers/pinctrl/pinctrl-s3c24xx.c
