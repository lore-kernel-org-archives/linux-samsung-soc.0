From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH V2 8/9] drm/bridge: Add PS8622 bridge driver
Date: Tue, 22 Apr 2014 17:43:52 +0900
Message-ID: <004001cf5e06$fccf1c00$f66d5400$%han@samsung.com>
References: <1398119958-32005-1-git-send-email-ajaykumar.rs@samsung.com>
 <1398119958-32005-9-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1398119958-32005-9-git-send-email-ajaykumar.rs@samsung.com>
Content-language: ko
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: 'Ajay Kumar' <ajaykumar.rs@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, seanpaul@google.com, 'Andrew Bresticker' <abrestic@chromium.org>, joshi@samsung.com, dri-devel@lists.freedesktop.org, ajaynumb@gmail.com, prashanth.g@samsung.com, 'Rahul Sharma' <rahul.sharma@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Tuesday, April 22, 2014 7:39 AM, Ajay Kumar wrote:
> 
> This patch adds a drm_bridge driver for the PS8622 DisplayPort to LVDS
> bridge chip.
> 
> Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
> Changes since V1:
> 	Pushing V1 for this as V2 because this patch holds good in this series.
> 
>  drivers/gpu/drm/bridge/Kconfig  |    7 +
>  drivers/gpu/drm/bridge/Makefile |    1 +
>  drivers/gpu/drm/bridge/ps8622.c |  566 +++++++++++++++++++++++++++++++++++++++
>  include/drm/bridge/ps8622.h     |   42 +++
>  4 files changed, 616 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/ps8622.c
>  create mode 100644 include/drm/bridge/ps8622.h
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index 3bc6845..aba21fc 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -4,3 +4,10 @@ config DRM_PTN3460
>  	select DRM_KMS_HELPER
>  	select DRM_PANEL
>  	---help---
> +
> +config DRM_PS8622
> +	tristate "Parade eDP/LVDS bridge"
> +	depends on DRM
> +	select DRM_KMS_HELPER
> +	select DRM_PANEL

Please add the following select.

+       select BACKLIGHT_LCD_SUPPORT
+       select BACKLIGHT_CLASS_DEVICE

Without this, the following build issues happen.

drivers/gpu/drm/bridge/ps8622.c:353: undefined reference to `backlight_device_unregister'
drivers/built-in.o: In function `ps8622_init':
drivers/gpu/drm/bridge/ps8622.c:559: undefined reference to `backlight_device_unregister'
drivers/gpu/drm/bridge/ps8622.c:507: undefined reference to `backlight_device_register'

> +	---help---
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index b4733e1..d1b5daa 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -1,3 +1,4 @@
>  ccflags-y := -Iinclude/drm
> 
>  obj-$(CONFIG_DRM_PTN3460) += ptn3460.o
> +obj-$(CONFIG_DRM_PS8622) += ps8622.o
> diff --git a/drivers/gpu/drm/bridge/ps8622.c b/drivers/gpu/drm/bridge/ps8622.c
> new file mode 100644
> index 0000000..1e6b3ca
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/ps8622.c

[.....]

