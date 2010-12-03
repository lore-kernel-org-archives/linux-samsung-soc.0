From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 3/4] plat-s5p: Add platform support for MIPI-CSI2 devices
Date: Fri, 3 Dec 2010 10:37:10 +0900
Message-ID: <AANLkTikjQkmD-bvtTV=fh-xqMkhsxt67LhAUWuCv5mU3@mail.gmail.com>
References: <1291307862-8125-1-git-send-email-s.nawrocki@samsung.com>
	<1291307862-8125-4-git-send-email-s.nawrocki@samsung.com>
	<20101202171538.GB30933@pulham.picochip.com>
	<4CF7D9E6.5000409@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:61881 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932079Ab0LCBhM convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Dec 2010 20:37:12 -0500
Received: by bwz15 with SMTP id 15so7873538bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Dec 2010 17:37:10 -0800 (PST)
In-Reply-To: <4CF7D9E6.5000409@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Jamie Iles <jamie@jamieiles.com>, kgene.kim@samsung.com, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com

On Fri, Dec 3, 2010 at 2:39 AM, Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
>
> Hi Jamie,
>
> On 12/02/2010 06:15 PM, Jamie Iles wrote:
>> Hi Sylwester,
>>
>> On Thu, Dec 02, 2010 at 05:37:41PM +0100, Sylwester Nawrocki wrote:
>>> diff --git a/arch/arm/plat-s5p/dev-csis0.c b/arch/arm/plat-s5p/dev-=
csis0.c
>>> new file mode 100644
>>> index 0000000..2b1ba43
>>> --- /dev/null
>>> +++ b/arch/arm/plat-s5p/dev-csis0.c
>>> @@ -0,0 +1,34 @@
>>> +/*
>>> + * Copyright (C) 2010 Samsung Electronics
>>> + *
>>> + * S5P series device definition for MIPI-CSI device 0
>>> + *
>>> + * This program is free software; you can redistribute it and/or m=
odify
>>> + * it under the terms of the GNU General Public License version 2 =
as
>>> + * published by the Free Software Foundation.
>>> +*/
>>> +
>>> +#include <linux/kernel.h>
>>> +#include <linux/interrupt.h>
>>> +#include <linux/platform_device.h>
>>> +#include <mach/map.h>
>>> +
>>> +static struct resource s5p_csis_resource[] =3D {
>>> + =C2=A0 =C2=A0[0] =3D {
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.start =3D S5P_PA_CSIS0,
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.end =C2=A0 =3D S5P_PA_C=
SIS0 + SZ_4K - 1,
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.flags =3D IORESOURCE_ME=
M,
>>> + =C2=A0 =C2=A0},
>>> + =C2=A0 =C2=A0[1] =3D {
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.start =3D IRQ_MIPICSI0,
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.end =C2=A0 =3D IRQ_MIPI=
CSI0,
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.flags =3D IORESOURCE_IR=
Q,
>>> + =C2=A0 =C2=A0}
>>> +};
>> Do you really need the [0] and [1] here? These are only needed if yo=
u are
>> sparsely initialising an array.
>
> I agree explicit indices are not really needed. I just followed the s=
tyle of
> all other resource definitions already there.
> I am not quite sure what is the preference of the maintainer, I guess=
 they want
> all devices to follow same style for consistence.

And that style has its origin because explicit indices are as because
they stress the fact that
drivers expect  a particular resource at a particular index (when we
have more than 1
resource of a type).
IMO we should use some macro shared between platform devices and their =
drivers.
Something like -
static struct resource s5p_csis_resource[] =3D {
       [PA_CSIS] =3D {
               .start =3D S5P_PA_CSIS0,
               .end   =3D S5P_PA_CSIS0 + SZ_4K - 1,
               .flags =3D IORESOURCE_MEM,
       },
       [IRQ_CSIS] =3D {
               .start =3D IRQ_MIPICSI0,
               .end   =3D IRQ_MIPICSI0,
               .flags =3D IORESOURCE_IRQ,
       }
};
