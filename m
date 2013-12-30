From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH] ARM: S3C24XX: Fix build failure for mach-osiris-dvs
Date: Mon, 30 Dec 2013 14:39:08 +0530
Message-ID: <1388394548-1205-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:57558 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751564Ab3L3JMr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Dec 2013 04:12:47 -0500
Received: by mail-pa0-f53.google.com with SMTP id hz1so11452371pad.12
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Dec 2013 01:12:46 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

=46ixes following build error.
arch/arm/mach-s3c24xx/mach-osiris-dvs.c: In function =E2=80=98osiris_dv=
s_notify=E2=80=99:
arch/arm/mach-s3c24xx/mach-osiris-dvs.c:76:4: error: implicit declarati=
on
of function =E2=80=98S3C2410_GPB=E2=80=99 [-Werror=3Dimplicit-function-=
declaration]

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
Tested at next-20131224.

 arch/arm/mach-s3c24xx/mach-osiris-dvs.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-s3c24xx/mach-osiris-dvs.c b/arch/arm/mach-s3=
c24xx/mach-osiris-dvs.c
index 45e7436..db36dc1 100644
--- a/arch/arm/mach-s3c24xx/mach-osiris-dvs.c
+++ b/arch/arm/mach-s3c24xx/mach-osiris-dvs.c
@@ -18,6 +18,7 @@
 #include <linux/gpio.h>
=20
 #include <linux/i2c/tps65010.h>
+#include <linux/platform_data/gpio-samsung-s3c24xx.h>
=20
 #include <plat/cpu-freq.h>
=20
--=20
1.7.9.5
