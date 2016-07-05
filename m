From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH 0/2] Add PMU support for Exynos7
Date: Wed,  6 Jul 2016 01:58:25 +0530
Message-ID: <1467750507-13853-1-git-send-email-a.kesavan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f66.google.com ([209.85.220.66]:32925 "EHLO
	mail-pa0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754964AbcGEQVH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Jul 2016 12:21:07 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, k.kozlowski@samsung.com
Cc: linux-kernel@vger.kernel.org

Add support for the Power Management Unit on Exynos7. These patches
have been tested on an Exynos7 espresso board (next-20160704).

Abhilash Kesavan (2):
  soc: samsung: Change type of PMU configuration register value to u32
  soc: samsung: Add support for Exynos7 PMU

 drivers/soc/samsung/Makefile                |   3 +-
 drivers/soc/samsung/exynos-pmu.c            |   3 +
 drivers/soc/samsung/exynos-pmu.h            |   4 +-
 drivers/soc/samsung/exynos7-pmu.c           | 367 ++++++++++++++++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h | 259 ++++++++++++++++++++
 5 files changed, 634 insertions(+), 2 deletions(-)
 create mode 100644 drivers/soc/samsung/exynos7-pmu.c

-- 
1.9.1
