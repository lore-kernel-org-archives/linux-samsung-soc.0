From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v6 10/14] drm/panel: add S6E3FA0 driver
Date: Mon, 21 Jul 2014 11:19:18 +0200
Message-ID: <20140721091917.GK8843@ulmo>
References: <1405587689-1466-1-git-send-email-yj44.cho@samsung.com>
 <1405587689-1466-11-git-send-email-yj44.cho@samsung.com>
 <20140717103645.GD17877@ulmo>
 <53C87D2F.9000906@samsung.com>
 <53CCD5A8.6090406@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="F55Y67F01HNW3AgB"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f182.google.com ([74.125.82.182]:42732 "EHLO
	mail-we0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753932AbaGUJTX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Jul 2014 05:19:23 -0400
Content-Disposition: inline
In-Reply-To: <53CCD5A8.6090406@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: YoungJun Cho <yj44.cho@samsung.com>, airlied@linux.ie, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, inki.dae@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Paul Mundt <paul.mundt@gmail.com>, Imre Deak <imre.deak@intel.com>


--F55Y67F01HNW3AgB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 21, 2014 at 10:56:08AM +0200, Andrzej Hajda wrote:
> On 07/18/2014 03:49 AM, YoungJun Cho wrote:
> > Hi Thierry,
> >
> > Thank you a lot for kind comments.
> >
> > On 07/17/2014 07:36 PM, Thierry Reding wrote:
> >> On Thu, Jul 17, 2014 at 06:01:25PM +0900, YoungJun Cho wrote:
> >> [...]
> >>> diff --git a/drivers/gpu/drm/panel/panel-s6e3fa0.c b/drivers/gpu/drm/=
panel/panel-s6e3fa0.c
> >> [...]
> >>> +/* Manufacturer Command Set */
> >>> +#define MCS_GLOBAL_PARAMETER	0xb0
> >>> +#define MCS_AID			0xb2
> >>> +#define MCS_ELVSSOPT		0xb6
> >>> +#define MCS_TEMPERATURE_SET	0xb8
> >>> +#define MCS_PENTILE_CTRL	0xc0
> >>> +#define MCS_GAMMA_MODE		0xca
> >>> +#define MCS_VDDM		0xd7
> >>> +#define MCS_ALS			0xe3
> >>> +#define MCS_ERR_FG		0xed
> >>> +#define MCS_KEY_LEV1		0xf0
> >>> +#define MCS_GAMMA_UPDATE	0xf7
> >>> +#define MCS_KEY_LEV2		0xfc
> >>> +#define MCS_RE			0xfe
> >>> +#define MCS_TOUT2_HSYNC		0xff
> >>> +
> >>> +/* Content Adaptive Brightness Control */
> >>> +#define DCS_WRITE_CABC		0x55
> >> Is this not a manufacturer specific command? I couldn't find it in the
> >> DSI or DCS specifications, but it sounds like something standard (also
> >> indicated by the DCS_ prefix). Can you point out the specification for
> >> this?
> >>
> > Andrzej commented before and decided it as DCS one because if the value=
=20
> > is less than 0xb0, it is DCS one and the others are MCS one.
> > But still I'm not sure it is correct.
> I would not say 'decided'. I have just stated that according to DCS
> specification
> it should be DCS command (below 0xb0), but it is not present in mipi dcs
> specs.
> On the other side many panels have it [1]:
>=20
> [1]:
> https://www.google.com/search?q=3D%22Write+Content+Adaptive+Brightness+Co=
ntrol%22

Yeah, my search yielded similar results. I wonder if this is perhaps
part of a draft future specification. I'll try to ask around some more
if anybody knows what the status of this is.

> >>> +static void s6e3fa0_read_mtp_id(struct s6e3fa0 *ctx)
> >>> +{
> >>> +	unsigned char id[MTP_ID_LEN];
> >>> +	int ret;
> >>> +
> >>> +	s6e3fa0_set_maximum_return_packet_size(ctx, MTP_ID_LEN);
> >>> +	ret =3D s6e3fa0_dcs_read(ctx, MIPI_DCS_GET_DISPLAY_ID, id, MTP_ID_L=
EN);
> >> This also looks like a standard DCS command. I can't find it in either
> >> v1.01 nor v1.02 of the specification, though. Do you know where it's
> >> specified?
> >>
> > Yes, I also can't find it in DCS specification and there is no special=
=20
> > description in panel datasheet.
> > But as it is declared in "include/video/mipi_display.h", so I think it=
=20
> > is a standard one.
>=20
> On page 9 of the "Introduction of MIPI by Renesas" [2] there is info
> it is a part of "Nokia I/F command list", I guess it is kind of alpha
> version of MIPI DCS.
>=20
> [2]: http://wenku.baidu.com/view/658fab68af1ffc4ffe47acbe.html

That link is the only one which contains "Nokia I/F command list" on the
internet (that is, according to Google). But since this is already part
of the mipi_display.h header file we may as well use it.

I wonder if perhaps the READ_DDB_START and READ_DDB_CONTINUE commands
could be used as a replacement for this display ID.

Adding Guennadi, Tomi, Paul and Imre on Cc since they were involved with
the original patch that added mipi_display.h. Perhaps they remember what
the origin of this command is.

Thierry

--F55Y67F01HNW3AgB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTzNsVAAoJEN0jrNd/PrOhRFwP/ixJn0wHdUKVIdugt6+vc2uI
EjettWamQVWVME7icg6porzle/oIUY7mk3n/9CSRGV2UDnJEXBOyaLQ0na9RWQtz
mHl7zv5KwQPvY4rsZk2qfVH0vWpMf/lBodILrlv0Ly7LXdBXPlezg8ZldZFFgq/q
FiecT9Z1GuhwnmIvilNcymScVrHIsb+AUsxvNl/urL6UdOzHnkihosEy2frFls7a
RqAAbTYtZ/9BTVLeAfwdhxQJhhR0foCPeDzVxpZvcgIiQ1Y4M0k2I221H8zpkEBr
xf33EuOj8TNhUVWP0bXqHqWVr/1eTdLUOZF0Va847OdhFD02OsWZVdxUesq/PP19
Ojzs67tER0vKE3TA8Z/ISCreVOw//CKE91qqDRSFuPsGlIbfwB3POc1iluHjL3rY
wB898IUQXr3ptJ0iykWAO6cgXwP1Hshzcz0hiIFpWSylowzLsrTOPwPvCwANlrh+
z1UXBfh+7OuENjFbMGHyRpSokhgjINGwVo9ah/k7xOn5yZ63KpI4Ufu2cI3wdjId
O30faYF+Til93h5DtNd4iUrY5qzqsWDYQTtJ1DvmiTh0faG9TLcQeON6OHouilgU
GF32lNoPGQgCdU0JEvSqfkL7exZKtdpdqI6jITJFfeqqOVj5cTEv+IfddVIVgOP/
mo1mklO2DrPpM18yAa2u
=YvXj
-----END PGP SIGNATURE-----

--F55Y67F01HNW3AgB--
