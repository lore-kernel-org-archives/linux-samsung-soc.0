From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v6 10/14] drm/panel: add S6E3FA0 driver
Date: Mon, 21 Jul 2014 10:56:08 +0200
Message-ID: <53CCD5A8.6090406@samsung.com>
References: <1405587689-1466-1-git-send-email-yj44.cho@samsung.com>
 <1405587689-1466-11-git-send-email-yj44.cho@samsung.com>
 <20140717103645.GD17877@ulmo> <53C87D2F.9000906@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <53C87D2F.9000906@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: YoungJun Cho <yj44.cho@samsung.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, dri-devel@lists.freedesktop.org, kyungmin.park@samsung.com, robh+dt@kernel.org, galak@codeaurora.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 07/18/2014 03:49 AM, YoungJun Cho wrote:
> Hi Thierry,
>
> Thank you a lot for kind comments.
>
> On 07/17/2014 07:36 PM, Thierry Reding wrote:
>> On Thu, Jul 17, 2014 at 06:01:25PM +0900, YoungJun Cho wrote:
>> [...]
>>> diff --git a/drivers/gpu/drm/panel/panel-s6e3fa0.c b/drivers/gpu/drm/panel/panel-s6e3fa0.c
>> [...]
>>> +/* Manufacturer Command Set */
>>> +#define MCS_GLOBAL_PARAMETER	0xb0
>>> +#define MCS_AID			0xb2
>>> +#define MCS_ELVSSOPT		0xb6
>>> +#define MCS_TEMPERATURE_SET	0xb8
>>> +#define MCS_PENTILE_CTRL	0xc0
>>> +#define MCS_GAMMA_MODE		0xca
>>> +#define MCS_VDDM		0xd7
>>> +#define MCS_ALS			0xe3
>>> +#define MCS_ERR_FG		0xed
>>> +#define MCS_KEY_LEV1		0xf0
>>> +#define MCS_GAMMA_UPDATE	0xf7
>>> +#define MCS_KEY_LEV2		0xfc
>>> +#define MCS_RE			0xfe
>>> +#define MCS_TOUT2_HSYNC		0xff
>>> +
>>> +/* Content Adaptive Brightness Control */
>>> +#define DCS_WRITE_CABC		0x55
>> Is this not a manufacturer specific command? I couldn't find it in the
>> DSI or DCS specifications, but it sounds like something standard (also
>> indicated by the DCS_ prefix). Can you point out the specification for
>> this?
>>
> Andrzej commented before and decided it as DCS one because if the value 
> is less than 0xb0, it is DCS one and the others are MCS one.
> But still I'm not sure it is correct.
I would not say 'decided'. I have just stated that according to DCS
specification
it should be DCS command (below 0xb0), but it is not present in mipi dcs
specs.
On the other side many panels have it [1]:

[1]:
https://www.google.com/search?q=%22Write+Content+Adaptive+Brightness+Control%22

