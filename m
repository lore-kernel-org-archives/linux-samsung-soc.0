From: Chander Kashyap <chander.kashyap@linaro.org>
Subject: [PATCH 0/2] Exynos5 device tree fixes
Date: Wed, 28 Aug 2013 18:12:46 +0530
Message-ID: <1377693768-16777-1-git-send-email-chander.kashyap@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f169.google.com ([209.85.192.169]:54222 "EHLO
	mail-pd0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754208Ab3H1MnD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Aug 2013 08:43:03 -0400
Received: by mail-pd0-f169.google.com with SMTP id r10so6283307pdi.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Aug 2013 05:43:02 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, thomas.ab@samsung.com, t.figa@samsung.com, Chander Kashyap <chander.kashyap@linaro.org>

This patch series fixes two problem with MCT node in Exynos5 platforms.
1. In Exynos5250 it fixes the number of interrupt-cells.
2. Removes invalid properties in MCT node for Exynos5420 and Exynos5250.

Chander Kashyap (2):
  ARM: DT: Exynos5250: fix number of interrupt-cells in mct node
  DTS: Exynos5: Remove invalid MCT properties

 arch/arm/boot/dts/exynos5250.dtsi |   19 ++++++++-----------
 arch/arm/boot/dts/exynos5420.dtsi |    2 --
 2 files changed, 8 insertions(+), 13 deletions(-)

-- 
1.7.9.5
