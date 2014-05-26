From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v2 04/18] video: add command mode and command mode display timing
Date: Mon, 26 May 2014 13:10:07 +0200
Message-ID: <2222199.PrI77DIhQ9@phil>
References: <1400647390-26590-1-git-send-email-yj44.cho@samsung.com> <1400647390-26590-5-git-send-email-yj44.cho@samsung.com> <20140526101441.GA24492@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6345095.1sPn3G9CG6"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140526101441.GA24492@ulmo>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: YoungJun Cho <yj44.cho-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, airlied-cv59FeDIM0c@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


--nextPart6345095.1sPn3G9CG6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Am Montag, 26. Mai 2014, 12:14:43 schrieb Thierry Reding:
> On Wed, May 21, 2014 at 01:42:56PM +0900, YoungJun Cho wrote:
> > This patch is based on videomode and display_timing relevant codes.=

> > To support command mode panel, it does not need to guide its timing=

> > information to the display controller like video mode panel,
> > but it requires signal timings to transfer video data.
> > So this patch adds cmdmode struct, cmdmode_display_timing struct an=
d
> > the according helper functions to convert cmdmode_display_timing
> > to a generic cmdmode.
> >=20
> > Signed-off-by: YoungJun Cho <yj44.cho-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > Acked-by: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > Acked-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > ---
> >=20
> >  drivers/video/Kconfig                     |    3 +
> >  drivers/video/Makefile                    |    2 +
> >  drivers/video/cmdmode.c                   |   42 ++++++
> >  drivers/video/cmdmode_display_timing.c    |   26 ++++
> >  drivers/video/of_cmdmode.c                |   55 ++++++++
> >  drivers/video/of_cmdmode_display_timing.c |  212
> >  +++++++++++++++++++++++++++++ include/video/cmdmode.h             =
    =20
> >  |   67 +++++++++
> >  include/video/cmdmode_display_timing.h    |   59 ++++++++
> >  include/video/of_cmdmode.h                |   19 +++
> >  include/video/of_cmdmode_display_timing.h |   26 ++++
> >  10 files changed, 511 insertions(+)
> >  create mode 100644 drivers/video/cmdmode.c
> >  create mode 100644 drivers/video/cmdmode_display_timing.c
> >  create mode 100644 drivers/video/of_cmdmode.c
> >  create mode 100644 drivers/video/of_cmdmode_display_timing.c
> >  create mode 100644 include/video/cmdmode.h
> >  create mode 100644 include/video/cmdmode_display_timing.h
> >  create mode 100644 include/video/of_cmdmode.h
> >  create mode 100644 include/video/of_cmdmode_display_timing.h
>=20
> Cc'ing Heiko St=FCbner on this. Heiko, you seem to have done some wor=
k on
> i80 in the past[0] and I'm wondering if you could share any insights =
you
> may have here.
>=20
> In particular I'd like your take on the approach taken in this patch =
to
> describe i80 parameters to a generic command-mode display timings
> structure. However it seems to me that these timings are really very =
i80
> specific and don't apply in general to command-mode displays.
>=20
> As such I'm beginning to think that this should rather be a property =
of
> the attached display/panel rather than the interface that generates t=
he
> signal.

OMG ... your digging in my ancient history :-D

I always got the impression, i80 is somehow related to the MIPI-DBI pro=
tocol=20
[1].

Also the display I was working on (AUO-K190x epaper controller) used th=
e=20
command mode to also transfer the display region to update and had a=20=

completely dfferent command set [2].

In the end, I temporarily settled in adding a glue driver, driving the =
s3c2416=20
i80 controller [3]. But someday I'd like to integrate this into a real=20=

solution, as the s3c2416 lcd-controller can do the i80 also in hardware=
, maybe=20
speeding things up a little.

So I guess the transfer method itself is generic, but the commands used=
 seem=20
to differ. But I of course don't know if "regular" MIPI-DBI/i80 display=
s use a=20
command set of commands for their timings.


Heiko


[1] https://www.mail-archive.com/linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg2=
9100.html
[2]=20
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/dr=
ivers/video/fbdev/auo_k190x.h
[3] https://github.com/mmind/linux-es600/blob/topic/es600-devel/drivers=
/video/es600-epd.c

> > diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
> > index c7b4f0f..7090ee5 100644
> > --- a/drivers/video/Kconfig
> > +++ b/drivers/video/Kconfig
> > @@ -38,6 +38,9 @@ config VGASTATE
> >=20
> >  config VIDEOMODE_HELPERS
> > =20
> >  =09bool
> >=20
> > +config CMDMODE_HELPERS
> > +=09bool
> > +
> >=20
> >  config HDMI
> > =20
> >  =09bool
> >=20
> > diff --git a/drivers/video/Makefile b/drivers/video/Makefile
> > index 9ad3c17..619dd99 100644
> > --- a/drivers/video/Makefile
> > +++ b/drivers/video/Makefile
> > @@ -8,6 +8,8 @@ obj-y=09=09=09=09  +=3D backlight/
> >=20
> >  obj-y=09=09=09=09  +=3D fbdev/
> > =20
> >  obj-$(CONFIG_VIDEOMODE_HELPERS) +=3D display_timing.o videomode.o
> >=20
> > +obj-$(CONFIG_CMDMODE_HELPERS) +=3D cmdmode_display_timing.o cmdmod=
e.o
> >=20
> >  ifeq ($(CONFIG_OF),y)
> >  obj-$(CONFIG_VIDEOMODE_HELPERS) +=3D of_display_timing.o of_videom=
ode.o
> >=20
> > +obj-$(CONFIG_CMDMODE_HELPERS) +=3D of_cmdmode_display_timing.o of_=
cmdmode.o
> >=20
> >  endif
> >=20
> > diff --git a/drivers/video/cmdmode.c b/drivers/video/cmdmode.c
> > new file mode 100644
> > index 0000000..3d3eeb8
> > --- /dev/null
> > +++ b/drivers/video/cmdmode.c
> > @@ -0,0 +1,42 @@
> > +/*
> > + * generic cmdmode display timing functions
> > + *
> > + * Copyright (c) 2014 YoungJun Cho <yj44.cho-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > + *
> > + * This program is free software; you can redistribute it and/or m=
odify
> > + * it under the terms of the GNU General Public License version 2 =
as
> > + * published by the Free Software Foundation.
> > + */
> > +
> > +#include <linux/errno.h>
> > +#include <linux/export.h>
> > +#include <video/cmdmode_display_timing.h>
> > +#include <video/cmdmode.h>
> > +
> > +void cmdmode_from_timing(const struct cmdmode_display_timing *cmdt=
,
> > +=09=09=09=09struct cmdmode *cm)
> > +{
> > +=09cm->pixelclock =3D cmdt->pixelclock;
> > +=09cm->hactive =3D cmdt->hactive;
> > +=09cm->vactive =3D cmdt->vactive;
> > +=09cm->cs_setup =3D cmdt->cs_setup;
> > +=09cm->wr_setup =3D cmdt->wr_setup;
> > +=09cm->wr_active =3D cmdt->wr_active;
> > +=09cm->wr_hold =3D cmdt->wr_hold;
> > +}
> > +EXPORT_SYMBOL_GPL(cmdmode_from_timing);
> > +
> > +int cmdmode_from_timings(const struct cmdmode_display_timings *cmd=
ts,
> > +=09=09=09=09struct cmdmode *cm, unsigned int index)
> > +{
> > +=09struct cmdmode_display_timing *cmdt;
> > +
> > +=09cmdt =3D cmdmode_display_timings_get(cmdts, index);
> > +=09if (!cmdt)
> > +=09=09return -EINVAL;
> > +
> > +=09cmdmode_from_timing(cmdt, cm);
> > +
> > +=09return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(cmdmode_from_timings);
> > diff --git a/drivers/video/cmdmode_display_timing.c
> > b/drivers/video/cmdmode_display_timing.c new file mode 100644
> > index 0000000..88bab08
> > --- /dev/null
> > +++ b/drivers/video/cmdmode_display_timing.c
> > @@ -0,0 +1,26 @@
> > +/*
> > + * generic cmdmode display timing functions
> > + *
> > + * Copyright (c) 2014 YoungJun Cho <yj44.cho-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > + *
> > + * This program is free software; you can redistribute it and/or m=
odify
> > + * it under the terms of the GNU General Public License version 2 =
as
> > + * published by the Free Software Foundation.
> > + */
> > +
> > +#include <linux/export.h>
> > +#include <linux/slab.h>
> > +#include <video/cmdmode_display_timing.h>
> > +
> > +void cmdmode_display_timings_release(struct cmdmode_display_timing=
s
> > *cmdts) +{
> > +=09if (cmdts->timings) {
> > +=09=09unsigned int i;
> > +
> > +=09=09for (i =3D 0; i < cmdts->num_timings; i++)
> > +=09=09=09kfree(cmdts->timings[i]);
> > +=09=09kfree(cmdts->timings);
> > +=09}
> > +=09kfree(cmdts);
> > +}
> > +EXPORT_SYMBOL_GPL(cmdmode_display_timings_release);
> > diff --git a/drivers/video/of_cmdmode.c b/drivers/video/of_cmdmode.=
c
> > new file mode 100644
> > index 0000000..d63294e
> > --- /dev/null
> > +++ b/drivers/video/of_cmdmode.c
> > @@ -0,0 +1,55 @@
> > +/*
> > + * generic cmdmode helper
> > + *
> > + * Copyright (c) 2014 YoungJun Cho <yj44.cho-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > + *
> > + * This program is free software; you can redistribute it and/or m=
odify
> > + * it under the terms of the GNU General Public License version 2 =
as
> > + * published by the Free Software Foundation.
> > + */
> > +#include <linux/errno.h>
> > +#include <linux/export.h>
> > +#include <linux/of.h>
> > +#include <video/cmdmode_display_timing.h>
> > +#include <video/of_cmdmode_display_timing.h>
> > +#include <video/of_cmdmode.h>
> > +#include <video/cmdmode.h>
> > +
> > +/**
> > + * of_get_cmdmode - get the cmdmode #<index> from devicetree
> > + * @np - devicenode with the cmdmode_display_timings
> > + * @cm - set to return value
> > + * @index - index into list of cmdmode_display_timings
> > + *=09    (Set this to OF_USE_CMDMODE_NATIVE_MODE to use whatever m=
ode is
> > + *=09     specified as native mode in the DT.)
> > + *
> > + * DESCRIPTION:
> > + * Get a list of all display timings and put the one
> > + * specified by index into *cm. This function should only be used,=
 if
> > + * only one cmdmode is to be retrieved. A driver that needs to wor=
k
> > + * with multiple/all cmdmodes should work with
> > + * of_get_cmdmode_display_timings instead.
> > + **/
> > +int of_get_cmdmode(struct device_node *np, struct cmdmode *cm, int=
 index)
> > +{
> > +=09struct cmdmode_display_timings *cmdts;
> > +=09int ret;
> > +
> > +=09cmdts =3D of_get_cmdmode_display_timings(np);
> > +=09if (!cmdts) {
> > +=09=09pr_err("%s: no timings specified\n", of_node_full_name(np));=

> > +=09=09return -EINVAL;
> > +=09}
> > +
> > +=09if (index =3D=3D OF_USE_CMDMODE_NATIVE_MODE)
> > +=09=09index =3D cmdts->native_mode;
> > +
> > +=09ret =3D cmdmode_from_timings(cmdts, cm, index);
> > +=09if (ret)
> > +=09=09return ret;
> > +
> > +=09cmdmode_display_timings_release(cmdts);
> > +
> > +=09return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(of_get_cmdmode);
> > diff --git a/drivers/video/of_cmdmode_display_timing.c
> > b/drivers/video/of_cmdmode_display_timing.c new file mode 100644
> > index 0000000..fcf2b35
> > --- /dev/null
> > +++ b/drivers/video/of_cmdmode_display_timing.c
> > @@ -0,0 +1,212 @@
> > +/*
> > + * OF helpers for parsing cmdmode display timings
> > + *
> > + * Copyright (c) 2014 YoungJun Cho <yj44.cho-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > + *
> > + * based on of_cmdmode.c
> > + *
> > + * This program is free software; you can redistribute it and/or m=
odify
> > + * it under the terms of the GNU General Public License version 2 =
as
> > + * published by the Free Software Foundation.
> > + */
> > +#include <linux/export.h>
> > +#include <linux/of.h>
> > +#include <linux/slab.h>
> > +#include <video/cmdmode_display_timing.h>
> > +#include <video/of_cmdmode_display_timing.h>
> > +
> > +/**
> > + * of_parse_cmdmode_display_timing - parse cmdmode_display_timing =
entry
> > + *=09=09=09=09=09from device_node
> > + * @np: device_node with the properties
> > + **/
> > +static int of_parse_cmdmode_display_timing(const struct device_nod=
e *np,
> > +=09=09=09=09=09struct cmdmode_display_timing *cmdt)
> > +{
> > +=09int ret =3D 0;
> > +
> > +=09memset(cmdt, 0, sizeof(*cmdt));
> > +
> > +=09ret |=3D of_property_read_u32(np, "clock-frequency", &cmdt-
>pixelclock);
> > +=09ret |=3D of_property_read_u32(np, "hactive", &cmdt->hactive);
> > +=09ret |=3D of_property_read_u32(np, "vactive", &cmdt->vactive);
> > +=09ret |=3D of_property_read_u32(np, "cs-setup", &cmdt->cs_setup);=

> > +=09ret |=3D of_property_read_u32(np, "wr-setup", &cmdt->wr_setup);=

> > +=09ret |=3D of_property_read_u32(np, "wr-active", &cmdt->wr_active=
);
> > +=09ret |=3D of_property_read_u32(np, "wr-hold", &cmdt->wr_hold);
> > +
> > +=09if (ret) {
> > +=09=09pr_err("%s: error reading cmdmode timing properties\n",
> > +=09=09=09of_node_full_name(np));
> > +=09=09return -EINVAL;
> > +=09}
> > +
> > +=09return 0;
> > +}
> > +
> > +/**
> > + * of_get_cmdmode_display_timing - parse a cmdmode_display_timing =
entry
> > + * @np: device_node with the timing subnode
> > + * @name: name of the timing node
> > + * @cmdt: cmdmode_display_timing struct to fill
> > + **/
> > +int of_get_cmdmode_display_timing(struct device_node *np, const ch=
ar
> > *name, +=09=09=09=09=09struct cmdmode_display_timing *cmdt)
> > +{
> > +=09struct device_node *timing_np;
> > +
> > +=09if (!np) {
> > +=09=09pr_err("%s: no devicenode given\n", of_node_full_name(np));
> > +=09=09return -EINVAL;
> > +=09}
> > +
> > +=09timing_np =3D of_get_child_by_name(np, name);
> > +=09if (!timing_np) {
> > +=09=09pr_err("%s: could not find node '%s'\n",
> > +=09=09=09of_node_full_name(np), name);
> > +=09=09return -ENOENT;
> > +=09}
> > +
> > +=09return of_parse_cmdmode_display_timing(timing_np, cmdt);
> > +}
> > +EXPORT_SYMBOL_GPL(of_get_cmdmode_display_timing);
> > +
> > +/**
> > + * of_get_cmdmode_display_timings - parse all cmdmode_display_timi=
ng
> > + * entries from a device_node
> > + * @np: device_node with the subnodes
> > + **/
> > +struct cmdmode_display_timings*
> > +of_get_cmdmode_display_timings(struct device_node *np)
> > +{
> > +=09struct device_node *timings_np;
> > +=09struct device_node *entry;
> > +=09struct device_node *native_mode;
> > +=09struct cmdmode_display_timings *cmdts;
> > +
> > +=09if (!np) {
> > +=09=09pr_err("%s: no device node given\n", of_node_full_name(np));=

> > +=09=09return NULL;
> > +=09}
> > +
> > +=09timings_np =3D of_get_child_by_name(np, "cmdmode-display-timing=
s");
> > +=09if (!timings_np) {
> > +=09=09pr_err("%s: could not find cmdmode-display-timings node\n",
> > +=09=09=09of_node_full_name(np));
> > +=09=09return NULL;
> > +=09}
> > +
> > +=09cmdts =3D kzalloc(sizeof(*cmdts), GFP_KERNEL);
> > +=09if (!cmdts) {
> > +=09=09pr_err("%s: could not allocate struct cmdts'\n",
> > +=09=09=09of_node_full_name(np));
> > +=09=09goto cmdtsfail;
> > +=09}
> > +
> > +=09entry =3D of_parse_phandle(timings_np, "native-mode", 0);
> > +=09/* assume first child as native mode if none provided */
> > +=09if (!entry)
> > +=09=09entry =3D of_get_next_child(np, NULL);
> > +=09/* if there is no child, it is useless to go on */
> > +=09if (!entry) {
> > +=09=09pr_err("%s: no timing specifications given\n",
> > +=09=09=09of_node_full_name(np));
> > +=09=09goto entryfail;
> > +=09}
> > +
> > +=09pr_debug("%s: using %s as default timing\n",
> > +=09=09of_node_full_name(np), entry->name);
> > +
> > +=09native_mode =3D entry;
> > +
> > +=09cmdts->num_timings =3D of_get_child_count(timings_np);
> > +=09if (cmdts->num_timings =3D=3D 0) {
> > +=09=09/* should never happen, as entry was already found above */
> > +=09=09pr_err("%s: no timings specified\n", of_node_full_name(np));=

> > +=09=09goto entryfail;
> > +=09}
> > +
> > +=09cmdts->timings =3D kzalloc(sizeof(struct cmdmode_display_timing=
 *) *
> > +=09=09=09=09cmdts->num_timings, GFP_KERNEL);
> > +=09if (!cmdts->timings) {
> > +=09=09pr_err("%s: could not allocate timings array\n",
> > +=09=09=09of_node_full_name(np));
> > +=09=09goto entryfail;
> > +=09}
> > +
> > +=09cmdts->num_timings =3D 0;
> > +=09cmdts->native_mode =3D 0;
> > +
> > +=09for_each_child_of_node(timings_np, entry) {
> > +=09=09struct cmdmode_display_timing *cmdt;
> > +=09=09int r;
> > +
> > +=09=09cmdt =3D kzalloc(sizeof(*cmdt), GFP_KERNEL);
> > +=09=09if (!cmdt) {
> > +=09=09=09pr_err("%s: could not allocate cmdmode_display_timing\n"
> > +=09=09=09=09, of_node_full_name(np));
> > +=09=09=09goto timingfail;
> > +=09=09}
> > +
> > +=09=09r =3D of_parse_cmdmode_display_timing(entry, cmdt);
> > +=09=09if (r) {
> > +=09=09=09/*
> > +=09=09=09 * to not encourage wrong devicetrees, fail in case of
> > +=09=09=09 * an error
> > +=09=09=09 */
> > +=09=09=09pr_err("%s: error in timing %d\n",
> > +=09=09=09=09of_node_full_name(np), cmdts->num_timings + 1);
> > +=09=09=09goto timingfail;
> > +=09=09}
> > +
> > +=09=09if (native_mode =3D=3D entry)
> > +=09=09=09cmdts->native_mode =3D cmdts->num_timings;
> > +
> > +=09=09cmdts->timings[cmdts->num_timings] =3D cmdt;
> > +=09=09cmdts->num_timings++;
> > +=09}
> > +=09of_node_put(timings_np);
> > +=09/*
> > +=09 * native_mode points to the device_node returned by of_parse_p=
handle
> > +=09 * therefore call of_node_put on it
> > +=09 */
> > +=09of_node_put(native_mode);
> > +
> > +=09pr_debug("%s: got %d timings. Using timing #%d as default\n",
> > +=09=09of_node_full_name(np), cmdts->num_timings,
> > +=09=09cmdts->native_mode + 1);
> > +
> > +=09return cmdts;
> > +
> > +timingfail:
> > +=09if (native_mode)
> > +=09=09of_node_put(native_mode);
> > +=09cmdmode_display_timings_release(cmdts);
> > +entryfail:
> > +=09kfree(cmdts);
> > +cmdtsfail:
> > +=09of_node_put(timings_np);
> > +=09return NULL;
> > +}
> > +EXPORT_SYMBOL_GPL(of_get_cmdmode_display_timings);
> > +
> > +/**
> > + * of_cmdmode_display_timings_exist - check if a display-timings n=
ode is
> > + * provided
> > + * @np: device_node with the timing
> > + **/
> > +int of_cmdmode_display_timings_exist(struct device_node *np)
> > +{
> > +=09struct device_node *timings_np;
> > +
> > +=09if (!np)
> > +=09=09return -EINVAL;
> > +
> > +=09timings_np =3D of_parse_phandle(np, "cmdmode-display-timings", =
0);
> > +=09if (!timings_np)
> > +=09=09return -EINVAL;
> > +
> > +=09of_node_put(timings_np);
> > +=09return 1;
> > +}
> > +EXPORT_SYMBOL_GPL(of_cmdmode_display_timings_exist);
> > diff --git a/include/video/cmdmode.h b/include/video/cmdmode.h
> > new file mode 100644
> > index 0000000..61ee71e
> > --- /dev/null
> > +++ b/include/video/cmdmode.h
> > @@ -0,0 +1,67 @@
> > +/*
> > + * generic cmdmode description
> > + *
> > + * Copyright 2014 YoungJun Cho <yj44.cho-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > + *
> > + * This program is free software; you can redistribute it and/or m=
odify
> > + * it under the terms of the GNU General Public License version 2 =
as
> > + * published by the Free Software Foundation.
> > + */
> > +
> > +#ifndef __LINUX_CMDMODE_H
> > +#define __LINUX_CMDMODE_H
> > +
> > +#include <linux/types.h>
> > +#include <video/cmdmode_display_timing.h>
> > +
> > +/*
> > + * Subsystem independent description of a cmdmode.
> > + * Can be generated from struct cmdmode_display_timing.
> > + * @pixelclock: display clock in Hz
> > + * @hactive: horizontal active video
> > + * @vactive: vertical active video
> > + * @cs_setup: clock cycles for the active period of address signal=
 is
> > enabled + *=09=09until chip select is enabled
> > + * @wr_setup: clock cycles for the active period of CS signal is e=
nabled
> > until + *=09=09write signal is enabled
> > + * @wr_active: clock cycles for the active period of CS is enabled=

> > + * @wr_hold: clock cycles for the active period of CS is disabled =
until
> > write + *=09=09signal is disabled
> > + */
> > +struct cmdmode {
> > +=09unsigned long pixelclock;
> > +
> > +=09u32 hactive;
> > +=09u32 vactive;
> > +
> > +=09u32 cs_setup;
> > +=09u32 wr_setup;
> > +=09u32 wr_active;
> > +=09u32 wr_hold;
> > +};
> > +
> > +/**
> > + * cmdmode_from_timing - convert display timing to cmdmode
> > + * @cmdt: cmdmode_display_timing structure
> > + * @cm: return value
> > + *
> > + * DESCRIPTION:
> > + * This function converts a struct cmdmode_display_timing to a str=
uct
> > cmdmode. + */
> > +void cmdmode_from_timing(const struct cmdmode_display_timing *cmdt=
,
> > +=09=09=09=09struct cmdmode *cm);
> > +
> > +/**
> > + * cmdmode_from_timings - convert one display timings entry to cmd=
mode
> > + * @disp: structure with all possible timing entries
> > + * @cm: return value
> > + * @index: index into the list of display timings in devicetree
> > + *
> > + * DESCRIPTION:
> > + * This function converts one struct cmdmode_display_timing entry =
to a
> > + * struct cmdmode.
> > + */
> > +int cmdmode_from_timings(const struct cmdmode_display_timings *cmd=
ts,
> > +=09=09=09=09struct cmdmode *cm, unsigned int index);
> > +
> > +#endif /* __LINUX_CMDMODE_H */
> > diff --git a/include/video/cmdmode_display_timing.h
> > b/include/video/cmdmode_display_timing.h new file mode 100644
> > index 0000000..5005660
> > --- /dev/null
> > +++ b/include/video/cmdmode_display_timing.h
> > @@ -0,0 +1,59 @@
> > +/*
> > + * description of cmdmode display timings
> > + *
> > + * Copyright 2014 YoungJun Cho <yj44.cho-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > + *
> > + * This program is free software; you can redistribute it and/or m=
odify
> > + * it under the terms of the GNU General Public License version 2 =
as
> > + * published by the Free Software Foundation.
> > + */
> > +
> > +#ifndef __LINUX_CMDMODE_DISPLAY_TIMING_H
> > +#define __LINUX_CMDMODE_DISPLAY_TIMING_H
> > +
> > +#include <linux/types.h>
> > +
> > +/*
> > + * Single "mode" entry. This describes one set of signal timings a=

> > display can + * have in one setting. This struct can later be conve=
rted
> > to struct cmdmode + * (see include/video/cmdmode.h).
> > + */
> > +struct cmdmode_display_timing {
> > +=09u32=09pixelclock;
> > +
> > +=09u32=09hactive;
> > +=09u32=09vactive;
> > +
> > +=09u32=09cs_setup;
> > +=09u32=09wr_setup;
> > +=09u32=09wr_active;
> > +=09u32=09wr_hold;
> > +};
> > +
> > +/*
> > + * This describes all timing settings a display provides.
> > + * The native_mode is the default setting for this display.
> > + * Drivers that can handle multiple cmdmodes should work with this=
 struct
> > + * and convert each entry to the desired end result.
> > + */
> > +struct cmdmode_display_timings {
> > +=09unsigned int num_timings;
> > +=09unsigned int native_mode;
> > +
> > +=09struct cmdmode_display_timing **timings;
> > +};
> > +
> > +/* get one entry from struct cmdmode_display_timings */
> > +static inline struct cmdmode_display_timing*
> > +cmdmode_display_timings_get(const struct cmdmode_display_timings *=
cmdts,
> > +=09=09=09=09unsigned int index)
> > +{
> > +=09if (cmdts->num_timings > index)
> > +=09=09return cmdts->timings[index];
> > +=09else
> > +=09=09return NULL;
> > +}
> > +
> > +void cmdmode_display_timings_release(struct cmdmode_display_timing=
s
> > *cmdts); +
> > +#endif /* __LINUX_CMDDMODE_DISPLAY_TIMING_H */
> > diff --git a/include/video/of_cmdmode.h b/include/video/of_cmdmode.=
h
> > new file mode 100644
> > index 0000000..fb7c6c7
> > --- /dev/null
> > +++ b/include/video/of_cmdmode.h
> > @@ -0,0 +1,19 @@
> > +/*
> > + * Copyright 2014 YoungJun Cho <yj44.cho-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > + *
> > + * cmdmode of-helpers
> > + *
> > + * This program is free software; you can redistribute it and/or m=
odify
> > + * it under the terms of the GNU General Public License version 2 =
as
> > + * published by the Free Software Foundation.
> > + */
> > +
> > +#ifndef __LINUX_OF_CMDMODE_H
> > +#define __LINUX_OF_CMDMODE_H
> > +
> > +struct device_node;
> > +struct cmdmode;
> > +
> > +int of_get_cmdmode(struct device_node *np, struct cmdmode *cm, int=

> > index);
> > +
> > +#endif /* __LINUX_OF_CMDMODE_H */
> > diff --git a/include/video/of_cmdmode_display_timing.h
> > b/include/video/of_cmdmode_display_timing.h new file mode 100644
> > index 0000000..6be91ba
> > --- /dev/null
> > +++ b/include/video/of_cmdmode_display_timing.h
> > @@ -0,0 +1,26 @@
> > +/*
> > + * Copyright 2014 YoungJun Cho <yj44.cho-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > + *
> > + * cmdmode display timings of helpers
> > + *
> > + * This program is free software; you can redistribute it and/or m=
odify
> > + * it under the terms of the GNU General Public License version 2 =
as
> > + * published by the Free Software Foundation.
> > + */
> > +
> > +#ifndef __LINUX_OF_CMDMODE_DISPLAY_TIMING_H
> > +#define __LINUX_OF_CMDMODE_DISPLAY_TIMING_H
> > +
> > +struct device_node;
> > +struct cmdmode_display_timing;
> > +struct cmdmode_display_timings;
> > +
> > +#define OF_USE_CMDMODE_NATIVE_MODE -1
> > +
> > +int of_get_cmdmode_display_timing(struct device_node *np, const ch=
ar
> > *name, +=09=09=09=09=09struct cmdmode_display_timing *cmdt);
> > +struct cmdmode_display_timings*
> > +=09of_get_cmdmode_display_timings(struct device_node *np);
> > +int of_cmdmode_display_timings_exist(struct device_node *np);
> > +
> > +#endif /* __LINUX_OF_CMDMODE_DISPLAY_TIMING_H */

--nextPart6345095.1sPn3G9CG6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAABCAAGBQJTgyEPAAoJEPOmecmc0R2B9MEIAJxowJcoEWF0FL0l/QVoJUVJ
mdl9ZB/p6LlhSjCQ2DKc+TQ07rxdEsY0dtfbRmA8OBvg+JHPG12NUfibdCxSWi7g
WgRuBYGtFC+va9RNa+JmdYMB4oo2Kr6231uV1LNBjEc10EWhZGnrRsEVi1L3pbE5
b+3lK9fOjWiN/B8gmA902CJLiBI5K05tycc1RUTW6OhkW0gh51k30D32Ozc4tffR
QkwqxdXRQn3pE76Lq4/Uk4GjylBxg6WeGv4gfhXXhj5vKnzxnitN6wV0aDL9UEK+
RB3UAC0vBp2EApWNgdfOYJpU+WfBkeYWs5iV+LjzR27jzKLqGY+a2s44yMZa31o=
=HLR3
-----END PGP SIGNATURE-----

--nextPart6345095.1sPn3G9CG6--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
