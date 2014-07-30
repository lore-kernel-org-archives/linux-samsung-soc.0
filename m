From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V6 2/8] drm/panel: Add support for prepare and unprepare
 routines
Date: Wed, 30 Jul 2014 12:32:41 +0200
Message-ID: <20140730103239.GE29590@ulmo>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
 <1406316130-4744-3-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1681772098=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1406316130-4744-3-git-send-email-ajaykumar.rs@samsung.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, seanpaul@google.com, daniel.vetter@ffwll.ch, joshi@samsung.com, dri-devel@lists.freedesktop.org, ajaynumb@gmail.com, prashanth.g@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org


--===============1681772098==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0QFb0wBpEddLcDHQ"
Content-Disposition: inline


--0QFb0wBpEddLcDHQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 26, 2014 at 12:52:04AM +0530, Ajay Kumar wrote:
> Now that we have 2 new callbacks(prepare and unprepare) for drm_panel,
> make changes in all the drm drivers which use the drm_panel framework
> to support the new callbacks.
>=20
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_dpi.c |    8 +++--
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c |    7 +++++
>  drivers/gpu/drm/panel/panel-ld9040.c    |   18 +++++++++--
>  drivers/gpu/drm/panel/panel-s6e8aa0.c   |   18 +++++++++--
>  drivers/gpu/drm/panel/panel-simple.c    |   51 ++++++++++++++++++++++++-=
------
>  drivers/gpu/drm/tegra/output.c          |    2 ++
>  6 files changed, 85 insertions(+), 19 deletions(-)

I'd prefer for this to be split up into patches per panel and per
display driver. The reason is that if this patch is merged as-is, then
if it's ever determined to cause a regression it'll be difficult to find
out which change exactly caused this.

But to not break bisectability you'll need to be careful in how you
break up the patches. I think the following should work:

	- for each panel driver, implement dummy .prepare() and
	  .unprepare() that return 0
	- for each display driver, make use of drm_panel_prepare() and
	  drm_panel_unprepare()
	- for each panel driver, properly implement .prepare() and
	  .unprepare() (presumably by moving code out of .enable() and
	  .disable(), respectively)

I have a couple more comments below about the ordering of the .prepare()
vs. .enable() and .disable() vs. .unprepare() calls.

> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_dsi.c
> index 5e78d45..2f58e45 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -1333,6 +1333,12 @@ static int exynos_dsi_enable(struct exynos_dsi *ds=
i)
>  	if (ret < 0)
>  		return ret;
> =20
> +	ret =3D drm_panel_prepare(dsi->panel);
> +	if (ret < 0) {
> +		exynos_dsi_poweroff(dsi);
> +		return ret;
> +	}
> +
>  	ret =3D drm_panel_enable(dsi->panel);
>  	if (ret < 0) {
>  		exynos_dsi_poweroff(dsi);
> @@ -1354,6 +1360,7 @@ static void exynos_dsi_disable(struct exynos_dsi *d=
si)
> =20
>  	exynos_dsi_set_display_enable(dsi, false);
>  	drm_panel_disable(dsi->panel);
> +	drm_panel_unprepare(dsi->panel);
>  	exynos_dsi_poweroff(dsi);

I don't know Exynos very well, so this may be completely wrong, but
should disable_panel_prepare() be called much earlier than
drm_panel_enable() and drm_panel_unprepare() much later than
drm_panel_disable()? With the above the result is still the same, so
you'll get the same glitches as without their separation.

Without knowing exactly what Exynos does in the above, I'd expect the
correct sequence to be something like this:

	ret =3D exynos_dsi_power_on(dsi);
	if (ret < 0)
		return ret;

	ret =3D drm_panel_prepare(dsi->panel);
	if (ret < 0) {
		exynos_dsi_poweroff(dsi);
		return ret;
	}

	exynos_dsi_set_display_mode(dsi);
	exynos_dsi_set_display_enable(dsi, true);

	ret =3D drm_panel_enable(dsi->panel);
	if (ret < 0) {
		/* perhaps undo exynos_dsi_set_display_enable() here? */
		exynos_dsi_poweroff(dsi);
		return ret;
	}

And for disable:

	drm_panel_disable(dsi->panel);
	exynos_dsi_set_display_enable(dsi, false);
	drm_panel_unprepare(dsi->panel);
	exynos_dsi_poweroff(dsi);

Perhaps I should quote the kerneldoc that I added for drm_panel_funcs to
underline why I think this is important:

/**
 * struct drm_panel_funcs - perform operations on a given panel
 * @disable: disable panel (turn off back light, etc.)
 * @unprepare: turn off panel
 * @prepare: turn on panel and perform set up
 * @enable: enable panel (turn on back light, etc.)
 * @get_modes: add modes to the connector that the panel is attached to and
 * return the number of modes added
 *
 * The .prepare() function is typically called before the display controller
 * starts to transmit video data. Panel drivers can use this to turn the pa=
nel
 * on and wait for it to become ready. If additional configuration is requi=
red
 * (via a control bus such as I2C, SPI or DSI for example) this is a good t=
ime
 * to do that.
 *
 * After the display controller has started transmitting video data, it's s=
afe
 * to call the .enable() function. This will typically enable the backlight=
 to
 * make the image on screen visible. Some panels require a certain amount of
 * time or frames before the image is displayed. This function is responsib=
le
 * for taking this into account before enabling the backlight to avoid visu=
al
 * glitches.
 *
 * Before stopping video transmission from the display controller it can be
 * necessary to turn off the panel to avoid visual glitches. This is done in
 * the .disable() function. Analogously to .enable() this typically involves
 * turning off the backlight and waiting for some time to make sure no image
 * is visible on the panel. It is then safe for the display controller to
 * cease transmission of video data.
 *
 * To save power when no video data is transmitted, a driver can power down
 * the panel. This is the job of the .unprepare() function.
 */

As you see, .prepare() should do whatever is necessary to make the panel
accept a stream of video data, then the display driver can start sending
video data and call .enable() to make the transmitted data visible.

Analogously .disable() should turn off the display, so that the user can
no longer see what's going on, then the display controller can cease
transmission of video data (and since the panel is disabled this should
no longer cause visual glitches) and then call .unprepare() to turn the
panel off.

I know that this isn't immediately relevant just yet because currently
the backlight will already turn on by default, but like we discussed
earlier I have ideas on how to properly fix it. As a matter of fact I'll
go and send out another mail about that when I'm through this series.

>  static const struct drm_panel_funcs ld9040_drm_funcs =3D {
> +	.unprepare =3D ld9040_unprepare,
>  	.disable =3D ld9040_disable,
> +	.prepare =3D ld9040_prepare,
>  	.enable =3D ld9040_enable,
>  	.get_modes =3D ld9040_get_modes,
>  };

The patch I applied for .prepare() and .unprepare() I've reordered the
functions slightly to give a more natural sequence. .disable() is now
first, while .unprepare() is next, since that's the sequence that they
should be called in.

Patches for the panel drivers should follow this same ordering.

> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel=
/panel-simple.c
> index a251361..fb0cfe2 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -45,7 +45,8 @@ struct panel_desc {
> =20
>  struct panel_simple {
>  	struct drm_panel base;
> -	bool enabled;
> +	bool panel_enabled;
> +	bool backlight_enabled;

Perhaps this should rather be:

	bool prepared;
	bool enabled;

?

> diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/outpu=
t.c
> index 446837e..b574ee6 100644
> --- a/drivers/gpu/drm/tegra/output.c
> +++ b/drivers/gpu/drm/tegra/output.c
> @@ -139,9 +139,11 @@ static void tegra_encoder_dpms(struct drm_encoder *e=
ncoder, int mode)
> =20
>  	if (mode !=3D DRM_MODE_DPMS_ON) {
>  		drm_panel_disable(panel);
> +		drm_panel_unprepare(panel);
>  		tegra_output_disable(output);

Similarly to my comments for the Exynos drivers, this should be:

		drm_panel_disable(panel);
		tegra_output_disable(output);
		drm_panel_unprepare(panel);

>  	} else {
>  		tegra_output_enable(output);
> +		drm_panel_prepare(panel);
>  		drm_panel_enable(panel);
>  	}

and

		drm_panel_prepare(panel);
		tegra_output_enable(output);
		drm_panel_enable(panel);

Thierry

--0QFb0wBpEddLcDHQ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT2MnHAAoJEN0jrNd/PrOhVh8P/0XvgDydNkcjUieMmZe4nHaU
CW1F8J0Inm0sXUYcDCbjH30fSjl2aczG6gbx3Nbu6IWoJLIJbm76dI3YrxQIdtQi
i+Ku5VRcktWGA7VWCGHpamZ+zVEjOPXhZqUnIJfD4/c8VSpH4xUGbtwByCTyLNsi
/OCfApRYjJGg+FA32c19If5+Uk81jhTyPkxCjLrje7hYEDUgo9B5x8XcBWPfoYNh
fZR+2ymsDXBMWm9d+sJITeR6KUe79uLRnjDEaa8wKFg6vsGl97tK0jev+CqC80mJ
ynqFAvxnXHmM9Syf7bCME2bRIjcOIa/Z0bYHI0gyg6g2EWdvvrHO6QIvjgCUuXtD
2ZBCAP93AS5wWqwdHTt5U4yhIo+fkOeVjw6thzqvcDt1cRCG9AkqJ4yeqjv/VTXU
Rv6+N6824YcO5Zfr9b4EQWo+O5yo9BN0X4dglx4mw2Wfn/UbCIQSr4XMjTrjdXT8
XXOOTO58MNhTwW+7tV43rkTtZ8JrQc319GaKb/bIajc0V1bNbNx+HPlQqmckTa3s
1Ty9DHUIBLxrwV2dtmdQj5dbRhTRM98Z3ZUBE1GAGDO0JrBE4aLvTRQ5X/D3DnWo
z7mdezM6s5zqktuwPnmF4wPtLZXKDdJibj2pjDDhhRw89bU1VsI812RzcCY9040C
vHeE6RDjvFCgGkFE3Q4I
=aWn0
-----END PGP SIGNATURE-----

--0QFb0wBpEddLcDHQ--

--===============1681772098==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1681772098==--
