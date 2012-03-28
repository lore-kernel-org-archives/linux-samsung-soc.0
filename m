From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 0/2] Fixes related to rtc-s3c
Date: Wed, 28 Mar 2012 13:28:41 +0200
Message-ID: <201203281328.41802.heiko@sntech.de>
References: <1332931837-3819-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:44976 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932302Ab2C1L2v convert rfc822-to-8bit
	(ORCPT <rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Mar 2012 07:28:51 -0400
In-Reply-To: <1332931837-3819-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: rtc-linux@googlegroups.com, linux-samsung-soc@vger.kernel.org, a.zummo@towertech.it, kgene.kim@samsung.com, patches@linaro.org

Am Mittwoch, 28. M=C3=A4rz 2012, 12:50:35 schrieb Tushar Behera:
> The patches are based on Kukjin's for-next branch and they fix a coup=
le
> of compile-time errors and warnings.
There was also a fixup patch for these problems posted on 2012-01-04. B=
ut it seems
to have been forgotten somehow.

I think either solution is fine.


Heiko


=46or reference the original patch was:

---- 8< ----------------------------------- >8 ----
Subject: [PATCH] rtc-s3c: Fix breakage introduced by S3C2443/S3C2416 su=
pport

Commits 7006ee4f (rtc-s3c: make room for more variants in devicetree bl=
ock)
and 6c0a2365 (rtc-s3c: add variants for S3C2443 and S3C2416)
introduced build-failures with enabled CONFIG_USE_OF option.

This patch fixes missing "," in s3c_rtc_dt_match and wrong handling of
the of_device_id.data property.

Reported-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/rtc/rtc-s3c.c |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index bb0f320..2b4feb8 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -449,7 +449,7 @@ static inline int s3c_rtc_get_driver_data(struct pl=
atform_device *pdev)
        if (pdev->dev.of_node) {
                const struct of_device_id *match;
                match =3D of_match_node(s3c_rtc_dt_match, pdev->dev.of_=
node);
-               return match->data;
+               return (int)match->data;
        }
 #endif
        return platform_get_device_id(pdev)->driver_data;
@@ -667,17 +667,17 @@ static int s3c_rtc_resume(struct platform_device =
*pdev)
 #ifdef CONFIG_OF
 static const struct of_device_id s3c_rtc_dt_match[] =3D {
        {
-               .compatible =3D "samsung,s3c2410-rtc"
-               .data =3D TYPE_S3C2410,
+               .compatible =3D "samsung,s3c2410-rtc",
+               .data =3D (void *)TYPE_S3C2410,
        }, {
-               .compatible =3D "samsung,s3c2416-rtc"
-               .data =3D TYPE_S3C2416,
+               .compatible =3D "samsung,s3c2416-rtc",
+               .data =3D (void *)TYPE_S3C2416,
        }, {
-               .compatible =3D "samsung,s3c2443-rtc"
-               .data =3D TYPE_S3C2443,
+               .compatible =3D "samsung,s3c2443-rtc",
+               .data =3D (void *)TYPE_S3C2443,
        }, {
-               .compatible =3D "samsung,s3c6410-rtc"
-               .data =3D TYPE_S3C64XX,
+               .compatible =3D "samsung,s3c6410-rtc",
+               .data =3D (void *)TYPE_S3C64XX,
        },
        {},
 };
--=20
1.7.5.4
