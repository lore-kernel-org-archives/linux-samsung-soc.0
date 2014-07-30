From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 7/8] drm/bridge: Add i2c based driver for ptn3460 bridge
Date: Wed, 30 Jul 2014 14:05:05 +0200
Message-ID: <20140730120504.GJ29590@ulmo>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
 <1406316130-4744-8-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1146670863=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1406316130-4744-8-git-send-email-ajaykumar.rs@samsung.com>
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


--===============1146670863==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+9faIjRurCDpBc7U"
Content-Disposition: inline


--+9faIjRurCDpBc7U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 26, 2014 at 12:52:09AM +0530, Ajay Kumar wrote:
[...]
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kcon=
fig
> index 1e2f96c..0b12d16 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -6,4 +6,14 @@ config DRM_BRIDGE
> =20
>  menu "bridge chips"
>  	depends on DRM_BRIDGE
> +
> +config DRM_PTN3460
> +	tristate "NXP ptn3460 eDP/LVDS bridge"
> +	depends on DRM && DRM_BRIDGE

I don't think you need these two dependencies any longer since they are
implicit in the "bridge chips" menu.

> diff --git a/drivers/gpu/drm/bridge/ptn3460.c b/drivers/gpu/drm/bridge/pt=
n3460.c
[...]
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_gpio.h>
> +#include <linux/i2c.h>
> +#include <linux/gpio.h>
> +#include <linux/delay.h>
> +#include <drm/drm_panel.h>

These should be ordered alphabetically, but they are already this way in
the original driver, so the reordering can be a separate patch.

