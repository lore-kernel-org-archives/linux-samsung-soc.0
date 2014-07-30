From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V6 8/8] drm/bridge: Add i2c based driver for
 ps8622/ps8625 bridge
Date: Wed, 30 Jul 2014 15:11:25 +0200
Message-ID: <20140730131124.GK29590@ulmo>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
 <1406316130-4744-9-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1802907291=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1406316130-4744-9-git-send-email-ajaykumar.rs@samsung.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Vincent Palatin <vpalatin@chromium.org>, seanpaul@google.com, Andrew Bresticker <abrestic@chromium.org>, daniel.vetter@ffwll.ch, joshi@samsung.com, dri-devel@lists.freedesktop.org, ajaynumb@gmail.com, prashanth.g@samsung.com, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============1802907291==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="u3W6riq+uV6J42Ub"
Content-Disposition: inline


--u3W6riq+uV6J42Ub
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 26, 2014 at 12:52:10AM +0530, Ajay Kumar wrote:
[...]
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Docu=
mentation/devicetree/bindings/vendor-prefixes.txt
> index 46a311e..b4a99cc 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -96,6 +96,7 @@ nxp	NXP Semiconductors
>  onnn	ON Semiconductor Corp.
>  opencores	OpenCores.org
>  panasonic	Panasonic Corporation
> +parade	Parade Technologies Inc.
>  phytec	PHYTEC Messtechnik GmbH
>  picochip	Picochip Ltd
>  plathome	Plat'Home Co., Ltd.

I think it's a good idea to turn this into a separate patch to avoid
conflicts.

> diff --git a/Documentation/devicetree/bindings/video/bridge/ps8622.txt b/=
Documentation/devicetree/bindings/video/bridge/ps8622.txt
> new file mode 100644
> index 0000000..fdeafb2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/video/bridge/ps8622.txt
> @@ -0,0 +1,19 @@
> +ps8622-bridge bindings
> +
> +Required properties:
> +	- compatible: "parade,ps8622" or "parade,ps8625"
> +	- reg: first i2c address of the bridge

I'm not sure what the deal is with devices that use more than one I2C
addresses. It would be good to hear from the device tree maintainers on
how to handle those. Technically each address is a separate device. This
is also mirrored in the Linux kernel's implementation of the I2C bus,
where it looks wrong to access more than a single address (since the
core only marks one of them used). So technically it's valid for
userspace to access any but the first "page" of this device.

> +	- sleep-gpios: OF device-tree gpio specification
> +	- reset-gpios: OF device-tree gpio specification

This should explain what these GPIOs are used for.

> +
> +Optional properties:
> +	- lane-count: number of DP lanes to use
> +
> +Example:
> +	ps8622-bridge@48 {
> +		compatible =3D "parade,ps8622";
> +		reg =3D <0x48>;
> +		sleep-gpios =3D <&gpc3 6 1 0 0>;
> +		reset-gpios =3D <&gpc3 1 1 0 0>;
> +		lane-count =3D <1>
> +	};

Same here. It's usually best to make this a patch separate from the
driver. Not because of conflicts, but because it makes it easier for DT
reviewers to find the relevant pieces to look at.

> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kcon=
fig
> index 0b12d16..d73e474 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -16,4 +16,14 @@ config DRM_PTN3460
>  	help
>  	  ptn3460 eDP-LVDS bridge chip driver.
> =20
> +config DRM_PS8622
> +	tristate "Parade eDP/LVDS bridge"
> +	depends on DRM && DRM_BRIDGE

Aagin, these are unnecessary.

> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Mak=
efile
> index b4733e1..d1b5daa 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -1,3 +1,4 @@
>  ccflags-y :=3D -Iinclude/drm
> =20
>  obj-$(CONFIG_DRM_PTN3460) +=3D ptn3460.o
> +obj-$(CONFIG_DRM_PS8622) +=3D ps8622.o

Please keep these sorted alphabetically.

> diff --git a/drivers/gpu/drm/bridge/ps8622.c b/drivers/gpu/drm/bridge/ps8=
622.c
[...]
> +#include <linux/module.h>
> +#include <linux/backlight.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/fb.h>
> +#include <linux/gpio.h>
> +#include <linux/i2c.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/pm.h>
> +#include <linux/regulator/consumer.h>

