From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [PATCH V6 8/8] drm/bridge: Add i2c based driver for ps8622/ps8625
 bridge
Date: Tue, 29 Jul 2014 13:29:58 +0200
Message-ID: <53D785B6.9060806@suse.de>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com> <1406316130-4744-9-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:42572 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753296AbaG2LaC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jul 2014 07:30:02 -0400
In-Reply-To: <1406316130-4744-9-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay Kumar <ajaykumar.rs@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: inki.dae@samsung.com, thierry.reding@gmail.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, Vincent Palatin <vpalatin@chromium.org>, Andrew Bresticker <abrestic@chromium.org>, Sean Paul <seanpaul@chromium.org>, Rahul Sharma <rahul.sharma@samsung.com>

Am 25.07.2014 21:22, schrieb Ajay Kumar:
> From: Vincent Palatin <vpalatin@chromium.org>
>=20
> This patch adds drm_bridge driver for parade DisplayPort
> to LVDS bridge chip.
>=20
> Signed-off-by: Vincent Palatin <vpalatin@chromium.org>
> Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
>  .../devicetree/bindings/vendor-prefixes.txt        |    1 +
>  .../devicetree/bindings/video/bridge/ps8622.txt    |   19 +
>  drivers/gpu/drm/bridge/Kconfig                     |   10 +
>  drivers/gpu/drm/bridge/Makefile                    |    1 +
>  drivers/gpu/drm/bridge/ps8622.c                    |  602 ++++++++++=
++++++++++
>  5 files changed, 633 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/video/bridge/ps=
8622.txt
>  create mode 100644 drivers/gpu/drm/bridge/ps8622.c
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/=
Documentation/devicetree/bindings/vendor-prefixes.txt
> index 46a311e..b4a99cc 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -96,6 +96,7 @@ nxp	NXP Semiconductors
>  onnn	ON Semiconductor Corp.
>  opencores	OpenCores.org
>  panasonic	Panasonic Corporation
> +parade	Parade Technologies Inc.
>  phytec	PHYTEC Messtechnik GmbH
>  picochip	Picochip Ltd
>  plathome	Plat'Home Co., Ltd.
> diff --git a/Documentation/devicetree/bindings/video/bridge/ps8622.tx=
t b/Documentation/devicetree/bindings/video/bridge/ps8622.txt
> new file mode 100644
> index 0000000..fdeafb2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/video/bridge/ps8622.txt
> @@ -0,0 +1,19 @@
> +ps8622-bridge bindings
> +
> +Required properties:
> +	- compatible: "parade,ps8622" or "parade,ps8625"
> +	- reg: first i2c address of the bridge
> +	- sleep-gpios: OF device-tree gpio specification
> +	- reset-gpios: OF device-tree gpio specification
> +
> +Optional properties:
> +	- lane-count: number of DP lanes to use
> +
> +Example:
> +	ps8622-bridge@48 {

Nit: Shouldn't this be lvds-bridge like in 7/8 or something else not
derived from the specific model? Applies to the DT series as well.

> +		compatible =3D "parade,ps8622";
> +		reg =3D <0x48>;
> +		sleep-gpios =3D <&gpc3 6 1 0 0>;
> +		reset-gpios =3D <&gpc3 1 1 0 0>;
> +		lane-count =3D <1>
> +	};
[...]
> diff --git a/drivers/gpu/drm/bridge/ps8622.c b/drivers/gpu/drm/bridge=
/ps8622.c
> new file mode 100644
> index 0000000..ec60fcf
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/ps8622.c
> @@ -0,0 +1,602 @@
> +/*
> + * Parade PS8622 eDP/LVDS bridge driver
> + *
> + * Copyright (C) 2014 Google, Inc.
> + *
> + * This software is licensed under the terms of the GNU General Publ=
ic
> + * License version 2, as published by the Free Software Foundation, =
and
> + * may be copied, distributed, and modified under those terms.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
[...]
> +MODULE_AUTHOR("Vincent Palatin <vpalatin@chromium.org>");
> +MODULE_DESCRIPTION("Parade ps8622 eDP-LVDS converter driver");
> +MODULE_LICENSE("GPL");

"GPL v2"?

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrn=
berg
