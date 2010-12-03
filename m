From: Jamie Iles <jamie@jamieiles.com>
Subject: Re: [PATCH 3/4] plat-s5p: Add platform support for MIPI-CSI2 devices
Date: Fri, 3 Dec 2010 09:18:09 +0000
Message-ID: <20101203091809.GB12385@pulham.picochip.com>
References: <1291307862-8125-1-git-send-email-s.nawrocki@samsung.com>
 <1291307862-8125-4-git-send-email-s.nawrocki@samsung.com>
 <20101202171538.GB30933@pulham.picochip.com>
 <4CF7D9E6.5000409@samsung.com>
 <AANLkTikjQkmD-bvtTV=fh-xqMkhsxt67LhAUWuCv5mU3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:57928 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752806Ab0LCJSN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Dec 2010 04:18:13 -0500
Received: by wyb28 with SMTP id 28so9202855wyb.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Dec 2010 01:18:12 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <AANLkTikjQkmD-bvtTV=fh-xqMkhsxt67LhAUWuCv5mU3@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Jamie Iles <jamie@jamieiles.com>, kgene.kim@samsung.com, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com

On Fri, Dec 03, 2010 at 10:37:10AM +0900, Jassi Brar wrote:
> On Fri, Dec 3, 2010 at 2:39 AM, Sylwester Nawrocki
> <s.nawrocki@samsung.com> wrote:
> >
> > Hi Jamie,
> >
> > On 12/02/2010 06:15 PM, Jamie Iles wrote:
> >> Hi Sylwester,
> >>
> >> On Thu, Dec 02, 2010 at 05:37:41PM +0100, Sylwester Nawrocki wrote=
:
> >>> diff --git a/arch/arm/plat-s5p/dev-csis0.c b/arch/arm/plat-s5p/de=
v-csis0.c
> >>> new file mode 100644
> >>> index 0000000..2b1ba43
> >>> --- /dev/null
> >>> +++ b/arch/arm/plat-s5p/dev-csis0.c
> >>> @@ -0,0 +1,34 @@
> >>> +/*
> >>> + * Copyright (C) 2010 Samsung Electronics
> >>> + *
> >>> + * S5P series device definition for MIPI-CSI device 0
> >>> + *
> >>> + * This program is free software; you can redistribute it and/or=
 modify
> >>> + * it under the terms of the GNU General Public License version =
2 as
> >>> + * published by the Free Software Foundation.
> >>> +*/
> >>> +
> >>> +#include <linux/kernel.h>
> >>> +#include <linux/interrupt.h>
> >>> +#include <linux/platform_device.h>
> >>> +#include <mach/map.h>
> >>> +
> >>> +static struct resource s5p_csis_resource[] =3D {
> >>> + =A0 =A0[0] =3D {
> >>> + =A0 =A0 =A0 =A0 =A0 =A0.start =3D S5P_PA_CSIS0,
> >>> + =A0 =A0 =A0 =A0 =A0 =A0.end =A0 =3D S5P_PA_CSIS0 + SZ_4K - 1,
> >>> + =A0 =A0 =A0 =A0 =A0 =A0.flags =3D IORESOURCE_MEM,
> >>> + =A0 =A0},
> >>> + =A0 =A0[1] =3D {
> >>> + =A0 =A0 =A0 =A0 =A0 =A0.start =3D IRQ_MIPICSI0,
> >>> + =A0 =A0 =A0 =A0 =A0 =A0.end =A0 =3D IRQ_MIPICSI0,
> >>> + =A0 =A0 =A0 =A0 =A0 =A0.flags =3D IORESOURCE_IRQ,
> >>> + =A0 =A0}
> >>> +};
> >> Do you really need the [0] and [1] here? These are only needed if =
you are
> >> sparsely initialising an array.
> >
> > I agree explicit indices are not really needed. I just followed the=
 style of
> > all other resource definitions already there.
> > I am not quite sure what is the preference of the maintainer, I gue=
ss they want
> > all devices to follow same style for consistence.
>=20
> And that style has its origin because explicit indices are as because
> they stress the fact that
> drivers expect  a particular resource at a particular index (when we
> have more than 1
> resource of a type).
> IMO we should use some macro shared between platform devices and thei=
r drivers.
> Something like -
> static struct resource s5p_csis_resource[] =3D {
>        [PA_CSIS] =3D {
>                .start =3D S5P_PA_CSIS0,
>                .end   =3D S5P_PA_CSIS0 + SZ_4K - 1,
>                .flags =3D IORESOURCE_MEM,
>        },
>        [IRQ_CSIS] =3D {
>                .start =3D IRQ_MIPICSI0,
>                .end   =3D IRQ_MIPICSI0,
>                .flags =3D IORESOURCE_IRQ,
>        }
> };
Or you could use the .name field of struct resource and use=20
platform_get_resource_byname() in the driver. The disadvantage would be=
 that=20
this takes up a few more bytes though.

Jamie