> +static int ps8622_send_config(struct ps8622_bridge *ps_bridge)
> +{
> +	struct i2c_client *cl = ps_bridge->client;
> +	int err = 0;
> +
> +	/* wait 20ms after power ON */
> +	usleep_range(20000, 30000);
> +
> +	err |= ps8622_set(cl, 0x02, 0xa1, 0x01); /* HPD low */
> +	/* SW setting */
> +	err |= ps8622_set(cl, 0x04, 0x14, 0x01); /* [1:0] SW output 1.2V voltage
> +						  * is lower to 96% */

The comment style looks awkward.
Please choose one of two options. And change all comments in this file.

1. 

+	/* SW setting */
+	err |= ps8622_set(cl, 0x04, 0x14, 0x01); /* [1:0] SW output 1.2V voltage is lower to 96% */

2. 

+	/* SW setting */
+	/* [1:0] SW output 1.2V voltage is lower to 96% */
+	err |= ps8622_set(cl, 0x04, 0x14, 0x01);


> +	/* RCO SS setting */
> +	err |= ps8622_set(cl, 0x04, 0xe3, 0x20); /* [5:4] = b01 0.5%, b10 1%,
> +						  * b11 1.5% */
> +	err |= ps8622_set(cl, 0x04, 0xe2, 0x80); /* [7] RCO SS enable */
> +	/* RPHY Setting */
> +	err |= ps8622_set(cl, 0x04, 0x8a, 0x0c); /* [3:2] CDR tune wait cycle
> +						  * before measure for fine tune
> +						  * b00: 1us b01: 0.5us b10:2us
> +						  * b11: 4us */
> +	err |= ps8622_set(cl, 0x04, 0x89, 0x08); /* [3] RFD always on */
> +	err |= ps8622_set(cl, 0x04, 0x71, 0x2d); /* CTN lock in/out:
> +						  * 20000ppm/80000ppm.
> +						  * Lock out 2 times. */
> +	/* 2.7G CDR settings */
> +	err |= ps8622_set(cl, 0x04, 0x7d, 0x07); /* NOF=40LSB for HBR CDR
> +						  * setting */
> +	err |= ps8622_set(cl, 0x04, 0x7b, 0x00); /* [1:0] Fmin=+4bands */
> +	err |= ps8622_set(cl, 0x04, 0x7a, 0xfd); /* [7:5] DCO_FTRNG=+-40% */
> +	/* 1.62G CDR settings */
> +	err |= ps8622_set(cl, 0x04, 0xc0, 0x12); /* [5:2]NOF=64LSB [1:0]DCO
> +						  * scale is 2/5 */
> +	err |= ps8622_set(cl, 0x04, 0xc1, 0x92); /* Gitune=-37% */
> +	err |= ps8622_set(cl, 0x04, 0xc2, 0x1c); /* Fbstep=100% */
> +	err |= ps8622_set(cl, 0x04, 0x32, 0x80); /* [7] LOS signal disable */
> +	/* RPIO Setting */
> +	err |= ps8622_set(cl, 0x04, 0x00, 0xb0); /* [7:4] LVDS driver bias
> +						  * current : 75% (250mV swing)
> +						  * */
> +	err |= ps8622_set(cl, 0x04, 0x15, 0x40); /* [7:6] Right-bar GPIO output
> +						  * strength is 8mA */
> +	/* EQ Training State Machine Setting */
> +	err |= ps8622_set(cl, 0x04, 0x54, 0x10); /* RCO calibration start */
> +	/* Logic, needs more than 10 I2C command */
> +	err |= ps8622_set(cl, 0x01, 0x02, 0x80 | ps_bridge->max_lane_count);
> +						 /* [4:0] MAX_LANE_COUNT set to
> +						  * max supported lanes */
> +	err |= ps8622_set(cl, 0x01, 0x21, 0x80 | ps_bridge->lane_count);
> +						 /* [4:0] LANE_COUNT_SET set to
> +						  * chosen lane count */
> +	err |= ps8622_set(cl, 0x00, 0x52, 0x20);
> +	err |= ps8622_set(cl, 0x00, 0xf1, 0x03); /* HPD CP toggle enable */
> +	err |= ps8622_set(cl, 0x00, 0x62, 0x41);
> +	err |= ps8622_set(cl, 0x00, 0xf6, 0x01); /* Counter number, add 1ms
> +						  * counter delay */
> +	err |= ps8622_set(cl, 0x00, 0x77, 0x06); /* [6]PWM function control by
> +						  * DPCD0040f[7], default is PWM
> +						  * block always works. */
> +	err |= ps8622_set(cl, 0x00, 0x4c, 0x04); /* 04h Adjust VTotal tolerance
> +						  * to fix the 30Hz no display
> +						  * issue */
> +	err |= ps8622_set(cl, 0x01, 0xc0, 0x00); /* DPCD00400='h00, Parade OUI =
> +						  * 'h001cf8 */
> +	err |= ps8622_set(cl, 0x01, 0xc1, 0x1c); /* DPCD00401='h1c */
> +	err |= ps8622_set(cl, 0x01, 0xc2, 0xf8); /* DPCD00402='hf8 */
> +	err |= ps8622_set(cl, 0x01, 0xc3, 0x44); /* DPCD403~408 = ASCII code
> +						  * D2SLV5='h4432534c5635 */
> +	err |= ps8622_set(cl, 0x01, 0xc4, 0x32); /* DPCD404 */
> +	err |= ps8622_set(cl, 0x01, 0xc5, 0x53); /* DPCD405 */
> +	err |= ps8622_set(cl, 0x01, 0xc6, 0x4c); /* DPCD406 */
> +	err |= ps8622_set(cl, 0x01, 0xc7, 0x56); /* DPCD407 */
> +	err |= ps8622_set(cl, 0x01, 0xc8, 0x35); /* DPCD408 */
> +	err |= ps8622_set(cl, 0x01, 0xca, 0x01); /* DPCD40A, Initial Code major
> +						  * revision '01' */
> +	err |= ps8622_set(cl, 0x01, 0xcb, 0x05); /* DPCD40B, Initial Code minor
> +						  * revision '05' */
> +	if (ps_bridge->bl) {
> +		err |= ps8622_set(cl, 0x01, 0xa5, 0xa0);
> +						/* DPCD720, internal PWM */
> +		err |= ps8622_set(cl, 0x01, 0xa7,
> +				ps_bridge->bl->props.brightness);
> +						 /* FFh for 100% brightness,
> +						  *  0h for 0% brightness */
> +	} else {
> +		err |= ps8622_set(cl, 0x01, 0xa5, 0x80);
> +						/* DPCD720, external PWM */
> +	}
> +	err |= ps8622_set(cl, 0x01, 0xcc, 0x13); /* Set LVDS output as 6bit-VESA
> +						  * mapping, single LVDS channel
> +						  * */
> +	err |= ps8622_set(cl, 0x02, 0xb1, 0x20); /* Enable SSC set by register
> +						  * */
> +	err |= ps8622_set(cl, 0x04, 0x10, 0x16); /* Set SSC enabled and +/-1%
> +						  * central spreading */
> +	/* Logic end */
> +	err |= ps8622_set(cl, 0x04, 0x59, 0x60); /* MPU Clock source: LC => RCO
> +						  * */
> +	err |= ps8622_set(cl, 0x04, 0x54, 0x14); /* LC -> RCO */
> +	err |= ps8622_set(cl, 0x02, 0xa1, 0x91); /* HPD high */
> +
> +	return err ? -EIO : 0;
> +}
> +

