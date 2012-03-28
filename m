From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 1/2] rtc: rtc-s3c: Fix compilation error
Date: Wed, 28 Mar 2012 16:20:36 +0530
Message-ID: <1332931837-3819-2-git-send-email-tushar.behera@linaro.org>
References: <1332931837-3819-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:33554 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757857Ab2C1K6a (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Mar 2012 06:58:30 -0400
Received: by pbcun15 with SMTP id un15so1627767pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Mar 2012 03:58:29 -0700 (PDT)
In-Reply-To: <1332931837-3819-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: rtc-linux@googlegroups.com
Cc: linux-samsung-soc@vger.kernel.org, a.zummo@towertech.it, kgene.kim@samsung.com, patches@linaro.org, Heiko Stuebner <heiko@sntech.de>

=46ixes following compilation error.
drivers/rtc/rtc-s3c.c: At top level:
drivers/rtc/rtc-s3c.c:671:3: error: request for member =E2=80=98data=E2=
=80=99 in something not a structure or union
drivers/rtc/rtc-s3c.c:674:3: error: request for member =E2=80=98data=E2=
=80=99 in something not a structure or union
drivers/rtc/rtc-s3c.c:677:3: error: request for member =E2=80=98data=E2=
=80=99 in something not a structure or union
drivers/rtc/rtc-s3c.c:680:3: error: request for member =E2=80=98data=E2=
=80=99 in something not a structure or union

Cc: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 drivers/rtc/rtc-s3c.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index 7895186..dc6c0d2 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -667,16 +667,16 @@ static int s3c_rtc_resume(struct platform_device =
*pdev)
 #ifdef CONFIG_OF
 static const struct of_device_id s3c_rtc_dt_match[] =3D {
 	{
-		.compatible =3D "samsung,s3c2410-rtc"
+		.compatible =3D "samsung,s3c2410-rtc",
 		.data =3D TYPE_S3C2410,
 	}, {
-		.compatible =3D "samsung,s3c2416-rtc"
+		.compatible =3D "samsung,s3c2416-rtc",
 		.data =3D TYPE_S3C2416,
 	}, {
-		.compatible =3D "samsung,s3c2443-rtc"
+		.compatible =3D "samsung,s3c2443-rtc",
 		.data =3D TYPE_S3C2443,
 	}, {
-		.compatible =3D "samsung,s3c6410-rtc"
+		.compatible =3D "samsung,s3c6410-rtc",
 		.data =3D TYPE_S3C64XX,
 	},
 	{},
--=20
1.7.4.1
