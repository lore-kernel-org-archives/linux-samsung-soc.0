From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 0/4] ARM: SAMSUNG: JPEG support on Exynos and S5PV210
Date: Thu,  1 Mar 2012 09:35:48 +0530
Message-ID: <1330574752-14088-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:56907 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755583Ab2CAEMU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Feb 2012 23:12:20 -0500
Received: by pbcup15 with SMTP id up15so386443pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Feb 2012 20:12:20 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

This patch series adds JPEG platform support to S5PV210 and board support to 
SMDKV210, SMDKV310 and Origen. 
This series is based on Kukjin Kim's for-next branch.

This series depends on the following patches:

http://www.spinics.net/lists/linux-samsung-soc/msg09163.html
http://www.spinics.net/lists/linux-samsung-soc/msg09475.html
http://www.spinics.net/lists/linux-samsung-soc/msg09554.html


Sachin Kamat (4):
  ARM: EXYNOS: Enable JPEG on SMDKV310
  ARM: EXYNOS: Enable JPEG on Origen
  ARM: S5PV210: Add JPEG board definition
  ARM: S5PV210: Enable JPEG on SMDKV210

 arch/arm/mach-exynos/Kconfig             |    2 ++
 arch/arm/mach-exynos/mach-origen.c       |    1 +
 arch/arm/mach-exynos/mach-smdkv310.c     |    1 +
 arch/arm/mach-s5pv210/Kconfig            |    1 +
 arch/arm/mach-s5pv210/clock.c            |    5 +++++
 arch/arm/mach-s5pv210/include/mach/map.h |    4 ++++
 arch/arm/mach-s5pv210/mach-smdkv210.c    |    1 +
 7 files changed, 15 insertions(+), 0 deletions(-)

-- 
1.7.4.1
