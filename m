From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH v2 2/2] ARM: multi_v7_defconfig: Don't attempt to enable schedutil governor as module
Date: Fri, 19 Aug 2016 09:47:24 -0400
Message-ID: <1471614444-10673-2-git-send-email-javier@osg.samsung.com>
References: <1471614444-10673-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:42099
        "EHLO s-opensource.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754915AbcHSNrr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 19 Aug 2016 09:47:47 -0400
In-Reply-To: <1471614444-10673-1-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Olof Johansson <olof@lixom.net>, linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, Javier Martinez Canillas <javier@osg.samsung.com>

The schedutil CPUFreq governor could be built as a module but the commit
58919e83c85c ("cpufreq / sched: Pass flags to cpufreq_update_util()")
made it non-modular so attempting to enable as module leads to a warning:

warning: symbol value 'm' invalid for CPU_FREQ_GOV_SCHEDUTIL

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

Changes in v2:
- Include linux-samsung-soc ML to cc list. Suggested by Krzysztof Kozlowski.

 arch/arm/configs/multi_v7_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 0ccaa519f588..65b5b6172e83 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -136,7 +136,7 @@ CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
 CONFIG_CPU_FREQ_GOV_POWERSAVE=m
 CONFIG_CPU_FREQ_GOV_USERSPACE=m
 CONFIG_CPU_FREQ_GOV_CONSERVATIVE=m
-CONFIG_CPU_FREQ_GOV_SCHEDUTIL=m
+CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y
 CONFIG_ARM_IMX6Q_CPUFREQ=y
 CONFIG_QORIQ_CPUFREQ=y
 CONFIG_CPU_IDLE=y
-- 
2.5.5
