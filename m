From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: s3c24xx: fix build error
Date: Tue,  7 Jan 2014 19:27:25 +0100
Message-ID: <1389119245-2167-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f179.google.com ([74.125.82.179]:56267 "EHLO
	mail-we0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752049AbaAGS1g (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jan 2014 13:27:36 -0500
Received: by mail-we0-f179.google.com with SMTP id q59so494529wes.24
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Jan 2014 10:27:35 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>

When enabling device tree on the S3C an additional build
bug appears in the Osiris DVS board file:

CC  arch/arm/mach-s3c24xx/mach-osiris-dvs.o
archh/arm/mach-s3c24xx/mach-osiris-dvs.c:
In function =E2=80=98osiris_dvs_notify=E2=80=99:
arch/arm/mach-s3c24xx/mach-osiris-dvs.c:77:4:
error: implicit declaration of function =E2=80=98S3C2410_GPB=E2=80=99
[-Werror=3Dimplicit-function-declaration]
    gpio_set_value(OSIRIS_GPIO_DVS, 1);
    ^

=46ix this by explicitly including
<linux/platform_data/gpio-samsung-s3c24xx.h>

Reported-by: Arnd Bergmann <arnd@arndb.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: Ben Dooks <ben-linux@fluff.org>
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
I have tentatively applied this to the GPIO tree so I
don't cause build regressions, ACKs are still
appreciated from the S3C maintainers.
---
 arch/arm/mach-s3c24xx/mach-osiris-dvs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-s3c24xx/mach-osiris-dvs.c b/arch/arm/mach-s3=
c24xx/mach-osiris-dvs.c
index 45e74363aaa9..5b8af46c0d6b 100644
--- a/arch/arm/mach-s3c24xx/mach-osiris-dvs.c
+++ b/arch/arm/mach-s3c24xx/mach-osiris-dvs.c
@@ -16,6 +16,7 @@
 #include <linux/platform_device.h>
 #include <linux/cpufreq.h>
 #include <linux/gpio.h>
+#include <linux/platform_data/gpio-samsung-s3c24xx.h>
=20
 #include <linux/i2c/tps65010.h>
=20
--=20
1.8.3.1
