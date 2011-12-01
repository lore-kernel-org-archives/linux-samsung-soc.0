From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 0/3] Framebuffer related fixes for Exynos / Origen
Date: Thu,  1 Dec 2011 11:20:08 +0530
Message-ID: <1322718611-20934-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:57628 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751095Ab1LAFwR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Dec 2011 00:52:17 -0500
Received: by yenl6 with SMTP id l6so1348981yen.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Nov 2011 21:52:17 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linaro-dev@lists.linaro.org, patches@linaro.org

Following patchset is required to add framebuffer support on Origen.

The patches are based on following commit on Kukjin's for-next branch.

a188e1e "Merge branch 'next-samsung-devel' into for-next"

Tushar Behera (3):
  ARM: EXYNOS: Increase DMA pool allocator size for framebuffer
	- Required to allocate the framebuffer successfully

  ARM: EXYNOS: Add clkdev lookup entry for lcd clock
	- Required for framebuffer operation

  ARM: EXYNOS: Invert VCLK polarity for framebuffer on Origen board
	- Required to remove glitch in LCD display

 arch/arm/mach-exynos/clock.c       |   14 +++++++++-----
 arch/arm/mach-exynos/cpu.c         |    7 +++++++
 arch/arm/mach-exynos/mach-origen.c |    3 ++-
 3 files changed, 18 insertions(+), 6 deletions(-)

-- 
1.7.4.1