>>> +#define MTP_ID_LEN		3
>>> +#define GAMMA_LEVEL_NUM		30
>>> +
>>> +#define DEFAULT_VDDM_VAL	0x15
>>> +
>>> +struct s6e3fa0 {
>>> +	struct device			*dev;
>>> +	struct drm_panel		panel;
>>> +
>>> +	struct regulator_bulk_data	supplies[2];
>>> +	struct gpio_desc		*reset_gpio;
>>> +	struct videomode		vm;
>>> +
>>> +	unsigned int			power_on_delay;
>>> +	unsigned int			reset_delay;
>>> +	unsigned int			init_delay;
>>> +	unsigned int			width_mm;
>>> +	unsigned int			height_mm;
>>> +
>>> +	unsigned char			id;
>>> +	unsigned char			vddm;
>>> +	unsigned int			brightness;
>>> +};
>> Please don't use this kind of artificial padding. A simple space will
>> do.
>>
>>> +
>>> +#define panel_to_s6e3fa0(p) container_of(p, struct s6e3fa0, panel)
>> Please turn this into a function so we can get proper type checking.
>>
>>> +
>>> +/* VDD Memory Lookup Table contains pairs of {ReadValue, WriteValue} */
>>> +static const unsigned char s6e3fa0_vddm_lut[][2] = {
>>> +	{0x00, 0x0d}, {0x01, 0x0d}, {0x02, 0x0e}, {0x03, 0x0f}, {0x04, 0x10},
>>> +	{0x05, 0x11}, {0x06, 0x12}, {0x07, 0x13}, {0x08, 0x14}, {0x09, 0x15},
>>> +	{0x0a, 0x16}, {0x0b, 0x17}, {0x0c, 0x18}, {0x0d, 0x19}, {0x0e, 0x1a},
>>> +	{0x0f, 0x1b}, {0x10, 0x1c}, {0x11, 0x1d}, {0x12, 0x1e}, {0x13, 0x1f},
>>> +	{0x14, 0x20}, {0x15, 0x21}, {0x16, 0x22}, {0x17, 0x23}, {0x18, 0x24},
>>> +	{0x19, 0x25}, {0x1a, 0x26}, {0x1b, 0x27}, {0x1c, 0x28}, {0x1d, 0x29},
>>> +	{0x1e, 0x2a}, {0x1f, 0x2b}, {0x20, 0x2c}, {0x21, 0x2d}, {0x22, 0x2e},
>>> +	{0x23, 0x2f}, {0x24, 0x30}, {0x25, 0x31}, {0x26, 0x32}, {0x27, 0x33},
>>> +	{0x28, 0x34}, {0x29, 0x35}, {0x2a, 0x36}, {0x2b, 0x37}, {0x2c, 0x38},
>>> +	{0x2d, 0x39}, {0x2e, 0x3a}, {0x2f, 0x3b}, {0x30, 0x3c}, {0x31, 0x3d},
>>> +	{0x32, 0x3e}, {0x33, 0x3f}, {0x34, 0x3f}, {0x35, 0x3f}, {0x36, 0x3f},
>>> +	{0x37, 0x3f}, {0x38, 0x3f}, {0x39, 0x3f}, {0x3a, 0x3f}, {0x3b, 0x3f},
>>> +	{0x3c, 0x3f}, {0x3d, 0x3f}, {0x3e, 0x3f}, {0x3f, 0x3f}, {0x40, 0x0c},
>>> +	{0x41, 0x0b}, {0x42, 0x0a}, {0x43, 0x09}, {0x44, 0x08}, {0x45, 0x07},
>>> +	{0x46, 0x06}, {0x47, 0x05}, {0x48, 0x04}, {0x49, 0x03}, {0x4a, 0x02},
>>> +	{0x4b, 0x01}, {0x4c, 0x40}, {0x4d, 0x41}, {0x4e, 0x42}, {0x4f, 0x43},
>>> +	{0x50, 0x44}, {0x51, 0x45}, {0x52, 0x46}, {0x53, 0x47}, {0x54, 0x48},
>>> +	{0x55, 0x49}, {0x56, 0x4a}, {0x57, 0x4b}, {0x58, 0x4c}, {0x59, 0x4d},
>>> +	{0x5a, 0x4e}, {0x5b, 0x4f}, {0x5c, 0x50}, {0x5d, 0x51}, {0x5e, 0x52},
>>> +	{0x5f, 0x53}, {0x60, 0x54}, {0x61, 0x55}, {0x62, 0x56}, {0x63, 0x57},
>>> +	{0x64, 0x58}, {0x65, 0x59}, {0x66, 0x5a}, {0x67, 0x5b}, {0x68, 0x5c},
>>> +	{0x69, 0x5d}, {0x6a, 0x5e}, {0x6b, 0x5f}, {0x6c, 0x60}, {0x6d, 0x61},
>>> +	{0x6e, 0x62}, {0x6f, 0x63}, {0x70, 0x64}, {0x71, 0x65}, {0x72, 0x66},
>>> +	{0x73, 0x67}, {0x74, 0x68}, {0x75, 0x69}, {0x76, 0x6a}, {0x77, 0x6b},
>>> +	{0x78, 0x6c}, {0x79, 0x6d}, {0x7a, 0x6e}, {0x7b, 0x6f}, {0x7c, 0x70},
>>> +	{0x7d, 0x71}, {0x7e, 0x72}, {0x7f, 0x73},
>>> +};
>> What's this used for?
>>
> This ldi contains an internal memory and requires an appropriate VDD.
> Each panel stores OTP value for this vddm, so reads this value, finds 
> matching value with vddm_lut and writes the final value to avoid noise 
> issues from an inappropriate VDD.
>
>>> +static int s6e3fa0_dcs_read(struct s6e3fa0 *ctx, unsigned char cmd,
>>> +							void *data, size_t len)
>>> +{
>>> +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
>>> +
>>> +	return mipi_dsi_dcs_read(dsi, dsi->channel, cmd, data, len);
>>> +}
>>> +
>>> +static void s6e3fa0_dcs_write(struct s6e3fa0 *ctx, const void *data, size_t len)
>>> +{
>>> +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
>>> +
>>> +	mipi_dsi_dcs_write(dsi, dsi->channel, data, len);
>>> +}
>> Both mipi_dsi_dcs_read() and mipi_dsi_dcs_write() return error codes on
>> failure. Why are you silently ignoring them?
>>
>>> +#define s6e3fa0_dcs_write_seq(ctx, seq...)				\
>>> +do {									\
>>> +	const unsigned char d[] = { seq };				\
>>> +	BUILD_BUG_ON_MSG(ARRAY_SIZE(d) > 64, "too big seq for stack");	\
>>> +	s6e3fa0_dcs_write(ctx, d, ARRAY_SIZE(d));			\
>>> +} while (0)
>>> +
>>> +#define s6e3fa0_dcs_write_seq_static(ctx, seq...)			\
>>> +do {									\
>>> +	static const unsigned char d[] = { seq };			\
>>> +	s6e3fa0_dcs_write(ctx, d, ARRAY_SIZE(d));			\
>>> +} while (0)
>> I've had this discussion with Andrzej before and I'm still not convinced
>> that this is a useful macro.
>>
>> At least they should propagate the error code, though.

