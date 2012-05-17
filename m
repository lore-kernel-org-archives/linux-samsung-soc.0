From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 0/3] ADD HSOTG support to SMDK and Origen boards
Date: Thu, 17 May 2012 17:24:12 +0530
Message-ID: <1337255655-10633-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:55043 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760001Ab2EQMEX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 May 2012 08:04:23 -0400
Received: by dady13 with SMTP id y13so2338036dad.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 May 2012 05:04:22 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

This patch series is based on Kukjin Kim's v3.5-for-usb tree.

Sachin Kamat (3):
  ARM: EXYNOS: Add HSOTG support to Origen
  ARM: EXYNOS: Add HSOTG device to SMDKV310
  ARM: S5PV210: Add HSOTG support to SMDKV210

 arch/arm/mach-exynos/Kconfig          |    2 ++
 arch/arm/mach-exynos/mach-origen.c    |    6 ++++++
 arch/arm/mach-exynos/mach-smdkv310.c  |    6 ++++++
 arch/arm/mach-s5pv210/Kconfig         |    2 ++
 arch/arm/mach-s5pv210/mach-smdkv210.c |    8 ++++++++
 5 files changed, 24 insertions(+), 0 deletions(-)

-- 
1.7.4.1
