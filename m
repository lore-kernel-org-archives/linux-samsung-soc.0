From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 0/4] phy/mfd/soc: exynos: Header cleanup
Date: Sat, 11 Mar 2017 20:25:30 +0200
Message-ID: <20170311182534.13345-1-krzk@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:57026 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933131AbdCKSZr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 11 Mar 2017 13:25:47 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Lee Jones <lee.jones@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Suggested by Marek, continuation of cleanup of PMU register defines
in headers.

Let's keep all of them in include/linux/soc/samsung/exynos-regs-pmu.h.

Merging strategy: probably through phy tree (in that case they have
samsung-soc's ack).
I can also take it through samsung-soc - please let me know.


Changes since v1:
=================
1. Rebase - dependencies should be already in.
2. Add Lee's acks.



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
 include/linux/mfd/syscon/exynos5-pmu.h      | 52 ---------------------
 include/linux/soc/samsung/exynos-regs-pmu.h | 16 ++++++-
 6 files changed, 56 insertions(+), 116 deletions(-)
 delete mode 100644 include/linux/mfd/syscon/exynos4-pmu.h
 delete mode 100644 include/linux/mfd/syscon/exynos5-pmu.h

-- 
2.9.3
