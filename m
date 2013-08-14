From: Arun Kumar K <arun.kk@samsung.com>
Subject: [PATCH v3 0/4] DT/ARCH updates for MFC
Date: Wed, 14 Aug 2013 17:11:33 +0530
Message-ID: <1376480497-17572-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:40245 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759767Ab3HNLlZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Aug 2013 07:41:25 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, k.debski@samsung.com, s.nawrocki@samsung.com, sachin.kamat@linaro.org, arun.kk@samsung.com

The patch series updates the DT nodes of MFC in Exynos4,
Exynos 5250 and creates node in 5420.
The memory reservation patch for MFC v7 firmware is omitted
in this series as its no longer needed after the new CMA DT
framework by Marek Szyprowski.

Changes from v2:
- Removed register and interrupt properties from common
exynos5.dtsi file as per Kukjin Kim's suggestion.
- Dropped v7 memory reservation patch

Changes from v1:
- Made status disabled in dtsi and enable in dts
as suggested by Sachin Kamat.
- Moved common properties to exynos5.dtsi as
suggested by Chander.
- Updated binding documentation for special clk removal
- Updated exynos4 dtsi

Arun Kumar K (4):
  ARM: dts: Update clocks entry in MFC binding documentation
  ARM: dts: Remove unsused MFC clock from exynos4
  ARM: dts: Update 5250 MFC node
  ARM: dts: Add MFC node for exynos 5420

 .../devicetree/bindings/media/s5p-mfc.txt          |   10 +++++-----
 arch/arm/boot/dts/exynos4.dtsi                     |    4 ++--
 arch/arm/boot/dts/exynos5250.dtsi                  |    2 ++
 arch/arm/boot/dts/exynos5420.dtsi                  |    8 ++++++++
 4 files changed, 17 insertions(+), 7 deletions(-)

-- 
1.7.9.5
