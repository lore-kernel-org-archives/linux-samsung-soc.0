From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 2/4] rtc-s3c: make room for more variants in devicetree block
Date: Mon, 12 Dec 2011 13:51:13 +0100
Message-ID: <201112121351.14362.heiko@sntech.de>
References: <201112091046.26563.heiko@sntech.de> <201112091050.11095.heiko@sntech.de> <CAJuYYwSvk1_tvNvukn-BQ4Z3JEeD15djs9xP_=jWz4vG-xs_nw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from h1778886.stratoserver.net ([85.214.133.74]:60310 "EHLO
	h1778886.stratoserver.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752893Ab1LLMvy convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Dec 2011 07:51:54 -0500
In-Reply-To: <CAJuYYwSvk1_tvNvukn-BQ4Z3JEeD15djs9xP_=jWz4vG-xs_nw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, ben-linux@fluff.org, a.zummo@towertech.it, Grant Likely <grant.likely@secretlab.ca>, rtc-linux@googlegroups.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org

Hi Thomas,

thanks for your review and you are of course right with both your sugge=
stions.=20
I will submit a v2 series shortly, implementing these suggestions.

Heiko

Am Sonntag, 11. Dezember 2011, 06:47:43 schrieb Thomas Abraham:
> Hi Heiko,
>=20
> On 9 December 2011 15:20, Heiko St=FCbner <heiko@sntech.de> wrote:
> > Use the data field of of_device_id to hold the type for
> > s3c_cpu_type.
> >=20
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> >  drivers/rtc/rtc-s3c.c |   27 +++++++++++++++++++++------
> >  1 files changed, 21 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
> > index 175067a..71807a6 100644
> > --- a/drivers/rtc/rtc-s3c.c
> > +++ b/drivers/rtc/rtc-s3c.c
> > @@ -428,11 +428,18 @@ static int __devexit s3c_rtc_remove(struct
> > platform_device *dev) return 0;
> >  }
>=20
> This patch looks fine but the number of #ifdef's can be reduced in
> this patch as below.
>=20
> static const struct of_device_id s3c_rtc_dt_match[];
>=20
> static inline int s3c_rtc_get_driver_data(struct platfrom_device *pde=
v)
> {
> #ifdef CONFIG_OF
>          if (pdev->dev.of_node) {
>                  const struct of_device_id *match;
>                  match =3D of_match_node(s3c_rtc_dt_match,
> pdev->dev.of_node); return match->data;
>          }
> #endif
>          return platform_get_device_id(pdev)->driver_data;
> }
>=20
> > +#ifdef CONFIG_OF
> > +static const struct of_device_id s3c_rtc_dt_match[];
> > +#endif
> > +
> >  static int __devinit s3c_rtc_probe(struct platform_device *pdev)
> >  {
> >        struct rtc_device *rtc;
> >        struct rtc_time rtc_tm;
> >        struct resource *res;
> > +#ifdef CONFIG_OF
> > +       const struct of_device_id *match;
> > +#endif
>=20
> *match not required here.
>=20
> >        int ret;
> >=20
> >        pr_debug("%s: probe=3D%p\n", __func__, pdev);
> > @@ -509,12 +516,15 @@ static int __devinit s3c_rtc_probe(struct
> > platform_device *pdev) }
> >=20
> >  #ifdef CONFIG_OF
> > -       if (pdev->dev.of_node)
> > -               s3c_rtc_cpu_type =3D
> > of_device_is_compatible(pdev->dev.of_node, -                     =20
> > "samsung,s3c6410-rtc") ? TYPE_S3C64XX : TYPE_S3C2410; -       else
> > +       if (pdev->dev.of_node) {
> > +               match =3D of_match_node(s3c_rtc_dt_match,
> > pdev->dev.of_node); +               s3c_rtc_cpu_type =3D match->dat=
a;
> > +       } else {
> >  #endif
> >                s3c_rtc_cpu_type =3D
> > platform_get_device_id(pdev)->driver_data; +#ifdef CONFIG_OF
> > +       }
> > +#endif
>=20
> This gets replaced with
>=20
>         s3c_rtc_cpu_type =3D s3c_rtc_get_driver_data(pdev);
>=20
> >        /* Check RTC Time */
> >=20
> > @@ -638,8 +648,13 @@ static int s3c_rtc_resume(struct platform_devi=
ce
> > *pdev)
> >=20
> >  #ifdef CONFIG_OF
> >  static const struct of_device_id s3c_rtc_dt_match[] =3D {
> > -       { .compatible =3D "samsung,s3c2410-rtc" },
> > -       { .compatible =3D "samsung,s3c6410-rtc" },
> > +       {
> > +               .compatible =3D "samsung,s3c2410-rtc"
> > +               .data =3D TYPE_S3C2410,
> > +       }, {
> > +               .compatible =3D "samsung,s3c6410-rtc"
> > +               .data =3D TYPE_S3C64XX,
> > +       },
> >        {},
> >  };
> >  MODULE_DEVICE_TABLE(of, s3c_rtc_dt_match);
> > --
> > 1.7.5.4
>=20
> Patch looks fine except the #ifdef's which can be reduced.
> Reviewed-by: Thomas Abraham <thomas.abraham@linaro.org>
>=20
> Regards,
> Thomas.
