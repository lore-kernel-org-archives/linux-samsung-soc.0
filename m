From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: [PATCH] ARM: S3C24XX: Correct NR_IRQS definition for s3c2440
Date: Sun,  7 Apr 2013 22:22:50 +0200
Message-ID: <1365366170-9682-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f48.google.com ([74.125.83.48]:61287 "EHLO
	mail-ee0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933828Ab3DGUXH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 7 Apr 2013 16:23:07 -0400
Received: by mail-ee0-f48.google.com with SMTP id b15so1977966eek.7
        for <linux-samsung-soc@vger.kernel.org>; Sun, 07 Apr 2013 13:23:06 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, Tomasz Figa <tomasz.figa@gmail.com>

Due to NR_IRQS being incorrectly defined not all IRQ domains can
be registered for S3C2440. It causes following errors on a s3c2440
SoC based board:

NR_IRQS:89
S3C2440: IRQ Support
irq: clearing pending status 00000002
------------[ cut here ]------------
WARNING: at kernel/irq/irqdomain.c:234 0xc0056ed0()
=2E..
irq: could not create irq-domain
=2E..
s3c2410-wdt s3c2410-wdt: failed to install irq (-22)
s3c2410-wdt: probe of s3c2410-wdt failed with error -22
=2E..
samsung-uart s3c2440-uart.0: cannot get irq 74

=46ix this by increasing NR_IRQS to at least (IRQ_S3C2443_AC97 + 1)
if CPU_S3C2440 is selected, so the subintc IRQ domain gets properly
registered.

Cc: Heiko St=C3=BCbner <heiko@sntech.de>
Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 arch/arm/mach-s3c24xx/include/mach/irqs.h |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/include/mach/irqs.h b/arch/arm/mach-=
s3c24xx/include/mach/irqs.h
index 43cada8..b6dd4cb 100644
--- a/arch/arm/mach-s3c24xx/include/mach/irqs.h
+++ b/arch/arm/mach-s3c24xx/include/mach/irqs.h
@@ -192,10 +192,8 @@
=20
 #if defined(CONFIG_CPU_S3C2416)
 #define NR_IRQS (IRQ_S3C2416_I2S1 + 1)
-#elif defined(CONFIG_CPU_S3C2443)
-#define NR_IRQS (IRQ_S3C2443_AC97+1)
 #else
-#define NR_IRQS (IRQ_S3C2440_AC97+1)
+#define NR_IRQS (IRQ_S3C2443_AC97 + 1)
 #endif
=20
 /* compatibility define. */
--=20
1.7.4.1
