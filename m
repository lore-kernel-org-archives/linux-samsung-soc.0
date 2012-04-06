From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 0/2] Fixes related to rtc-s3c
Date: Fri, 6 Apr 2012 22:12:56 +0200
Message-ID: <201204062212.57574.heiko@sntech.de>
References: <1332931837-3819-1-git-send-email-tushar.behera@linaro.org> <201203281328.41802.heiko@sntech.de> <4F72FF25.3030702@linaro.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:54179 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757791Ab2DFUND convert rfc822-to-8bit
	(ORCPT <rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Apr 2012 16:13:03 -0400
In-Reply-To: <4F72FF25.3030702@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: Tushar Behera <tushar.behera@linaro.org>, rtc-linux@googlegroups.com, linux-samsung-soc@vger.kernel.org, a.zummo@towertech.it, patches@linaro.org

Hi Kgene,

Am Mittwoch 28 M=C3=A4rz 2012, 14:08:05 schrieb Tushar Behera:
> On 03/28/2012 04:58 PM, Heiko St=C3=BCbner wrote:
> > Am Mittwoch, 28. M=C3=A4rz 2012, 12:50:35 schrieb Tushar Behera:
> >> The patches are based on Kukjin's for-next branch and they fix a c=
ouple
> >> of compile-time errors and warnings.
> >=20
> > There was also a fixup patch for these problems posted on 2012-01-0=
4. But
> > it seems to have been forgotten somehow.
> >=20
> > I think either solution is fine.
> >=20
> >=20
> > Heiko
>=20
> I must have missed this patch too. We can go ahead with Heiko's patch=
=2E

could you please take either this patch, or my two-patch series from=20
2012-01-04 to fix this problem?


Thanks
Heiko


>=20
> > For reference the original patch was:
> >=20
> > ---- 8< ----------------------------------- >8 ----
> > Subject: [PATCH] rtc-s3c: Fix breakage introduced by S3C2443/S3C241=
6
> > support
> >=20
> > Commits 7006ee4f (rtc-s3c: make room for more variants in devicetre=
e
> > block) and 6c0a2365 (rtc-s3c: add variants for S3C2443 and S3C2416)
> > introduced build-failures with enabled CONFIG_USE_OF option.
> >=20
> > This patch fixes missing "," in s3c_rtc_dt_match and wrong handling=
 of
> > the of_device_id.data property.
> >=20
> > Reported-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> >=20
> >  drivers/rtc/rtc-s3c.c |   18 +++++++++---------
> >  1 files changed, 9 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
> > index bb0f320..2b4feb8 100644
> > --- a/drivers/rtc/rtc-s3c.c
> > +++ b/drivers/rtc/rtc-s3c.c
> > @@ -449,7 +449,7 @@ static inline int s3c_rtc_get_driver_data(struc=
t
> > platform_device *pdev)
> >=20
> >         if (pdev->dev.of_node) {
> >        =20
> >                 const struct of_device_id *match;
> >                 match =3D of_match_node(s3c_rtc_dt_match,
> >                 pdev->dev.of_node);
> >=20
> > -               return match->data;
> > +               return (int)match->data;
> >=20
> >         }
> > =20
> >  #endif
> > =20
> >         return platform_get_device_id(pdev)->driver_data;
> >=20
> > @@ -667,17 +667,17 @@ static int s3c_rtc_resume(struct platform_dev=
ice
> > *pdev)
> >=20
> >  #ifdef CONFIG_OF
> >  static const struct of_device_id s3c_rtc_dt_match[] =3D {
> > =20
> >         {
> >=20
> > -               .compatible =3D "samsung,s3c2410-rtc"
> > -               .data =3D TYPE_S3C2410,
> > +               .compatible =3D "samsung,s3c2410-rtc",
> > +               .data =3D (void *)TYPE_S3C2410,
> >=20
> >         }, {
> >=20
> > -               .compatible =3D "samsung,s3c2416-rtc"
> > -               .data =3D TYPE_S3C2416,
> > +               .compatible =3D "samsung,s3c2416-rtc",
> > +               .data =3D (void *)TYPE_S3C2416,
> >=20
> >         }, {
> >=20
> > -               .compatible =3D "samsung,s3c2443-rtc"
> > -               .data =3D TYPE_S3C2443,
> > +               .compatible =3D "samsung,s3c2443-rtc",
> > +               .data =3D (void *)TYPE_S3C2443,
> >=20
> >         }, {
> >=20
> > -               .compatible =3D "samsung,s3c6410-rtc"
> > -               .data =3D TYPE_S3C64XX,
> > +               .compatible =3D "samsung,s3c6410-rtc",
> > +               .data =3D (void *)TYPE_S3C64XX,
> >=20
> >         },
> >         {},
> > =20
> >  };
