From: Vikas Sajjan <vikas.sajjan@samsung.com>
Subject: [PATCH v3 0/2] Refactor the pm code to use DT based lookup
Date: Thu,  7 Aug 2014 17:44:46 +0545
Message-ID: <1407412789-1919-1-git-send-email-vikas.sajjan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f173.google.com ([209.85.192.173]:51190 "EHLO
	mail-pd0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754597AbaHGMAH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Aug 2014 08:00:07 -0400
Received: by mail-pd0-f173.google.com with SMTP id w10so5107905pde.18
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 Aug 2014 05:00:07 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, sajjan.linux@gmail.com, dianders@chromium.org, olof@lixom.net

Refactoring the pm.c to avoid using "soc_is_exynos" checks,
instead use the DT based lookup.

While at it, move exynos5250 specific disabling of JPEG USE_RETENTION to pmu.c

changes since v2:
	- Addressed Tomasz Figa's comments to unify the functions for exynos4
	and exynos5250.
	- Added new patch to move exynos5250 specific disabling of 
		JPEG USE_RETENTION to pmu.c 
	- Addressed comment from Thomas Abraham.
changes since v1:
	- Address Kukjin Kim comments to respin this patch separately from
		http://lists.infradead.org/pipermail/linux-arm-kernel/2014-July/272574.html
	- removed panic, returned if no PMU node found and added check in exynos_wkup_irq.

Rebased on Kukjin Kim's tree, for-next branch 
	https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/log/?h=for-next

Vikas Sajjan (2):
  ARM: EXYNOS: Move Disabling of JPEG USE_RETENTION for exynos5250 to
    pmu.c
  ARM: EXYNOS: Refactor the pm code to use DT based lookup

 arch/arm/mach-exynos/pm.c       |  173 ++++++++++++++++++++++++++++-----------
 arch/arm/mach-exynos/pmu.c      |    6 ++
 arch/arm/mach-exynos/regs-pmu.h |    1 +
 3 files changed, 132 insertions(+), 48 deletions(-)

-- 
1.7.9.5
