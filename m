From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v4 0/3] Add RTC DT node to Exynos5420 SoC and Fix RTC DT node name for 5250 Soc
Date: Wed, 14 Aug 2013 19:28:27 +0530
Message-ID: <1376488710-12124-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f174.google.com ([209.85.192.174]:43699 "EHLO
	mail-pd0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754074Ab3HNN6n (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Aug 2013 09:58:43 -0400
Received: by mail-pd0-f174.google.com with SMTP id y13so6389867pdi.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Aug 2013 06:58:42 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, patches@linaro.org, linaro-kernel@lists.linaro.org

This patchset does the following 3 things:
 1) Fixes the RTC DT node name for Exynos5250 SoC
 2) Updates the status of RTC DT node of Exynos5250 SoC to "okay"
 3) Adds RTC DT node to Exynos5420 SoC

changes since v3:
	- split the 5250 related modifications into 2 separate patch as 
	suggested by Tomasz Figa <t.figa@samsung.com>

changes since v2:
	- split the 5250 related modifications into a separate patch.
	- placed the RTC node as per the alphabetical order in the DTS file as
	suggested by Kukjin Kim <kgene@kernel.org>.

changes since v1:
	- made DT node status as "okay" in the dtsi file itself.

Vikas Sajjan (3):
  ARM: dts: Fix the RTC DT node name for Exynos5250 SoC
  ARM: dts: Update the status of RTC DT node of Exynos5250 SoC to
    "okay"
  ARM: dts: Add RTC DT node to Exynos5420 SoC

 arch/arm/boot/dts/exynos5.dtsi    |    2 +-
 arch/arm/boot/dts/exynos5250.dtsi |    3 ++-
 arch/arm/boot/dts/exynos5420.dtsi |    6 ++++++
 3 files changed, 9 insertions(+), 2 deletions(-)

-- 
1.7.9.5
