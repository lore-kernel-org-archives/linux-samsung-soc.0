From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v14.1 01/17] drm: bridge: analogix/dp: split exynos dp
 driver to bridge directory
Date: Wed, 8 Jun 2016 08:44:19 +0100
Message-ID: <20160608084419.602f02d2@arm.com>
References: <1455534485-1154-1-git-send-email-ykk@rock-chips.com>
	<1455534576-1486-1-git-send-email-ykk@rock-chips.com>
	<1811552.qvsCm7GUs1@diego>
	<417ed48e-74e1-f747-34b9-0d1031a3d862@osg.samsung.com>
	<575774C0.4000900@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <575774C0.4000900-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Gustavo Padovan <gustavo.padovan-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, 8 Jun 2016 09:28:32 +0800
Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:

> Hi Javier,
>=20
> On 06/08/2016 01:06 AM, Javier Martinez Canillas wrote:
> > Hello Yakir,
> >
> > On 03/17/2016 05:47 PM, Heiko St=FCbner wrote: =20
> >> Split the dp core driver from exynos directory to bridge directory=
,
> >> and rename the core driver to analogix_dp_*, rename the platform
> >> code to exynos_dp.
> >>
> >> Beside the new analogix_dp driver would export six hooks.
> >> "analogix_dp_bind()" and "analogix_dp_unbind()"
> >> "analogix_dp_suspned()" and "analogix_dp_resume()"
> >> "analogix_dp_detect()" and "analogix_dp_get_modes()"
> >>
> >> The bind/unbind symbols is used for analogix platform driver to co=
nnect
> >> with analogix_dp core driver. And the detect/get_modes is used for=
 analogix
> >> platform driver to init the connector.
> >>
> >> They reason why connector need register in helper driver is rockch=
ip drm
> >> haven't implement the atomic API, but Exynos drm have implement it=
, so
> >> there would need two different connector helper functions, that's =
why we
> >> leave the connector register in helper driver.
> >>
> >> Signed-off-by: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> >> --- =20
> > Marc reported that his Exynos5250 Snow Chromebook fails to boot wit=
h v4.7-rc.
> >
> > I've done a git bisect and tracked down to this commit. The problem=
 is a NULL
> > pointer dereference to connector->dev in drm_mode_create(connector-=
>dev) when
> > called from exynos_dp_get_modes(). The error log is at [1].
> >
> > I'm trying to figure out the issue but wanted to mention in case yo=
u have any
> > hints about what could be the cause. AFAICT the problem is related =
to the fact
> > that drm_connector_init() is called in analogix_dp_bridge_attach() =
and the
> > connector passed as argument is the one in struct analogix_dp_devic=
e *dp, but
> > later exynos_dp_get_modes() calls drm_mode_create() passing the con=
nector in
> > struct exynos_dp_device *dp, which has not been previously initiali=
zed. =20
>=20
> Agree, this should be the problem, exynos_dp->connector haven't been
> initialized, driver should make exynos_dp->dp to a connector point, a=
nd
> record the passing connector in exynos_dp_bridge_attach(), that shoul=
d
> fix this problem.
>=20
>=20
> Thanks,
> - Yakir
>=20
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_dp.c=20
> b/drivers/gpu/drm/exynos/exynos_dp.c
> index 468498e..4c1fb3f 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp.c
> @@ -34,7 +34,7 @@
>=20
>   struct exynos_dp_device {
>          struct drm_encoder         encoder;
> -       struct drm_connector       connector;
> +       struct drm_connector       *connector;
>          struct drm_bridge          *ptn_bridge;
>          struct drm_device          *drm_dev;
>          struct device              *dev;
> @@ -70,7 +70,7 @@ static int exynos_dp_poweroff(struct=20
> analogix_dp_plat_data *plat_data)
>   static int exynos_dp_get_modes(struct analogix_dp_plat_data *plat_d=
ata)
>   {
>          struct exynos_dp_device *dp =3D to_dp(plat_data);
> -       struct drm_connector *connector =3D &dp->connector;
> +       struct drm_connector *connector =3D dp->connector;
>          struct drm_display_mode *mode;
>          int num_modes =3D 0;
>=20
> @@ -103,6 +103,7 @@ static int exynos_dp_bridge_attach(struct=20
> analogix_dp_plat_data *plat_data,
>          int ret;
>=20
>          drm_connector_register(connector);
> +       dp->connector =3D connector;
>=20
>          /* Pre-empt DP connector creation if there's a bridge */
>          if (dp->ptn_bridge) {
>=20

I've just tested this change, and in combination with Javier's DT patch=
,
my Snow is back to its useful state (I'm writing this email from that
very Chromebook).

Once you make this a proper patch, please add my:

Tested-by: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>

to it.

Thanks a lot to you and Javier for tracking this down!

	M.
--=20
Jazz is not dead. It just smells funny.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
