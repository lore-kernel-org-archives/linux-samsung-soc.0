From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v12 9/9] ARM: exynos_defconfig: enable DMC driver
Date: Mon, 22 Jul 2019 11:46:46 +0200
Message-ID: <20190722094646.13342-10-l.luba@partner.samsung.com>
References: <20190722094646.13342-1-l.luba@partner.samsung.com>
        <CGME20190722094733eucas1p1a0294a332b11aed42124308c5d204e62@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190722094646.13342-1-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, keescook@chromium.org, tony@atomide.com, jroedel@suse.de, treding@nvidia.com, digetx@gmail.com, gregkh@linuxfoundation.org, willy.mh.wolff.ml@gmail.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Enable driver for Exynos5422 Dynamic Memory Controller supporting
dynamic frequency and voltage scaling in Exynos5422 SoCs.

Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 arch/arm/configs/exynos_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 2e6a863d25aa..ebed93236a47 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -291,6 +291,7 @@ CONFIG_DEVFREQ_GOV_PERFORMANCE=y
 CONFIG_DEVFREQ_GOV_POWERSAVE=y
 CONFIG_DEVFREQ_GOV_USERSPACE=y
 CONFIG_ARM_EXYNOS_BUS_DEVFREQ=y
+CONFIG_EXYNOS5422_DMC=y
 CONFIG_DEVFREQ_EVENT_EXYNOS_NOCP=y
 CONFIG_EXTCON=y
 CONFIG_EXTCON_MAX14577=y
-- 
2.17.1
