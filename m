From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH v2 0/2] ARM: EXYNOS: G2D clock support to Exynos4
Date: Mon, 16 Jul 2012 10:36:58 +0530
Message-ID: <1342415220-15497-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:33902 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750817Ab2GPFHZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Jul 2012 01:07:25 -0400
Received: by pbbrp8 with SMTP id rp8so9452839pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 15 Jul 2012 22:07:25 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

This patch series moves the SoC specific G2D clock entries from common clock-
file (clock-exynos4.c) to Exynos4210 specific clock file (clock-exynos4210.c)
since G2D clock registers are different in Exynos4210 and Exynos4X12 SoCs
and adds support for Exynos4x12 G2D clock.

Changes since v1:
Incorporated Kukjin's comments to use exynos4210/4x12 in structure names
instead of exynos4 for better clarity.

This series is based on Kukjin Kim's latest next/devel-samsung branch.

Sachin Kamat (2):
  ARM: EXYNOS: Move G2D clock entries to clock-exynos4210.c file
  ARM: EXYNOS: Add G2D related clock entries for SMDK4X12

 arch/arm/mach-exynos/clock-exynos4.c    |   41 +-----------------------------
 arch/arm/mach-exynos/clock-exynos4.h    |    3 ++
 arch/arm/mach-exynos/clock-exynos4210.c |   37 ++++++++++++++++++++++++++++
 arch/arm/mach-exynos/clock-exynos4212.c |   41 +++++++++++++++++++++++++++++-
 4 files changed, 81 insertions(+), 41 deletions(-)

-- 
1.7.4.1
