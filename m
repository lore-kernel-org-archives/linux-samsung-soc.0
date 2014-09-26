From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: RE: [PATCH v5] mfd: syscon: Decouple syscon interface from platform
 devices
Date: Fri, 26 Sep 2014 10:26:35 +0530
Message-ID: <000d01cfd946$521304f0$f6390ed0$@samsung.com>
References: <1411360807-7750-1-git-send-email-pankaj.dubey@samsung.com>
 <CAGhQ9VzZ8LadDT5RWUSX89q0WP3fGiQ8f=bWbRVfEz5Vy_zZKw@mail.gmail.com>
 <13449286.k3JCbR2ABy@phil> <4389453.TP96FZcCbx@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:20604 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752170AbaIZE51 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Sep 2014 00:57:27 -0400
In-reply-to: <4389453.TP96FZcCbx@phil>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?iso-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>, 'Joachim Eastwood' <manabian@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, kgene.kim@samsung.com, 'Russell King - ARM Linux' <linux@arm.linux.org.uk>, 'Arnd Bergmann' <arnd@arndb.de>, naushad@samsung.com, b29396@freescale.com, tomasz.figa@gmail.com, joshi@samsung.com, thomas.ab@samsung.com, Li.Xiubo@freescale.com, vikas.sajjan@samsung.com, chow.kim@samsung.com, lee.jones@linaro.org, dianders@chromium.org

Hi Heiko and Joachim,

> -----Original Message-----
> From: Heiko St=FCbner [mailto:heiko@sntech.de]
> Sent: Thursday, September 25, 2014 5:52 PM
> To: Pankaj Dubey
> Cc: Joachim Eastwood; linux-arm-kernel@lists.infradead.org; linux-sam=
sung-
> soc@vger.kernel.org; linux-kernel@vger.kernel.org; kgene.kim@samsung.=
com;
> Russell King - ARM Linux; Arnd Bergmann; naushad@samsung.com;
> b29396@freescale.com; tomasz.figa@gmail.com; joshi@samsung.com;
> thomas.ab@samsung.com; Li.Xiubo@freescale.com; vikas.sajjan@samsung.c=
om;
> chow.kim@samsung.com; lee.jones@linaro.org; dianders@chromium.org
> Subject: Re: [PATCH v5] mfd: syscon: Decouple syscon interface from
platform
> devices
>=20
> Am Mittwoch, 24. September 2014, 20:35:10 schrieb Heiko St=FCbner:
> > Hi Pankaj, Joachim,
> >
> > Am Dienstag, 23. September 2014, 20:12:50 schrieb Joachim Eastwood:
> > > On 22 September 2014 06:40, Pankaj Dubey <pankaj.dubey@samsung.co=
m>
> wrote:
> > > > Currently a syscon entity can be only registered directly throu=
gh
> > > > a platform device that binds to a dedicated syscon driver. Howe=
ver
> > > > in certain use cases it is desirable to make a device used with
> > > > another driver a syscon interface provider.
> > > >
> > > > For example, certain SoCs (e.g. Exynos) contain system controll=
er
> > > > blocks which perform various functions such as power domain
> > > > control, CPU power management, low power mode control, but in
> > > > addition contain certain IP integration glue, such as various
> > > > signal masks, coprocessor power control, etc. In such case, the=
re
> > > > is a need to have a dedicated driver for such system controller
> > > > but also share registers with other drivers. The latter is wher=
e the
syscon
> interface is helpful.
> > > >
> > > > In case of DT based platforms, this patch decouples syscon obje=
ct
> > > > from syscon platform driver, and allows to create syscon object=
s
> > > > first time when it is required by calling of
> > > > syscon_regmap_lookup_by APIs and keep a list of such syscon
> > > > objects along with syscon provider device_nodes and regmap hand=
les.
> > > >
> > > > For non-DT based platforms, this patch keeps syscon platform
> > > > driver structure where is can be probed and such non-DT based
> > > > drivers can use syscon_regmap_lookup_by_pdev API and get access=
 to
