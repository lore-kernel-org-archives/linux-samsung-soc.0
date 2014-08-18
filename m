From: Vikas Sajjan <vikas.sajjan@samsung.com>
Subject: [PATCH v4 0/2] Refactor the pm code to use DT based lookup
Date: Mon, 18 Aug 2014 19:34:19 +0545
Message-ID: <1408369761-5458-1-git-send-email-vikas.sajjan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f176.google.com ([209.85.192.176]:45131 "EHLO
	mail-pd0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750709AbaHRNtf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Aug 2014 09:49:35 -0400
Received: by mail-pd0-f176.google.com with SMTP id y10so7516439pdj.7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Aug 2014 06:49:35 -0700 (PDT)
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
