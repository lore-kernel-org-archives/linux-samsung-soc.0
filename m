From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v5 0/3] Add RTC DT node to Exynos5420 SoC and Fix RTC DT node name for 5250 Soc
Date: Thu, 22 Aug 2013 17:03:25 +0530
Message-ID: <1377171208-23515-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:54049 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752601Ab3HVLdj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Aug 2013 07:33:39 -0400
Received: by mail-pa0-f51.google.com with SMTP id lf1so1393978pab.38
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Aug 2013 04:33:38 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, devicetree@vger.kernel.org, patches@linaro.org, linaro-kernel@lists.linaro.org

This patchset does the following 3 things:
 1) Fixes the RTC DT node name for Exynos5250 SoC
 2) Update the "status" property of RTC DT node for Exynos5250 SoC
 3) Adds RTC DT node to Exynos5420 SoC

changes since v4:
	- removed "status" property of RTC DT node from exynos5250 board dts files 

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
  ARM: dts: Update the "status" property of RTC DT node for Exynos5250
    SoC
  ARM: dts: Add RTC DT node to Exynos5420 SoC

 arch/arm/boot/dts/exynos5.dtsi           |    2 +-
 arch/arm/boot/dts/exynos5250-arndale.dts |    4 ----
 arch/arm/boot/dts/exynos5250-snow.dts    |    4 ----
 arch/arm/boot/dts/exynos5250.dtsi        |    3 ++-
 arch/arm/boot/dts/exynos5420.dtsi        |    6 ++++++
 5 files changed, 9 insertions(+), 10 deletions(-)

-- 
1.7.9.5