> regmap handles.
> > > > Once all users of "syscon_regmap_lookup_by_pdev" migrated to DT
> > > > based, we can completly remove platform driver of syscon, and k=
eep
> > > > only helper functions to get regmap handles.
> > > >
> > > > Suggested-by: Arnd Bergmann <arnd@arndb.de>
> > > > Suggested-by: Tomasz Figa <tomasz.figa@gmail.com>
> > > > Tested-by: Vivek Gautam <gautam.vivek@samsung.com>
> > > > Tested-by: Javier Martinez Canillas
> > > > <javier.martinez@collabora.co.uk>
> > > > Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> > >
> > > I wrote a clk driver using syscon and your patch. clk driver uses
> > > CLK_OF_DECLARE, btw.
> > >
> > > It works but I get a '(null): Failed to create debugfs directory'
> > > message in the boot log.
> > >
> > > Tested-by: Joachim Eastwood <manabian@gmail.com>
> >
> > on Rockchip platforms this syscon support also helps quite a bit, a=
s
> > the pll lock-status is sitting in an external syscon register, so
> > setting target pll-rates through assigned-clocks is not easily doab=
le
without it.
> > Therefore I'm very much looking forward to this.
> >
> >
> > Similar to Joachim I get an error about debugfs from regmap, which
> > seems to be caused by
> > 	name =3D dev_name(map->dev);
> > returning NULL in regmap_debugfs_init in regmap-debugfs.c for such =
an
> > "early" syscon.
>=20
> It looks like of_device_make_bus_id would be able to do the necessary
steps to
> populate the dev_name seemingly correctly.
>=20
> With the diff below I now get a syscon that can init clocks and also =
a
sane regmap
> debugfs init:
>=20
> /debug/regmap # ls -la
> total 0
> drwxr-xr-x    5 0        0                0 Jan  1  1970 .
> drwx------   19 0        0                0 Jan  1  1970 ..
> drwxr-xr-x    2 0        0                0 Jan  1  1970 0-001b
> drwxr-xr-x    2 0        0                0 Jan  1  1970
ff730000.power-management
> drwxr-xr-x    2 0        0                0 Jan  1  1970 ff770000.sys=
con
>=20
>=20
> But of course I don't know enough about device-internals to determine=
 if
this is an
> insane solution or not :-)
>=20

Thanks Heiko for figuring out issue and proposed solution.

As you and Joachim pointed out that current patch failed to create regm=
ap
debugfs entry,
I also investigated and found that it fails to create regmap debugfs en=
try
either you call it
early (from init_irq or clk_init function) or you call it in later stag=
e
before actual device is
populated (from init_machine before of_platform_populate_device).

One point is regmap debugfs code should have handled it gracefully inst=
ead
of kernel panic,
so looks like it needs some fix in that part of code.

I tried Heiko's suggested solution of calling "of_device_make_bus_id" a=
fter
platform_device_alloc
and it worked well and I tested it from init_irq as well as clk_init, w=
hich
happens at very early stage.
Maybe Joachim can also try if it's working for him.

Only concerns for this approach: Is it proper way of doing this?

In my opinion it could be, if we are not getting any other approach of
handling early syscon.

I also tried to get any other solution for handling debugfs entry, and =
found
one more solution.
But it will work only for late users of syscon:=20

pdev =3D platform_device_alloc("dummy-syscon", -1);
ret =3D platform_device_add(pdev);

It can solve issue of regmap debugfs for late users, i.e. if we try to =
use
syscon_lookup_by APIs not before
init_machine. But this will not work for early users of syscon, as I ca=
n see
that "platform_device_add"
fails (kernel panic) if we call it from init_irq or clk_init.

Meanwhile I have posted a fix [1] for this so that if someone calls
platform_device_add at very early
stage at least it should not panic and kernel should handle it graceful=
ly.=20

[1]: https://lkml.org/lkml/2014/9/24/348

Also as I mentioned earlier, providing feature of early syscon availabi=
lity
was not the main objective of this
patch, so just to make sure that this should not be a blocking factor f=
or
current patch I would like to split
patch in two steps to address to different issues:

1: First patch will cover existing users and allow any such users to cr=
eate
actual platform device and register
their own platform driver, instead of syscon getting probed first.
I will make sure that it should not break existing users or any existin=
g
functionality (including debugfs).

2: Second on top of this patch we can have discussion how to go for ear=
ly
syscon users.

Thanks,
Pankaj Dubey
>=20
> Heiko
>=20
>=20
> diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c index
8ebc1c6..3734434
> 100644
> --- a/drivers/mfd/syscon.c
> +++ b/drivers/mfd/syscon.c
> @@ -73,6 +73,7 @@ static struct syscon *of_syscon_register(struct
device_node
> *np)
>                         goto err_pdev;
>                 }
>                 pdev->dev.of_node =3D of_node_get(np);
> +               of_device_make_bus_id(&pdev->dev);
>         }
>=20
>         regmap =3D devm_regmap_init_mmio(&pdev->dev, base,
> &syscon_regmap_config);
