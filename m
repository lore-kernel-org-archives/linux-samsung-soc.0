From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V6 3/8] drm/panel: simple: Add support for auo_b133htn01
 panel
Date: Wed, 30 Jul 2014 12:51:33 +0200
Message-ID: <20140730105132.GF29590@ulmo>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
 <1406316130-4744-4-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1297295985=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1406316130-4744-4-git-send-email-ajaykumar.rs@samsung.com>
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


--===============1297295985==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3oCie2+XPXTnK5a5"
Content-Disposition: inline


--3oCie2+XPXTnK5a5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 26, 2014 at 12:52:05AM +0530, Ajay Kumar wrote:
> Add panel_desc structure for auo_b133htn01 eDP panel.
>=20
> Also, modify the panel_simple routines to support timing_parameter
> delays if mentioned in the panel_desc structure.
>=20
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
>  .../devicetree/bindings/panel/auo,b133htn01.txt    |    7 +++
>  drivers/gpu/drm/panel/panel-simple.c               |   47 ++++++++++++++=
++++++
>  2 files changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/panel/auo,b133htn01=
=2Etxt

I think this should be two patches, one which adds the delay parameters
and another which adds support for the new panel.

> diff --git a/Documentation/devicetree/bindings/panel/auo,b133htn01.txt b/=
Documentation/devicetree/bindings/panel/auo,b133htn01.txt
> new file mode 100644
> index 0000000..302226b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/panel/auo,b133htn01.txt
> @@ -0,0 +1,7 @@
> +AU Optronics Corporation 13.3" FHD (1920x1080) color TFT-LCD panel
> +
> +Required properties:
> +- compatible: should be "auo,b133htn01"
> +
> +This binding is compatible with the simple-panel binding, which is speci=
fied
> +in simple-panel.txt in this directory.
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel=
/panel-simple.c
> index fb0cfe2..cbbb1b8 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -41,6 +41,13 @@ struct panel_desc {
>  		unsigned int width;
>  		unsigned int height;
>  	} size;
> +
> +	struct {
> +		unsigned int prepare_stage_delay;
> +		unsigned int enable_stage_delay;
> +		unsigned int disable_stage_delay;
> +		unsigned int unprepare_stage_delay;
> +	} timing_parameter;

These are overly long in my opinion, how about:

	struct {
		unsigned int prepare;
		unsigned int enable;
		unsigned int disable;
		unsigned int unprepare;
	} delay;

? Oh, and this should probably mention that it's in milliseconds. On
that note, do you think we'll ever need microsecond resolution? I don't
think I've ever seen a panel datasheet mentioning that kind of
granularity.

>  struct panel_simple {
> @@ -105,6 +112,8 @@ static int panel_simple_unprepare(struct drm_panel *p=
anel)
>  		gpiod_set_value_cansleep(p->enable_gpio, 0);
> =20
>  	regulator_disable(p->supply);
> +	if (p->desc)

Should have a blank line between "regulator_disable(...)" and "if ...".
Also it's not useful to check for p->desc, really, since it's a bug if
that is NULL.

However I think it would be good to check for the delay being set, like
so:

	if (p->desc->delay.unprepare)
		msleep(p->desc->delay.unprepare);

I'm not sure about the placement of the delay here, see below for more.

> @@ -142,6 +154,9 @@ static int panel_simple_prepare(struct drm_panel *pan=
el)
>  		return err;
>  	}
> =20
> +	if (p->desc)
> +		msleep(p->desc->timing_parameter.prepare_stage_delay);
> +
>  	if (p->enable_gpio)
>  		gpiod_set_value_cansleep(p->enable_gpio, 1);

Should the delay not be *after* all steps in prepare have been
performed? That way drivers can use it to specify the time that a panel
needs to "internally" become ready after they've been power up (for
example).

