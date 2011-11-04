From: amit.kachhap@linaro.org
Subject: [PATCH 0/4]ARM: exynos4: Add l2 retention mode cpuidle state
Date: Fri,  4 Nov 2011 13:03:44 -0400
Message-ID: <1320426228-21746-1-git-send-email-amit.kachhap@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:50426 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932550Ab1KDREA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Nov 2011 13:04:00 -0400
Received: by ywf7 with SMTP id 7so2699497ywf.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Nov 2011 10:04:00 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linaro-dev@lists.linaro.org, linux-arm-kernel@lists.infradead.org, patches@linaro.org, kgene.kim@samsung.com, Amit Daniel Kachhap <amit.kachhap@linaro.org>

From: Amit Daniel Kachhap <amit.kachhap@linaro.org>

This Patch series adds support for AFTR mode cpuidle state based on 
patch (http://www.spinics.net/lists/arm-kernel/msg132243.html) earlier
submitted by Jaecheol Lee <jc.lee@samsung.com>.

This patch uses CPU PM notifiers , common l2 save/restore and 
new cpu_suspend/resume interfaces and is based on the tip of 
linus tree(git://github.com/torvalds/linux.git). 

Amit Daniel Kachhap (3):
  ARM: exynos4: Add support for AFTR mode cpuidle state
  ARM: exynos4: add L2 early resume code
  ARM: exynos4: remove useless code to save/restore L2 and GIC state

Lorenzo Pieralisi (1):
  ARM: exynos4: remove useless churn in sleep.S

 arch/arm/mach-exynos4/cpu.c              |   43 ++++++--
 arch/arm/mach-exynos4/cpuidle.c          |  152 +++++++++++++++++++++++++++++-
 arch/arm/mach-exynos4/include/mach/pmu.h |    2 +
 arch/arm/mach-exynos4/pm.c               |   86 -----------------
 arch/arm/mach-exynos4/sleep.S            |   29 +++++-
 5 files changed, 210 insertions(+), 102 deletions(-)

-- 
1.7.5.4
