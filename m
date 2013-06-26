From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [linux-next PATCH] samsung_pwm: fix build for
 CONFIG_CLKSRC_SAMSUNG_PWM=n
Date: Wed, 26 Jun 2013 18:39:49 +0200
Message-ID: <1913259.iCGtCKZW7f@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:16982 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751498Ab3FZQkA convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Jun 2013 12:40:00 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MP0004MGEANYW50@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 27 Jun 2013 01:39:59 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

=46rom: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [linux-next PATCH] samsung_pwm: fix build for CONFIG_CLKSRC_SA=
MSUNG_PWM=3Dn

If CONFIG_PWM_SAMSUNG=3Dy and CONFIG_CLKSRC_SAMSUNG_PWM=3Dn next-201306=
26
build fails with the following error:

drivers/pwm/pwm-samsung.c:89:19: error: static declaration of =E2=80=98=
samsung_pwm_lock=E2=80=99 follows non-static declaration
include/clocksource/samsung_pwm.h:23:19: note: previous declaration of =
=E2=80=98samsung_pwm_lock=E2=80=99 was here

It is caused by commit 9ebe293 ("pwm: Add new pwm-samsung driver").

=46ix it by adding missing ifdef.

Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 include/clocksource/samsung_pwm.h |    2 ++
 1 file changed, 2 insertions(+)

Index: b/include/clocksource/samsung_pwm.h
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- a/include/clocksource/samsung_pwm.h	2013-06-21 12:05:51.329680497 +=
0200
+++ b/include/clocksource/samsung_pwm.h	2013-06-26 17:48:02.574187287 +=
0200
@@ -20,7 +20,9 @@
=20
 #define SAMSUNG_PWM_NUM		5
=20
+#ifdef CONFIG_CLKSRC_SAMSUNG_PWM
 extern spinlock_t samsung_pwm_lock;
+#endif
=20
 struct samsung_pwm_variant {
 	u8 bits;
