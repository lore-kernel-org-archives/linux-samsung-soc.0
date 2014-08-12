From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v2 1/3] ARM: EXYNOS: Fix build with PM_SLEEP=n and
 ARM_EXYNOS_CPUIDLE=n
Date: Tue, 12 Aug 2014 17:11:55 +0200
Message-ID: <1407856317-2457-2-git-send-email-b.zolnierkie@samsung.com>
References: <1407856317-2457-1-git-send-email-b.zolnierkie@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1407856317-2457-1-git-send-email-b.zolnierkie@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sachin Kamat <sachin.kamat@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Olof Johansson <olof@lixom.net>, Russell King <rmk+kernel@arm.linux.org.uk>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Fix building of exynos_defconfig with disabled CONFIG_PM_SLEEP by
adding checking whether Exynos cpuidle support is enabled before
accessing exynos_enter_aftr.

The build error message:
arch/arm/mach-exynos/built-in.o:(.data+0x74): undefined reference to `exynos_enter_aftr'
make: *** [vmlinux] Error 1

This patch has been tested on Exynos4210 based Origen board.

Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/exynos.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index 6a24e11..d57f136 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -161,7 +161,9 @@ static void exynos_restart(enum reboot_mode mode, const char *cmd)
 
 static struct platform_device exynos_cpuidle = {
 	.name              = "exynos_cpuidle",
+#ifdef CONFIG_ARM_EXYNOS_CPUIDLE
 	.dev.platform_data = exynos_enter_aftr,
+#endif
 	.id                = -1,
 };
 
-- 
1.8.2.3
