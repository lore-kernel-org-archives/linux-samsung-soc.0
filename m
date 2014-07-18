From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung fixes-4 for v3.16
Date: Sat, 19 Jul 2014 08:34:59 +0900
Message-ID: <53C9AF23.6030007@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f169.google.com ([209.85.192.169]:65096 "EHLO
	mail-pd0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933590AbaGRXfI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Jul 2014 19:35:08 -0400
Received: by mail-pd0-f169.google.com with SMTP id y10so5844439pdj.28
        for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Jul 2014 16:35:08 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "arm@kernel.org" <arm@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>

Hi,

This is a regression for v3.16 so please take this in -rc.

Thanks,
Kukjin

The following changes since commit 1795cd9b3a91d4b5473c97f491d63892442212ab:

   Linux 3.16-rc5 (2014-07-13 14:04:33 -0700)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/samsung-fixes-4

for you to fetch changes up to 4e3a498d6fc438d8c203c51aadc6ca8fb47b0577:

   ARM: EXYNOS: Fix core ID used by platsmp and hotplug code (2014-07-16 
02:59:18 +0900)

----------------------------------------------------------------
Samsung fixes-4 for v3.16
- Fix core ID for platsmp and hotplug
   This fixes existing calculation of PMU register offsets on
   exynos SoCs and this also fixes CPU hotplug with more than
   2 cores, because it removes incorrect condition check in
   platform_do_lowpower().

----------------------------------------------------------------
Tomasz Figa (1):
       ARM: EXYNOS: Fix core ID used by platsmp and hotplug code

  arch/arm/mach-exynos/hotplug.c | 10 ++++++----
  arch/arm/mach-exynos/platsmp.c | 34 +++++++++++++++++++---------------
  2 files changed, 25 insertions(+), 19 deletions(-)
