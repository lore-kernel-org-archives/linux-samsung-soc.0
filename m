From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] rtc: rtc-s3c: Add device tree support
Date: Tue, 11 Oct 2011 19:48:07 +0900
Message-ID: <053801cc8803$43676230$ca362690$%kim@samsung.com>
References: <1315064959-16930-1-git-send-email-thomas.abraham@linaro.org>
 <CAJuYYwQdeD=DEFSBqTTJM_EQcc517LPDy4w-N+mbHdH8Eqh=Dg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:14592 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754145Ab1JKKsK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Oct 2011 06:48:10 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LSW00IG3E00JJQ0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 11 Oct 2011 19:48:09 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LSW00850E071730@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Tue, 11 Oct 2011 19:48:08 +0900 (KST)
In-reply-to: <CAJuYYwQdeD=DEFSBqTTJM_EQcc517LPDy4w-N+mbHdH8Eqh=Dg@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>, rtc-linux@googlegroups.com
Cc: devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, a.zummo@towertech.it

Thomas Abraham wrote:
>=20
> On 3 September 2011 21:19, Thomas Abraham <thomas.abraham@linaro.org>
> wrote:
> > Add device tree based discovery support for Samsung's rtc controlle=
r.
> >
> > Cc: Ben Dooks <ben-linux@fluff.org>
> > Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> > ---
> > =A0Documentation/devicetree/bindings/rtc/s3c-rtc.txt | =A0 20
> ++++++++++++++++++++
> > =A0drivers/rtc/rtc-s3c.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 | =A0 21
> ++++++++++++++++++++-
> > =A02 files changed, 40 insertions(+), 1 deletions(-)
> > =A0create mode 100644 Documentation/devicetree/bindings/rtc/s3c-rtc=
=2Etxt
>=20
> Ping. Any comments for this patch? If this looks fine, can this be
> considered for 3.2 merge via the Samsung kernel tree.
>=20
(Cc'ed Alessandro Zummo who is RTC Subsystem maintainer)

I'm ok with this, so if this can be got the ack from Grant and Alessand=
ro,
will take this.

> >
> > diff --git a/Documentation/devicetree/bindings/rtc/s3c-rtc.txt
> b/Documentation/devicetree/bindings/rtc/s3c-rtc.txt
> > new file mode 100644
> > index 0000000..90ec45f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/rtc/s3c-rtc.txt
> > @@ -0,0 +1,20 @@
> > +* Samsung's S3C Real Time Clock controller
> > +
> > +Required properties:
> > +- compatible: should be one of the following.
> > + =A0 =A0* "samsung,s3c2410-rtc" - for controllers compatible with =
s3c2410
rtc.
> > + =A0 =A0* "samsung,s3c6410-rtc" - for controllers compatible with =
s3c6410
rtc.
> > +- reg: physical base address of the controller and length of memor=
y
mapped
> > + =A0region.
> > +- interrupts: Two interrupt numbers to the cpu should be specified=
=2E
=46irst
> > + =A0interrupt number is the rtc alarm interupt and second interrup=
t
number
> > + =A0is the rtc tick interrupt. The number of cells representing a
interrupt
> > + =A0depends on the parent interrupt controller.
> > +
> > +Example:
> > +
> > + =A0 =A0 =A0 rtc@10070000 {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "samsung,s3c6410-rtc";
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x10070000 0x100>;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <44 0 45 0>;
> > + =A0 =A0 =A0 };
> > diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
> > index 4e7c04e..29f928c 100644
> > --- a/drivers/rtc/rtc-s3c.c
> > +++ b/drivers/rtc/rtc-s3c.c
> > @@ -25,6 +25,7 @@
> > =A0#include <linux/clk.h>
> > =A0#include <linux/log2.h>
> > =A0#include <linux/slab.h>
> > +#include <linux/of.h>
> >
> > =A0#include <mach/hardware.h>
> > =A0#include <asm/uaccess.h>
> > @@ -481,7 +482,13 @@ static int __devinit s3c_rtc_probe(struct
> platform_device *pdev)
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto err_nortc;
> > =A0 =A0 =A0 =A0}
> >
> > - =A0 =A0 =A0 s3c_rtc_cpu_type =3D platform_get_device_id(pdev)->dr=
iver_data;
> > +#ifdef CONFIG_OF
> > + =A0 =A0 =A0 if (pdev->dev.of_node)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_rtc_cpu_type =3D of_device_is_com=
patible(pdev-
> >dev.of_node,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "samsung,s3c6410-rtc"=
) ? TYPE_S3C64XX :
> TYPE_S3C2410;
> > + =A0 =A0 =A0 else
> > +#endif
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_rtc_cpu_type =3D
platform_get_device_id(pdev)->driver_data;
> >
> > =A0 =A0 =A0 =A0/* Check RTC Time */
> >
> > @@ -603,6 +610,17 @@ static int s3c_rtc_resume(struct platform_devi=
ce
*pdev)
> > =A0#define s3c_rtc_resume =A0NULL
> > =A0#endif
> >
> > +#ifdef CONFIG_OF
> > +static const struct of_device_id s3c_rtc_dt_match[] =3D {
> > +       { .compatible =3D "samsung,s3c2410-rtc" },
     ^^^^^^^
> > +       { .compatible =3D "samsung,s3c6410-rtc" },
     ^^^^^^^
> > +       {},
     ^^^^^^^
should be Tab?

> > +};
> > +MODULE_DEVICE_TABLE(of, s3c_rtc_dt_match);
> > +#else
> > +#define s3c_rtc_dt_match NULL
> > +#endif
> > +
> > =A0static struct platform_device_id s3c_rtc_driver_ids[] =3D {
> > =A0 =A0 =A0 =A0{
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =A0 =A0 =A0 =A0 =3D "s3c24=
10-rtc",
> > @@ -625,6 +643,7 @@ static struct platform_driver s3c_rtc_driver =3D=
 {
> > =A0 =A0 =A0 =A0.driver =A0 =A0 =A0 =A0 =3D {
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =3D "s3c-rtc",
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.owner =A0=3D THIS_MODULE,
> > +               .of_match_table =3D s3c_rtc_dt_match,
     ^^^^^^^^^^^^^^^
Same as above...

But I know, Thomas' original patch has no problem...probably when ping,
happened above.

> > =A0 =A0 =A0 =A0},
> > =A0};
> >
> > --

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