[.....]

> +
> +static void ps8622_pre_enable(struct drm_bridge *bridge)
> +{
> +	struct ps8622_bridge *ps_bridge = bridge->driver_private;
> +	int ret;
> +
> +	mutex_lock(&ps_bridge->enable_mutex);
> +	if (ps_bridge->enabled)
> +		goto out;
> +
> +	if (gpio_is_valid(ps_bridge->gpio_rst_n))
> +		gpio_set_value(ps_bridge->gpio_rst_n, 0);
> +
> +	if (ps_bridge->v12) {
> +		ret = regulator_enable(ps_bridge->v12);
> +		if (ret)
> +			DRM_ERROR("fails to enable ps_bridge->v12");
> +	}
> +
> +	drm_panel_pre_enable(ps_bridge->panel);
> +
> +	if (gpio_is_valid(ps_bridge->gpio_slp_n))
> +		gpio_set_value(ps_bridge->gpio_slp_n, 1);
> +
> +	/*
> +	 * T1 is the range of time that it takes for the power to rise after we
> +	 * enable the lcd fet. T2 is the range of time in which the data sheet
> +	 * specifies we should deassert the reset pin.
> +	 *
> +	 * If it takes T1.max for the power to rise, we need to wait atleast
> +	 * T2.min before deasserting the reset pin. If it takes T1.min for the
> +	 * power to rise, we need to wait at most T2.max before deasserting the
> +	 * reset pin.
> +	 */
> +	usleep_range(PS8622_RST_HIGH_T2_MIN_US + PS8622_POWER_RISE_T1_MAX_US,
> +		     PS8622_RST_HIGH_T2_MAX_US + PS8622_POWER_RISE_T1_MIN_US);
> +
> +	if (gpio_is_valid(ps_bridge->gpio_rst_n))
> +		gpio_set_value(ps_bridge->gpio_rst_n, 1);
> +
> +	ret = ps8622_send_config(ps_bridge);
> +	if (ret)
> +		DRM_ERROR("Failed to send config to bridge (%d)\n", ret);
> +
> +	ps_bridge->enabled = true;
> +
> +	mutex_unlock(&ps_bridge->enable_mutex);
> +	return;
> +
> +out:
> +
> +	mutex_unlock(&ps_bridge->enable_mutex);
> +}

