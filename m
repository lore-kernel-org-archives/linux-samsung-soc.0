From: Chander Kashyap <chander.kashyap@linaro.org>
Subject: [RFC] [PATCH 0/2] ARM: EXYNOS4: Add new cpuidle state
Date: Thu, 13 Sep 2012 17:25:33 +0530
Message-ID: <1347537335-26657-1-git-send-email-chander.kashyap@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:44367 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757617Ab2IML4Z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Sep 2012 07:56:25 -0400
Received: by dady13 with SMTP id y13so1660018dad.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Sep 2012 04:56:24 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org
Cc: kgene.kim@samsung.com, ksoo.yu@samsung.com, jc.lee@samsung.com, Chander Kashyap <chander.kashyap@linaro.org>

This patchset does following:

Patch 1: Segregate and move common code to new function
Patch 2: Adds C2 idle state

It has been tested on Kukjin's for-next branch on Origen board.

Chander Kashyap (2):
  ARM: Exynos4: CPUIDLE: Add generic function for exynos4 cpuidle
  ARM: EXYNOS4: CPUIDLE: Add C2 state

 arch/arm/mach-exynos/cpuidle.c |  385 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 373 insertions(+), 12 deletions(-)

-- 
1.7.9.5
