From: MyungJoo Ham <myungjoo.ham@gmail.com>
Subject: Pull Requeset: Exynos4 Register Address Update for Devfreq Drivers.
Date: Wed, 21 Dec 2011 16:45:22 +0900
Message-ID: <CAJ0PZbQ1=+BTs0Emi78kfOWD5d90+ND5Jc_SJ9T4BcGMXyny9A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:45228 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751427Ab1LUHp0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Dec 2011 02:45:26 -0500
Received: by eaad14 with SMTP id d14so956899eaa.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Dec 2011 23:45:24 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Linux Samsung SoC <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kyungmin Park <kyungmin.park@samsung.com>

Hello,

Please pull the patches for Exynos4 SoCs that support devfreq device
drivers for Exynos4210/4212/4412.

The patches are:
ARM: EXYNOS4: Add DMC1, allow PPMU access for DMC.
ARM: EXYNOS4: Add clock register addresses for Exynos4x12 bus devfreq driver
ARM Exynos4210-Nuri: support Exynos4210-bus Devfreq driver.

Gitweb: http://git.infradead.org/users/kmpark/linux-samsung/shortlog/refs/heads/devfreq-for-samsung
Git Repository: git://git.infradead.org/users/kmpark/linux-samsung
Branch: devfreq-for-samsung

The following changes since commit 390f998509bf049019df0b078c0a6606e0d57fb4:

Merge: e34d6b4 6f6c2aa
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun Dec 18 14:28:31 2011 -0800

  Merge git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi-rc-fixes-2.6
(2011-12-18 14:28:31 -0800)

are available in the git repository at:

  git://git.infradead.org/users/kmpark/linux-samsung.git devfreq-for-samsung

MyungJoo Ham (3):
      ARM: EXYNOS4: Add DMC1, allow PPMU access for DMC.
      ARM: EXYNOS4: Add clock register addresses for Exynos4x12 bus
devfreq driver
      ARM Exynos4210-Nuri: support Exynos4210-bus Devfreq driver.

 arch/arm/mach-exynos/cpu.c                     |    7 +++-
 arch/arm/mach-exynos/include/mach/map.h        |    1 +
 arch/arm/mach-exynos/include/mach/regs-clock.h |   42 ++++++++++++++++++++++++
 arch/arm/mach-exynos/mach-nuri.c               |   11 ++++--
 4 files changed, 57 insertions(+), 4 deletions(-)



-- 
MyungJoo Ham, Ph.D.
Mobile Software Platform Lab, DMC Business, Samsung Electronics