mutex_unlock() is duplicated. Also, 'return' is unnecessary.
Please fix it as below.

+	ps_bridge->enabled = true;
+
+out:
+	mutex_unlock(&ps_bridge->enable_mutex);
+}

> +
> +static void ps8622_enable(struct drm_bridge *bridge)
> +{
> +	struct ps8622_bridge *ps_bridge = bridge->driver_private;
> +
> +	mutex_lock(&ps_bridge->enable_mutex);
> +	if (ps_bridge->enabled)
> +		drm_panel_enable(ps_bridge->panel);
> +	mutex_unlock(&ps_bridge->enable_mutex);
> +}
> +
> +static void ps8622_disable(struct drm_bridge *bridge)
> +{
> +	struct ps8622_bridge *ps_bridge = bridge->driver_private;
> +
> +	mutex_lock(&ps_bridge->enable_mutex);
> +
> +	if (!ps_bridge->enabled)
> +		goto out;
> +
> +	ps_bridge->enabled = false;
> +
> +	drm_panel_disable(ps_bridge->panel);
> +	msleep(PS8622_PWMO_END_T12_MS);
> +
> +	/*
> +	 * This doesn't matter if the regulators are turned off, but something
> +	 * else might keep them on. In that case, we want to assert the slp gpio
> +	 * to lower power.
> +	 */
> +	if (gpio_is_valid(ps_bridge->gpio_slp_n))
> +		gpio_set_value(ps_bridge->gpio_slp_n, 0);
> +
> +	drm_panel_post_disable(ps_bridge->panel);
> +	if (ps_bridge->v12)
> +		regulator_disable(ps_bridge->v12);
> +
> +	/*
> +	 * Sleep for at least the amount of time that it takes the power rail to
> +	 * fall to prevent asserting the rst gpio from doing anything.
> +	 */
> +	usleep_range(PS8622_POWER_FALL_T16_MAX_US,
> +		     2 * PS8622_POWER_FALL_T16_MAX_US);
> +	if (gpio_is_valid(ps_bridge->gpio_rst_n))
> +		gpio_set_value(ps_bridge->gpio_rst_n, 0);
> +
> +	msleep(PS8622_POWER_OFF_T17_MS);
> +
> +out:
> +	mutex_unlock(&ps_bridge->enable_mutex);
> +}
> +
> +static void ps8622_post_disable(struct drm_bridge *bridge)
> +{
> +}

How about just removing this empty function?

[.....]

Best regards,
Jingoo Han
