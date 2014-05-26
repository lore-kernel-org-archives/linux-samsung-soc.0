From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 04/18] video: add command mode and command mode
 display timing
Date: Mon, 26 May 2014 12:14:43 +0200
Message-ID: <20140526101441.GA24492@ulmo>
References: <1400647390-26590-1-git-send-email-yj44.cho@samsung.com>
 <1400647390-26590-5-git-send-email-yj44.cho@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1213047532=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1400647390-26590-5-git-send-email-yj44.cho@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: YoungJun Cho <yj44.cho@samsung.com>, Heiko Stuebner <heiko@sntech.de>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, dri-devel@lists.freedesktop.org, a.hajda@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, laurent.pinchart@ideasonboard.com, galak@codeaurora.org, kgene.kim@samsung.com, s.trumtrar@pengutronix.de
List-Id: linux-samsung-soc@vger.kernel.org


--===============1213047532==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="M9NhX3UHpAaciwkO"
Content-Disposition: inline


--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2014 at 01:42:56PM +0900, YoungJun Cho wrote:
> This patch is based on videomode and display_timing relevant codes.
> To support command mode panel, it does not need to guide its timing
> information to the display controller like video mode panel,
> but it requires signal timings to transfer video data.
> So this patch adds cmdmode struct, cmdmode_display_timing struct and
> the according helper functions to convert cmdmode_display_timing
> to a generic cmdmode.
>=20
> Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
> Acked-by: Inki Dae <inki.dae@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  drivers/video/Kconfig                     |    3 +
>  drivers/video/Makefile                    |    2 +
>  drivers/video/cmdmode.c                   |   42 ++++++
>  drivers/video/cmdmode_display_timing.c    |   26 ++++
>  drivers/video/of_cmdmode.c                |   55 ++++++++
>  drivers/video/of_cmdmode_display_timing.c |  212 +++++++++++++++++++++++=
++++++
>  include/video/cmdmode.h                   |   67 +++++++++
>  include/video/cmdmode_display_timing.h    |   59 ++++++++
>  include/video/of_cmdmode.h                |   19 +++
>  include/video/of_cmdmode_display_timing.h |   26 ++++
>  10 files changed, 511 insertions(+)
>  create mode 100644 drivers/video/cmdmode.c
>  create mode 100644 drivers/video/cmdmode_display_timing.c
>  create mode 100644 drivers/video/of_cmdmode.c
>  create mode 100644 drivers/video/of_cmdmode_display_timing.c
>  create mode 100644 include/video/cmdmode.h
>  create mode 100644 include/video/cmdmode_display_timing.h
>  create mode 100644 include/video/of_cmdmode.h
>  create mode 100644 include/video/of_cmdmode_display_timing.h

Cc'ing Heiko St=C3=BCbner on this. Heiko, you seem to have done some work on
i80 in the past[0] and I'm wondering if you could share any insights you
may have here.

In particular I'd like your take on the approach taken in this patch to
describe i80 parameters to a generic command-mode display timings
structure. However it seems to me that these timings are really very i80
specific and don't apply in general to command-mode displays.

As such I'm beginning to think that this should rather be a property of
the attached display/panel rather than the interface that generates the
signal.

Thierry

[0]: https://lkml.org/lkml/2011/5/17/170

> diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
> index c7b4f0f..7090ee5 100644
> --- a/drivers/video/Kconfig
> +++ b/drivers/video/Kconfig
> @@ -38,6 +38,9 @@ config VGASTATE
>  config VIDEOMODE_HELPERS
>  	bool
> =20
> +config CMDMODE_HELPERS
> +	bool
> +
>  config HDMI
>  	bool
> =20
> diff --git a/drivers/video/Makefile b/drivers/video/Makefile
> index 9ad3c17..619dd99 100644
> --- a/drivers/video/Makefile
> +++ b/drivers/video/Makefile
> @@ -8,6 +8,8 @@ obj-y				  +=3D backlight/
>  obj-y				  +=3D fbdev/
> =20
>  obj-$(CONFIG_VIDEOMODE_HELPERS) +=3D display_timing.o videomode.o
> +obj-$(CONFIG_CMDMODE_HELPERS) +=3D cmdmode_display_timing.o cmdmode.o
>  ifeq ($(CONFIG_OF),y)
>  obj-$(CONFIG_VIDEOMODE_HELPERS) +=3D of_display_timing.o of_videomode.o
> +obj-$(CONFIG_CMDMODE_HELPERS) +=3D of_cmdmode_display_timing.o of_cmdmod=
e.o
>  endif
> diff --git a/drivers/video/cmdmode.c b/drivers/video/cmdmode.c
> new file mode 100644
> index 0000000..3d3eeb8
> --- /dev/null
> +++ b/drivers/video/cmdmode.c
> @@ -0,0 +1,42 @@
> +/*
> + * generic cmdmode display timing functions
> + *
> + * Copyright (c) 2014 YoungJun Cho <yj44.cho@samsung.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/errno.h>
> +#include <linux/export.h>
> +#include <video/cmdmode_display_timing.h>
> +#include <video/cmdmode.h>
> +
> +void cmdmode_from_timing(const struct cmdmode_display_timing *cmdt,
> +				struct cmdmode *cm)
> +{
> +	cm->pixelclock =3D cmdt->pixelclock;
> +	cm->hactive =3D cmdt->hactive;
> +	cm->vactive =3D cmdt->vactive;
> +	cm->cs_setup =3D cmdt->cs_setup;
> +	cm->wr_setup =3D cmdt->wr_setup;
> +	cm->wr_active =3D cmdt->wr_active;
> +	cm->wr_hold =3D cmdt->wr_hold;
> +}
> +EXPORT_SYMBOL_GPL(cmdmode_from_timing);
> +
> +int cmdmode_from_timings(const struct cmdmode_display_timings *cmdts,
> +				struct cmdmode *cm, unsigned int index)
> +{
> +	struct cmdmode_display_timing *cmdt;
> +
> +	cmdt =3D cmdmode_display_timings_get(cmdts, index);
> +	if (!cmdt)
> +		return -EINVAL;
> +
> +	cmdmode_from_timing(cmdt, cm);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(cmdmode_from_timings);
> diff --git a/drivers/video/cmdmode_display_timing.c b/drivers/video/cmdmo=
de_display_timing.c
> new file mode 100644
> index 0000000..88bab08
> --- /dev/null
> +++ b/drivers/video/cmdmode_display_timing.c
> @@ -0,0 +1,26 @@
> +/*
> + * generic cmdmode display timing functions
> + *
> + * Copyright (c) 2014 YoungJun Cho <yj44.cho@samsung.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/export.h>
> +#include <linux/slab.h>
> +#include <video/cmdmode_display_timing.h>
> +
> +void cmdmode_display_timings_release(struct cmdmode_display_timings *cmd=
ts)
> +{
> +	if (cmdts->timings) {
> +		unsigned int i;
> +
> +		for (i =3D 0; i < cmdts->num_timings; i++)
> +			kfree(cmdts->timings[i]);
> +		kfree(cmdts->timings);
> +	}
> +	kfree(cmdts);
> +}
> +EXPORT_SYMBOL_GPL(cmdmode_display_timings_release);
> diff --git a/drivers/video/of_cmdmode.c b/drivers/video/of_cmdmode.c
> new file mode 100644
> index 0000000..d63294e
> --- /dev/null
> +++ b/drivers/video/of_cmdmode.c
> @@ -0,0 +1,55 @@
> +/*
> + * generic cmdmode helper
> + *
> + * Copyright (c) 2014 YoungJun Cho <yj44.cho@samsung.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +#include <linux/errno.h>
> +#include <linux/export.h>
> +#include <linux/of.h>
> +#include <video/cmdmode_display_timing.h>
> +#include <video/of_cmdmode_display_timing.h>
> +#include <video/of_cmdmode.h>
> +#include <video/cmdmode.h>
> +
> +/**
> + * of_get_cmdmode - get the cmdmode #<index> from devicetree
> + * @np - devicenode with the cmdmode_display_timings
> + * @cm - set to return value
> + * @index - index into list of cmdmode_display_timings
> + *	    (Set this to OF_USE_CMDMODE_NATIVE_MODE to use whatever mode is
> + *	     specified as native mode in the DT.)
> + *
> + * DESCRIPTION:
> + * Get a list of all display timings and put the one
> + * specified by index into *cm. This function should only be used, if
> + * only one cmdmode is to be retrieved. A driver that needs to work
> + * with multiple/all cmdmodes should work with
> + * of_get_cmdmode_display_timings instead.
> + **/
> +int of_get_cmdmode(struct device_node *np, struct cmdmode *cm, int index)
> +{
> +	struct cmdmode_display_timings *cmdts;
> +	int ret;
> +
> +	cmdts =3D of_get_cmdmode_display_timings(np);
> +	if (!cmdts) {
> +		pr_err("%s: no timings specified\n", of_node_full_name(np));
> +		return -EINVAL;
> +	}
> +
> +	if (index =3D=3D OF_USE_CMDMODE_NATIVE_MODE)
> +		index =3D cmdts->native_mode;
> +
> +	ret =3D cmdmode_from_timings(cmdts, cm, index);
> +	if (ret)
> +		return ret;
> +
> +	cmdmode_display_timings_release(cmdts);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(of_get_cmdmode);
> diff --git a/drivers/video/of_cmdmode_display_timing.c b/drivers/video/of=
_cmdmode_display_timing.c
> new file mode 100644
> index 0000000..fcf2b35
> --- /dev/null
> +++ b/drivers/video/of_cmdmode_display_timing.c
> @@ -0,0 +1,212 @@
> +/*
> + * OF helpers for parsing cmdmode display timings
> + *
> + * Copyright (c) 2014 YoungJun Cho <yj44.cho@samsung.com>
> + *
> + * based on of_cmdmode.c
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +#include <linux/export.h>
> +#include <linux/of.h>
> +#include <linux/slab.h>
> +#include <video/cmdmode_display_timing.h>
> +#include <video/of_cmdmode_display_timing.h>
> +
> +/**
> + * of_parse_cmdmode_display_timing - parse cmdmode_display_timing entry
> + *					from device_node
> + * @np: device_node with the properties
> + **/
> +static int of_parse_cmdmode_display_timing(const struct device_node *np,
> +					struct cmdmode_display_timing *cmdt)
> +{
> +	int ret =3D 0;
> +
> +	memset(cmdt, 0, sizeof(*cmdt));
> +
> +	ret |=3D of_property_read_u32(np, "clock-frequency", &cmdt->pixelclock);
> +	ret |=3D of_property_read_u32(np, "hactive", &cmdt->hactive);
> +	ret |=3D of_property_read_u32(np, "vactive", &cmdt->vactive);
> +	ret |=3D of_property_read_u32(np, "cs-setup", &cmdt->cs_setup);
> +	ret |=3D of_property_read_u32(np, "wr-setup", &cmdt->wr_setup);
> +	ret |=3D of_property_read_u32(np, "wr-active", &cmdt->wr_active);
> +	ret |=3D of_property_read_u32(np, "wr-hold", &cmdt->wr_hold);
> +
> +	if (ret) {
> +		pr_err("%s: error reading cmdmode timing properties\n",
> +			of_node_full_name(np));
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * of_get_cmdmode_display_timing - parse a cmdmode_display_timing entry
> + * @np: device_node with the timing subnode
> + * @name: name of the timing node
> + * @cmdt: cmdmode_display_timing struct to fill
> + **/
> +int of_get_cmdmode_display_timing(struct device_node *np, const char *na=
me,
> +					struct cmdmode_display_timing *cmdt)
> +{
> +	struct device_node *timing_np;
> +
> +	if (!np) {
> +		pr_err("%s: no devicenode given\n", of_node_full_name(np));
> +		return -EINVAL;
> +	}
> +
> +	timing_np =3D of_get_child_by_name(np, name);
> +	if (!timing_np) {
> +		pr_err("%s: could not find node '%s'\n",
> +			of_node_full_name(np), name);
> +		return -ENOENT;
> +	}
> +
> +	return of_parse_cmdmode_display_timing(timing_np, cmdt);
> +}
> +EXPORT_SYMBOL_GPL(of_get_cmdmode_display_timing);
> +
> +/**
> + * of_get_cmdmode_display_timings - parse all cmdmode_display_timing
> + * entries from a device_node
> + * @np: device_node with the subnodes
> + **/
> +struct cmdmode_display_timings*
> +of_get_cmdmode_display_timings(struct device_node *np)
> +{
> +	struct device_node *timings_np;
> +	struct device_node *entry;
> +	struct device_node *native_mode;
> +	struct cmdmode_display_timings *cmdts;
> +
> +	if (!np) {
> +		pr_err("%s: no device node given\n", of_node_full_name(np));
> +		return NULL;
> +	}
> +
> +	timings_np =3D of_get_child_by_name(np, "cmdmode-display-timings");
> +	if (!timings_np) {
> +		pr_err("%s: could not find cmdmode-display-timings node\n",
> +			of_node_full_name(np));
> +		return NULL;
> +	}
> +
> +	cmdts =3D kzalloc(sizeof(*cmdts), GFP_KERNEL);
> +	if (!cmdts) {
> +		pr_err("%s: could not allocate struct cmdts'\n",
> +			of_node_full_name(np));
> +		goto cmdtsfail;
> +	}
> +
> +	entry =3D of_parse_phandle(timings_np, "native-mode", 0);
> +	/* assume first child as native mode if none provided */
> +	if (!entry)
> +		entry =3D of_get_next_child(np, NULL);
> +	/* if there is no child, it is useless to go on */
> +	if (!entry) {
> +		pr_err("%s: no timing specifications given\n",
> +			of_node_full_name(np));
> +		goto entryfail;
> +	}
> +
> +	pr_debug("%s: using %s as default timing\n",
> +		of_node_full_name(np), entry->name);
> +
> +	native_mode =3D entry;
> +
> +	cmdts->num_timings =3D of_get_child_count(timings_np);
> +	if (cmdts->num_timings =3D=3D 0) {
> +		/* should never happen, as entry was already found above */
> +		pr_err("%s: no timings specified\n", of_node_full_name(np));
> +		goto entryfail;
> +	}
> +
> +	cmdts->timings =3D kzalloc(sizeof(struct cmdmode_display_timing *) *
> +				cmdts->num_timings, GFP_KERNEL);
> +	if (!cmdts->timings) {
> +		pr_err("%s: could not allocate timings array\n",
> +			of_node_full_name(np));
> +		goto entryfail;
> +	}
> +
> +	cmdts->num_timings =3D 0;
> +	cmdts->native_mode =3D 0;
> +
> +	for_each_child_of_node(timings_np, entry) {
> +		struct cmdmode_display_timing *cmdt;
> +		int r;
> +
> +		cmdt =3D kzalloc(sizeof(*cmdt), GFP_KERNEL);
> +		if (!cmdt) {
> +			pr_err("%s: could not allocate cmdmode_display_timing\n"
> +				, of_node_full_name(np));
> +			goto timingfail;
> +		}
> +
> +		r =3D of_parse_cmdmode_display_timing(entry, cmdt);
> +		if (r) {
> +			/*
> +			 * to not encourage wrong devicetrees, fail in case of
> +			 * an error
> +			 */
> +			pr_err("%s: error in timing %d\n",
> +				of_node_full_name(np), cmdts->num_timings + 1);
> +			goto timingfail;
> +		}
> +
> +		if (native_mode =3D=3D entry)
> +			cmdts->native_mode =3D cmdts->num_timings;
> +
> +		cmdts->timings[cmdts->num_timings] =3D cmdt;
> +		cmdts->num_timings++;
> +	}
> +	of_node_put(timings_np);
> +	/*
> +	 * native_mode points to the device_node returned by of_parse_phandle
> +	 * therefore call of_node_put on it
> +	 */
> +	of_node_put(native_mode);
> +
> +	pr_debug("%s: got %d timings. Using timing #%d as default\n",
> +		of_node_full_name(np), cmdts->num_timings,
> +		cmdts->native_mode + 1);
> +
> +	return cmdts;
> +
> +timingfail:
> +	if (native_mode)
> +		of_node_put(native_mode);
> +	cmdmode_display_timings_release(cmdts);
> +entryfail:
> +	kfree(cmdts);
> +cmdtsfail:
> +	of_node_put(timings_np);
> +	return NULL;
> +}
> +EXPORT_SYMBOL_GPL(of_get_cmdmode_display_timings);
> +
> +/**
> + * of_cmdmode_display_timings_exist - check if a display-timings node is
> + * provided
> + * @np: device_node with the timing
> + **/
> +int of_cmdmode_display_timings_exist(struct device_node *np)
> +{
> +	struct device_node *timings_np;
> +
> +	if (!np)
> +		return -EINVAL;
> +
> +	timings_np =3D of_parse_phandle(np, "cmdmode-display-timings", 0);
> +	if (!timings_np)
> +		return -EINVAL;
> +
> +	of_node_put(timings_np);
> +	return 1;
> +}
> +EXPORT_SYMBOL_GPL(of_cmdmode_display_timings_exist);
> diff --git a/include/video/cmdmode.h b/include/video/cmdmode.h
> new file mode 100644
> index 0000000..61ee71e
> --- /dev/null
> +++ b/include/video/cmdmode.h
> @@ -0,0 +1,67 @@
> +/*
> + * generic cmdmode description
> + *
> + * Copyright 2014 YoungJun Cho <yj44.cho@samsung.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#ifndef __LINUX_CMDMODE_H
> +#define __LINUX_CMDMODE_H
> +
> +#include <linux/types.h>
> +#include <video/cmdmode_display_timing.h>
> +
> +/*
> + * Subsystem independent description of a cmdmode.
> + * Can be generated from struct cmdmode_display_timing.
> + * @pixelclock: display clock in Hz
> + * @hactive: horizontal active video
> + * @vactive: vertical active video
> + * @cs_setup: clock cycles for the active period of address signal is en=
abled
> + *		until chip select is enabled
> + * @wr_setup: clock cycles for the active period of CS signal is enabled=
 until
> + *		write signal is enabled
> + * @wr_active: clock cycles for the active period of CS is enabled
> + * @wr_hold: clock cycles for the active period of CS is disabled until =
write
> + *		signal is disabled
> + */
> +struct cmdmode {
> +	unsigned long pixelclock;
> +
> +	u32 hactive;
> +	u32 vactive;
> +
> +	u32 cs_setup;
> +	u32 wr_setup;
> +	u32 wr_active;
> +	u32 wr_hold;
> +};
> +
> +/**
> + * cmdmode_from_timing - convert display timing to cmdmode
> + * @cmdt: cmdmode_display_timing structure
> + * @cm: return value
> + *
> + * DESCRIPTION:
> + * This function converts a struct cmdmode_display_timing to a struct cm=
dmode.
> + */
> +void cmdmode_from_timing(const struct cmdmode_display_timing *cmdt,
> +				struct cmdmode *cm);
> +
> +/**
> + * cmdmode_from_timings - convert one display timings entry to cmdmode
> + * @disp: structure with all possible timing entries
> + * @cm: return value
> + * @index: index into the list of display timings in devicetree
> + *
> + * DESCRIPTION:
> + * This function converts one struct cmdmode_display_timing entry to a
> + * struct cmdmode.
> + */
> +int cmdmode_from_timings(const struct cmdmode_display_timings *cmdts,
> +				struct cmdmode *cm, unsigned int index);
> +
> +#endif /* __LINUX_CMDMODE_H */
> diff --git a/include/video/cmdmode_display_timing.h b/include/video/cmdmo=
de_display_timing.h
> new file mode 100644
> index 0000000..5005660
> --- /dev/null
> +++ b/include/video/cmdmode_display_timing.h
> @@ -0,0 +1,59 @@
> +/*
> + * description of cmdmode display timings
> + *
> + * Copyright 2014 YoungJun Cho <yj44.cho@samsung.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#ifndef __LINUX_CMDMODE_DISPLAY_TIMING_H
> +#define __LINUX_CMDMODE_DISPLAY_TIMING_H
> +
> +#include <linux/types.h>
> +
> +/*
> + * Single "mode" entry. This describes one set of signal timings a displ=
ay can
> + * have in one setting. This struct can later be converted to struct cmd=
mode
> + * (see include/video/cmdmode.h).
> + */
> +struct cmdmode_display_timing {
> +	u32	pixelclock;
> +
> +	u32	hactive;
> +	u32	vactive;
> +
> +	u32	cs_setup;
> +	u32	wr_setup;
> +	u32	wr_active;
> +	u32	wr_hold;
> +};
> +
> +/*
> + * This describes all timing settings a display provides.
> + * The native_mode is the default setting for this display.
> + * Drivers that can handle multiple cmdmodes should work with this struct
> + * and convert each entry to the desired end result.
> + */
> +struct cmdmode_display_timings {
> +	unsigned int num_timings;
> +	unsigned int native_mode;
> +
> +	struct cmdmode_display_timing **timings;
> +};
> +
> +/* get one entry from struct cmdmode_display_timings */
> +static inline struct cmdmode_display_timing*
> +cmdmode_display_timings_get(const struct cmdmode_display_timings *cmdts,
> +				unsigned int index)
> +{
> +	if (cmdts->num_timings > index)
> +		return cmdts->timings[index];
> +	else
> +		return NULL;
> +}
> +
> +void cmdmode_display_timings_release(struct cmdmode_display_timings *cmd=
ts);
> +
> +#endif /* __LINUX_CMDDMODE_DISPLAY_TIMING_H */
> diff --git a/include/video/of_cmdmode.h b/include/video/of_cmdmode.h
> new file mode 100644
> index 0000000..fb7c6c7
> --- /dev/null
> +++ b/include/video/of_cmdmode.h
> @@ -0,0 +1,19 @@
> +/*
> + * Copyright 2014 YoungJun Cho <yj44.cho@samsung.com>
> + *
> + * cmdmode of-helpers
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#ifndef __LINUX_OF_CMDMODE_H
> +#define __LINUX_OF_CMDMODE_H
> +
> +struct device_node;
> +struct cmdmode;
> +
> +int of_get_cmdmode(struct device_node *np, struct cmdmode *cm, int index=
);
> +
> +#endif /* __LINUX_OF_CMDMODE_H */
> diff --git a/include/video/of_cmdmode_display_timing.h b/include/video/of=
_cmdmode_display_timing.h
> new file mode 100644
> index 0000000..6be91ba
> --- /dev/null
> +++ b/include/video/of_cmdmode_display_timing.h
> @@ -0,0 +1,26 @@
> +/*
> + * Copyright 2014 YoungJun Cho <yj44.cho@samsung.com>
> + *
> + * cmdmode display timings of helpers
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#ifndef __LINUX_OF_CMDMODE_DISPLAY_TIMING_H
> +#define __LINUX_OF_CMDMODE_DISPLAY_TIMING_H
> +
> +struct device_node;
> +struct cmdmode_display_timing;
> +struct cmdmode_display_timings;
> +
> +#define OF_USE_CMDMODE_NATIVE_MODE -1
> +
> +int of_get_cmdmode_display_timing(struct device_node *np, const char *na=
me,
> +					struct cmdmode_display_timing *cmdt);
> +struct cmdmode_display_timings*
> +	of_get_cmdmode_display_timings(struct device_node *np);
> +int of_cmdmode_display_timings_exist(struct device_node *np);
> +
> +#endif /* __LINUX_OF_CMDMODE_DISPLAY_TIMING_H */
> --=20
> 1.7.9.5
>=20

--M9NhX3UHpAaciwkO
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTgxQRAAoJEN0jrNd/PrOhT8kP/RCyq+bN0e00H828v9O/7pCN
s/O6t2Mo33ow567nXNNX50PvozerkwSg2LQ7AqHVCh8SIzMRCjHedZfRMztZTLyS
OV/ubX1PDs6pMXkA/5WUmnlGQHKhfgFnxHa0aVBG70pRRnB+J3GJA1A7Y74SiF2S
2j3mv6rr+eifXqVmQ79ePQSexKhrDNjY1H9Dy7daPSuhaLmk8f27oGeCIrOkLw3a
ih4SRZU2ax7V+marIxt+N92YVZjQv1iY1GDfMWs3fvDSXPcTJj1Ql1MFnno4DonQ
CV3lolCSVfVImTUAyOBsLobkObbV8iMUxlNAeDRhK5vYS5Q+znUP2q6SVKLvcy2S
ugg4FNQtsDor/qOw0SydiM1T3yRrUZU/Zr7XXgQ96Js1QEHwufRy0XzATvdND/+x
ooJqD9w8+m9QxlT0kj7bSk+gOrN83kJXBWhQk/at7reD1wkAeIZsTOHvA1xXFm7u
pAdQ8J5axRV5kQB3Ebee1frYjyLR8LFnn7+iP6mvicuRlNkbKCWcCAKBjyT1F2iW
0yAvMGnlG349wEW+gn3Jk7CadW4WDIGTqbJmf2ENzlanIL6tWwMWnoC3uuuIQf4B
kNnTzJPI+AeSc9+Itf8R8qaP7AB81epbkczaaxnQTXnV2Br6Y5U8+aiMfMEFMASs
HPrVjD0iJ7QJkx7JhH1M
=nw0m
-----END PGP SIGNATURE-----

--M9NhX3UHpAaciwkO--

--===============1213047532==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1213047532==--
