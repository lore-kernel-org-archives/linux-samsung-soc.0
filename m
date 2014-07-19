From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 1/5] Samsung non-critical-fixes for v3.17
Date: Sat, 19 Jul 2014 09:51:45 +0900
Message-ID: <53C9C121.6090403@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f176.google.com ([209.85.192.176]:57243 "EHLO
	mail-pd0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753500AbaGSAvw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Jul 2014 20:51:52 -0400
Received: by mail-pd0-f176.google.com with SMTP id y10so5838568pdj.7
        for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Jul 2014 17:51:52 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "arm@kernel.org" <arm@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

The following changes since commit 1795cd9b3a91d4b5473c97f491d63892442212ab:

   Linux 3.16-rc5 (2014-07-13 14:04:33 -0700)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/fixes-for-3.17

for you to fetch changes up to 042b687f880adcca77847688aac35e2e16927944:

   ARM: EXYNOS: Fix build breakge with PM_SLEEP=n (2014-07-19 04:45:02 
+0900)

----------------------------------------------------------------
Samsung non critical fixes for v3.17
- update exynos_defconfig for remove outdated configs and
enable most of the configs used on latest exynos platforms
- fix build breakge for exynos_defconfig with PM_SLEEP=n

----------------------------------------------------------------
Krzysztof Kozlowski (1):
       ARM: EXYNOS: Fix build breakge with PM_SLEEP=n

Sachin Kamat (1):
       ARM: exynos_defconfig: Update exynos_defconfig

  arch/arm/configs/exynos_defconfig | 56 ++++++++++++++++++++++++++++-----
  arch/arm/mach-exynos/platsmp.c    | 66 
+++++++++++++++++++++++++++++++++++++++
  arch/arm/mach-exynos/pm.c         | 66 
---------------------------------------
  3 files changed, 114 insertions(+), 74 deletions(-)
