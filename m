From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 14/15] drm/exynos: Move DP setup into commit()
Date: Fri, 1 Aug 2014 11:18:35 +0200
Message-ID: <20140801091834.GE21724@ulmo>
References: <1406828534-10072-1-git-send-email-ajaykumar.rs@samsung.com>
 <1406828534-10072-15-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1562342365=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1406828534-10072-15-git-send-email-ajaykumar.rs@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ajay Kumar <ajaykumar.rs@samsung.com>, Sean Paul <seanpaul@chromium.org>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, joshi@samsung.com, dri-devel@lists.freedesktop.org, ajaynumb@gmail.com, prashanth.g@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org


--===============1562342365==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LSp5EJdfMPwZcMS1"
Content-Disposition: inline


--LSp5EJdfMPwZcMS1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2014 at 11:12:13PM +0530, Ajay Kumar wrote:
> Add commit callback for exynos_dp, and move the DP link training,
> video configuration code from the hotplug handler into commit().
>=20
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_dp_core.c |   24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)

This is not related to the other patches in the series, so it can be
applied independently.

Sean, this looks like a back-/forward-port of the patch you linked to in
reply to an earlier version of the series, does this still correspond to
what you think it should be doing? (hence not trimming the quote)

Thierry

> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/ex=
ynos/exynos_dp_core.c
> index 31c3de9..347dec9 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp_core.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
> @@ -875,10 +875,18 @@ static irqreturn_t exynos_dp_irq_handler(int irq, v=
oid *arg)
>  static void exynos_dp_hotplug(struct work_struct *work)
>  {
>  	struct exynos_dp_device *dp;
> -	int ret;
> =20
>  	dp =3D container_of(work, struct exynos_dp_device, hotplug_work);
> =20
> +	if (dp->drm_dev)
> +		drm_helper_hpd_irq_event(dp->drm_dev);
> +}
> +
> +static void exynos_dp_commit(struct exynos_drm_display *display)
> +{
> +	struct exynos_dp_device *dp =3D display->ctx;
> +	int ret;
> +
>  	ret =3D exynos_dp_detect_hpd(dp);
>  	if (ret) {
>  		/* Cable has been disconnected, we're done */
> @@ -1050,8 +1058,10 @@ static void exynos_dp_phy_exit(struct exynos_dp_de=
vice *dp)
>  	}
>  }
> =20
> -static void exynos_dp_poweron(struct exynos_dp_device *dp)
> +static void exynos_dp_poweron(struct exynos_drm_display *display)
>  {
> +	struct exynos_dp_device *dp =3D display->ctx;
> +
>  	if (dp->dpms_mode =3D=3D DRM_MODE_DPMS_ON)
>  		return;
> =20
> @@ -1059,10 +1069,13 @@ static void exynos_dp_poweron(struct exynos_dp_de=
vice *dp)
>  	exynos_dp_phy_init(dp);
>  	exynos_dp_init_dp(dp);
>  	enable_irq(dp->irq);
> +	exynos_dp_commit(display);
>  }
> =20
> -static void exynos_dp_poweroff(struct exynos_dp_device *dp)
> +static void exynos_dp_poweroff(struct exynos_drm_display *display)
>  {
> +	struct exynos_dp_device *dp =3D display->ctx;
> +
>  	if (dp->dpms_mode !=3D DRM_MODE_DPMS_ON)
>  		return;
> =20
> @@ -1078,12 +1091,12 @@ static void exynos_dp_dpms(struct exynos_drm_disp=
lay *display, int mode)
> =20
>  	switch (mode) {
>  	case DRM_MODE_DPMS_ON:
> -		exynos_dp_poweron(dp);
> +		exynos_dp_poweron(display);
>  		break;
>  	case DRM_MODE_DPMS_STANDBY:
>  	case DRM_MODE_DPMS_SUSPEND:
>  	case DRM_MODE_DPMS_OFF:
> -		exynos_dp_poweroff(dp);
> +		exynos_dp_poweroff(display);
>  		break;
>  	default:
>  		break;
> @@ -1094,6 +1107,7 @@ static void exynos_dp_dpms(struct exynos_drm_displa=
y *display, int mode)
>  static struct exynos_drm_display_ops exynos_dp_display_ops =3D {
>  	.create_connector =3D exynos_dp_create_connector,
>  	.dpms =3D exynos_dp_dpms,
> +	.commit =3D exynos_dp_commit,
>  };
> =20
>  static struct exynos_drm_display exynos_dp_display =3D {
> --=20
> 1.7.9.5
>=20

--LSp5EJdfMPwZcMS1
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT21tqAAoJEN0jrNd/PrOh+FsP/2vVypmqRyvWcls5tYDqL3zS
AafTIRESikD/e3IGEuML9TatlKfBDm9+RZOdJpSQ9knGTw+YWygCdZBoVP3DDW5B
Qh9iXYVV+kMdJy3SNoug++Tto8chB+hgxhZ9LbIBsMjAkbPYEa/Bd1hcMuqXGd4T
FSu0pB1+LTTiLmNS701bZxM8uI7dms45z8hPe0vKVlV6QTacUrL3U/epjxaAHEKT
CyTDlUmbTtaAeji8db5rVkAmkCqjn3rzgZ8AOjIcNghFV3Wbewy268LblMUbvZ7j
u+6zxAgsZSgegTPRofFsRViJL0H3wUBIi/NstgIC4hebAs2YRIP3diVfp9VI9a6e
qa46lqb/XJ6t5vlSumeCVjiiMcyvGhL+5kfKZDxCkDl8wuoMf0jMpsINc6LgM8na
PfwjNNBqARkpfmEoJ6h0GggL6BdkG6ZtVXi2QqFlKeyvhLIXt0ai2WBHqD1nyDdJ
8gTVKPwiyn7U2mXwf7kp5BzG+SXRWC0pKdZo1P6QPIninXXtA2Fzd6EN1TlFEE5W
yDWuT7ampv52CNbazqqIXbkMa0g3BPl1COrVqe/Q8PIqJvq+hch4FtB5MRyYnNxu
KaUq0l9xTyGXxFD8imlclx87CxbTSKlYH6WBxjTI3eCDN0e01cSKvjh0W/XadkwY
0YyHPkTsuYT8Ch/K4WxG
=pCOC
-----END PGP SIGNATURE-----

--LSp5EJdfMPwZcMS1--

--===============1562342365==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1562342365==--