This is different implementation, my version propagates error code.
Anyway I have also objections about ignoring errors.

>>
>>> +static void s6e3fa0_set_maximum_return_packet_size(struct s6e3fa0 *ctx,
>>> +							unsigned int size)
>>> +{
>>> +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
>>> +	const struct mipi_dsi_host_ops *ops = dsi->host->ops;
>>> +
>>> +	if (ops && ops->transfer) {
>>> +		unsigned char buf[] = {size, 0};
>>> +		struct mipi_dsi_msg msg = {
>>> +			.channel = dsi->channel,
>>> +			.type = MIPI_DSI_SET_MAXIMUM_RETURN_PACKET_SIZE,
>>> +			.tx_len = sizeof(buf),
>>> +			.tx_buf = buf
>>> +		};
>>> +
>>> +		ops->transfer(dsi->host, &msg);
>>> +	}
>>> +}
>> The Set Maximum Return Packet Size command is a standard command, so
>> please turn that into a generic function exposed by the DSI core.
>>
> For this and below standard DCS commands, you want to use generic 
> functions, but I have no idea for that.
> Could you explain more detail?
>
>>> +static void s6e3fa0_read_mtp_id(struct s6e3fa0 *ctx)
>>> +{
>>> +	unsigned char id[MTP_ID_LEN];
>>> +	int ret;
>>> +
>>> +	s6e3fa0_set_maximum_return_packet_size(ctx, MTP_ID_LEN);
>>> +	ret = s6e3fa0_dcs_read(ctx, MIPI_DCS_GET_DISPLAY_ID, id, MTP_ID_LEN);
>> This also looks like a standard DCS command. I can't find it in either
>> v1.01 nor v1.02 of the specification, though. Do you know where it's
>> specified?
>>
> Yes, I also can't find it in DCS specification and there is no special 
> description in panel datasheet.
> But as it is declared in "include/video/mipi_display.h", so I think it 
> is a standard one.

On page 9 of the "Introduction of MIPI by Renesas" [2] there is info
it is a part of "Nokia I/F command list", I guess it is kind of alpha
version of MIPI DCS.

[2]: http://wenku.baidu.com/view/658fab68af1ffc4ffe47acbe.html

Regards
Andrzej
>
> Thank you.
> Best regards YJ
>
>>> +static void s6e3fa0_set_te_on(struct s6e3fa0 *ctx)
>>> +{
>>> +	s6e3fa0_dcs_write_seq_static(ctx, MIPI_DCS_SET_TEAR_ON, 0x00);
>>> +}
>> This is also a standard DCS command.
>>
>>> +static int s6e3fa0_power_off(struct s6e3fa0 *ctx)
>>> +{
>>> +	gpiod_set_value(ctx->reset_gpio, 0);
>> Setting the reset GPIO to 0 for power off? Shouldn't this be 1 and the
>> polarity be specified in the GPIO specifier?
>>
>>> +static void s6e3fa0_set_sequence(struct s6e3fa0 *ctx)
>>> +{
>>> +	s6e3fa0_apply_level_1_key(ctx);
>>> +	s6e3fa0_dcs_write_seq_static(ctx, MIPI_DCS_EXIT_SLEEP_MODE);
>>> +	msleep(20);
>>> +
>>> +	s6e3fa0_read_mtp_id(ctx);
>>> +	s6e3fa0_read_vddm(ctx);
>>> +
>>> +	s6e3fa0_panel_init(ctx);
>>> +
>>> +	s6e3fa0_dcs_write_seq_static(ctx, MIPI_DCS_SET_DISPLAY_ON);
>>> +}
>>> +
>>> +static int s6e3fa0_disable(struct drm_panel *panel)
>>> +{
>>> +	struct s6e3fa0 *ctx = panel_to_s6e3fa0(panel);
>>> +
>>> +	s6e3fa0_dcs_write_seq_static(ctx, MIPI_DCS_SET_DISPLAY_OFF);
>>> +	msleep(35);
>>> +	s6e3fa0_dcs_write_seq_static(ctx, MIPI_DCS_ENTER_SLEEP_MODE);
>>> +	msleep(120);
>>> +
>>> +	return s6e3fa0_power_off(ctx);
>>> +}
>> The SET_DISPLAY_{ON,OFF} and {ENTER,EXIT}_SLEEP_MODE are standard
>> commands, too.
>>
>>> +static int s6e3fa0_probe(struct mipi_dsi_device *dsi)
>>> +{
>>> +	struct device *dev = &dsi->dev;
>>> +	struct s6e3fa0 *ctx;
>>> +	struct gpio_desc *det_gpio;
>>> +	int ret, te_gpio;
>>> +
>>> +	ctx = devm_kzalloc(dev, sizeof(struct s6e3fa0), GFP_KERNEL);
>> sizeof(*ctx)
>>
>>> +	det_gpio = devm_gpiod_get(dev, "det");
>>> +	if (IS_ERR(det_gpio)) {
>>> +		dev_err(dev, "failed to get det gpio: %ld\n",
>>> +				PTR_ERR(det_gpio));
>>> +		return PTR_ERR(det_gpio);
>>> +	}
>>> +	ret = gpiod_direction_input(det_gpio);
>>> +	if (ret < 0) {
>>> +		dev_err(dev, "failed to configure det gpio: %d\n", ret);
>>> +		return ret;
>>> +	}
>>> +	ret = devm_request_irq(dev, gpiod_to_irq(det_gpio),
>>> +				s6e3fa0_det_interrupt, IRQF_TRIGGER_FALLING,
>>> +				"oled-det", ctx);
>>> +	if (ret) {
>>> +		dev_err(dev, "failed to request det irq: %d\n", ret);
>>> +		return ret;
>>> +	}
>>> +
>>> +	te_gpio = of_get_named_gpio(dev->of_node, "te-gpios", 0);
>> Why doesn't this use the gpiod_* API like the other GPIOs?
>>
>>> +static struct of_device_id s6e3fa0_of_match[] = {
>> Should be static const.
>>
>> Thierry
>>
>
