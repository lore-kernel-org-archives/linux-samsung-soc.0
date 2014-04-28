From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC v2 PATCH v3 10/14] drm/panel: add S6E3FA0 driver
Date: Mon, 28 Apr 2014 23:25:50 +0200
Message-ID: <20140428212547.GA13897@mithrandir>
References: <1398083321-8668-1-git-send-email-yj44.cho@samsung.com>
 <5275422.8CoHT7g51N@avalon>
 <5355C4D7.7010109@samsung.com>
 <1852265.JnliZKqXKk@avalon>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="17pEHd4RhPHOinZp"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f50.google.com ([74.125.83.50]:44833 "EHLO
	mail-ee0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752119AbaD1VZy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Apr 2014 17:25:54 -0400
Content-Disposition: inline
In-Reply-To: <1852265.JnliZKqXKk@avalon>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: YoungJun Cho <yj44.cho@samsung.com>, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, dri-devel@lists.freedesktop.org, a.hajda@samsung.com, sachin.kamat@linaro.org, kyungmin.park@samsung.com, robh+dt@kernel.org, galak@codeaurora.org, kgene.kim@samsung.com


--17pEHd4RhPHOinZp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2014 at 05:05:24PM +0200, Laurent Pinchart wrote:
> Hi YoungJun,
>=20
> On Tuesday 22 April 2014 10:24:39 YoungJun Cho wrote:
> > On 04/22/2014 08:00 AM, Laurent Pinchart wrote:
> > > Hi YoungJun,
> > >=20
> > > Thank you for the patch.
> > >=20
> > > On Monday 21 April 2014 21:28:37 YoungJun Cho wrote:
> > >> This patch adds MIPI-DSI command mode based S6E3FA0 AMOLED LCD Panel
> > >> driver.
> > >>=20
> > >> Changelog v2:
> > >> - Declares delay, size properties in probe routine instead of DT
> > >> Changelog v3:
> > >> - Moves CPU timings relevant properties from FIMD DT
> > >>=20
> > >>    (commented by Laurent Pinchart, Andrzej Hajda)
> > >>=20
> > >> Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
> > >> Acked-by: Inki Dae <inki.dae@samsung.com>
> > >> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> > >> ---
> > >>=20
> > >>   drivers/gpu/drm/panel/Kconfig         |    7 +
> > >>   drivers/gpu/drm/panel/Makefile        |    1 +
> > >>   drivers/gpu/drm/panel/panel-s6e3fa0.c |  569 +++++++++++++++++++++=
+++++
> > >>   3 files changed, 577 insertions(+)
> > >>   create mode 100644 drivers/gpu/drm/panel/panel-s6e3fa0.c
> > >=20
> > > [snip]
> > >=20
> > >> diff --git a/drivers/gpu/drm/panel/panel-s6e3fa0.c
> > >> b/drivers/gpu/drm/panel/panel-s6e3fa0.c new file mode 100644
> > >> index 0000000..1282678
> > >> --- /dev/null
> > >> +++ b/drivers/gpu/drm/panel/panel-s6e3fa0.c
> > >> @@ -0,0 +1,569 @@
> > >=20
> > > [snip]
> > >=20
> > >> +static int s6e3fa0_get_modes(struct drm_panel *panel)
> > >> +{
> > >> +	struct drm_connector *connector =3D panel->connector;
> > >> +	struct s6e3fa0 *ctx =3D panel_to_s6e3fa0(panel);
> > >> +	struct drm_display_mode *mode;
> > >> +
> > >> +	mode =3D drm_mode_create(connector->dev);
> > >> +	if (!mode) {
> > >> +		DRM_ERROR("failed to create a new display mode\n");
> > >> +		return 0;
> > >> +	}
> > >> +
> > >> +	drm_display_mode_from_videomode(&ctx->vm, mode);
> > >> +	mode->width_mm =3D ctx->width_mm;
> > >> +	mode->height_mm =3D ctx->height_mm;
> > >> +	connector->display_info.width_mm =3D mode->width_mm;
> > >> +	connector->display_info.height_mm =3D mode->height_mm;
> > >> +
> > >> +	mode->type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> > >> +	mode->private =3D (void *)&ctx->cpu_timings;
> > >=20
> > > Wouldn't it make sense to create a new get_interface_params (or simil=
ar)
> > > operation for drm_panel to query interface configuration parameters
> > > instead of shoving it in the mode private field ?
> >=20
> > You mean "new get_interface_params operation" is different from
> > get_modes() ?
> >=20
> > Till now, struct drm_display_mode and most of mode relevant APIs are
> > only for video interface.
> > And CPU interface also needs video mode configurations.
> >=20
> > I have a plan to implement the CPU interface relevant APIs like video
> > mode ones, but I think they should be used under current DRM mode APIs
> > like fill_modes, get_modes and so on.
> > So after that implementation, this private field will be replaced by
> > new ones.
> >=20
> > Could you explain it in more detail?
>=20
> The idea is that the interface parameters (RD/WR signals timings in this =
case,=20
> but this could also include MIPI DSI lane configuration or any other kind=
 of=20
> physical interface parameters) are distinct from the video modes.

We already have the lanes field in struct mipi_dsi_device. I think in
general I'd prefer to not spread these parameters around too wildly. If
this is a general requirement for DBI devices, perhaps what we need is
struct mipi_dbi_device?

Thierry

--17pEHd4RhPHOinZp
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTXsdbAAoJEN0jrNd/PrOhSN0P/RdX1dWnsCs++zZTdhJca0YS
/gQ6WL8ecj6BY2QwkCTfmYc1NQJGrYRaOlUtBQmmAQAsVW6JkxAHKg+7bcU07ptR
mcIjkQiNIGBJrCQgi2sM8N3nnSWqyJky4N2ZaPZpGdPxzAAx0CP4eCOgi/Yp8xR5
pTqagAl2/nmDmTUSrab/YaGiI/lHDOJSUXY+Z8DMF0oLsARtexoYH0u5LjIj7jwn
3e7WOsPW/MARz7OiR1n/M/+ENGS5J+xUm5BdC6ps34uzgMcK7mqwg4WiwI+buuhs
NlMBfs9oeqEye4JvQQNhjJjNyL0CeofmPg6xqyy7dM/6Me0JddRSlRrnQdZvCYCS
ZHyE2J/Pm+6nsfjhqn3zj6fN5OtrjGCfmCtYT5aXbeBdZWh3V937F+qSElpJ5gT6
Xpsp9SM5VTHLpb2w8+i2csa2QoLXA7kae8lECaaYFFCTbPHpzUBwnaO/gqZ6W/Q1
Sjp05X1gTFjUjMt4MGqBf+r+0lBLcK2dQwPpmjpQPFHMu37/MhA4tsBrJ29V8NET
ZHu4ahBkZZvpxfKuzhl3kKnmhRmx+O9kAJND24RgK2IoJ4sBiOHeEy0NMbLdHn0N
UEEk06QNL/i7j6IXFPRuK6bz0mzur96QovVP5ODdAnm1gfDnxOa44TROmnClmW+w
rY/1J5kp2wesp67n4KSc
=bkvk
-----END PGP SIGNATURE-----

--17pEHd4RhPHOinZp--
