From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH V2 17/17] ARM: exynos: config: Enable cpuidle
Date: Fri,  4 Apr 2014 15:43:09 +0200
Message-ID: <1396618989-2897-18-git-send-email-daniel.lezcano@linaro.org>
References: <1396618989-2897-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f43.google.com ([74.125.82.43]:62385 "EHLO
	mail-wg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752318AbaDDNnV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Apr 2014 09:43:21 -0400
Received: by mail-wg0-f43.google.com with SMTP id x13so3423418wgg.26
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Apr 2014 06:43:20 -0700 (PDT)
In-Reply-To: <1396618989-2897-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, linaro-kernel@lists.linaro.org, rjw@rjwysocki.net

The cpuidle driver is broken since v3.11 and now we are at v3.14.

Default the cpuidle driver to favorize a better detection next time.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 arch/arm/configs/exynos_defconfig |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 4ce7b70..6ed4b34 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -132,3 +132,4 @@ CONFIG_DEBUG_INFO=y
 CONFIG_DEBUG_USER=y
 CONFIG_CRYPTO_SHA256=y
 CONFIG_CRC_CCITT=y
+CONFIG_CPU_IDLE=y
-- 
1.7.9.5
