From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: [PATCH] ARM: exynos_defconfig - enable CONFIG_EXYNOS_IOMMU
Date: Tue, 12 Dec 2017 14:31:10 -0700
Message-ID: <20171212213110.20893-1-shuahkh@osg.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from osg.samsung.com ([64.30.133.232]:53060 "EHLO osg.samsung.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752415AbdLLVbf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 12 Dec 2017 16:31:35 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux@armlinux.org.uk, kgene@kernel.org, krzk@kernel.org, linux.amoon@gmail.com, arnd@arndb.de, javier@dowhile0.org, robie@justgohome.co.uk, shuah@kernel.org, viresh.kumar@linaro.org, m.szyprowski@samsung.com
Cc: Shuah Khan <shuahkh@osg.samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

EXYNOS_IOMMU is disabled in exynos_defconfig since it is known to cause
boot failures on Exynos Chrome-books. The recommendation is for IOMMU to
be enabled manually on systems as needed.

A recent exynos_drm change added a warning message when EXYNOS_IOMMU is
disabled. It is necessary to enable it to avoid the warning messages.
A few initial tests have shown that enabling EXYNOS_IOMMU might be safe
on Exynos Chrome-books.

Enable CONFIG_EXYNOS_IOMMU in exynos_defconfig.

Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
---
 arch/arm/configs/exynos_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index f1d7834..0ccd5eb 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -281,6 +281,7 @@ CONFIG_DEVFREQ_GOV_POWERSAVE=y
 CONFIG_DEVFREQ_GOV_USERSPACE=y
 CONFIG_ARM_EXYNOS_BUS_DEVFREQ=y
 CONFIG_DEVFREQ_EVENT_EXYNOS_NOCP=y
+CONFIG_EXYNOS_IOMMU=y
 CONFIG_EXTCON=y
 CONFIG_EXTCON_MAX14577=y
 CONFIG_EXTCON_MAX77693=y
-- 
2.7.4
