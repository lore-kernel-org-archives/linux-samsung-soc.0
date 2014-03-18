From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 1/2] Samsung 2nd cleanup for v3.15
Date: Tue, 18 Mar 2014 23:12:39 +0900
Message-ID: <53285457.80900@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f47.google.com ([209.85.160.47]:49004 "EHLO
	mail-pb0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755242AbaCROMo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Mar 2014 10:12:44 -0400
Received: by mail-pb0-f47.google.com with SMTP id up15so7290452pbc.6
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Mar 2014 07:12:44 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, arm@kernel.org
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

The following changes since commit d9671ca923445aa870ecc34df3db01dd602d87fc:

   ARM: EXYNOS: Remove uncompress.h (2014-02-24 09:39:18 +0900)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/samsung-cleanup-2

for you to fetch changes up to 19a964644f1e655c3f67d539c1e99a9fbcc4588c:

   ARM: SAMSUNG: remove all custom uncompress.h (2014-03-11 22:05:18 +0900)

----------------------------------------------------------------
Samsung cleanup-2 for v3.15
- use generic uncompress.h and remove all custom
   uncompress.h in mach-s3c24xx, s3c64xx, s5p64x0,
   s5pc100, s5pv210 and plat-samsung directories.

Note that based on previous tags/samsung-cleanup

----------------------------------------------------------------
Heiko Stuebner (2):
       ARM: SAMSUNG: use generic uncompress.h
       ARM: SAMSUNG: remove all custom uncompress.h

  arch/arm/Kconfig.debug                          |   4 +-
  arch/arm/mach-s3c24xx/include/mach/uncompress.h |  57 --------
  arch/arm/mach-s3c64xx/include/mach/uncompress.h |  31 -----
  arch/arm/mach-s5p64x0/include/mach/uncompress.h |  34 -----
  arch/arm/mach-s5pc100/include/mach/uncompress.h |  30 ----
  arch/arm/mach-s5pv210/include/mach/uncompress.h |  28 ----
  arch/arm/plat-samsung/include/plat/uncompress.h | 175 
------------------------
  7 files changed, 2 insertions(+), 357 deletions(-)
  delete mode 100644 arch/arm/mach-s3c24xx/include/mach/uncompress.h
  delete mode 100644 arch/arm/mach-s3c64xx/include/mach/uncompress.h
  delete mode 100644 arch/arm/mach-s5p64x0/include/mach/uncompress.h
  delete mode 100644 arch/arm/mach-s5pc100/include/mach/uncompress.h
  delete mode 100644 arch/arm/mach-s5pv210/include/mach/uncompress.h
  delete mode 100644 arch/arm/plat-samsung/include/plat/uncompress.h
