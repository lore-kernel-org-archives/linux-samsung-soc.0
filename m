From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH] ARM: EXYNOS: cpuidle: Fix build error of no type of module_init
Date: Wed, 22 Jan 2014 15:18:57 +0100
Message-ID: <1390400337-22850-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:11871 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753856AbaAVOTG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Jan 2014 09:19:06 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

Add missing include to fix build error:
arch/arm/mach-exynos/cpuidle.c:256:1: warning: data definition has no t=
ype or storage class [enabled by default]
arch/arm/mach-exynos/cpuidle.c:256:1: error: type defaults to =E2=80=98=
int=E2=80=99 in declaration of =E2=80=98module_init=E2=80=99 [-Werror=3D=
implicit-int]
arch/arm/mach-exynos/cpuidle.c:256:1: warning: parameter names (without=
 types) in function declaration [enabled by default]
arch/arm/mach-exynos/cpuidle.c:256:1: warning: data definition has no t=
ype or storage class [enabled by default]
arch/arm/mach-exynos/cpuidle.c:256:1: error: type defaults to =E2=80=98=
int=E2=80=99 in declaration of =E2=80=98module_exit=E2=80=99 [-Werror=3D=
implicit-int]
arch/arm/mach-exynos/cpuidle.c:256:1: warning: parameter names (without=
 types) in function declaration [enabled by default]
arch/arm/mach-exynos/cpuidle.c:256:1: warning: =E2=80=98exynos_cpuidle_=
driver_init=E2=80=99 defined but not used [-Wunused-function]
cc1: some warnings being treated as errors
make[1]: *** [arch/arm/mach-exynos/cpuidle.o] Error 1

Build error happens on gcc version 4.6.3 (Ubuntu/Linaro 4.6.3-1ubuntu5)
and was introduced by commit 35baa3369d1c (ARM: EXYNOS: convert cpuidle
driver to be a platform driver).

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/cpuidle.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-exynos/cpui=
dle.c
index f57cb91f02aa..53dc1e705b2f 100644
--- a/arch/arm/mach-exynos/cpuidle.c
+++ b/arch/arm/mach-exynos/cpuidle.c
@@ -15,6 +15,7 @@
 #include <linux/io.h>
 #include <linux/export.h>
 #include <linux/time.h>
+#include <linux/module.h>
 #include <linux/platform_device.h>
=20
 #include <asm/proc-fns.h>
--=20
1.7.9.5
