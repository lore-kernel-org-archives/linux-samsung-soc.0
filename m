From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH] ARM: exynos_defconfig: Enable big.LITTLE CPUidle support
Date: Fri, 28 Aug 2015 10:16:09 +0200
Message-ID: <1440749769-10135-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:60668 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751418AbbH1IQU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Aug 2015 04:16:20 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Thierry Reding <treding@nvidia.com>, Anand Moon <linux.amoon@gmail.com>, Russell King <linux@arm.linux.org.uk>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Lukasz Majewski <l.majewski@samsung.com>, linux-arm-kernel@lists.infradead.org

Some Exynos big.LITTLE boards (i.e: Exynos5420 and Exynos5800 based
Chromebooks) have proper firmware that allow the big.LITTLE CPUidle
driver to work correctly, so enable support for this.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---
Kukjin and Krzysztof,

As you know there are other boards like the Exynos5422 based Odroid XU{3,4}
whose firmware is broken due leaving CCI in secure mode which means that the
kernel MCPM support can't properly manage CCI.

So if you pick this patch, it should be tested in kernelci before appearing
in linux-next to prevent any boot issues.

But if that happens, I believe that is better to do a fix / workaround in
those broken platforms since nothing prevents users to enable this option
anyways. For example the CCI device node could be disabled in the DTS.

 arch/arm/configs/exynos_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 729e2fae3e58..228ee945b8ed 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -30,6 +30,7 @@ CONFIG_CPU_FREQ=y
 CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
 CONFIG_CPUFREQ_DT=y
 CONFIG_CPU_IDLE=y
+CONFIG_ARM_BIG_LITTLE_CPUIDLE=y
 CONFIG_ARM_EXYNOS_CPUIDLE=y
 CONFIG_VFP=y
 CONFIG_NEON=y
-- 
2.4.3
