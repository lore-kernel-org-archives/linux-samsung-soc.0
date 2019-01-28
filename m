From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH 8/8] arm: config: exynos: enable DMC driver
Date: Mon, 28 Jan 2019 20:21:39 +0100
Message-ID: <1548703299-15806-9-git-send-email-l.luba@partner.samsung.com>
References: <1548703299-15806-1-git-send-email-l.luba@partner.samsung.com>
        <CGME20190128192155eucas1p13fa8616c0da161cd2f041ba241dba3d5@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548703299-15806-1-git-send-email-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: b.zolnierkie@samsung.com, myungjoo.ham@samsung.com, krzk@kernel.org, Lukasz Luba <l.luba@partner.samsung.com>, Russell King <linux@armlinux.org.uk>, Kukjin Kim <kgene@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Enable driver for Dynamic Memory Controller in Exynos SoCs.

CC: Russell King <linux@armlinux.org.uk>
CC: Kukjin Kim <kgene@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Marek Szyprowski <m.szyprowski@samsung.com>
CC: Guenter Roeck <groeck@chromium.org>
CC: Benson Leung <bleung@chromium.org>
CC: linux-arm-kernel@lists.infradead.org
CC: linux-samsung-soc@vger.kernel.org
CC: linux-kernel@vger.kernel.org
Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 arch/arm/configs/exynos_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index d635edf..4b1901d 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -291,6 +291,7 @@ CONFIG_DEVFREQ_GOV_PERFORMANCE=y
 CONFIG_DEVFREQ_GOV_POWERSAVE=y
 CONFIG_DEVFREQ_GOV_USERSPACE=y
 CONFIG_ARM_EXYNOS_BUS_DEVFREQ=y
+CONFIG_ARM_EXYNOS_DMC_DEVFREQ=y
 CONFIG_DEVFREQ_EVENT_EXYNOS_NOCP=y
 CONFIG_EXYNOS_IOMMU=y
 CONFIG_EXTCON=y
-- 
2.7.4