These too.

> +struct ps8622_bridge {
> +	struct drm_connector connector;
> +	struct i2c_client *client;
> +	struct drm_bridge *bridge;

Should be embedded.

> +	struct drm_panel *panel;
> +	struct regulator *v12;
> +	struct backlight_device *bl;
> +	struct mutex enable_mutex;

I don't quite understand what this protects. Can you explain?

> +struct ps8622_device_data {
> +	u8 max_lane_count;
> +};
> +
> +static const struct ps8622_device_data ps8622_data =3D {
> +	.max_lane_count =3D 1,
> +};
> +
> +static const struct ps8622_device_data ps8625_data =3D {
> +	.max_lane_count =3D 2,
> +};
> +
> +/* Brightness scale on the Parade chip */
> +#define PS8622_MAX_BRIGHTNESS 0xff
> +
> +/* Timings taken from the version 1.7 datasheet for the PS8622/PS8625 */
> +#define PS8622_POWER_RISE_T1_MIN_US 10
> +#define PS8622_POWER_RISE_T1_MAX_US 10000
> +#define PS8622_RST_HIGH_T2_MIN_US 3000
> +#define PS8622_RST_HIGH_T2_MAX_US 30000
> +#define PS8622_PWMO_END_T12_MS 200
> +#define PS8622_POWER_FALL_T16_MAX_US 10000
> +#define PS8622_POWER_OFF_T17_MS 500
> +
> +#if ((PS8622_RST_HIGH_T2_MIN_US + PS8622_POWER_RISE_T1_MAX_US) > \
> +	(PS8622_RST_HIGH_T2_MAX_US + PS8622_POWER_RISE_T1_MIN_US))
> +#error "T2.min + T1.max must be less than T2.max + T1.min"
> +#endif
> +
> +static int ps8622_set(struct i2c_client *client, u8 page, u8 reg, u8 val)
> +{
> +	int ret;
> +	struct i2c_adapter *adap =3D client->adapter;
> +	struct i2c_msg msg;
> +	u8 data[] =3D {reg, val};
> +
> +	msg.addr =3D client->addr + page;
> +	msg.flags =3D 0;
> +	msg.len =3D sizeof(data);
> +	msg.buf =3D data;
> +
> +	ret =3D i2c_transfer(adap, &msg, 1);
> +	if (ret !=3D 1)
> +		pr_warn("PS8622 I2C write (0x%02x,0x%02x,0x%02x) failed: %d\n",
> +			client->addr + page, reg, val, ret);
> +	return !(ret =3D=3D 1);
> +}
> +
> +static int ps8622_send_config(struct ps8622_bridge *ps_bridge)
> +{
> +	struct i2c_client *cl =3D ps_bridge->client;
> +	int err =3D 0;
> +
> +	/* wait 20ms after power ON */
> +	usleep_range(20000, 30000);

It's unusual to do this here. The function doesn't know when it's being
called. It could theoretically be called at any point. Better to move
the sleep to after where the device is powered on.

> +
> +	err |=3D ps8622_set(cl, 0x02, 0xa1, 0x01); /* HPD low */
> +	/* SW setting */
> +	err |=3D ps8622_set(cl, 0x04, 0x14, 0x01); /* [1:0] SW output 1.2V volt=
age
> +						  * is lower to 96% */

I'm not at all a fan of this kind of error chaining because you loose
all context about specific errors. Also if there's a systematic error
you'll want to abort as early as possible. If the device doesn't respond
to the first command sent, then it likely won't respond to the next
either. No need to keep trying in that case.

> +	/* RCO SS setting */
> +	err |=3D ps8622_set(cl, 0x04, 0xe3, 0x20); /* [5:4] =3D b01 0.5%, b10 1=
%,
> +						  * b11 1.5% */

Also I find it very hard to follow these calls. Since you have enough
information about what each of these registers does, can't you provide
symbolic constants?

It would probably also help to separate these into logical groups (or
individual function calls if there are no meaningful groups). That way
you'll get automatic documentation via function names and this function
would look a lot less cluttered.

> +static int ps8622_backlight_get(struct backlight_device *bl)
> +{
> +	return bl->props.brightness;
> +}

Backlight devices no longer need this kind of trivial implementation. It
is what the backlight core will do by default if the driver doesn't
implement .get_brightness().

> +static void ps8622_pre_enable(struct drm_bridge *bridge)
> +{
> +	struct ps8622_bridge *ps_bridge =3D bridge->driver_private;
> +	int ret;
> +
> +	mutex_lock(&ps_bridge->enable_mutex);
> +	if (ps_bridge->enabled)
> +		goto out;
> +
> +	gpiod_set_value(ps_bridge->gpio_rst_n, 0);
> +
> +	if (ps_bridge->v12) {
> +		ret =3D regulator_enable(ps_bridge->v12);
> +		if (ret)
> +			DRM_ERROR("fails to enable ps_bridge->v12");
> +	}
> +
> +	drm_panel_prepare(ps_bridge->panel);
> +
> +	gpiod_set_value(ps_bridge->gpio_slp_n, 1);

This uses high-active logic for the sleep pin, so shouldn't it rather be
named "gpio_slp"?

> +	/*
> +	 * T1 is the range of time that it takes for the power to rise after we
> +	 * enable the lcd fet.

Is that the time it takes for the FET's power to rise? In that case it
would be a property of the FET, not the bridge.

>                              T2 is the range of time in which the data sh=
eet
> +	 * specifies we should deassert the reset pin.
> +	 *
> +	 * If it takes T1.max for the power to rise, we need to wait atleast
> +	 * T2.min before deasserting the reset pin. If it takes T1.min for the
> +	 * power to rise, we need to wait at most T2.max before deasserting the
> +	 * reset pin.
> +	 */

Note that to my knowledge none of the sleep functions give you any
guarantees about the maximum amount of time they'll sleep, only the
minimum. So there's no such thing as "wait at most" in Linux.

> +	usleep_range(PS8622_RST_HIGH_T2_MIN_US + PS8622_POWER_RISE_T1_MAX_US,
> +		     PS8622_RST_HIGH_T2_MAX_US + PS8622_POWER_RISE_T1_MIN_US);
> +
> +	gpiod_set_value(ps_bridge->gpio_rst_n, 1);

This also uses high-active logic.

> +	ret =3D ps8622_send_config(ps_bridge);
> +	if (ret)
> +		DRM_ERROR("Failed to send config to bridge (%d)\n", ret);

Isn't this a fatal error? What will be the consequences if this doesn't
succeed? I guess it doesn't matter much either way since the API can't
propagate errors at this point anyway...

> +static void ps8622_enable(struct drm_bridge *bridge)
> +{
> +	struct ps8622_bridge *ps_bridge =3D bridge->driver_private;
> +
> +	mutex_lock(&ps_bridge->enable_mutex);
> +	drm_panel_enable(ps_bridge->panel);
> +	mutex_unlock(&ps_bridge->enable_mutex);

What's the enable_mutex protecting here?

> +static void ps8622_disable(struct drm_bridge *bridge)
> +{
> +	struct ps8622_bridge *ps_bridge =3D bridge->driver_private;
> +
> +	mutex_lock(&ps_bridge->enable_mutex);
> +
> +	if (!ps_bridge->enabled)
> +		goto out;
> +
> +	ps_bridge->enabled =3D false;
> +
> +	drm_panel_disable(ps_bridge->panel);
> +	msleep(PS8622_PWMO_END_T12_MS);
> +
> +	/*
> +	 * This doesn't matter if the regulators are turned off, but something
> +	 * else might keep them on. In that case, we want to assert the slp gpio
> +	 * to lower power.
> +	 */
> +	gpiod_set_value(ps_bridge->gpio_slp_n, 0);
> +
> +	if (ps_bridge->v12)
> +		regulator_disable(ps_bridge->v12);
> +
> +	/*
> +	 * Sleep for at least the amount of time that it takes the power rail to
> +	 * fall to prevent asserting the rst gpio from doing anything.
> +	 */
> +	usleep_range(PS8622_POWER_FALL_T16_MAX_US,
> +		     2 * PS8622_POWER_FALL_T16_MAX_US);
> +	gpiod_set_value(ps_bridge->gpio_rst_n, 0);

Does this even matter? Why would it be bad if the reset was asserted
before power went away? Isn't the end result that the chip will be off
and reset to an initial state the next time it's power up anyway?

> +static enum drm_connector_status ps8622_detect(struct drm_connector *con=
nector,
> +		bool force)

Alignment here is slightly odd. We usually follow (in DRM and many other
parts of the kernel) the convention of aligning arguments on subsequent
lines with the first argument on the first line.

> +int ps8622_post_encoder_init(struct drm_bridge *bridge)
> +{
> +	struct ps8622_bridge *ps_bridge =3D bridge->driver_private;
> +	int ret;
> +
> +	/* bridge is attached to encoder.
> +	 * safe to remove it from the bridge_lookup table.
> +	 */
> +	drm_bridge_remove_from_lookup(bridge);

Like I said for the ptn3460 driver, this should not be here.

> +	ret =3D drm_bridge_init(bridge->drm_dev, bridge);
> +	if (ret) {
> +		DRM_ERROR("Failed to initialize bridge with drm\n");
> +		return ret;
> +	}

And this should probably happen somewhere else to avoid having to do it
for every driver.

> +static const struct of_device_id ps8622_devices[] =3D {
> +	{
> +		.compatible =3D "parade,ps8622",
> +		.data	=3D &ps8622_data,
> +	}, {
> +		.compatible =3D "parade,ps8625",
> +		.data	=3D &ps8625_data,
> +	}, {

The above uses a mix of spaces and tabs for padding (tabs between .data
and =3D). Single spaces will do.

> +		/* end node */

Nit: it's not a node, it's an entry or element.

> +	}
> +};
> +MODULE_DEVICE_TABLE(of, ps8622_devices);
> +
> +static inline struct ps8622_device_data *get_device_data(struct device *=
dev)
> +{
> +	const struct of_device_id *match =3D
> +			of_match_device(ps8622_devices, dev);
> +
> +	return (struct ps8622_device_data *)match->data;
> +}

Please drop this. First of all, match->data is void *, so there's no
need for the explicit casting. Second, match->data is also const, so
you're effectively casting that away.

> +
> +static int ps8622_probe(struct i2c_client *client,
> +					const struct i2c_device_id *id)
> +{
> +	struct device *dev =3D &(client->dev);

No need for the parentheses here.

> +	struct device_node *panel_node, *backlight_node;
> +	struct drm_bridge *bridge;
> +	struct backlight_device *backlight_dev;
> +	struct ps8622_bridge *ps_bridge;

Have you considered naming this simply "ps" to make it shorter? There's
some weird formatting below just because this is a very long variable
name.

> +	const struct ps8622_device_data *device_data;
> +	int ret;

It's just as easy (and shorter) to do this here:

	const struct ps8622_device_data *data;
	const struct of_device_id *match;

	match =3D of_match_device(ps8622_devices, dev);
	data =3D match->data;

> +	bridge =3D devm_kzalloc(dev, sizeof(*bridge), GFP_KERNEL);
> +	if (!bridge) {
> +		DRM_ERROR("Failed to allocate drm bridge\n");
> +		return -ENOMEM;
> +	}
> +
> +	ps_bridge =3D devm_kzalloc(dev, sizeof(*ps_bridge), GFP_KERNEL);
> +	if (!ps_bridge) {
> +		DRM_ERROR("could not allocate ps bridge\n");
> +		return -ENOMEM;
> +	}
> +
> +	panel_node =3D of_parse_phandle(dev->of_node, "panel", 0);
> +	if (panel_node) {
> +		ps_bridge->panel =3D of_drm_find_panel(panel_node);
> +		of_node_put(panel_node);
> +		if (!ps_bridge->panel)
> +			return -EPROBE_DEFER;
> +	}
> +
> +	backlight_dev =3D NULL;

It's more idiomatic to initialize these when you declare them to avoid
sprinkling them across the code like this.

> +	backlight_node =3D of_parse_phandle(dev->of_node, "backlight", 0);
> +	if (backlight_node) {
> +		backlight_dev =3D of_find_backlight_by_node(backlight_node);
> +		of_node_put(backlight_node);
> +		if (!backlight_dev)
> +			return -EPROBE_DEFER;

It seems like in this case you aren't storing the backlight anywhere. Is
there a reason for that? Is it because the same backlight is used by the
panel driver and it does the controlling from there? If so it might be
better to use a boolean property here rather than a phandle to another
backlight device. Using a phandle usually signal that you do want to use
the device in some way.

> +	}
> +
> +	mutex_init(&ps_bridge->enable_mutex);
> +
> +	bridge->dev =3D dev;
> +	bridge->driver_private =3D ps_bridge;
> +	bridge->funcs =3D &ps8622_bridge_funcs;
> +
> +	ps_bridge->client =3D client;
> +	ps_bridge->bridge =3D bridge;
> +
> +	device_data =3D get_device_data(dev);
> +
> +	ps_bridge->v12 =3D devm_regulator_get(&client->dev, "vdd_bridge");

vdd_bridge is not a valid name for a regulator. This will translate to
vdd_bridge-supply for a DT property and you shouldn't be using
underscores for them. Also this property isn't documented in the
binding.

> +	if (IS_ERR(ps_bridge->v12)) {
> +		DRM_INFO("no 1.2v regulator found for PS8622\n");
> +		ps_bridge->v12 =3D NULL;
> +	}

Does this ever happen? As far as I know the regulator core will give you
a dummy regulator when booting using DT, so errors returned here will
always be real errors that you likely won't want to ignore.

> +
> +	ps_bridge->gpio_slp_n =3D devm_gpiod_get(&client->dev, "sleep");
> +	if (IS_ERR(ps_bridge->gpio_slp_n)) {
> +		ret =3D PTR_ERR(ps_bridge->gpio_slp_n);
> +		DRM_ERROR("cannot get gpio_slp_n %d\n", ret);
> +		goto err_client;
> +	} else {
> +		ret =3D gpiod_direction_output(ps_bridge->gpio_slp_n, 1);
> +		if (ret) {
> +			DRM_ERROR("cannot configure gpio_slp_n\n");
> +			goto err_client;
> +		}
> +	}
> +
> +	ps_bridge->gpio_rst_n =3D devm_gpiod_get(&client->dev, "reset");
> +	if (IS_ERR(ps_bridge->gpio_rst_n)) {
> +		ret =3D PTR_ERR(ps_bridge->gpio_rst_n);
> +		DRM_ERROR("cannot get gpio_rst_n %d\n", ret);
> +		goto err_client;
> +	} else {
> +		/*
> +		 * Assert the reset pin high to avoid the bridge being
> +		 * initialized prematurely
> +		 */
> +		ret =3D gpiod_direction_output(ps_bridge->gpio_rst_n, 1);
> +		if (ret) {
> +			DRM_ERROR("cannot configure gpio_slp_n\n");
> +			goto err_client;
> +		}
> +	}

Just as a side-note, there's an API under discussion that will allow
gpio_desc's to be configured at the same time as they are requested.
This driver should probably convert to that API.

> +	ps_bridge->max_lane_count =3D device_data->max_lane_count;
> +
> +	if (of_property_read_u8(dev->of_node, "lane-count",
> +						&ps_bridge->lane_count))
> +		ps_bridge->lane_count =3D ps_bridge->max_lane_count;
> +	else if (ps_bridge->lane_count > ps_bridge->max_lane_count) {
> +		DRM_INFO("lane-count property is too high for DP bridge\n");
> +		ps_bridge->lane_count =3D ps_bridge->max_lane_count;
> +	}

Perhaps this should clarify that you're falling back to max_lane_count.

> +
> +	if (!backlight_dev) {
> +		ps_bridge->bl =3D backlight_device_register("ps8622-backlight",
> +				dev, ps_bridge, &ps8622_backlight_ops,
> +				NULL);
> +		if (IS_ERR(ps_bridge->bl)) {
> +			DRM_ERROR("failed to register backlight\n");
> +			ret =3D PTR_ERR(ps_bridge->bl);
> +			ps_bridge->bl =3D NULL;

No need to set this to NULL since you'll return with an error and
ps_bridge will be freed.

> +			goto err_client;
> +		}
> +		ps_bridge->bl->props.max_brightness =3D PS8622_MAX_BRIGHTNESS;
> +		ps_bridge->bl->props.brightness =3D PS8622_MAX_BRIGHTNESS;

Perhaps you want to initialize bl->props.power to FB_BLANK_POWERDOWN at
this point. The reason is that if you don't then the backlight will be
on by default (FB_BLANK_UNBLANK =3D=3D 0). Many backlight drivers do call
backlight_update_status() after registering with the core to set the
initial state. It looks like you're not doing that here, but it might be
better to still set this to reflect what the initial state should be.

I'm assuming you want it disabled to avoid visual glitches when you turn
on the display. Of course if the bootloader already turned it on and
initialized the display, then you'll get flickering... but I guess
that's a problem to solve another day.

> +	}
> +
> +	i2c_set_clientdata(client, ps_bridge);
> +
> +	drm_bridge_add_for_lookup(bridge);
> +
> +	return 0;
> +
> +err_client:
> +	DRM_ERROR("device probe failed : %d\n", ret);

No need for this. The driver core typically tells you already.

> +static int ps8622_remove(struct i2c_client *client)
> +{
> +	struct ps8622_bridge *ps_bridge =3D i2c_get_clientdata(client);
> +
> +	if (ps_bridge->bl)
> +		backlight_device_unregister(ps_bridge->bl);
> +
> +	return 0;
> +}

You'll also want to call drm_bridge_remove() here.

> +static const struct i2c_device_id ps8622_i2c_table[] =3D {
> +	{"parade", 0},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(i2c, ps8622_i2c_table);

This table doesn't look right. Shouldn't that be:

	{ "ps8622", 0 },
	{ "ps8625", 0 },

? And perhaps use the .driver_data field to refer to the device data
like for the of_device_id table?

> +struct i2c_driver ps8622_driver =3D {
> +	.id_table	=3D ps8622_i2c_table,
> +	.probe		=3D ps8622_probe,
> +	.remove		=3D ps8622_remove,
> +	.driver		=3D {
> +		.name	=3D "parade",

That's an awfully generic name. I'd suggest "ps8622".

> +		.owner	=3D THIS_MODULE,
> +		.of_match_table =3D of_match_ptr(ps8622_devices),

As for ptn3460, this has a hard dependency on OF, so of_match_ptr()
isn't useful.

> +	},
> +};
> +module_i2c_driver(ps8622_driver);
> +
> +MODULE_AUTHOR("Vincent Palatin <vpalatin@chromium.org>");
> +MODULE_DESCRIPTION("Parade ps8622 eDP-LVDS converter driver");
> +MODULE_LICENSE("GPL");

"GPL v2"

Thierry

--u3W6riq+uV6J42Ub
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT2O78AAoJEN0jrNd/PrOhre0QAL/9hpYQl/xJxU5YifHSuwdX
aiv+H1JfWFbZoy0/8IjnJv5pgopvYfBjjUwk4bXHruP5Hg6nwr+LPrY9DqntEIWs
IuALBsKQkZO7XSLvILa/22TDaacYmaZQYbR1cWztBD4sNjtO98H9eeS5/thQVeHY
ciAYWQCK4kZM/dh1FTBrcVO8NPSCG+ficsqqnlRCEHqxceo3WLuDj3BpOibR0DAe
hnBMvDbNVm9xL33dYOjftc3XRs94imAR3PDcjL9Z2xO75a1/44AFCRg8hRnbx8U4
cQWDA7KOmJ4RfaEuc/LrF+BzVdfzd+c2oTB5dkxWYKSJSHWW6N6WJunz2Bv/JOc7
HGjUsbYnY5gII9BUDcjhQTGJb+pNk8wpwXb9H3uODt3KPcVOgBtPOD9mAEoWrhMW
/zHlGdR6RVEZilvk83P3T+B8dgS6+/dJs6LN+SCFJ/tIvVTuwYpy3VvxT7f3qEte
6dp7ACls4eDlMf5hdZwHgwWBMND0mryuE+xhigmDpgN7VRobuKf5L2UN8NFdACeA
VeNvMRgEsBsebZbtgkUHTUkVlA8d44jBG/mwyvyGaN8NxQ35vBq1k6CvzzEQAaYD
ElOTPiSrPR99WnRE6/EE1eSmZYG1u6g+PBDVjNgIjXPeXGSJcHY/k/fvm7Ow88un
2Ziy5J1AqJxlOW/vUcrc
=T0/N
-----END PGP SIGNATURE-----

--u3W6riq+uV6J42Ub--

--===============1802907291==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1802907291==--
