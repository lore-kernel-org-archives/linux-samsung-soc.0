From: Kevin Hilman <khilman@kernel.org>
Subject: [PATCH] ARM: exynos_defconfig: disable CONFIG_EXYNOS5420_MCPM; not stable
Date: Fri, 31 Oct 2014 15:59:41 -0700
Message-ID: <1414796382-5447-1-git-send-email-khilman@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.19.201]:33631 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751798AbaJaW7p (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 31 Oct 2014 18:59:45 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linaro-kernel@lists.linaro.org, Kevin Hilman <khilman@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Sachin Kamat <sachin.kamat@samsung.com>, Doug Anderson <dianders@chromium.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Tushar Behera <tushar.behera@linaro.org>

From: Kevin Hilman <khilman@linaro.org>

The option CONFIG_EXYNOS5420_MCPM is causing imprecise external aborts
during boot testing, causing various userspace startup failures.

Disable until it has gotten more testing.

Cc: Kukjin Kim <kgene.kim@samsung.com>,
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>,
Cc: Sachin Kamat <sachin.kamat@samsung.com>,
Cc: Doug Anderson <dianders@chromium.org>,
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>,
Cc: Tushar Behera <tushar.behera@linaro.org>,
Cc: stable@vger.kernel.org # v3.17+
Signed-off-by: Kevin Hilman <khilman@linaro.org>
---
This has been reported by a few people[1], but not investigated or fixed, so it's
time to disable this feature until it can be fixed.

[1] http://lists.infradead.org/pipermail/linux-arm-kernel/2014-September/288344.html

 arch/arm/configs/exynos_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 72058b8a6f4d..a250dcbf34cd 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -10,7 +10,7 @@ CONFIG_MODULE_UNLOAD=y
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_ARCH_EXYNOS=y
 CONFIG_ARCH_EXYNOS3=y
-CONFIG_EXYNOS5420_MCPM=y
+CONFIG_EXYNOS5420_MCPM=n
 CONFIG_SMP=y
 CONFIG_BIG_LITTLE=y
 CONFIG_BL_SWITCHER=y
-- 
2.1.0
