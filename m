From: Vikas Sajjan <vikas.sajjan@samsung.com>
Subject: [RESEND PATCH v4 0/2] Refactor the pm code to use DT based lookup
Date: Tue, 19 Aug 2014 12:37:45 +0545
Message-ID: <1408431167-14134-1-git-send-email-vikas.sajjan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f54.google.com ([209.85.220.54]:60307 "EHLO
	mail-pa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752666AbaHSGxA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Aug 2014 02:53:00 -0400
Received: by mail-pa0-f54.google.com with SMTP id fa1so9428070pad.13
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Aug 2014 23:52:56 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, sajjan.linux@gmail.com, dianders@chromium.org, olof@lixom.net

Refactoring the pm.c to avoid using "soc_is_exynos" checks,
instead use the DT based lookup.

While at it, move exynos5250 specific disabling of JPEG USE_RETENTION to pmu.c

changes since v3:
	- Addressed comments from Tomasz Figa.
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

Tested on 5250 based Chromebook.

Vikas Sajjan (2):
  ARM: EXYNOS: Move Disabling of JPEG USE_RETENTION for exynos5250 to
    pmu.c
  ARM: EXYNOS: Refactor the pm code to use DT based lookup

 arch/arm/mach-exynos/pm.c       |  172 ++++++++++++++++++++++++++++-----------
 arch/arm/mach-exynos/pmu.c      |    1 +
 arch/arm/mach-exynos/regs-pmu.h |    1 +
 3 files changed, 127 insertions(+), 47 deletions(-)

-- 
1.7.9.5
