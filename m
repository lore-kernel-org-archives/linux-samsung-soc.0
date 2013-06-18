From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 02/10] Samsung EXYNOS arch for v3.11
Date: Wed, 19 Jun 2013 04:59:59 +0900
Message-ID: <51C0BC3F.2060002@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f41.google.com ([209.85.160.41]:51715 "EHLO
	mail-pb0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932908Ab3FRUAD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Jun 2013 16:00:03 -0400
Received: by mail-pb0-f41.google.com with SMTP id rp16so4254383pbb.14
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2013 13:00:02 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

The following changes since commit 317ddd256b9c24b0d78fa8018f80f1e495481a10:

   Linux 3.10-rc5 (2013-06-08 17:41:04 -0700)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/exynos-arch-2

for you to fetch changes up to b5f3c75a75d31039c6de3ab38d074b43c60462f7:

   ARM: EXYNOS: call scu_enable() only in case of cortex-A9 processor 
(2013-06-19 03:41:38 +0900)

----------------------------------------------------------------
arch/arm/mach-exynos update
- enable XHCI on exynos5
- enable Pinctrl on exynos4 and exynos5
- calling scu_enable() is only available on Cortex-A9

----------------------------------------------------------------
Doug Anderson (1):
       ARM: EXYNOS: Select PINCTRL_EXYNOS for exynos4/5 at chip level

Leela Krishna Amudala (1):
       ARM: EXYNOS: call scu_enable() only in case of cortex-A9 processor

Vivek Gautam (1):
       ARM: EXYNOS: Enable XHCI support on exynos5

  arch/arm/mach-exynos/Kconfig   | 10 +++++++---
  arch/arm/mach-exynos/platsmp.c |  2 +-
  drivers/pinctrl/Kconfig        |  5 +++--
  3 files changed, 11 insertions(+), 6 deletions(-)
