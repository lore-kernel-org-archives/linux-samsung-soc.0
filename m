From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] rtc: rtc-s3c: Add device tree support
Date: Thu, 13 Oct 2011 13:34:55 -0600
Message-ID: <20111013193455.GC18574@ponder.secretlab.ca>
References: <1315064959-16930-1-git-send-email-thomas.abraham@linaro.org>
 <CAJuYYwQdeD=DEFSBqTTJM_EQcc517LPDy4w-N+mbHdH8Eqh=Dg@mail.gmail.com>
 <053801cc8803$43676230$ca362690$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f42.google.com ([209.85.210.42]:57993 "EHLO
	mail-pz0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753053Ab1JMTfB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Oct 2011 15:35:01 -0400
Received: by pzk1 with SMTP id 1so3554655pzk.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Oct 2011 12:35:00 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <053801cc8803$43676230$ca362690$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Thomas Abraham' <thomas.abraham@linaro.org>, rtc-linux@googlegroups.com, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, a.zummo@towertech.it

On Tue, Oct 11, 2011 at 07:48:07PM +0900, Kukjin Kim wrote:
> Thomas Abraham wrote:
> >=20
> > On 3 September 2011 21:19, Thomas Abraham <thomas.abraham@linaro.or=
g>
> > wrote:
> > > Add device tree based discovery support for Samsung's rtc control=
ler.
> > >
> > > Cc: Ben Dooks <ben-linux@fluff.org>
> > > Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> > > ---
> > > =A0Documentation/devicetree/bindings/rtc/s3c-rtc.txt | =A0 20
> > ++++++++++++++++++++
> > > =A0drivers/rtc/rtc-s3c.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 | =A0 21
> > ++++++++++++++++++++-
> > > =A02 files changed, 40 insertions(+), 1 deletions(-)
> > > =A0create mode 100644 Documentation/devicetree/bindings/rtc/s3c-r=
tc.txt
> >=20
> > Ping. Any comments for this patch? If this looks fine, can this be
> > considered for 3.2 merge via the Samsung kernel tree.
> >=20
> (Cc'ed Alessandro Zummo who is RTC Subsystem maintainer)
>=20
> I'm ok with this, so if this can be got the ack from Grant and Alessa=
ndro,
> will take this.

Acked-by: Grant Likely <grant.likely@secretlab.ca>
>=20
> > >
> > > diff --git a/Documentation/devicetree/bindings/rtc/s3c-rtc.txt
> > b/Documentation/devicetree/bindings/rtc/s3c-rtc.txt
> > > new file mode 100644
> > > index 0000000..90ec45f
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/rtc/s3c-rtc.txt
> > > @@ -0,0 +1,20 @@
> > > +* Samsung's S3C Real Time Clock controller
> > > +
> > > +Required properties:
> > > +- compatible: should be one of the following.
> > > + =A0 =A0* "samsung,s3c2410-rtc" - for controllers compatible wit=
h s3c2410
> rtc.
> > > + =A0 =A0* "samsung,s3c6410-rtc" - for controllers compatible wit=
h s3c6410
> rtc.
> > > +- reg: physical base address of the controller and length of mem=
ory
> mapped
> > > + =A0region.
> > > +- interrupts: Two interrupt numbers to the cpu should be specifi=
ed.
> First
> > > + =A0interrupt number is the rtc alarm interupt and second interr=
upt
> number
> > > + =A0is the rtc tick interrupt. The number of cells representing =
a
> interrupt
> > > + =A0depends on the parent interrupt controller.
> > > +
> > > +Example:
> > > +
> > > + =A0 =A0 =A0 rtc@10070000 {
> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "samsung,s3c6410-rtc=
";
> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x10070000 0x100>;
> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <44 0 45 0>;
> > > + =A0 =A0 =A0 };
> > > diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
> > > index 4e7c04e..29f928c 100644
> > > --- a/drivers/rtc/rtc-s3c.c
> > > +++ b/drivers/rtc/rtc-s3c.c
> > > @@ -25,6 +25,7 @@
> > > =A0#include <linux/clk.h>
> > > =A0#include <linux/log2.h>
> > > =A0#include <linux/slab.h>
> > > +#include <linux/of.h>
> > >
> > > =A0#include <mach/hardware.h>
> > > =A0#include <asm/uaccess.h>
> > > @@ -481,7 +482,13 @@ static int __devinit s3c_rtc_probe(struct
> > platform_device *pdev)
> > > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto err_nortc;
> > > =A0 =A0 =A0 =A0}
> > >
> > > - =A0 =A0 =A0 s3c_rtc_cpu_type =3D platform_get_device_id(pdev)->=
driver_data;
> > > +#ifdef CONFIG_OF
> > > + =A0 =A0 =A0 if (pdev->dev.of_node)
> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_rtc_cpu_type =3D of_device_is_c=
ompatible(pdev-
> > >dev.of_node,
> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "samsung,s3c6410-rt=
c") ? TYPE_S3C64XX :
> > TYPE_S3C2410;
> > > + =A0 =A0 =A0 else
> > > +#endif
> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_rtc_cpu_type =3D
> platform_get_device_id(pdev)->driver_data;
> > >
> > > =A0 =A0 =A0 =A0/* Check RTC Time */
> > >
> > > @@ -603,6 +610,17 @@ static int s3c_rtc_resume(struct platform_de=
vice
> *pdev)
> > > =A0#define s3c_rtc_resume =A0NULL
> > > =A0#endif
> > >
> > > +#ifdef CONFIG_OF
> > > +static const struct of_device_id s3c_rtc_dt_match[] =3D {
> > > +       { .compatible =3D "samsung,s3c2410-rtc" },
>      ^^^^^^^
> > > +       { .compatible =3D "samsung,s3c6410-rtc" },
>      ^^^^^^^
> > > +       {},
>      ^^^^^^^
> should be Tab?
>=20
> > > +};
> > > +MODULE_DEVICE_TABLE(of, s3c_rtc_dt_match);
> > > +#else
> > > +#define s3c_rtc_dt_match NULL
> > > +#endif
> > > +
> > > =A0static struct platform_device_id s3c_rtc_driver_ids[] =3D {
> > > =A0 =A0 =A0 =A0{
> > > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =A0 =A0 =A0 =A0 =3D "s3c=
2410-rtc",
> > > @@ -625,6 +643,7 @@ static struct platform_driver s3c_rtc_driver =
=3D {
> > > =A0 =A0 =A0 =A0.driver =A0 =A0 =A0 =A0 =3D {
> > > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =3D "s3c-rtc",
> > > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.owner =A0=3D THIS_MODULE,
> > > +               .of_match_table =3D s3c_rtc_dt_match,
>      ^^^^^^^^^^^^^^^
> Same as above...
>=20
> But I know, Thomas' original patch has no problem...probably when pin=
g,
> happened above.
>=20
> > > =A0 =A0 =A0 =A0},
> > > =A0};
> > >
> > > --
>=20
> Thanks.
>=20
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>=20
