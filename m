From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [RFC v2 PATCH v3 10/14] drm/panel: add S6E3FA0 driver
Date: Wed, 23 Apr 2014 12:16:48 +0200
Message-ID: <53579310.6030301@samsung.com>
References: <1398083321-8668-1-git-send-email-yj44.cho@samsung.com>
 <1398083321-8668-11-git-send-email-yj44.cho@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1398083321-8668-11-git-send-email-yj44.cho@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: YoungJun Cho <yj44.cho@samsung.com>, airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sachin.kamat@linaro.org, sw0312.kim@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, laurent.pinchart@ideasonboard.com, galak@codeaurora.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi YoungJun,


On 04/21/2014 02:28 PM, YoungJun Cho wrote:
> This patch adds MIPI-DSI command mode based S6E3FA0 AMOLED LCD Panel driver.
> 
> Changelog v2:
> - Declares delay, size properties in probe routine instead of DT
> Changelog v3:
> - Moves CPU timings relevant properties from FIMD DT
>   (commented by Laurent Pinchart, Andrzej Hajda)
> 
> Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
> Acked-by: Inki Dae <inki.dae@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  drivers/gpu/drm/panel/Kconfig         |    7 +
>  drivers/gpu/drm/panel/Makefile        |    1 +
>  drivers/gpu/drm/panel/panel-s6e3fa0.c |  569 +++++++++++++++++++++++++++++++++
>  3 files changed, 577 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-s6e3fa0.c
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 4ec874d..be1392e 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -30,4 +30,11 @@ config DRM_PANEL_S6E8AA0
>  	select DRM_MIPI_DSI
>  	select VIDEOMODE_HELPERS
>  
> +config DRM_PANEL_S6E3FA0
> +	tristate "S6E3FA0 DSI command mode panel"
> +	depends on DRM && DRM_PANEL
> +	depends on OF
> +	select DRM_MIPI_DSI
> +	select VIDEOMODE_HELPERS
> +
>  endmenu
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index 8b92921..85c6738 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -1,3 +1,4 @@
>  obj-$(CONFIG_DRM_PANEL_SIMPLE) += panel-simple.o
>  obj-$(CONFIG_DRM_PANEL_LD9040) += panel-ld9040.o
>  obj-$(CONFIG_DRM_PANEL_S6E8AA0) += panel-s6e8aa0.o
> +obj-$(CONFIG_DRM_PANEL_S6E3FA0) += panel-s6e3fa0.o
> diff --git a/drivers/gpu/drm/panel/panel-s6e3fa0.c b/drivers/gpu/drm/panel/panel-s6e3fa0.c
> new file mode 100644
> index 0000000..1282678
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-s6e3fa0.c
> @@ -0,0 +1,569 @@
> +/*
> + * MIPI-DSI based s6e3fa0 AMOLED LCD 5.7 inch panel driver.
> + *
> + * Copyright (c) 2014 Samsung Electronics Co., Ltd
> + *
> + * YoungJun Cho <yj44.cho@samsung.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#include <drm/drmP.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_panel.h>
> +
> +#include <linux/gpio.h>
> +#include <linux/of_gpio.h>


#include <linux/gpio/consumer.h> should be enough.


> +#include <linux/regulator/consumer.h>
> +
> +#include <video/mipi_display.h>
> +#include <video/of_videomode.h>
> +#include <video/videomode.h>
> +
> +#define MTP_ID_LEN		3
> +#define GAMMA_LEVEL_NUM		30
> +
> +struct s6e3fa0 {
> +	struct device			*dev;
> +	struct drm_panel		panel;
> +
> +	struct regulator_bulk_data	supplies[2];
> +	struct gpio_desc		*reset_gpio;
> +	struct gpio_desc		*det_gpio;
> +	struct gpio_desc		*te_gpio;
> +	struct videomode		vm;
> +	struct drm_panel_cpu_timings	cpu_timings;
> +
> +	unsigned int			power_on_delay;
> +	unsigned int			reset_delay;
> +	unsigned int			init_delay;
> +	unsigned int			width_mm;
> +	unsigned int			height_mm;
> +
> +	unsigned char			id;
> +	unsigned char			vddm;
> +	unsigned int			brightness;
> +};
> +
> +#define panel_to_s6e3fa0(p) container_of(p, struct s6e3fa0, panel)
> +
> +static const unsigned char s6e3fa0_vddm_lut[][2] = {
> +	{0x00, 0x0d}, {0x01, 0x0d}, {0x02, 0x0e}, {0x03, 0x0f}, {0x04, 0x10},
> +	{0x05, 0x11}, {0x06, 0x12}, {0x07, 0x13}, {0x08, 0x14}, {0x09, 0x15},
> +	{0x0a, 0x16}, {0x0b, 0x17}, {0x0c, 0x18}, {0x0d, 0x19}, {0x0e, 0x1a},
> +	{0x0f, 0x1b}, {0x10, 0x1c}, {0x11, 0x1d}, {0x12, 0x1e}, {0x13, 0x1f},
> +	{0x14, 0x20}, {0x15, 0x21}, {0x16, 0x22}, {0x17, 0x23}, {0x18, 0x24},
> +	{0x19, 0x25}, {0x1a, 0x26}, {0x1b, 0x27}, {0x1c, 0x28}, {0x1d, 0x29},
> +	{0x1e, 0x2a}, {0x1f, 0x2b}, {0x20, 0x2c}, {0x21, 0x2d}, {0x22, 0x2e},
> +	{0x23, 0x2f}, {0x24, 0x30}, {0x25, 0x31}, {0x26, 0x32}, {0x27, 0x33},
> +	{0x28, 0x34}, {0x29, 0x35}, {0x2a, 0x36}, {0x2b, 0x37}, {0x2c, 0x38},
> +	{0x2d, 0x39}, {0x2e, 0x3a}, {0x2f, 0x3b}, {0x30, 0x3c}, {0x31, 0x3d},
> +	{0x32, 0x3e}, {0x33, 0x3f}, {0x34, 0x3f}, {0x35, 0x3f}, {0x36, 0x3f},
> +	{0x37, 0x3f}, {0x38, 0x3f}, {0x39, 0x3f}, {0x3a, 0x3f}, {0x3b, 0x3f},
> +	{0x3c, 0x3f}, {0x3d, 0x3f}, {0x3e, 0x3f}, {0x3f, 0x3f}, {0x40, 0x0c},
> +	{0x41, 0x0b}, {0x42, 0x0a}, {0x43, 0x09}, {0x44, 0x08}, {0x45, 0x07},
> +	{0x46, 0x06}, {0x47, 0x05}, {0x48, 0x04}, {0x49, 0x03}, {0x4a, 0x02},
> +	{0x4b, 0x01}, {0x4c, 0x40}, {0x4d, 0x41}, {0x4e, 0x42}, {0x4f, 0x43},
> +	{0x50, 0x44}, {0x51, 0x45}, {0x52, 0x46}, {0x53, 0x47}, {0x54, 0x48},
> +	{0x55, 0x49}, {0x56, 0x4a}, {0x57, 0x4b}, {0x58, 0x4c}, {0x59, 0x4d},
> +	{0x5a, 0x4e}, {0x5b, 0x4f}, {0x5c, 0x50}, {0x5d, 0x51}, {0x5e, 0x52},
> +	{0x5f, 0x53}, {0x60, 0x54}, {0x61, 0x55}, {0x62, 0x56}, {0x63, 0x57},
> +	{0x64, 0x58}, {0x65, 0x59}, {0x66, 0x5a}, {0x67, 0x5b}, {0x68, 0x5c},
> +	{0x69, 0x5d}, {0x6a, 0x5e}, {0x6b, 0x5f}, {0x6c, 0x60}, {0x6d, 0x61},
> +	{0x6e, 0x62}, {0x6f, 0x63}, {0x70, 0x64}, {0x71, 0x65}, {0x72, 0x66},
> +	{0x73, 0x67}, {0x74, 0x68}, {0x75, 0x69}, {0x76, 0x6a}, {0x77, 0x6b},
> +	{0x78, 0x6c}, {0x79, 0x6d}, {0x7a, 0x6e}, {0x7b, 0x6f}, {0x7c, 0x70},
> +	{0x7d, 0x71}, {0x7e, 0x72}, {0x7f, 0x73},
> +};


Some comment would be helpful.


> +
> +static int s6e3fa0_dcs_read(struct s6e3fa0 *ctx, unsigned char cmd,
> +							void *data, size_t len)
> +{
> +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> +
> +	return mipi_dsi_dcs_read(dsi, dsi->channel, cmd, data, len);
> +}
> +
> +static void s6e3fa0_dcs_write(struct s6e3fa0 *ctx, const void *data, size_t len)
> +{
> +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> +
> +	mipi_dsi_dcs_write(dsi, dsi->channel, data, len);
> +}
> +
> +#define s6e3fa0_dcs_write_seq(ctx, seq...)				\
> +do {									\
> +	const unsigned char d[] = { seq };				\
> +	BUILD_BUG_ON_MSG(ARRAY_SIZE(d) > 64, "too big seq for stack");	\
> +	s6e3fa0_dcs_write(ctx, d, ARRAY_SIZE(d));			\
> +} while (0)
> +
> +#define s6e3fa0_dcs_write_seq_static(ctx, seq...)			\
> +do {									\
> +	static const unsigned char d[] = { seq };			\
> +	s6e3fa0_dcs_write(ctx, d, ARRAY_SIZE(d));			\
> +} while (0)
> +
> +static void s6e3fa0_apply_level_1_key(struct s6e3fa0 *ctx)
> +{
> +	s6e3fa0_dcs_write_seq_static(ctx, 0xf0, 0x5a, 0x5a);
> +}
> +
> +static void s6e3fa0_apply_level_2_key(struct s6e3fa0 *ctx, bool on)
> +{
> +	if (on)
> +		s6e3fa0_dcs_write_seq_static(ctx, 0xfc, 0x5a, 0x5a);
> +	else
> +		s6e3fa0_dcs_write_seq_static(ctx, 0xfc, 0xa5, 0xa5);
> +}
> +
> +static void s6e3fa0_set_maximum_return_packet_size(struct s6e3fa0 *ctx,
> +							unsigned int size)
> +{
> +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> +	const struct mipi_dsi_host_ops *ops = dsi->host->ops;
> +
> +	if (ops && ops->transfer) {
> +		unsigned char buf[] = {size, 0};
> +		struct mipi_dsi_msg msg = {
> +			.channel = dsi->channel,
> +			.type = MIPI_DSI_SET_MAXIMUM_RETURN_PACKET_SIZE,
> +			.tx_len = sizeof(buf),
> +			.tx_buf = buf
> +		};
> +
> +		ops->transfer(dsi->host, &msg);
> +	}
> +}
> +
> +static void s6e3fa0_read_mtp_id(struct s6e3fa0 *ctx)
> +{
> +	unsigned char id[MTP_ID_LEN];
> +	int ret;
> +
> +	s6e3fa0_set_maximum_return_packet_size(ctx, MTP_ID_LEN);
> +	ret = s6e3fa0_dcs_read(ctx, 0x04, id, MTP_ID_LEN);
> +	if (ret < MTP_ID_LEN || id[0] == 0x00) {
> +		dev_err(ctx->dev, "failed to read id\n");
> +		return;
> +	}
> +
> +	dev_info(ctx->dev, "ID: 0x%02x, 0x%02x, 0x%02x\n", id[0], id[1], id[2]);
> +
> +	ctx->id = id[2];
> +}
> +
> +static void s6e3fa0_read_vddm(struct s6e3fa0 *ctx)
> +{
> +	unsigned char vddm;
> +	int ret;
> +
> +	s6e3fa0_apply_level_2_key(ctx, true);
> +	s6e3fa0_dcs_write_seq_static(ctx, 0xb0, 0x16);

It seems little bit cryptic, it would be better to document somehow
what this sequence is for. I guess datasheet provides at least
information what first byte means and standard says clearly that it is
DCS for values < 0xb0 and MCS (manufacturer command set) for values >=
0xb0. You can use defines to make it more readable. Please look at
panel-ld9040.c how it could be done.

s6e3fa0_dcs_write_seq_static(ctx, MCS_MANPWR, 0x16);

looks better. The same for other sequences.


> +	s6e3fa0_set_maximum_return_packet_size(ctx, 1);
> +	ret = s6e3fa0_dcs_read(ctx, 0xd7, &vddm, 1);
> +	s6e3fa0_apply_level_2_key(ctx, false);
> +
> +	if (ret < 1 || vddm > 0x7f) {
> +		dev_err(ctx->dev, "failed to read vddm\n");
> +		return;
> +	}
> +
> +	ctx->vddm = s6e3fa0_vddm_lut[vddm][1];

In case of error ctx->vddm is zero, and this value is used later by
s6e3fa0_set_etc_and_write_vddm. Is it OK?

Anyway it seems you do not care about DSI transmission errors at all in
most places. Maybe it will not hurt but IMO it is asking for troubles.


> +}
> +
> +static void s6e3fa0_set_pentile_control(struct s6e3fa0 *ctx)
> +{
> +	s6e3fa0_dcs_write_seq_static(ctx, 0xc0, 0x00, 0x02, 0x03, 0x32, 0x03,
> +				0x44, 0x44, 0xc0, 0x00, 0x1c, 0x20, 0xe8);
> +}
> +
> +static void s6e3fa0_write_als(struct s6e3fa0 *ctx)
> +{
> +	s6e3fa0_dcs_write_seq_static(ctx, 0xe3, 0xff, 0xff, 0xff, 0xff);
> +}
> +
> +static void s6e3fa0_set_readability_enhancement(struct s6e3fa0 *ctx)
> +{
> +	s6e3fa0_dcs_write_seq_static(ctx, 0xfe, 0x00, 0x03, 0xb0, 0x2b, 0xfe,
> +									0xe4);
> +}
> +
> +static void s6e3fa0_set_common_control(struct s6e3fa0 *ctx)
> +{
> +	s6e3fa0_set_pentile_control(ctx);
> +	s6e3fa0_write_als(ctx);
> +	s6e3fa0_set_readability_enhancement(ctx);
> +}
> +
> +static void s6e3fa0_set_gamma(struct s6e3fa0 *ctx)
> +{
> +	s6e3fa0_dcs_write_seq_static(ctx, 0xca, 0x01, 0x00, 0x01, 0x00, 0x01,
> +					0x00, 0x80, 0x80, 0x80, 0x80, 0x80,
> +					0x00, 0x80, 0x80, 0x80, 0x80, 0x80,
> +					0x00, 0x80, 0x80, 0x80, 0x80, 0x80,
> +					0x00, 0x80, 0x80, 0x80, 0x80, 0x80,
> +					0x00, 0x00, 0x00);
> +}
> +
> +static void s6e3fa0_set_aid(struct s6e3fa0 *ctx)
> +{
> +	s6e3fa0_dcs_write_seq_static(ctx, 0xb2, 0x00, 0x06, 0x00, 0x06);
> +}
> +
> +static void s6e3fa0_set_elvss(struct s6e3fa0 *ctx)
> +{
> +	s6e3fa0_dcs_write_seq_static(ctx, 0xb6, 0x88, 0x0a);
> +}
> +
> +static void s6e3fa0_update_panel(struct s6e3fa0 *ctx)
> +{
> +	s6e3fa0_dcs_write_seq_static(ctx, 0xf7, 0x03);
> +}
> +
> +static void s6e3fa0_write_acl(struct s6e3fa0 *ctx)
> +{
> +	s6e3fa0_dcs_write_seq_static(ctx, 0x55, 0x02);


That's strange beast. It should be DCS command but I do not see it in
spec. Specification violation???


> +}
> +
> +static void s6e3fa0_set_brightness_control(struct s6e3fa0 *ctx)
> +{
> +	s6e3fa0_set_gamma(ctx);
> +	s6e3fa0_set_aid(ctx);
> +	s6e3fa0_set_elvss(ctx);
> +	s6e3fa0_update_panel(ctx);
> +	s6e3fa0_write_acl(ctx);
> +}
> +
> +static void s6e3fa0_set_temperature(struct s6e3fa0 *ctx)
> +{
> +	s6e3fa0_dcs_write_seq_static(ctx, 0xb0, 0x05, 0xb8, 0x19);
> +}
> +
> +static void s6e3fa0_set_elvss_control(struct s6e3fa0 *ctx)
> +{
> +	s6e3fa0_set_temperature(ctx);
> +	s6e3fa0_set_elvss(ctx);
> +}
> +
> +static void s6e3fa0_set_te_on(struct s6e3fa0 *ctx)
> +{
> +	s6e3fa0_dcs_write_seq_static(ctx, 0x35, 0x00);


s6e3fa0_dcs_write_seq_static(ctx, MIPI_DCS_SET_TEAR_ON, 0x00);


> +}
> +
> +static void s6e3fa0_set_etc_and_write_vddm(struct s6e3fa0 *ctx)
> +{
> +	s6e3fa0_apply_level_2_key(ctx, true);
> +	s6e3fa0_dcs_write_seq(ctx, 0xed, 0x0c, 0x04, 0xff, 0x01, 0xb0, 0x16,
> +							0xd7, ctx->vddm);
> +	s6e3fa0_apply_level_2_key(ctx, false);
> +}
> +
> +static void s6e3fa0_set_etc_condition(struct s6e3fa0 *ctx)
> +{
> +	s6e3fa0_set_te_on(ctx);
> +	s6e3fa0_set_etc_and_write_vddm(ctx);
> +}
> +
> +static void s6e3fa0_panel_init(struct s6e3fa0 *ctx)
> +{
> +	s6e3fa0_set_common_control(ctx);
> +	s6e3fa0_set_brightness_control(ctx);
> +	s6e3fa0_set_elvss_control(ctx);
> +	s6e3fa0_set_etc_condition(ctx);
> +
> +	msleep(ctx->init_delay);
> +}
> +
> +static int s6e3fa0_power_off(struct s6e3fa0 *ctx)
> +{
> +	gpiod_set_value(ctx->reset_gpio, 0);
> +
> +	return regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +}
> +
> +static int s6e3fa0_power_on(struct s6e3fa0 *ctx)
> +{
> +	int ret;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +	if (ret)
> +		return ret;
> +
> +	msleep(ctx->power_on_delay);
> +
> +	gpiod_set_value(ctx->reset_gpio, 1);
> +	gpiod_set_value(ctx->reset_gpio, 0);
> +	usleep_range(1000, 2000);
> +	gpiod_set_value(ctx->reset_gpio, 1);
> +
> +	msleep(ctx->reset_delay);
> +
> +	return 0;
> +}
> +
> +static void s6e3fa0_set_sequence(struct s6e3fa0 *ctx)
> +{
> +	s6e3fa0_apply_level_1_key(ctx);
> +	s6e3fa0_dcs_write_seq_static(ctx, MIPI_DCS_EXIT_SLEEP_MODE);
> +	msleep(20);
> +
> +	s6e3fa0_read_mtp_id(ctx);
> +	s6e3fa0_read_vddm(ctx);
> +
> +	s6e3fa0_panel_init(ctx);
> +
> +	s6e3fa0_dcs_write_seq_static(ctx, MIPI_DCS_SET_DISPLAY_ON);
> +}
> +
> +static int s6e3fa0_disable(struct drm_panel *panel)
> +{
> +	struct s6e3fa0 *ctx = panel_to_s6e3fa0(panel);
> +
> +	s6e3fa0_dcs_write_seq_static(ctx, MIPI_DCS_ENTER_SLEEP_MODE);
> +	s6e3fa0_dcs_write_seq_static(ctx, MIPI_DCS_SET_DISPLAY_OFF);
> +	msleep(35);
> +
> +	return s6e3fa0_power_off(ctx);
> +}
> +
> +static int s6e3fa0_enable(struct drm_panel *panel)
> +{
> +	struct s6e3fa0 *ctx = panel_to_s6e3fa0(panel);
> +	int ret;
> +
> +	ret = s6e3fa0_power_on(ctx);
> +	if (ret)
> +		return ret;
> +
> +	s6e3fa0_set_sequence(ctx);
> +
> +	return ret;
> +}
> +
> +static int s6e3fa0_get_modes(struct drm_panel *panel)
> +{
> +	struct drm_connector *connector = panel->connector;
> +	struct s6e3fa0 *ctx = panel_to_s6e3fa0(panel);
> +	struct drm_display_mode *mode;
> +
> +	mode = drm_mode_create(connector->dev);
> +	if (!mode) {
> +		DRM_ERROR("failed to create a new display mode\n");
> +		return 0;
> +	}
> +
> +	drm_display_mode_from_videomode(&ctx->vm, mode);
> +	mode->width_mm = ctx->width_mm;
> +	mode->height_mm = ctx->height_mm;
> +	connector->display_info.width_mm = mode->width_mm;
> +	connector->display_info.height_mm = mode->height_mm;
> +
> +	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +	mode->private = (void *)&ctx->cpu_timings;
> +	drm_mode_probed_add(connector, mode);
> +
> +	return 1;
> +}
> +
> +static const struct drm_panel_funcs s6e3fa0_drm_funcs = {
> +	.disable	= s6e3fa0_disable,
> +	.enable		= s6e3fa0_enable,
> +	.get_modes	= s6e3fa0_get_modes,
> +};
> +
> +static int s6e3fa0_parse_dt(struct s6e3fa0 *ctx)
> +{
> +	struct device *dev = ctx->dev;
> +	struct device_node *np = dev->of_node, *cpu_timing_np;
> +	struct drm_panel_cpu_timings *cpu_timings = &ctx->cpu_timings;
> +	int ret;
> +
> +	ret = of_get_videomode(np, &ctx->vm, 0);
> +	if (ret) {
> +		dev_err(dev, "failed to get video mode: %d\n", ret);
> +		return ret;
> +	}
> +
> +	cpu_timing_np = of_find_node_by_name(np, "cpu-timings");
> +	if (!cpu_timing_np) {
> +		dev_err(dev, "failed to get cpu timings\n");
> +		return -EINVAL;
> +	}
> +	if (of_property_read_u32(cpu_timing_np, "cs-setup",
> +					&cpu_timings->cs_setup))
> +		cpu_timings->cs_setup = 0;
> +	if (of_property_read_u32(cpu_timing_np, "wr-setup",
> +					&cpu_timings->wr_setup))
> +		cpu_timings->wr_setup = 0;
> +	if (of_property_read_u32(cpu_timing_np, "wr-act",
> +					&cpu_timings->wr_act))
> +		cpu_timings->wr_act = 1;
> +	if (of_property_read_u32(cpu_timing_np, "wr-hold",
> +					&cpu_timings->wr_hold))
> +		cpu_timings->wr_hold = 0;

If I remember default values were not provided in bindings, please fix it.


> +	of_node_put(cpu_timing_np);
> +
> +	return 0;
> +}
> +
> +irqreturn_t s6e3fa0_det_interrupt(int irq, void *dev_id)
> +{
> +	/* TODO */
> +	return IRQ_HANDLED;
> +}
> +
> +irqreturn_t s6e3fa0_te_interrupt(int irq, void *dev_id)
> +{
> +	struct s6e3fa0 *ctx = dev_id;
> +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> +	struct mipi_dsi_host *host = dsi->host;
> +	const struct mipi_dsi_host_ops *ops = host->ops;
> +
> +	if (ops && ops->te_handler)
> +		ops->te_handler(host);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int s6e3fa0_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct s6e3fa0 *ctx;
> +	int ret;
> +
> +	ctx = devm_kzalloc(dev, sizeof(struct s6e3fa0), GFP_KERNEL);
> +	if (!ctx) {
> +		dev_err(dev, "failed to allocate s6e3fa0 structure.\n");
> +		return -ENOMEM;
> +	}
> +
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +
> +	ctx->dev = dev;
> +
> +	dsi->lanes = 4;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +
> +	ret = s6e3fa0_parse_dt(ctx);
> +	if (ret)
> +		return ret;
> +
> +	ctx->supplies[0].supply = "vdd3";
> +	ctx->supplies[1].supply = "vci";
> +	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies),
> +					ctx->supplies);
> +	if (ret) {
> +		dev_err(dev, "failed to get regulators: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ctx->reset_gpio = devm_gpiod_get(dev, "reset");
> +	if (IS_ERR(ctx->reset_gpio)) {
> +		dev_err(dev, "failed to get reset gpio: %ld\n",
> +						PTR_ERR(ctx->reset_gpio));
> +		return PTR_ERR(ctx->reset_gpio);
> +	}
> +	ret = gpiod_direction_output(ctx->reset_gpio, 1);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to configure reset gpio: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ctx->det_gpio = devm_gpiod_get(dev, "det");
> +	if (IS_ERR(ctx->det_gpio)) {
> +		dev_err(dev, "failed to get det gpio: %ld\n",
> +						PTR_ERR(ctx->det_gpio));
> +		return PTR_ERR(ctx->det_gpio);
> +	}
> +	ret = gpiod_direction_input(ctx->det_gpio);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to configure det gpio: %d\n", ret);
> +		return ret;
> +	}
> +	ret = devm_request_irq(dev, gpiod_to_irq(ctx->det_gpio),
> +						s6e3fa0_det_interrupt,
> +						IRQF_TRIGGER_FALLING,
> +						"oled-det", ctx);
> +	if (ret) {
> +		dev_err(dev, "failed to request det irq: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ctx->te_gpio = devm_gpiod_get(dev, "te");
> +	if (IS_ERR(ctx->te_gpio)) {
> +		dev_err(dev, "failed to get te gpio: %ld\n",
> +						PTR_ERR(ctx->te_gpio));
> +		return PTR_ERR(ctx->te_gpio);
> +	}
> +	ret = gpiod_direction_input(ctx->te_gpio);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to configure te gpio: %d\n", ret);
> +		return ret;
> +	}
> +	ret = devm_request_irq(dev, gpiod_to_irq(ctx->te_gpio),
> +						s6e3fa0_te_interrupt,
> +						IRQF_TRIGGER_RISING,
> +						"TE", ctx);
> +	if (ret) {
> +		dev_err(dev, "failed to request det irq: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ctx->power_on_delay = 10;
> +	ctx->reset_delay = 5;
> +	ctx->init_delay = 120;
> +	ctx->width_mm = 71;
> +	ctx->height_mm = 126;
> +
> +	ctx->brightness = GAMMA_LEVEL_NUM - 1;
> +
> +	drm_panel_init(&ctx->panel);
> +	ctx->panel.dev = dev;
> +	ctx->panel.funcs = &s6e3fa0_drm_funcs;
> +
> +	ret = drm_panel_add(&ctx->panel);
> +	if (ret)
> +		return ret;
> +
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret)
> +		drm_panel_remove(&ctx->panel);
> +
> +	return ret;
> +}
> +
> +static int s6e3fa0_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct s6e3fa0 *ctx = mipi_dsi_get_drvdata(dsi);
> +
> +	s6e3fa0_power_off(ctx);


In case panel is off this will lead to double disable of regulators.

In general mipi_dsi_detach should be enough, it will trigger hpd,
which will set dpms to off, which will call s6e3fa0_power_off.


Regards
Andrzej


> +
> +	mipi_dsi_detach(dsi);
> +	drm_panel_remove(&ctx->panel);
> +
> +	return 0;
> +}
> +
> +static struct of_device_id s6e3fa0_of_match[] = {
> +	{ .compatible = "samsung,s6e3fa0" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, s6e3fa0_of_match);
> +
> +static struct mipi_dsi_driver s6e3fa0_driver = {
> +	.probe = s6e3fa0_probe,
> +	.remove = s6e3fa0_remove,
> +	.driver = {
> +		.name = "panel_s6e3fa0",
> +		.owner = THIS_MODULE,
> +		.of_match_table = s6e3fa0_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(s6e3fa0_driver);
> +
> +MODULE_AUTHOR("YoungJun Cho <yj44.cho@samsung.com>");
> +MODULE_DESCRIPTION("MIPI-DSI based s6e3fa0 AMOLED LCD Panel Driver");
> +MODULE_LICENSE("GPL v2");
> 
