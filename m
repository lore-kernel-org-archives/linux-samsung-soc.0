From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] 3rd Samsung fixes for v3.4
Date: Fri, 27 Apr 2012 07:27:30 -0700
Message-ID: <4F9AACD2.80308@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:62959 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756683Ab2D0O1c (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Apr 2012 10:27:32 -0400
Received: by pbbrp8 with SMTP id rp8so614288pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Apr 2012 07:27:32 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi Arnd, Olof

Here this pull request includes fix for some remained build error and 
warning for samsung stuff and change the device name for exynos4 sdhci 
according to change of regarding driver and fix gic initializer for 
exynos5 dt.

Please pull from:
   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
v3.4-samsung-fixes-3

If any problems, please let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit e816b57a337ea3b755de72bec38c10c864f23015:

   Linux 3.4-rc3 (2012-04-15 18:28:29 -0700)

are available in the git repository at:
   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
v3.4-samsung-fixes-3

Arnd Bergmann (1):
       ARM: mini2440_defconfig: Fix build error

Kukjin Kim (2):
       ARM: S3C24XX: Fix build warning for S3C2410_PM
       ARM: EXYNOS: Fix resource on dev-dwmci.c

Marek Szyprowski (1):
       ARM: SAMSUNG: add missing MMC_CAP2_BROKEN_VOLTAGE capability

Thomas Abraham (2):
       ARM: EXYNOS: use 'exynos4-sdhci' as device name for sdhci controllers
       ARM: EXYNOS: Fix incorrect initialization of GIC

Tushar Behera (1):
       ARM: EXYNOS: Fix compilation error when CONFIG_OF is not defined

  arch/arm/configs/mini2440_defconfig        |    2 ++
  arch/arm/mach-exynos/clock-exynos4.c       |   24 ++++++++++++------------
  arch/arm/mach-exynos/clock-exynos5.c       |   24 ++++++++++++------------
  arch/arm/mach-exynos/common.c              |   14 +++++++++++++-
  arch/arm/mach-exynos/dev-dwmci.c           |   13 +++----------
  arch/arm/mach-exynos/mach-nuri.c           |    1 +
  arch/arm/mach-exynos/mach-universal_c210.c |    1 +
  arch/arm/mach-s3c24xx/Kconfig              |    8 ++++----
  arch/arm/mach-s5pv210/mach-goni.c          |    2 ++
  arch/arm/plat-samsung/include/plat/sdhci.h |   28 
++++++++++++++++++++++++++++
  10 files changed, 78 insertions(+), 39 deletions(-)
