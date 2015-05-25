From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH 04/21] ARM: EXYNOS: Register drivers before devices
Date: Mon, 25 May 2015 16:53:08 +0200
Message-ID: <1432565608-26036-5-git-send-email-tomeu.vizoso@collabora.com>
References: <1432565608-26036-1-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432565608-26036-1-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?St=C3=A9phane=20Marchesin?= <stephane.marchesin@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Alexander Holler <holler@ahsoftware.de>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

So devices can be probed on demand, we need to have the drivers already
registered as we don't have enough information to register a driver on
demand.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 arch/arm/mach-exynos/exynos.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index 5917a30..3c98c92 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -110,6 +110,8 @@ void __init exynos_sysram_init(void)
 
 static void __init exynos_init_late(void)
 {
+	of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL);
+
 	if (of_machine_is_compatible("samsung,exynos5440"))
 		/* to be supported later */
 		return;
@@ -246,8 +248,6 @@ static void __init exynos_dt_machine_init(void)
 		platform_device_register(&exynos_cpuidle);
 
 	platform_device_register_simple("exynos-cpufreq", -1, NULL, 0);
-
-	of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL);
 }
 
 static char const *const exynos_dt_compat[] __initconst = {
-- 
2.4.1
