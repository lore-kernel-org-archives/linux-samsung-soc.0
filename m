From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v4 0/16] Add Analogix Core Display Port Driver
Date: Mon, 21 Sep 2015 13:22:48 +0200
Message-ID: <20150921112246.GD20992@ulmo.nvidia.com>
References: <1441086371-24838-1-git-send-email-ykk@rock-chips.com>
 <3233920.KG0buE86B2@phil>
 <55E65BCD.7090804@rock-chips.com>
 <55FFC3B8.9030108@rock-chips.com>
 <20150921091537.GA20992@ulmo.nvidia.com>
 <55FFDB9C.1030901@rock-chips.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zS7rBR6csb6tI2e1"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55FFDB9C.1030901@rock-chips.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, s.infradead.org@NULL.NULL, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, architt@codeaurora.org, linux-samsung-soc@vger.kernel.org, seanpaul@chromium.com, djkurtz@chromium.com, Kishon Vijay Abraham I <kishon@ti.com>, linux-rockchip@lists.infradead.org, Kukjin Kim <kgene@kernel.org>, robherring2@gmail.com, Russell King <rmk+kernel@arm.linux.org.uk>, linux-arm-kernel@list.NULL.NULL, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Inki Dae <inki.dae@samsung.com>, joe@perches.com, Rob Herring <robh+dt@kernel.org>, dianders@chromium.com, Mark Yao <mark.yao@rock-chips.com>, Jingoo Han <jingoohan1@gmail.co>
List-Id: linux-samsung-soc@vger.kernel.org

--zS7rBR6csb6tI2e1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2015 at 06:27:40PM +0800, Yakir Yang wrote:
> Hi Thierry,
>=20
> Thanks for your suggest :)
>=20
> On 09/21/2015 05:15 PM, Thierry Reding wrote:
> >On Mon, Sep 21, 2015 at 04:45:44PM +0800, Yakir Yang wrote:
> >>Hi Heiko,
> >>
> >>On 09/02/2015 10:15 AM, Yakir Yang wrote:
> >>>Hi Heiko,
> >>>
> >>>=E5=9C=A8 09/02/2015 05:47 AM, Heiko Stuebner =E5=86=99=E9=81=93:
> >>>>Hi Yakir,
> >>>>
> >>>>Am Dienstag, 1. September 2015, 13:46:11 schrieb Yakir Yang:
> >>>>>    The Samsung Exynos eDP controller and Rockchip RK3288 eDP
> >>>>>controller
> >>>>>share the same IP, so a lot of parts can be re-used. I split the com=
mon
> >>>>>code into bridge directory, then rk3288 and exynos only need to keep
> >>>>>some platform code. Cause I can't find the exact IP name of exynos dp
> >>>>>controller, so I decide to name dp core driver with "analogix" which=
 I
> >>>>>find in rk3288 eDP TRM ;)
> >>>>>
> >>>>>Beyond that, there are three light registers setting differents bewt=
een
> >>>>>exynos and rk3288.
> >>>>>1. RK3288 have five special pll resigters which not indicata in exyn=
os
> >>>>>    dp controller.
> >>>>>2. The address of DP_PHY_PD(dp phy power manager register) are
> >>>>>different
> >>>>>    between rk3288 and exynos.
> >>>>>3. Rk3288 and exynos have different setting with AUX_HW_RETRY_CTL(dp
> >>>>>debug
> >>>>>    register).
> >>>>>
> >>>>>I have verified this series on two kinds of rockchip platform board,
> >>>>>one
> >>>>>is rk3288 sdk board which connect with a 2K display port monitor, the
> >>>>>other
> >>>>>is google jerry chromebook which connect with a eDP screen
> >>>>>"cnm,n116bgeea2",
> >>>>>both of them works rightlly.
> >>>>it looks like during the rebase something did go wrong and I found so=
me
> >>>>issues
> >>>>I mentioned in the replies to individual patches.
> >>>>
> >>>>I did prepare a branch based on mainline [0] with both the old and the
> >>>>new edp
> >>>>driver - rk3288_veyron_defconfig build both drivers into the image.
> >>>>
> >>>>While the old driver still works, I wasn't able to make the new one w=
ork
> >>>>yet
> >>>>... the drm core does find the connector, but not that anything is
> >>>>connected
> >>>>to it. I'll try to dig deeper tomorrow, but maybe you'll see anything
> >>>>interesting before then.
> >>>Many thanks for your comment and debug, I would rebase on your
> >>>"edp-with-veyron" branch and fix the broken, make sure v6 would
> >>>work rightly at least in your side and my side.
> >>Just like we talk off line, I guess there are two tricky questions which
> >>make analogix_dp just crash/failed on rockchip platform:
> >>
> >>-  One is how to reach a agreement with the common way to register
> >>connector. There would be a conflict with Exynos & IMX & Rockchip.
> >>      On analogix_dp thread, Exynos want to register connector when that
> >>connector is ready.
> >>      On dw_hdmi thread, IMX want to register connector when all compon=
ent is
> >>already.
> >>      So Exynos & IMX & Rockchip should reach a common way to register
> >>connector to fix this issue.
> >>
> >>-  The other is atomic API.
> >>       The rockchip drm haven't implemented the atomic API, but the ori=
ginal
> >>exynos_dp have used the atomic API on connector helper function. That's=
 why
