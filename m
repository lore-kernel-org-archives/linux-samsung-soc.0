From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH V3 0/2] Add RTC DT node to Exynos5420 SoC and Fix RTC DT node name for 5250 Soc
Date: Wed, 14 Aug 2013 16:32:59 +0530
Message-ID: <1376478181-27539-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f179.google.com ([209.85.192.179]:41589 "EHLO
	mail-pd0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759667Ab3HNLDL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Aug 2013 07:03:11 -0400
Received: by mail-pd0-f179.google.com with SMTP id v10so6190279pde.10
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Aug 2013 04:03:11 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, patches@linaro.org, linaro-kernel@lists.linaro.org

changes since v2:
	- split the 5250 related modifications into a separate patch.
	- placed the RTC node as per the alphabetical order in the DTS file as
	suggested by Kukjin Kim <kgene@kernel.org>.

changes since v1:
	- made DT node status as "okay" in the dtsi file itself.
-
Vikas Sajjan (2):
  ARM: dts: Add RTC DT node to Exynos5420 SoC
  ARM: dts: Fix the RTC DT node name for Exynos5250 SoC

 arch/arm/boot/dts/exynos5.dtsi    |    2 +-
 arch/arm/boot/dts/exynos5250.dtsi |    3 ++-
 arch/arm/boot/dts/exynos5420.dtsi |    6 ++++++
 3 files changed, 9 insertions(+), 2 deletions(-)

-- 
1.7.9.5
