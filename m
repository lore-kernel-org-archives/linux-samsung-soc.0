From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 0/3] ARM: EXYNOS/S5PV210: Add missing FIMC media device
Date: Thu, 29 Dec 2011 11:59:33 +0530
Message-ID: <1325140176-2309-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:34272 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751333Ab1L2GdZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Dec 2011 01:33:25 -0500
Received: by iaeh11 with SMTP id h11so23180375iae.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Dec 2011 22:33:24 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org, snjw23@gmail.com

FIMC media device (md) registers all required video nodes.
This is required for functioning of FIMC devices.

Thanks to Sylwester Nawrocki for pointing this out.

This patchset is based on the latest for-next branch of Kukjin Kim's tree.

Sachin Kamat (3):
  ARM: S5PV210: Add missing FIMC media device to Aquila
  ARM: EXYNOS: Add missing FIMC media device to SMDKV310
  ARM: EXYNOS: Add missing FIMC media device to Origen

 arch/arm/mach-exynos/mach-origen.c   |    1 +
 arch/arm/mach-exynos/mach-smdkv310.c |    1 +
 arch/arm/mach-s5pv210/mach-aquila.c  |    1 +
 3 files changed, 3 insertions(+), 0 deletions(-)

-- 
1.7.4.1
