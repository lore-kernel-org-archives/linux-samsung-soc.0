From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v4 03/16] drm: bridge: analogix/dp: split exynos dp
 driver to bridge dir
Date: Mon, 7 Sep 2015 10:11:53 +0200
Message-ID: <20150907081152.GA19961@ulmo.nvidia.com>
References: <1441086371-24838-1-git-send-email-ykk@rock-chips.com>
 <2618155.E00Pak1qvi@phil>
 <CAL_JsqLvOOF0Wk=E1kz0rWXg0+6ay0=4OTbCpjdGCfL7_qFN8Q@mail.gmail.com>
 <3704589.SqgGPobGdG@phil>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:7164 "EHLO
	hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751676AbbIGIMF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Sep 2015 04:12:05 -0400
In-Reply-To: <3704589.SqgGPobGdG@phil>
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robherring2@gmail.com>, Yakir Yang <ykk@rock-chips.com>, Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, Joe Perches <joe@perches.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Mark Yao <mark.yao@rock-chips.com>, Russell King <rmk+kernel@arm.linux.org.uk>, Ajay kumar <ajaynumb@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Andy Yan <andy.yan@rock-chips.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>, architt@codeaurora.org, dri-devel <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-kernel@vger.kernel

--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 04, 2015 at 11:29:30PM +0200, Heiko Stuebner wrote:
> Am Freitag, 4. September 2015, 16:06:02 schrieb Rob Herring:
> > On Tue, Sep 1, 2015 at 3:46 PM, Heiko Stuebner <heiko@sntech.de> wrote:
> > > Am Dienstag, 1. September 2015, 13:49:58 schrieb Yakir Yang:
> > >> Split the dp core driver from exynos directory to bridge
> > >> directory, and rename the core driver to analogix_dp_*,
> > >> leave the platform code to analogix_dp-exynos.
> > >>=20
> > >> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
> > >=20
> > > [...]
> > >=20
> > >> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c
> > >> b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c similarity inde=
x 50%
> > >> rename from drivers/gpu/drm/exynos/exynos_dp_core.c
> > >> rename to drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > >> index bed0252..7d62f22 100644
> > >> --- a/drivers/gpu/drm/exynos/exynos_dp_core.c
> > >> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > >=20
> > > [...]
> > >=20
> > >>       connector->polled =3D DRM_CONNECTOR_POLL_HPD;
> > >>      =20
> > >>       ret =3D drm_connector_init(dp->drm_dev, connector,
> > >>=20
> > >> -                              &exynos_dp_connector_funcs,
> > >> +                              &analogix_dp_connector_funcs,
> > >>=20
> > >>                                DRM_MODE_CONNECTOR_eDP);
> > >>      =20
> > >>       if (ret) {
> > >>      =20
> > >>               DRM_ERROR("Failed to initialize connector with drm\n");
> > >>               return ret;
> > >>      =20
> > >>       }
> > >>=20
> > >> -     drm_connector_helper_add(connector,
> > >> &exynos_dp_connector_helper_funcs); +   =20
> > >> drm_connector_helper_add(connector,
> > >> +                              &analogix_dp_connector_helper_funcs);
> > >>=20
> > >>       drm_connector_register(connector);
> > >=20
> > > this should only run on exynos, as we're doing all our connector
> > > registration in the core driver after all components are bound, so I
> > > guess something like>=20
> > > the following is needed:
> > >        if (dp->plat_data && dp->plat_data->dev_type =3D=3D EXYNOS_DP)
> > >       =20
> > >                drm_connector_register(connector);
> >=20
> > Yuck!
> >=20
> > Surely there is a better way. From what I've seen of DRM, I have no
> > doubt this is needed, but really a better solution is needed. Surely
> > there can be a more generic way for the driver to determine if it
> > should handle the connector or not. This seems like a common problem
> > including one I have seen. What I'm working on has onchip DSI encoder
> > -> ADV7533 -> HDMI. The DSI encoder can also have a direct attached
> > panel. So I have to check for a bridge in the encoder driver and only
> > register the connector for the panel if a bridge is not attached.
>=20
> I'm also only a part-time drm meddler, so things may be inaccurate.
>=20
> This conditional is not meant to prevent the registration of the dp conne=
ctor,=20
> only delay it for non-exynos drms. The connector registration does publis=
h it=20
> to userspace, so like i.MX we're doing that for all connectors at the sam=
e=20
> time after all components are bound - to also make x11 happy. Exynos on t=
he=20
> other hand seems to register its connectors individually and I'm not sure=
 if=20
> they would be willing to change that.
>=20
> see d3007dabeff4 ("drm/rockchip: register all connectors after bind") or=
=20
> simply rockchip_drm_drv.c line 178.
>=20
> and e355e7dd607b ("imx-drm: delay publishing sysfs connector entries")

There really shouldn't be a reason for both drivers to behave
differently in this case. Gustavo has done a lot of work on cleaning up
the Exynos driver lately, so perhaps you should sync up with him to see
if this is something that he can integrate with his changes.

If you can't reach an agreement and Exynos must keep the exact behaviour
as it has now, then perhaps a better option would be to have the
Analogix core driver not register the connector but rather leave that up
to users of the helpers. Then you don't have to clutter the core driver
with this type of platform-specific data.

Thierry

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJV7UbFAAoJEN0jrNd/PrOhhQEP/jHH4mCsHQhN5TM93ToODSaX
PPIfSGotJwJRb4aerJlBmOJe/TttR3E0gN5C+c7YwTMcUJzAz7I/ORMJtfKrkqiF
3n0EnWu/ni0FQoZWInV5+vwnRWaChZ1/yGlTmQSd8APlxQdojvOSjkMFG6EVWU8t
0A1xPjetuUwkdHP3T2RRAkPHt6KDgc/EF0z71kDgs7vOkF4hhEqNCXk8k+NSEYpr
wh/RUU70Us+MzsoQMypnOBredfsjrKoJXI/iEBVVzBbtg5//GQqNPDuG8eFzKrZy
Xv0pxG8PCmVmZX+dDT73Foh3m7h2/zqzOFaXqXjx9101ZgldlfgFCTYE1Mybtfo7
f6rS4cE4n2JsebYSa5sR5i5nlIkLF2v2GtfQpT9EWn1pKlTq6PIvBhGfUtFTWsYZ
Wu8mYK/88PYtgOj64OV8KuylZrGFVoT6H/BZPlEmvea56Pyw3yAxcDOS40GaQFTi
J2OWghSDhdWa3C6q333ZOILtG61Ik1PaDvynEQF51thkh/6L+8wlmh2pWLSWAT0E
PtQJbX6AnuOS7LWDTOWMEMK/0UJsLZ2fc/kg8A7YXizqQJZO1uxOI8VqO2wJPX/Y
jh8lc2ad0ztXqCd0v0pS7su4RYaxjomT3YLxIhUkFz4zZUpiZG9EjqLYCtJUYEqM
kyHGsK+eVeiLZw/ukWae
=a4je
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--