> +struct ptn3460_bridge {
> +	struct drm_connector connector;
> +	struct i2c_client *client;
> +	struct drm_bridge *bridge;

I think it would be much more natural for ptn3460_bridge to embed struct
drm_bridge rather than store a pointer to it.

> +	struct drm_panel *panel;
> +	struct edid *edid;
> +	struct gpio_desc *gpio_pd_n;
> +	struct gpio_desc *gpio_rst_n;
> +	u32 edid_emulation;
> +	bool enabled;
> +};
> +
> +static int ptn3460_read_bytes(struct ptn3460_bridge *ptn_bridge, char ad=
dr,
> +		u8 *buf, int len)
> +{
> +	int ret;
> +
> +	ret =3D i2c_master_send(ptn_bridge->client, &addr, 1);
> +	if (ret <=3D 0) {
> +		DRM_ERROR("Failed to send i2c command, ret=3D%d\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D i2c_master_recv(ptn_bridge->client, buf, len);
> +	if (ret <=3D 0) {
> +		DRM_ERROR("Failed to recv i2c data, ret=3D%d\n", ret);
> +		return ret;
> +	}

This isn't introduced by this patch, but doesn't this require locking so
that this is an atomic transaction?

Perhaps it could be rewritten using i2c_smbus_read_block_data()?

> +static int ptn3460_write_byte(struct ptn3460_bridge *ptn_bridge, char ad=
dr,
> +		char val)
> +{
> +	int ret;
> +	char buf[2];
> +
> +	buf[0] =3D addr;
> +	buf[1] =3D val;
> +
> +	ret =3D i2c_master_send(ptn_bridge->client, buf, ARRAY_SIZE(buf));
> +	if (ret <=3D 0) {
> +		DRM_ERROR("Failed to send i2c command, ret=3D%d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}

Same here, this looks like it could be i2c_smbus_write_byte_data().

> +static int ptn3460_select_edid(struct ptn3460_bridge *ptn_bridge)
> +{
> +	int ret;
> +	char val;
> +
> +	/* Load the selected edid into SRAM (accessed at PTN3460_EDID_ADDR) */
> +	ret =3D ptn3460_write_byte(ptn_bridge, PTN3460_EDID_SRAM_LOAD_ADDR,
> +			ptn_bridge->edid_emulation);
> +	if (ret) {
> +		DRM_ERROR("Failed to transfer edid to sram, ret=3D%d\n", ret);
> +		return ret;
> +	}
> +
> +	/* Enable EDID emulation and select the desired EDID */
> +	val =3D 1 << PTN3460_EDID_ENABLE_EMULATION |
> +		ptn_bridge->edid_emulation << PTN3460_EDID_EMULATION_SELECTION;
> +
> +	ret =3D ptn3460_write_byte(ptn_bridge, PTN3460_EDID_EMULATION_ADDR, val=
);
> +	if (ret) {
> +		DRM_ERROR("Failed to write edid value, ret=3D%d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}

s/edid/EDID/ in the above (and below, too), but again the original
driver had this, so it can be a separate patch.

> +static void ptn3460_pre_enable(struct drm_bridge *bridge)
> +{
> +	struct ptn3460_bridge *ptn_bridge =3D bridge->driver_private;

If you embed drm_bridge within ptn3460_bridge then you can use the much
more canonical container_of() macro (or rather a driver-specific inline
function that wraps it) and no longer need the drm_bridge.driver_private
field.

> +	int ret;
> +
> +	if (ptn_bridge->enabled)
> +		return;
> +
> +	gpiod_set_value(ptn_bridge->gpio_pd_n, 1);
> +
> +	gpiod_set_value(ptn_bridge->gpio_rst_n, 0);
> +	udelay(10);

This shouldn't be using udelay(), usleep_range(10, 20) (or similar)
would be better. Again, can be a separate patch.

> +	gpiod_set_value(ptn_bridge->gpio_rst_n, 1);

It also seems like you've converted to using the gpiod_*() API, but the
driver previously used gpio_is_valid() to check that both PD and RST
pins had valid GPIOs associated with them. The device tree binding said
that they are required, though.

So this patch actually does the right thing by making them non-optional
but it also changes behaviour from the original. Like I said earlier, I
would very much prefer that this conversion be split into separate
patches rather than one patch that removes the old driver and a second
patch that adds a new one. It makes it really difficult to tell what's
really changing, breaks bisectability and generally makes our lives
miserable.

> +
> +	drm_panel_prepare(ptn_bridge->panel);

This should check for errors.

> +static void ptn3460_enable(struct drm_bridge *bridge)
> +{
> +	struct ptn3460_bridge *ptn_bridge =3D bridge->driver_private;
> +
> +	drm_panel_enable(ptn_bridge->panel);

Should check for errors as well.

> +int ptn3460_get_modes(struct drm_connector *connector)

static? There seem to be quite a few functions that can be locally
scoped. Again, this seems to be the case in the original driver as
but it should definitely be fixed at some point.

> +{
> +	struct ptn3460_bridge *ptn_bridge;
> +	u8 *edid;
> +	int ret, num_modes;
> +	bool power_off;
> +
> +	ptn_bridge =3D container_of(connector, struct ptn3460_bridge, connector=
);
> +
> +	if (ptn_bridge->edid)
> +		return drm_add_edid_modes(connector, ptn_bridge->edid);
> +
> +	power_off =3D !ptn_bridge->enabled;
> +	ptn3460_pre_enable(ptn_bridge->bridge);
> +
> +	edid =3D kmalloc(EDID_LENGTH, GFP_KERNEL);
> +	if (!edid) {
> +		DRM_ERROR("Failed to allocate edid\n");
> +		return 0;
> +	}
> +
> +	ret =3D ptn3460_read_bytes(ptn_bridge, PTN3460_EDID_ADDR, edid,
> +			EDID_LENGTH);
> +	if (ret) {
> +		kfree(edid);
> +		num_modes =3D 0;

Maybe instead of doing this here you can initialize the variable when
you declare it? It's always been that way, so can be a separate patch,
too.

> +struct drm_encoder *ptn3460_best_encoder(struct drm_connector *connector)
> +{
> +	struct ptn3460_bridge *ptn_bridge;
> +
> +	ptn_bridge =3D container_of(connector, struct ptn3460_bridge, connector=
);

You use this long construct a couple of times, so it's useful to
introduce a helper, such as this:

	static inline struct ptn3460_bridge *
	connector_to_ptn3460(struct drm_connector *connector)
	{
		return container_of(connector, struct ptn3460_bridge, connector);
	}

> +int ptn3460_post_encoder_init(struct drm_bridge *bridge)
> +{
> +	struct ptn3460_bridge *ptn_bridge =3D bridge->driver_private;
> +	int ret;
> +
> +	/* bridge is attached to encoder.
> +	 * safe to remove it from the bridge_lookup table.
> +	 */
> +	drm_bridge_remove_from_lookup(bridge);

No, you should never do this. First, you're not adding it back to the
registry when the bridge is detached, so unloading and reloading the
display driver will fail. Second there should never be a need to remove
it from the registry as long as the driver itself is loaded. If you're
concerned about a single bridge being used multiple times, there's
already code to handle that in your previous patch:

	int drm_bridge_attach_encoder(...)
	{
		...

		if (bridge->encoder)
			return -EBUSY;

		...
	}

Generally the registry should contain a list of bridges that have been
registered, whether they're used or not is irrelevant.

> +	ret =3D drm_bridge_init(bridge->drm_dev, bridge);
> +	if (ret) {
> +		DRM_ERROR("Failed to initialize bridge with drm\n");
> +		return ret;
> +	}
> +
> +	/* connector implementation */
> +	ptn_bridge->connector.polled =3D bridge->connector_polled;

Why does this need to be handed from bridge to connector? You implement
both the connector and the bridge in this driver, so can't you directly
set ptn_bridge->connector.polled as appropriate?

> +	ret =3D drm_connector_init(bridge->drm_dev, &ptn_bridge->connector,
> +			&ptn3460_connector_funcs, DRM_MODE_CONNECTOR_LVDS);
> +	if (ret) {
> +		DRM_ERROR("Failed to initialize connector with drm\n");
> +		return ret;
> +	}
> +	drm_connector_helper_add(&ptn_bridge->connector,
> +					&ptn3460_connector_helper_funcs);
> +	drm_connector_register(&ptn_bridge->connector);
> +	drm_mode_connector_attach_encoder(&ptn_bridge->connector,
> +							bridge->encoder);
> +
> +	if (ptn_bridge->panel)
> +		drm_panel_attach(ptn_bridge->panel, &ptn_bridge->connector);
> +
> +	return ret;
> +}

I'm thinking that eventually we'll want to register the connector only
when a panel is attached to the bridge. This will only become important
when we implement bridge chaining because if you instantiate a connector
for each bridge then you'll get a list of connectors for the DRM device
representing the output of each bridge rather than just the final one
that goes to the display.

> +static int ptn3460_probe(struct i2c_client *client,
> +				const struct i2c_device_id *id)
> +{
> +	struct device *dev =3D &(client->dev);

No need for the parentheses here.

> +	struct device_node *panel_node;
> +	struct drm_bridge *bridge;
> +	struct ptn3460_bridge *ptn_bridge;
> +	int ret;
> +
> +	bridge =3D devm_kzalloc(dev, sizeof(*bridge), GFP_KERNEL);
> +	if (!bridge) {
> +		DRM_ERROR("Failed to allocate drm bridge\n");
> +		return -ENOMEM;
> +	}
> +
> +	ptn_bridge =3D devm_kzalloc(dev, sizeof(*ptn_bridge), GFP_KERNEL);
> +	if (!ptn_bridge) {
> +		DRM_ERROR("Failed to allocate ptn bridge\n");
> +		return -ENOMEM;
> +	}

No need for error messages on allocation failures. The allocator will
already complain itself.

Also I think it's usually better to use the dev_*() functions to print
messages, especially given that at this stage we're not even hooked up
to DRM in the first place.

So in general I try to use DRM_*() functions only from DRM-specific
callbacks (or functions called from them) and dev_*() otherwise.

> +static int ptn3460_remove(struct i2c_client *client)
> +{
> +	return 0;
> +}

This function should remove the bridge from the lookup table by calling
drm_bridge_remove().

> +
> +static const struct i2c_device_id ptn3460_i2c_table[] =3D {
> +	{"nxp,ptn3460", 0},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(i2c, ptn3460_i2c_table);
> +
> +static const struct of_device_id ptn3460_match[] =3D {
> +	{ .compatible =3D "nxp,ptn3460" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, ptn3460_match);
> +
> +struct i2c_driver ptn3460_driver =3D {

Is there a reason why this can't be static?

> +	.id_table	=3D ptn3460_i2c_table,
> +	.probe		=3D ptn3460_probe,
> +	.remove		=3D ptn3460_remove,
> +	.driver		=3D {
> +		.name	=3D "nxp,ptn3460",
> +		.owner	=3D THIS_MODULE,
> +		.of_match_table =3D of_match_ptr(ptn3460_match),

You don't need of_match_ptr() here since you already depend on OF in
Kconfig, therefore of_match_ptr(x) will always evaluate to x.

> +	},
> +};
> +module_i2c_driver(ptn3460_driver);
> +
> +MODULE_AUTHOR("Sean Paul <seanpaul@chromium.org>");
> +MODULE_DESCRIPTION("NXP ptn3460 eDP-LVDS converter driver");
> +MODULE_LICENSE("GPL");

This should be "GPL v2".

Thierry

--+9faIjRurCDpBc7U
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT2N9wAAoJEN0jrNd/PrOhgWsQAJpp3qJdLced8yol2AvbA/wv
666aCjAF1sGBXUPIQI23M+SdzkYfH6S+sNVRW2x8CKTYYxhQZ3EkA9tnnNYGk1jD
89jcUEDBBbcsIMMb1wLy7Q1wDg8OJgLYr1Yt0eCTNEK60/Epktc6x08COo5hT+AJ
yinHaj+94B3nfyKT9Ma0ZdUF9Y6GGNMd/dS710yLys0rRSpvFAEB+X5UCAOjihvA
N56rXWsVMfYUkzb/nGTBzodQMgTVy6NZH9THPWiY2VPrCT/QBUy9Xmq5wQuT5zkZ
3reik4SUBRy1w8my5TejpGP8A2MflQjW10mLVNGtQsT79hVmuHridUloLES10eaO
30Mzyat7vGA9782bsJsVsPPJXcv7hu5k4ysV29Hn69ZEdQ91+ZX+g7Fh892wRmVr
9k4ovEYpS4cjB6WVgE3adcrpteE2eaAOFdAiaSB6hkha4G5qfz+bp/m+xwOdU/Lv
uETWnrCH93c40Cl3pp+I2KklZaiiEkZt+yakN10985X/+ScT8Qp3zjnHQUsGKfX5
JJrWwI+ttGOqJ9ORMvWZv/Q5V9/1aVMWEaO1HeSIrnvrTQyCPwkkP0pIXLbca3Pp
ZbsmILalFysfYD2MIuR1rhQQGV7XvWUWJd5AmGex58uqyp9R+gZsWDG/0P2Tmuxi
SmiNBbkGQ/BqwlIyRP1T
=JweV
-----END PGP SIGNATURE-----

--+9faIjRurCDpBc7U--

--===============1146670863==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1146670863==--
