From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 4/9] drm/exynos: add exynos_dp_panel driver
 registration to drm driver
Date: Tue, 22 Apr 2014 10:33:12 +0200
Message-ID: <20140422083311.GC17275@ulmo>
References: <1398119958-32005-1-git-send-email-ajaykumar.rs@samsung.com>
 <1398119958-32005-5-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2124742210=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1398119958-32005-5-git-send-email-ajaykumar.rs@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, seanpaul@google.com, joshi@samsung.com, dri-devel@lists.freedesktop.org, ajaynumb@gmail.com, prashanth.g@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org


--===============2124742210==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dkEUBIird37B8yKS"
Content-Disposition: inline


--dkEUBIird37B8yKS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2014 at 04:09:13AM +0530, Ajay Kumar wrote:
> Register exynos_dp_panel before the list of exynos crtcs and
> connectors are probed.
>=20
> This is needed because exynos_dp_panel should be registered to
> the drm_panel list via panel-exynos-dp probe, i.e much before
> exynos_dp_bind calls of_drm_find_panel().
>=20
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
> Changes since V1:
> 	Added platform_driver_unregister(&exynos_dp_panel_driver) to
> 	exynos_drm_platform_remove as per Jingoo Han's correction
>=20
>  drivers/gpu/drm/exynos/exynos_drm_drv.c |   15 +++++++++++++++
>  drivers/gpu/drm/exynos/exynos_drm_drv.h |    1 +
>  2 files changed, 16 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_drv.c
> index 1d653f8..2db7f67 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -530,12 +530,23 @@ static int exynos_drm_platform_probe(struct platfor=
m_device *pdev)
>  		goto err_unregister_ipp_drv;
>  #endif
> =20
> +#ifdef CONFIG_DRM_PANEL_EXYNOS_DP
> +	ret =3D platform_driver_register(&exynos_dp_panel_driver);
> +	if (ret < 0)
> +		goto err_unregister_dp_panel;
> +#endif

No, this is not how you're supposed to use DRM panel drivers. The idea
is that you write a standalone driver for a given panel.

What you do here has a number of problems. For one it's a driver that's
tightly coupled to Exynos SoCs. But if I have a different SoC that uses
the same panel I want to be able to use the same driver, and not have to
rewrite the driver for my SoC.

Another problem is that you're assuming here that the driver is built in
and it will break if you try to build either Exynos DRM or the panel
driver as a module. This is perhaps nothing you care about right now,
but eventually people will want to ship a single kernel that can run on
a number of SoCs. But if we keep adding things like this, that kernel
will keep growing in size until it no longer fits in any kind of memory.

Thierry

--dkEUBIird37B8yKS
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTVilHAAoJEN0jrNd/PrOhBSoP/iPGSZJHrAMpW0F1Dpj+wG57
1x4zMTVmdfIWwrS+IkbcGDWYOb8NFVsAxG8CtbxKBIdCGItyt1emBmx8YPMz4A/X
I4mJdJOCjmLqhiKTyzTlE73idGcukWt0cgOTS5BlwRsTL6wA6NENm7KXI+G8L7Jd
gB7ztdNgiAEWETl/BXOwgcrkJC0/X4xE5ZOaChvO56z0FZxnXWAANoliG/kKBPeF
Q+Sx1WVEz8Z4yNTPXyMUfLc4vXyPxyrJDWqhX3xrHCLA8aBVeMB1EVU6o7HCsqaX
/OYyyjEjeQX/OwcdappO9u1bP4tDK//uQYw6M7G4ZBVnp+V7m7KiuGJvI5/3YEGU
em55q3w4g+xzk2QqvZrTBTKqISnJMpL59i0ylkqE47HVsWKJZrgNVPjgsbRad4GL
xi/EcFyh252ICJ1oQactTQ/xTvmh00oPDJkuzzZQnmU2y0ySgHkBpWrV0cpvCdkn
zdUxiWuw+bHhbUPx5ULyi69oSTxDc0/e4B47od0crMjT+Xu6316txqQPSB49CpdW
wvowHDKqMbu3oWHExTsyMN6rKzpGhteA8xTBiIQSYAxSZExcJfCiQxTdWU2ML9Ay
XMpAGBuUkggqobIq5KXsBXQJpncEr9Dr/m8OrbHvH4V+/1GMX1M7PaX22rjSaEoM
9/oIrac6DSgajQdCzt3t
=c0Nh
-----END PGP SIGNATURE-----

--dkEUBIird37B8yKS--

--===============2124742210==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2124742210==--
