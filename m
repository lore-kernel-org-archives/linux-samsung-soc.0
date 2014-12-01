From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/3] drm/panel: add s6e63j0x03 LCD Panel driver
Date: Mon, 1 Dec 2014 11:43:39 +0100
Message-ID: <20141201104337.GC20174@ulmo>
References: <1417174791-7339-1-git-send-email-inki.dae@samsung.com>
 <1417174791-7339-3-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2102385953=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1417174791-7339-3-git-send-email-inki.dae@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, dri-devel@lists.freedesktop.org, a.hajda@samsung.com, robh+dt@kernel.org, galak@codeaurora.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org


--===============2102385953==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="da4uJneut+ArUgXk"
Content-Disposition: inline


--da4uJneut+ArUgXk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 28, 2014 at 08:39:50PM +0900, Inki Dae wrote:
> This patch adds MIPI-DSI based S6E63J0X03 AMOLED LCD Panel driver
> which uses mipi_dsi bus to communicate with Panel.

s/Panel/panel/. Also I prefer to have more information in the commit
message than this. Physical size and resolution would be good. Also a
small comment as to which device this panel can be found in would be
good.

> +config DRM_PANEL_S6E63J0X03
> +	tristate "S6E63J0X03 DSI video mode panel"
> +	depends on OF
> +	select DRM_MIPI_DSI
> +	select VIDEOMODE_HELPERS
> +
>  endmenu
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makef=
ile
> index 8b92921..7f36dc2 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -1,3 +1,4 @@
>  obj-$(CONFIG_DRM_PANEL_SIMPLE) +=3D panel-simple.o
>  obj-$(CONFIG_DRM_PANEL_LD9040) +=3D panel-ld9040.o
>  obj-$(CONFIG_DRM_PANEL_S6E8AA0) +=3D panel-s6e8aa0.o
> +obj-$(CONFIG_DRM_PANEL_S6E63J0X03) +=3D panel-s6e63j0x03.o
> diff --git a/drivers/gpu/drm/panel/panel-s6e63j0x03.c b/drivers/gpu/drm/p=
anel/panel-s6e63j0x03.c
[...]
> +struct s6e63j0x03 {
> +	struct device *dev;
> +	struct drm_panel panel;
> +	struct backlight_device *bl_dev;
> +
> +	struct regulator_bulk_data supplies[2];
> +	struct gpio_desc *reset_gpio;
> +	u32 power_on_delay;
> +	u32 power_off_delay;
> +	u32 reset_delay;
> +	u32 init_delay;
> +	bool flip_horizontal;
> +	bool flip_vertical;
> +	struct videomode vm;

Specifying the video mode in DT should be optional and only used to
override the default mode provided by the driver.

> +	u32 width_mm;
> +	u32 height_mm;

There's no need for these to be sized types. unsigned int will do just
fine.

> +	int power;

What's the difference between this and bl_dev->properties.power?

> +
> +	/* This field is tested by functions directly accessing DSI bus before
> +	 * transfer, transfer is skipped if it is set. In case of transfer
> +	 * failure or unexpected response the field is set to error value.
> +	 * Such construct allows to eliminate many checks in higher level
> +	 * functions.
> +	 */

The format of this comment is wrong, it should be:

	/*
	 * ...
	 */

> +	int error;
> +};
> +
> +static const unsigned char GAMMA_10[] =3D {
=2E..

These array names should not be all-caps.

> +static const unsigned char *gamma_tbl[MAX_GAMMA_CNT] =3D {
> +	GAMMA_10,
> +	GAMMA_30,
> +	GAMMA_60,
> +	GAMMA_90,
> +	GAMMA_120,
> +	GAMMA_150,
> +	GAMMA_200,
> +	GAMMA_200,
> +	GAMMA_240,
> +	GAMMA_300,
> +	GAMMA_300
> +};

Why not just do this using a two-dimensional array?

> +
> +static inline struct s6e63j0x03 *panel_to_s6e63j0x03(struct drm_panel *p=
anel)
> +{
> +	return container_of(panel, struct s6e63j0x03, panel);
> +}
> +
> +static int s6e63j0x03_clear_error(struct s6e63j0x03 *ctx)
> +{
> +	int ret =3D ctx->error;
> +
> +	ctx->error =3D 0;
> +	return ret;
> +}

The only place where you ever call this ignores the return value.

> +
> +static void s6e63j0x03_dcs_write(struct s6e63j0x03 *ctx, const void *dat=
a, size_t len)
> +{
> +	struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(ctx->dev);
> +	int ret;
> +
> +	if (ctx->error < 0)
> +		return;
> +
> +	ret =3D mipi_dsi_dcs_write(dsi, data, len);
> +	if (ret < 0) {
> +		dev_err(ctx->dev, "error %d writing dcs seq: %*ph\n", ret, len,
> +			data);
> +		ctx->error =3D ret;
> +	}
> +}

The only reason for these wrappers seems to be the ctx->error handling.
But that error handling is flawed because it silently ignores errors.
The only location where you check for errors is in .prepare(), but you
only do so after all commands have been executed, so you loose all
context about what exactly went wrong.

I'd prefer if the driver just did straightforward checking of all
commands that could possibly fail.

> +static void s6e63j0x03_set_maximum_return_packet_size(struct s6e63j0x03 =
*ctx,
> +							unsigned int size)
> +{
> +	struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(ctx->dev);
> +	const struct mipi_dsi_host_ops *ops =3D dsi->host->ops;
> +
> +	if (ops && ops->transfer) {
> +		unsigned char buf[] =3D {size, 0};
> +		struct mipi_dsi_msg msg =3D {
> +			.channel =3D dsi->channel,
> +			.type =3D MIPI_DSI_SET_MAXIMUM_RETURN_PACKET_SIZE,
> +			.tx_len =3D sizeof(buf),
> +			.tx_buf =3D buf
> +		};
> +		int ret;
> +
> +		ret =3D ops->transfer(dsi->host, &msg);
> +		if (ret < 0) {
> +			dev_err(ctx->dev, "failed to transfer message.\n");
> +			ctx->error =3D ret;
> +		}
> +	}
> +}

Use mipi_dsi_set_maximum_return_packet_size().

> +static void s6e63j0x03_set_sequence(struct s6e63j0x03 *ctx)

Can you find a better name for this? Also this is really only called by
->prepare() below, so why not just inline it there?

> +{
> +	/* Test key enable */
> +	s6e63j0x03_test_level_1_key_on(ctx);
> +	s6e63j0x03_test_level_2_key_on(ctx);
> +
> +	s6e63j0x03_porch_adjustment(ctx);
> +	s6e63j0x03_frame_freq(ctx);
> +	s6e63j0x03_frame_freq(ctx);
> +	s6e63j0x03_mem_addr_set_0(ctx);
> +	s6e63j0x03_mem_addr_set_1(ctx);
> +
> +	s6e63j0x03_ltps_timming_set_0_60hz(ctx);
> +	s6e63j0x03_ltps_timming_set_1(ctx);
> +
> +	s6e63j0x03_param_pos_te_edge(ctx);
> +	s6e63j0x03_te_rising_edge(ctx);
> +	s6e63j0x03_param_pos_default(ctx);
> +
> +	s6e63j0x03_dcs_write_seq_static(ctx, MIPI_DCS_EXIT_SLEEP_MODE);

Use mipi_dsi_dcs_exit_sleep_mode().

> +	msleep(120);
> +
> +	/* etc condition setting */
> +	s6e63j0x03_elvss_cond(ctx);
> +	s6e63j0x03_set_pos(ctx);
> +
> +	/* brightness setting */
> +	s6e63j0x03_white_brightness_default(ctx);
> +	s6e63j0x03_white_ctrl(ctx);
> +	s6e63j0x03_acl_off(ctx);
> +
> +	s6e63j0x03_dcs_write_seq_static(ctx, MIPI_DCS_SET_TEAR_ON);

Use mipi_dsi_dcs_set_tear_on().

> +	s6e63j0x03_test_level_2_key_off(ctx);
> +
> +	/* display on */
> +	s6e63j0x03_dcs_write_seq_static(ctx, MIPI_DCS_SET_DISPLAY_ON);

Use mipi_dsi_dcs_set_display_on().

> +static int s6e63j0x03_get_brightness(struct backlight_device *bl_dev)
> +{
> +	return bl_dev->props.brightness;
> +}
> +
> +static int s6e63j0x03_get_brightness_index(unsigned int brightness)

Should return unsigned int.

> +{
> +	int index;
> +
> +	switch (brightness) {
> +	case 0 ... 20:
> +		index =3D 0;
> +		break;
> +	case 21 ... 40:
> +		index =3D 2;
> +		break;
> +	case 41 ... 60:
> +		index =3D 4;
> +		break;
> +	case 61 ... 80:
> +		index =3D 6;
> +		break;
> +	default:
> +		index =3D 10;
> +		break;
> +	}
> +
> +	return index;
> +}
> +
> +static void s6e63j0x03_update_gamma(struct s6e63j0x03 *ctx,
> +					unsigned int brightness)
> +{
> +	int index =3D s6e63j0x03_get_brightness_index(brightness);

And this should be unsigned, too, otherwise you'll need to test that
it's non-negative before indexing the array.

> +static int s6e63j0x03_set_brightness(struct backlight_device *bl_dev)
> +{
> +	struct s6e63j0x03 *ctx =3D (struct s6e63j0x03 *)bl_get_data(bl_dev);
> +	unsigned int brightness =3D bl_dev->props.brightness;
> +
> +	if (brightness < MIN_BRIGHTNESS ||
> +		brightness > bl_dev->props.max_brightness) {
> +		dev_err(ctx->dev, "brightness[%u] is invalid value\n",
> +			brightness);

Perhaps a more canonical error message would read: "Invalid brightness
%u\n".

> +		return -EINVAL;
> +	}
> +
> +	if (ctx->power > FB_BLANK_UNBLANK) {
> +		dev_err(ctx->dev, "panel is not in fb unblank state\n");
> +		return -EPERM;
> +	}

What does that have to do with anything? If the screen is blanked you
could still set the brightness and have it in effect when the screen is
unblanked, I presume?

> +
> +	s6e63j0x03_update_gamma(ctx, brightness);
> +
> +	return 0;
> +}
> +
> +static const struct backlight_ops s6e63j0x03_bl_ops =3D {
> +	.get_brightness =3D s6e63j0x03_get_brightness,
> +	.update_status =3D s6e63j0x03_set_brightness,
> +};
> +
> +

There's a gratuitous blank line here.

> +static int s6e63j0x03_enable(struct drm_panel *panel)
> +{
> +	return 0;
> +}
> +
> +static int s6e63j0x03_disable(struct drm_panel *panel)
> +{
> +	return 0;
> +}

These should typically enable or disable the backlight.

> +static int s6e63j0x03_prepare(struct drm_panel *panel)
> +{
> +	struct s6e63j0x03 *ctx =3D panel_to_s6e63j0x03(panel);
> +	int ret;
> +
> +	ret =3D s6e63j0x03_power_on(ctx);
> +	if (ret < 0)
> +		return ret;
> +
> +	s6e63j0x03_read_mtp_id(ctx);
> +
> +	s6e63j0x03_set_sequence(ctx);
> +	ret =3D ctx->error;
> +
> +	if (ret < 0)
> +		return s6e63j0x03_disable(panel);

No, you can't do this. While there's nothing enforcing this (yet), the
panel can't be disabled before it's been prepared.

> +
> +	ctx->power =3D FB_BLANK_UNBLANK;
> +
> +	return ret;
> +}
> +
> +static int s6e63j0x03_unprepare(struct drm_panel *panel)
> +{
> +	struct s6e63j0x03 *ctx =3D panel_to_s6e63j0x03(panel);
> +	int ret;
> +
> +	s6e63j0x03_dcs_write_seq_static(ctx, MIPI_DCS_SET_DISPLAY_OFF);

Use mipi_dsi_dcs_set_display_off().

> +	s6e63j0x03_dcs_write_seq_static(ctx, MIPI_DCS_ENTER_SLEEP_MODE);

Use mipi_dsi_dcs_enter_sleep_mode().

> +
> +	s6e63j0x03_clear_error(ctx);
> +
> +	usleep_range(ctx->power_off_delay * 1000,
> +			(ctx->power_off_delay + 1) * 1000);
> +
> +	ret =3D s6e63j0x03_power_off(ctx);
> +	if (ret < 0)
> +		return s6e63j0x03_prepare(panel);

Huh? Why?

> +
> +	ctx->power =3D FB_BLANK_POWERDOWN;
> +
> +	return ret;
> +}
> +
> +static const struct drm_panel_funcs s6e63j0x03_drm_funcs =3D {

No need for "_drm" in the variable name here.

> +	.enable =3D s6e63j0x03_enable,
> +	.disable =3D s6e63j0x03_disable,
> +	.prepare=3D s6e63j0x03_prepare,

Missing space between '.prepare' and '=3D'.

> +	.unprepare =3D s6e63j0x03_unprepare,
> +	.get_modes =3D s6e63j0x03_get_modes,

Please order these in the same way as they are declared in the
structure.

> +static int s6e63j0x03_parse_dt(struct s6e63j0x03 *ctx)
> +{
> +	struct device *dev =3D ctx->dev;
> +	struct device_node *np =3D dev->of_node;
> +	int ret;
> +
> +	ret =3D of_get_videomode(np, &ctx->vm, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	of_property_read_u32(np, "power-on-delay", &ctx->power_on_delay);
> +	of_property_read_u32(np, "power-off-delay", &ctx->power_off_delay);
> +	of_property_read_u32(np, "reset-delay", &ctx->reset_delay);
> +	of_property_read_u32(np, "init-delay", &ctx->init_delay);

I take it that these are optional (I can't tell because you haven't
provided a DT binding for this panel)?

> +static int s6e63j0x03_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev =3D &dsi->dev;
> +	struct s6e63j0x03 *ctx;
> +	int ret;
> +
> +	ctx =3D devm_kzalloc(dev, sizeof(struct s6e63j0x03), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +
> +	ctx->dev =3D dev;
> +
> +	dsi->lanes =3D 1;
> +	dsi->format =3D MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags =3D MIPI_DSI_MODE_EOT_PACKET | MIPI_DSI_MODE_VIDEO_BURS=
T;
> +
> +	ret =3D s6e63j0x03_parse_dt(ctx);
> +	if (ret < 0)
> +		return ret;
> +
> +	ctx->supplies[0].supply =3D "vdd3";
> +	ctx->supplies[1].supply =3D "vci";
> +	ret =3D devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies),
> +				      ctx->supplies);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to get regulators: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ctx->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(ctx->reset_gpio)) {
> +		dev_err(dev, "cannot get reset-gpios %ld\n",
> +				PTR_ERR(ctx->reset_gpio));

"reset GPIO" since it's only one. Also please separate the error code
=66rom the rest of the message using a colon to make it more obvious that
the number isn't the GPIO that could be gotten.

> +	ctx->bl_dev->props.max_brightness =3D MAX_BRIGHTNESS;
> +	ctx->bl_dev->props.brightness =3D DEFAULT_BRIGHTNESS;
> +
> +	ret =3D drm_panel_add(&ctx->panel);
> +	if (ret < 0)
> +		goto err_unregister_backlight;
> +
> +	ret =3D mipi_dsi_attach(dsi);
> +	if (ret < 0)
> +		goto err_remove_panel;
> +
> +	return ret;
> +
> +err_remove_panel:
> +		drm_panel_remove(&ctx->panel);
> +
> +err_unregister_backlight:

No need for the err_ prefix here.

> +	backlight_device_unregister(ctx->bl_dev);
> +
> +	return ret;
> +}
> +
> +static int s6e63j0x03_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct s6e63j0x03 *ctx =3D mipi_dsi_get_drvdata(dsi);
> +
> +	mipi_dsi_detach(dsi);
> +	drm_panel_remove(&ctx->panel);
> +
> +	backlight_device_unregister(ctx->bl_dev);
> +
> +	return 0;
> +}
> +
> +static struct of_device_id s6e63j0x03_of_match[] =3D {

static const please.

> +	{ .compatible =3D "samsung,s6e63j0x03" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, s6e63j0x03_of_match);
> +
> +static struct mipi_dsi_driver s6e63j0x03_driver =3D {
> +	.probe =3D s6e63j0x03_probe,
> +	.remove =3D s6e63j0x03_remove,
> +	.driver =3D {
> +		.name =3D "panel_s6e63j0x03",
> +		.owner =3D THIS_MODULE,

It is no longer necessary to specify this explicitly.

> +		.of_match_table =3D s6e63j0x03_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(s6e63j0x03_driver);

You're missing MODULE_AUTHOR, MODULE_DESCRIPTION and MODULE_LICENSE
here.

Thierry

--da4uJneut+ArUgXk
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUfEZZAAoJEN0jrNd/PrOhHgUP/0aEjNsPkSl3XEi3fmbB4UPH
92tVAypgMSltP0f1BBWW8fjV1CLjOanlsIBodG5N0yiqh/Q0Y4VTUdSXXynyS90v
FYYKj+18G7QTrTsgoo7mya7QMQaOBq+u3NyBc7TJGolTWRPSGOaqa6vASAFIVrWB
V4P6V0euriGcprItUUbHML0yWI8cBXUD4orma8VMgeRpxVsVMiMqctbosZrf7G4q
IoZPiRkXCAog52juwTKScdnt93w4w0xun85vEkAn6aJXCAFDtSodpU7EcxVobatr
FFQ97ghlvs3rUNz9cFzrFMjSOwrAFmpyhBK5KSCmW6GE5elg9Usna0DX19VxSK0e
H/mV4JaWUaI9r7xyFoQrLwoK1Ibc9kV2THqWyWzgiiyItWMH8fuVjXQV8wfh+DZZ
2lYIH4LwCJGDWoSPYyaloVWTImgp4318IIFD37Ckirxwnis/mmx/hfQ+m7cChBQM
B9LBciROaTS6wIgu9/bFqg51y/iqEp/gGyXxXXKGCiMYtj9qc7fBY1PcpOOvhXia
3FYynW7W+IiuMQ8gRuaUpb+nwnA2mFWo280WwTzbzz/Y1fGomxwZ/93qFqrPnJBL
mI94iwhS/7C+iLEtbFZF+851mV2U+4M9Kpu7U8OvqxE/m6P4oNg8VI0LXIFQxM4K
rcD1cFH/EPETqSRqMAx2
=yrin
-----END PGP SIGNATURE-----

--da4uJneut+ArUgXk--

--===============2102385953==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============2102385953==--
