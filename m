From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung board stuff for v3.4
Date: Sat, 10 Mar 2012 07:34:35 -0800
Message-ID: <4F5B748B.6050404@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:59334 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755104Ab2CJPel (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 10 Mar 2012 10:34:41 -0500
Received: by gghe5 with SMTP id e5so1568532ggh.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 10 Mar 2012 07:34:40 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>

Hi Arnd, Olof,

Please pull regarding Samsung board patches for v3.4.

Most are enabling some features(IPs) on each board and
one is adding new board file, Samsung Mobile's TRATS board.

If any problems, please let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit 192cfd58774b4d17b2fe8bdc77d89c2ef4e0591d:

   Linux 3.3-rc6 (2012-03-03 17:08:09 -0800)

are available in the git repository at:
   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
next/board-samsung

Andrzej Pietrasiewicz (2):
       ARM: EXYNOS: Register JPEG on universal_c210
       ARM: EXYNOS: Register JPEG on nuri

HeungJun, Kim (1):
       ARM: EXYNOS: Adds Samsung TRATS board support

Kamil Debski (2):
       ARM: EXYNOS: add G2D to mach-nuri
       ARM: EXYNOS: add G2D to mach-universal

Mark Brown (8):
       ARM: S3C64XX: Support GPIO LEDs on Cragganmore
       ARM: S3C64XX: Fix build of Cragganmore after SPI changes
       ARM: S3C64XX: Enable power management for disk on Cragganmore
       ARM: S3C64XX: Enable power management for WiFi on Cragganmore
       ARM: S3C64XX: Add hookup for Tomatin module on Cragganmore
       ARM: S3C64XX: Add a SPKVDD supply for CODECs on Cragganmore
       ARM: S3C64XX: Add some more Cragganmore module IDs to the table
       ARM: S3C64XX: Supply platform data for SPI on Cragganmore

MyungJoo Ham (1):
       ARM: EXYNOS: support Exynos4210-bus Devfreq driver on Nuri board

Sachin Kamat (13):
       ARM: EXYNOS: Enable G2D on ORIGEN
       ARM: S5PV210: Add missing FIMC media device to Aquila
       ARM: EXYNOS: Add missing FIMC media device to SMDKV310
       ARM: EXYNOS: Add missing FIMC media device to Origen
       ARM: EXYNOS: Enable G2D on SMDKV310
       ARM: S5PV210: Enable MFC on SMDKV210
       ARM: S5PV210: Enable MFC on SMDKC110
       ARM: S5PV210: Enable FIMC on SMDKV210
       ARM: S5PV210: Enable FIMC on SMDKC110
       ARM: EXYNOS: Enable JPEG on SMDKV310
       ARM: EXYNOS: Enable JPEG on Origen
       ARM: S5PV210: Add JPEG board definition
       ARM: S5PV210: Enable JPEG on SMDKV210

Sangwook Lee (1):
       ARM: EXYNOS: Enable Bluetooth on ORIGEN

Sylwester Nawrocki (3):
       ARM: EXYNOS: Increase virtual framebuffer size on Universal C210 
board
       ARM: EXYNOS: Add support for S5K6AAFX image sensor on Universal 
C210 board
       ARM: SAMSUNG: Add support for S5K6AAFX camera on Nuri board

Tushar Behera (2):
       ARM: EXYNOS: Add __init attribute to nuri_camera_init()
       ARM: EXYNOS: Add __init attribute to universal_camera_init()

  arch/arm/mach-exynos/Kconfig                 |   21 ++
  arch/arm/mach-exynos/Makefile                |    1 +
  arch/arm/mach-exynos/mach-nuri.c             |   80 ++++++-
  arch/arm/mach-exynos/mach-origen.c           |   37 +++
  arch/arm/mach-exynos/mach-smdkv310.c         |    3 +
  arch/arm/mach-exynos/mach-trats.c            |  344 
++++++++++++++++++++++++++
  arch/arm/mach-exynos/mach-universal_c210.c   |   80 ++++++-
  arch/arm/mach-s3c64xx/Kconfig                |    1 +
  arch/arm/mach-s3c64xx/mach-crag6410-module.c |   31 +++-
  arch/arm/mach-s3c64xx/mach-crag6410.c        |   67 +++++-
  arch/arm/mach-s5pv210/Kconfig                |    9 +
  arch/arm/mach-s5pv210/clock.c                |    5 +
  arch/arm/mach-s5pv210/include/mach/map.h     |    4 +
  arch/arm/mach-s5pv210/mach-aquila.c          |    1 +
  arch/arm/mach-s5pv210/mach-smdkc110.c        |   14 +
  arch/arm/mach-s5pv210/mach-smdkv210.c        |   15 ++
  16 files changed, 702 insertions(+), 11 deletions(-)
  create mode 100644 arch/arm/mach-exynos/mach-trats.c
