From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung 2nd cleanup for v3.17
Date: Fri, 01 Aug 2014 04:00:31 +0900
Message-ID: <53DA924F.40201@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f171.google.com ([209.85.192.171]:45543 "EHLO
	mail-pd0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751008AbaGaTAi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jul 2014 15:00:38 -0400
Received: by mail-pd0-f171.google.com with SMTP id z10so4018409pdj.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 31 Jul 2014 12:00:38 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "arm@kernel.org" <arm@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi Arnd, Olof

One more pull-request. Sorry.

Thanks,
Kukjin

The following changes since commit f1ff47454bb2fe0d5644f981679d1bea532816fd:

   clk: samsung: s5pv210: Remove legacy board support (2014-07-19 
04:32:19 +0900)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/samsung-cleanup-2

for you to fetch changes up to 3f47c65f86e7f85871432f7e2f6b3698f7c86021:

   ARM: S5PV210: move <mach/regs-clock.h> into mach-s5pv210/ (2014-08-01 
03:22:04 +0900)

----------------------------------------------------------------
Samsung 2nd cleanup for v3.17

- since <mach/memory.h> in mach-exynos is not included
   long time so can remove it

- move <mach/regs-clock.h> into mach-s5pv210 and now
   no more header files in mach-s5pv210/include/mach

Note move <mach/regs-clock.h> in mach-s5pv210 depends on
previous tags/s5pv210-dt which supports s5pv210 DT.

----------------------------------------------------------------
Kukjin Kim (1):
       ARM: S5PV210: move <mach/regs-clock.h> into mach-s5pv210/

Uwe Kleine-Koenig (1):
       ARM: EXYNOS: remove unused <mach/memory.h>

  arch/arm/mach-exynos/include/mach/memory.h         | 26 
----------------------
  arch/arm/mach-s5pv210/pm.c                         |  3 +--
  .../mach-s5pv210/{include/mach => }/regs-clock.h   |  3 +--
  arch/arm/mach-s5pv210/s5pv210.c                    |  2 +-
  4 files changed, 3 insertions(+), 31 deletions(-)
  delete mode 100644 arch/arm/mach-exynos/include/mach/memory.h
  rename arch/arm/mach-s5pv210/{include/mach => }/regs-clock.h (99%)