> =20
> @@ -157,6 +172,8 @@ static int panel_simple_enable(struct drm_panel *pane=
l)
>  	if (p->backlight_enabled)
>  		return 0;
> =20
> +	if (p->desc)
> +		msleep(p->desc->timing_parameter.enable_stage_delay);
>  	if (p->backlight) {
>  		p->backlight->props.power =3D FB_BLANK_UNBLANK;
>  		backlight_update_status(p->backlight);

I think here the delay makes sense where it is because it allows the
panel driver to wait for a given amount of time (after video data has
been sent by the display controller) until the first "good" frame is
visible.

In general I think it would be good to have a description of these in
the struct panel_desc structure, something like this perhaps:

	/**
	 * @prepare: the time (in milliseconds) that it takes for the panel
	 *           to become ready and start receiving video data
	 * @enable: the time (in milliseconds) that it takes for the panel
	 *          to display the first valid frame after starting to
	 *          receive video data
	 * @disable: the time (in milliseconds) that it takes for the panel
	 *           to turn the display off (no content is visible)
	 * @unprepare: ???
	 */
	struct {
		unsigned int prepare;
		unsigned int enable;
		unsigned int disable;
		unsigned int unprepare;
	} delay;

For prepare and enable delays this would mean that they should take
effect at the very end of the .prepare() and .enable() functions,
respectively. For disable in means that it should be at the end (for
example to take into account the time it takes for backlight to
completely turn off). For unprepare I have no idea what we would need it
for. And the new panel that you're adding in this patch doesn't use it
either, so perhaps it can just be left out (for now)?

> +static const struct panel_desc auo_b133htn01 =3D {
> +	.modes =3D &auo_b133htn01_mode,
> +	.num_modes =3D 1,
> +	.size =3D {
> +		.width =3D 293,
> +		.height =3D 165,
> +	},
> +	.timing_parameter =3D {
> +		.prepare_stage_delay =3D 105,
> +		.enable_stage_delay =3D 20,
> +		.prepare_stage_delay =3D 50,

I take it that this last one was supposed to be .enable_stage_delay
since you've already set up .prepare_stage_delay.

Thierry

--3oCie2+XPXTnK5a5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT2M40AAoJEN0jrNd/PrOhPF0P+gLMQQ+liga89h/ftogsxuzX
LeKQJIfMlOlHif8+haO5LRaQI6z0JAWQaIhqHMPCZdHi4ML+6oTRUV9OxTdHBsOz
P6eh1JvqL3EKNNcOD1ColSvZxMyXVoTsqSOd0OwbmAm0nRTysaMDwSIFWd6qSwUs
Ea1Y6yax+Wdn4mugXEx+Wc6ITQKXO29gzDgy4+Kfy7PvyD2rclbgn3izzGoI7FZ1
MtF4LTR3cxjsy6xYm9+l0K+RniWVIXK3PvDlAkRA+5CaeN52ggtL9YOw69QW6PpQ
z3YOiNRu8yDcttxXLk7iiWSrCYgaSdBGRQiFXaF9AfPsBi0MStodArm0d7BF2whO
BHeg7INrX7gGBodPSwwVY4IM7VMewU7TbIs1O+B7eKLUEKw0jxmrGUknUi0VR9Es
WeXQPst3Hk+4USrtDvMBYm6Wf4KQ8ovOxC+6/aIGm1nXuBb5Gdl2bubAkPuP+0Eg
GJYzOdwbahCz0CzRhAyVMsUjHbKW35TppBfNmFLRRtNWfDDhjk4tRiArfEntj2ig
G6tSW5jAk+qKJgTo/BIfYSFs4CxFzEfo07t0ZCIcIGrWu0jUwqzAmd8Wf8+GPhv9
No5yRAzAoEE+ytEupNQk3mL7WBM36CywaNTyW2dT2xljd2oYJONR7R5RcXmib4zU
izkuFWBR7/tIBGUu3lYt
=Txx2
-----END PGP SIGNATURE-----

--3oCie2+XPXTnK5a5--

--===============1297295985==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1297295985==--
