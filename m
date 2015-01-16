From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [Resend][PATCH v2 2/3] drm/panel: add s6e63j0x03 LCD panel driver
Date: Fri, 16 Jan 2015 12:30:29 +0100
Message-ID: <20150116113028.GD4885@ulmo.nvidia.com>
References: <1418117346-9078-3-git-send-email-human.hwang@samsung.com>
 <54AAAD96.2050004@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XvKFcGCOAo53UbWW"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f176.google.com ([209.85.192.176]:54304 "EHLO
	mail-pd0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754541AbbAPLae (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Jan 2015 06:30:34 -0500
Content-Disposition: inline
In-Reply-To: <54AAAD96.2050004@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>


--XvKFcGCOAo53UbWW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 06, 2015 at 12:28:22AM +0900, Inki Dae wrote:
[...]
> -------- Original Message --------
> Subject: [PATCH v2 2/3] drm/panel: add s6e63j0x03 LCD panel driver
> Date: Tue, 09 Dec 2014 18:29:05 +0900
> From: Hyungwon Hwang <human.hwang@samsung.com>
> To: dri-devel@lists.freedesktop.org
> CC: airlied@linux.ie, devicetree@vger.kernel.org, robh+dt@kernel.org,
> pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk,
> galak@codeaurora.org, linux-samsung-soc@vger.kernel.org,
> kyungmin.park@samsung.com, inki.dae@samsung.com, a.hajda@samsung.com,
> kgene.kim@samsung.com, thierry.reding@gmail.com, Hyungwon Hwang
> <human.hwang@samsung.com>
>=20
> From: Inki Dae <inki.dae@samsung.com>
>=20
> This patch adds MIPI-DSI based S6E63J0X03 AMOLED LCD panel driver
> which uses mipi_dsi bus to communicate with panel. The panel has
> 320=C3=97320 resolution in 1.63-inch physical panel. This panel is used in
> Samsung Galaxy Gear 2.
>=20
> Signed-off-by: Inki Dae <inki.dae@samsung.com>
> Signed-off-by: Hyungwon Hwang <human.hwang@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
> Changes for v2:
> - Change the gamma table to 2-dimensional array
> - Change the way to make index for brightness
> - Make command functions to an array so that it can be called simply
> - Change command id for reading device ID
> - Change the way to handle the error condition
> - Remove power variable, and use the same name variable in bl_dev
> - Add the state FB_BLANK_NORMAL to represent the state which the panel
> is working but blanked
> - Miscellaneous changes to increase the readability and follow the
>   coding-style standard
>=20
>  drivers/gpu/drm/panel/Kconfig            |   6 +
>  drivers/gpu/drm/panel/Makefile           |   1 +
>  drivers/gpu/drm/panel/panel-s6e63j0x03.c | 549
> +++++++++++++++++++++++++++++++
>  3 files changed, 556 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-s6e63j0x03.c

I thought I had mentioned this before, but this is missing device tree
binding documentation.

Thierry

--XvKFcGCOAo53UbWW
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUuPZTAAoJEN0jrNd/PrOhG9gQAMJinnyb/4M/+XcMqQd0TCz/
VrjpNg8txuFNtCwXKXSglxyw7XP563U4areRAMCyYkqKjiCHCCKjcSUCvXLBLftu
cSjCmQWcA36LNq8aaPVcVYEYsGtNxQtzrGE6RhlRjeviUkT/sc5+lbk1u3WZ7OOR
HCMVg+j5MZ59irbR12gVqJpvMmCBQlIoGLdifuRgvE4knzXHF68avg0YjdlmOeF6
YSsk9MK6lNpPqqVeQgjM2wcLJ2XLADqBNQOSasl0HHJEejrwcPGWVD3x8GD4XF7G
v+r+B/SrrUfRkwYJ9zA+BGdux1gLjnswNQUPUt085hukyyUKRvyvf/ORAFVBVCci
j42PH6XZCri/3d5QWqEIiNkzCy+71w6gwHGAsaeaTrP9N6GcQn7ch8S35SCycWks
q4aYUwtqJrErlnkLKuV2StlPJepumPv3JXP7Xp/DnI4wBYec1gZPHhnBOb2FoRUV
39vhSaQOSkShf6llzZfXdSWgm5z4oKvBY7dBHO/lrm1K3Mhwv/XP+isAhzVYW1EW
IdWITV0w9zDJKEEh0SD12AHoj+s/cuLvsjZZlsiQmWjZ2Nyyf5LP8NQVn4ckkXBQ
dJozKkkCLljxvPjTvBTcJdLBlEc5aK4qCoQO92roIMRholanj8dutYMnoLGxZ/M8
au157/WM1hke/8+vxTtt
=H7mJ
-----END PGP SIGNATURE-----

--XvKFcGCOAo53UbWW--
