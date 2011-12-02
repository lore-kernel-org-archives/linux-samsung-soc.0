From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH 0/3] Moving xusbxti clock setting in clock.c file.
Date: Fri,  2 Dec 2011 12:08:15 +0530
Message-ID: <1322807898-14825-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:53148 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751307Ab1LBGk3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 Dec 2011 01:40:29 -0500
Received: by iage36 with SMTP id e36so3699997iag.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 Dec 2011 22:40:29 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linaro-dev@lists.linaro.org
Cc: kgene.kim@samsung.com, pankaj.dubey@samsung.com

Since there is code duplication in different mach-board.c file it is better
to set default clock rate of xusbxti clock in plat-s5p/clock.c file.

The patches are based on following commit on Kukjin's for-next branch.

Pankaj (1):
  ARM: S5P: Set default rate of xusbxti clock

Pankaj Dubey (2):
  ARM: EXYNOS: Removed code for setting clock rate of xusbxti
  ARM: S5PV210: Removed code for setting clock rate of xusbxti

 arch/arm/mach-exynos/mach-nuri.c     |    1 -
 arch/arm/mach-exynos/mach-origen.c   |    1 -
 arch/arm/mach-exynos/mach-smdk4x12.c |    2 --
 arch/arm/mach-exynos/mach-smdkv310.c |    1 -
 arch/arm/mach-s5pv210/mach-goni.c    |    1 -
 arch/arm/plat-s5p/clock.c            |    1 +
 6 files changed, 1 insertions(+), 6 deletions(-)

-- 
1.7.4.1
