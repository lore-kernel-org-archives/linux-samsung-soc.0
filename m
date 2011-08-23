From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 0/2] ARM: EXYNOS4: USB: Code cleanup and PHY initialization
Date: Tue, 23 Aug 2011 16:58:55 +0530
Message-ID: <1314098937-4727-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f42.google.com ([209.85.210.42]:47771 "EHLO
	mail-pz0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751706Ab1HWLbq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Aug 2011 07:31:46 -0400
Received: by pzk37 with SMTP id 37so12788pzk.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Aug 2011 04:31:45 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linaro-dev@lists.linaro.org, patches@linaro.org, sachin.kamat@linaro.org

This patch set is based on Kukjin Kim's for-next branch.
Tested on SMDKV310 and Origen boards.

The patch set cleans up intermediate functions and combines USB host and device
initialisation into a single function.

Pankaj Dubey (2):
  ARM: EXYNOS4: Code cleanup and remove extra functions.
  ARM: EXYNOS4: Add USB phy initialization for device

 arch/arm/mach-exynos4/include/mach/regs-pmu.h |    2 +-
 arch/arm/mach-exynos4/setup-usb-phy.c         |  123 +++++++++++++++++--------
 2 files changed, 84 insertions(+), 41 deletions(-)

-- 
1.7.4.1