> >>analogix_dp just keep crash on your side.
> >There's really no reason not to convert Rockchip to atomic. It will have
> >to happen eventually anyway.
>=20
> Do agree on this point, and I see Tomasz Figa have done some WIP
> works on implementing the atomic_commit, maybe would upstream
> in further.(https://chromium-review.googlesource.com/#/c/284560/1)
>=20
>=20
> >That said, there's another option that would allow you to side-step both
> >of the above problems at the same time. If you turn the common code into
> >a helper library that should give you enough flexibility to integrate it
> >into all existing users. For example you could leave out the connector
> >registration and let the drivers do that. Similarly since the helpers
> >are only hooked up at registration time you could probably find a way to
> >share the low-level code but again leave it up to the drivers to glue it
> >all together at registration time (drivers could wrap the low-level code
> >with atomic or non-atomic callbacks).
>=20
> Wow, sounds good, but I'm not sure I understand this rightly. Do you
> mean that I could support two kinds of callbacks in analogix_dp_core
> driver, and export them out. And move the connector registration code
> into the helper driver (like exynos_dp.c), so helper driver could chose to
> use the atomic or non-atomic callbacks. like:
>=20
> -- analogix_dp_core.c
> --------------------------------------------------------------------
> ...
> struct drm_connector_funcs analogix_dp_connector_atomic_funcs =3D {
>         .dpms =3D drm_atomic_helper_connector_dpms,
>         .fill_modes =3D drm_helper_probe_single_connector_modes,
>         .detect =3D analogix_dp_detect,
>         .destroy =3D analogix_dp_connector_destroy,
>         .reset =3D drm_atomic_helper_connector_reset,
>         .atomic_duplicate_state =3D
> drm_atomic_helper_connector_duplicate_state,
>         .atomic_destroy_state =3D drm_atomic_helper_connector_destroy_sta=
te,
> };
> EXPORT_SYMBOL(analogix_dp_connector_atomic_funcs);
>=20
> struct drm_connector_funcs analogix_dp_connector_funcs =3D {
>         .dpms =3D drm_helper_connector_dpms,
>         .fill_modes =3D drm_helper_probe_single_connector_modes,
>         .detect =3D analogix_dp_detect,
>         .destroy =3D analogix_dp_connector_destroy,
> };
> EXPORT_SYMBOL(analogix_dp_connector_funcs);
>=20
> struct drm_connector_helper_funcs analogix_dp_connector_helper_funcs =3D {
>         .get_modes =3D analogix_dp_get_modes,
>         .best_encoder =3D analogix_dp_best_encoder,
> };
> EXPORT_SYMBOL(analogix_dp_connector_helper_funcs);
> ...
>=20
> -- exynos_dp
> -------------------------------------------------------------------------=
---
>         ret =3D drm_connector_init(dp->drm_dev, connector,
> &analogix_dp_connector_atomic_funcs,
>                                  DRM_MODE_CONNECTOR_eDP);
>         if (ret) {
>                 DRM_ERROR("Failed to initialize connector with drm\n");
>                 return ret;
>         }
>=20
>         drm_connector_helper_add(connector,
> &analogix_dp_connector_helper_funcs);
>         drm_connector_register(connector);
>         drm_mode_connector_attach_encoder(connector, encoder);
>=20
> -- analogix_dp-rockchip
> -------------------------------------------------------------------------=
---
>         ret =3D drm_connector_init(dp->drm_dev, connector,
>                                  &analogix_dp_connector_funcs,
>                                  DRM_MODE_CONNECTOR_eDP);
>         if (ret) {
>                 DRM_ERROR("Failed to initialize connector with drm\n");
>                 return ret;
>         }
>=20
>         drm_connector_helper_add(connector,
> &analogix_dp_connector_helper_funcs);
>         drm_mode_connector_attach_encoder(connector, encoder);
>=20
>=20
> Are those code corresponding to your suggestion.   :)

Yes, that looks about right. You could also move the implementations
into the Exynos and Rockchip drivers, respectively, if they're only used
=66rom one place. Then you can simply export the low-level analogix_dp_*()
functions. That might give you even more flexibility, but the above
would probably work well enough.

Thierry

--zS7rBR6csb6tI2e1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJV/+iEAAoJEN0jrNd/PrOh5iQQAJgK23Lm4fl6HeUVSuW2bVuO
i46+gOj6TlaZHilL57ZOx+3BLU+j2hPxnQVV4RDhKth/mj57wbb1gmi+r0sztt6x
mP9veq++7zNtmP5r8ls82f1pw8L13DDy23sv88Lu4KE/GbRtr/a9xdwMJ4SRGOj8
8Y7xa04UUHKFpX0C+o+A41n8LfaO7MDC/TWSeqMB2IMwGLsi4/OII3OW3bQB4qlR
u3PU0M9ZIUie3kRX54T8U1p5mKbuweb9PwbkAD+eScMznsPeE3lXU175GGCAAL8b
L2PmSML6+HqEIRAiDDCFYO0ByEBE9WAQiWEOI83+dfI5BYtlMpzYiKDQIDsn7jRE
Lc/kLkS6yGIQCx3x/u22On/1kTDRK0Q9hrnPZndTHm0o+KBmID+H3dgTlnpMAzi9
Wp+QyA7de6rH++5MmAjj43HDNshRczcIEbZsQWB3KGptWAEXr9zsa9whRDvuIkmo
BBet/D1lB0mjTgcty97HsT019oNyEaUFr8NMOsuDLi3W0tAC1I9fRAL1Rc0vbv1E
idXSZU9zocONGVEr/O8D6ekxayWwsaC/gLd2DuFpq/DxUfsNAmDicrMNbB5J76je
/EnvDdAU0i64PFShE2PTeLv+Yq/OhxkYE4G3pThwfC+M5EBtMFpoPoxlaAKYdvo4
uVKMlZ8P98O2YY7NVY22
=QgKz
-----END PGP SIGNATURE-----

--zS7rBR6csb6tI2e1--
