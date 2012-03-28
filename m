From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 2/2] rtc: rtc-s3c: Add placeholder for driver private data
Date: Wed, 28 Mar 2012 16:20:37 +0530
Message-ID: <1332931837-3819-3-git-send-email-tushar.behera@linaro.org>
References: <1332931837-3819-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:63991 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757857Ab2C1K6e (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Mar 2012 06:58:34 -0400
Received: by yenl12 with SMTP id l12so562544yen.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Mar 2012 03:58:33 -0700 (PDT)
In-Reply-To: <1332931837-3819-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: rtc-linux@googlegroups.com
Cc: linux-samsung-soc@vger.kernel.org, a.zummo@towertech.it, kgene.kim@samsung.com, patches@linaro.org, Heiko Stuebner <heiko@sntech.de>

Driver data field is a pointer, hence assigning that to an integer
results in compilation warnings.

=46ixes following compilation warnigs.

drivers/rtc/rtc-s3c.c: In function =E2=80=98s3c_rtc_get_driver_data=E2=80=
=99:
drivers/rtc/rtc-s3c.c:452:3: warning: return makes integer from pointer=
 without a cast [enabled by default]
drivers/rtc/rtc-s3c.c: At top level:
drivers/rtc/rtc-s3c.c:674:3: warning: initialization makes pointer from=
 integer without a cast [enabled by default]
drivers/rtc/rtc-s3c.c:674:3: warning: (near initialization for =E2=80=98=
s3c_rtc_dt_match[1].data=E2=80=99) [enabled by default]
drivers/rtc/rtc-s3c.c:677:3: warning: initialization makes pointer from=
 integer without a cast [enabled by default]
drivers/rtc/rtc-s3c.c:677:3: warning: (near initialization for =E2=80=98=
s3c_rtc_dt_match[2].data=E2=80=99) [enabled by default]
drivers/rtc/rtc-s3c.c:680:3: warning: initialization makes pointer from=
 integer without a cast [enabled by default]
drivers/rtc/rtc-s3c.c:680:3: warning: (near initialization for =E2=80=98=
s3c_rtc_dt_match[3].data=E2=80=99) [enabled by default]

Cc: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 drivers/rtc/rtc-s3c.c |   23 ++++++++++++++++++-----
 1 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index dc6c0d2..6774a27 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -40,6 +40,10 @@ enum s3c_cpu_type {
 	TYPE_S3C64XX,
 };
=20
+struct s3c_rtc_drv_data {
+	int cpu_type;
+};
+
 /* I have yet to find an S3C implementation with more than one
  * of these rtc blocks in */
=20
@@ -446,10 +450,12 @@ static const struct of_device_id s3c_rtc_dt_match=
[];
 static inline int s3c_rtc_get_driver_data(struct platform_device *pdev=
)
 {
 #ifdef CONFIG_OF
+	struct s3c_rtc_drv_data *data;
 	if (pdev->dev.of_node) {
 		const struct of_device_id *match;
 		match =3D of_match_node(s3c_rtc_dt_match, pdev->dev.of_node);
-		return match->data;
+		data =3D (struct s3c_rtc_drv_data *) match->data;
+		return data->cpu_type;
 	}
 #endif
 	return platform_get_device_id(pdev)->driver_data;
@@ -664,20 +670,27 @@ static int s3c_rtc_resume(struct platform_device =
*pdev)
 #define s3c_rtc_resume  NULL
 #endif
=20
+static struct s3c_rtc_drv_data s3c_rtc_drv_data_array[] =3D {
+	[TYPE_S3C2410] =3D { TYPE_S3C2410 },
+	[TYPE_S3C2416] =3D { TYPE_S3C2416 },
+	[TYPE_S3C2443] =3D { TYPE_S3C2443 },
+	[TYPE_S3C64XX] =3D { TYPE_S3C64XX },
+};
+
 #ifdef CONFIG_OF
 static const struct of_device_id s3c_rtc_dt_match[] =3D {
 	{
 		.compatible =3D "samsung,s3c2410-rtc",
-		.data =3D TYPE_S3C2410,
+		.data =3D &s3c_rtc_drv_data_array[TYPE_S3C2410],
 	}, {
 		.compatible =3D "samsung,s3c2416-rtc",
-		.data =3D TYPE_S3C2416,
+		.data =3D &s3c_rtc_drv_data_array[TYPE_S3C2416],
 	}, {
 		.compatible =3D "samsung,s3c2443-rtc",
-		.data =3D TYPE_S3C2443,
+		.data =3D &s3c_rtc_drv_data_array[TYPE_S3C2443],
 	}, {
 		.compatible =3D "samsung,s3c6410-rtc",
-		.data =3D TYPE_S3C64XX,
+		.data =3D &s3c_rtc_drv_data_array[TYPE_S3C64XX],
 	},
 	{},
 };
--=20
1.7.4.1
