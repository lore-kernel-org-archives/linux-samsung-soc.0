From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 0/3] Extend SDHCI support for Origen board
Date: Fri, 26 Aug 2011 15:08:41 +0530
Message-ID: <1314351524-10942-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f42.google.com ([209.85.210.42]:58318 "EHLO
	mail-pz0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752803Ab1HZJlg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Aug 2011 05:41:36 -0400
Received: by pzk37 with SMTP id 37so3982659pzk.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Aug 2011 02:41:35 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linaro-dev@lists.linaro.org, kgene.kim@samsung.com, patches@linaro.org

Patch 1: It fixes the incorrect card detection type.
Patch 2: It enables secondary MMC port.
Patch 3: It extends support of 8-bit bus width

The patches are rebased to for-next branch of
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git

Tushar Behera (3):
  ARM: EXYNOS4: Fix sdhci card detection for ORIGEN
  ARM: EXYNOS4: Add support for secondary MMC port on ORIGEN
  ARM: EXYNOS4: Add support for 8-bit bus width in SDHCI for ORIGEN

 arch/arm/mach-exynos4/Kconfig       |    1 +
 arch/arm/mach-exynos4/mach-origen.c |   19 ++++++++++++++++---
 2 files changed, 17 insertions(+), 3 deletions(-)

-- 
1.7.4.1
