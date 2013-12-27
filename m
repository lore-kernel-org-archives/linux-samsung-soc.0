From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 0/3] Remove Exynos specific code from legacy files
Date: Fri, 27 Dec 2013 11:59:52 +0530
Message-ID: <1388125795-30418-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f176.google.com ([209.85.192.176]:45311 "EHLO
	mail-pd0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752662Ab3L0Gd0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Dec 2013 01:33:26 -0500
Received: by mail-pd0-f176.google.com with SMTP id w10so8710804pde.21
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Dec 2013 22:33:25 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, patches@linaro.org

No need to maintain Exynos specific codes for legacy files as they
are not compiled for Exynos platforms. Remove any reference to Exynos
from those files.

Tushar Behera (3):
  ARM: SAMSUNG: Remove Exynos specific code from devs.c
  ARM: SAMSUNG: Remove Exynos specific code from s5p-pm-irq.c
  ARM: SAMSUNG: Remove Exynos specific code from pm-gpio.c

 arch/arm/plat-samsung/devs.c       |   10 ++--------
 arch/arm/plat-samsung/pm-gpio.c    |    5 ++---
 arch/arm/plat-samsung/s5p-irq-pm.c |   13 -------------
 3 files changed, 4 insertions(+), 24 deletions(-)

-- 
1.7.9.5
