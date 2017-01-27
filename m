From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 0/4] phy/mfd/soc: exynos: Header cleanup
Date: Fri, 27 Jan 2017 22:05:06 +0200
Message-ID: <20170127200510.4444-1-krzk@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:42978 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751225AbdA0UF3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 27 Jan 2017 15:05:29 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, Kishon Vijay Abraham I <kishon@ti.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Lee Jones <lee.jones@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi,

Suggested by Marek, continuation of cleanup of PMU register defines
in headers.

Let's keep all of them in include/linux/soc/samsung/exynos-regs-pmu.h.

This is based on:
1. Marek's recent work around pinctrl/power domains/lpass:
   https://git.linaro.org/people/marek.szyprowski/linux-srpol.git
   branch: v4.10-next-tm2-pd

2. My two previous patches for cleanup:
   https://git.kernel.org/cgit/linux/kernel/git/krzk/linux.git
   branch: for-v4.11/drivers-soc-exynos-pmu-the-joy-never-ends

Affected subsystems/drivers:
1. phy - drivers,
2. mfd - headers,
3. soc/samsung - header.

However because of dependency on Marek's patchset, I do not have a clue
how to merge it... it is not an urgent stuff, so it may wait till
dependencies get in.


Best regards,
Krzysztof



Krzysztof Kozlowski (4):
  phy: exynos4: Remove duplicated defines of PHY register defines
  phy: exynos5: Remove duplicated defines of PHY register defines
  phy: exynos-mipi-video: Use consistent method to address phy registers
  phy: exynos: Use one define for enable bit

 drivers/phy/phy-exynos-dp-video.c           |  6 +--
 drivers/phy/phy-exynos-mipi-video.c         | 71 ++++++++++++++---------------
 drivers/phy/phy-exynos5-usbdrd.c            |  6 +--
 include/linux/mfd/syscon/exynos4-pmu.h      | 21 ---------
 include/linux/mfd/syscon/exynos5-pmu.h      | 49 --------------------
 include/linux/soc/samsung/exynos-regs-pmu.h | 16 ++++++-
 6 files changed, 56 insertions(+), 113 deletions(-)
 delete mode 100644 include/linux/mfd/syscon/exynos4-pmu.h
 delete mode 100644 include/linux/mfd/syscon/exynos5-pmu.h

-- 
2.9.3
