From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v7 2/8] mfd: cros_ec: rev cros_ec_commands.h
Date: Mon, 15 Jun 2015 13:23:24 +0100
Message-ID: <20150615122324.GB3266@x1>
References: <1433847889-7220-1-git-send-email-javier.martinez@collabora.co.uk>
 <1433847889-7220-3-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1433847889-7220-3-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, Alexandru M Stan <amstan@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 09 Jun 2015, Javier Martinez Canillas wrote:

> From: Stephen Barber <smbarber@chromium.org>
>=20
> Update cros_ec_commands.h to the latest version in the EC
> firmware sources and add power domain and passthru commands.
>=20
> Also, update lightbar to use new command names.
>=20
> Signed-off-by: Stephen Barber <smbarber@chromium.org>
> Reviewed-by: Randall Spangler <rspangler@chromium.org>
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co=
=2Euk>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Gwendal Grignou <gwendal@chromium.org>
> Tested-by: Gwendal Grignou <gwendal@chromium.org>
> Acked-by: Lee Jones <lee.jones@linaro.org>
> Acked-by: Olof Johansson <olof@lixom.net>

Applied, thanks.

> ---
>=20
> Changes since v6:
>  - Add Olof Johansson Acked-by tag
>=20
> Changes since v5: None
>=20
> Changes since v4: None
>=20
> Changes since v3: None
>=20
> Changes since v2: None
>=20
> Changes since v1:
>  - Added Gwendal Grignou and Heiko Stuebner Tested-by tags
>  - Added Gwendal Grignou Reviewed-by tag
>  - Added Lee Jones Acked-by tag
> ---
>  drivers/platform/chrome/cros_ec_lightbar.c |  14 +-
>  include/linux/mfd/cros_ec_commands.h       | 277 +++++++++++++++++++=
+++++++---
>  2 files changed, 262 insertions(+), 29 deletions(-)
>=20
> diff --git a/drivers/platform/chrome/cros_ec_lightbar.c b/drivers/pla=
tform/chrome/cros_ec_lightbar.c
> index 560e5d41b7ae..6e1986a2dce1 100644
> --- a/drivers/platform/chrome/cros_ec_lightbar.c
> +++ b/drivers/platform/chrome/cros_ec_lightbar.c
> @@ -197,8 +197,8 @@ static ssize_t brightness_store(struct device *de=
v,
>  		return -ENOMEM;
> =20
>  	param =3D (struct ec_params_lightbar *)msg->data;
> -	param->cmd =3D LIGHTBAR_CMD_BRIGHTNESS;
> -	param->brightness.num =3D val;
> +	param->cmd =3D LIGHTBAR_CMD_SET_BRIGHTNESS;
> +	param->set_brightness.num =3D val;
>  	ret =3D lb_throttle();
>  	if (ret)
>  		goto exit;
> @@ -253,11 +253,11 @@ static ssize_t led_rgb_store(struct device *dev=
, struct device_attribute *attr,
> =20
>  		if (i =3D=3D 4) {
>  			param =3D (struct ec_params_lightbar *)msg->data;
> -			param->cmd =3D LIGHTBAR_CMD_RGB;
> -			param->rgb.led =3D val[0];
> -			param->rgb.red =3D val[1];
> -			param->rgb.green =3D val[2];
> -			param->rgb.blue =3D val[3];
> +			param->cmd =3D LIGHTBAR_CMD_SET_RGB;
> +			param->set_rgb.led =3D val[0];
> +			param->set_rgb.red =3D val[1];
> +			param->set_rgb.green =3D val[2];
> +			param->set_rgb.blue =3D val[3];
>  			/*
>  			 * Throttle only the first of every four transactions,
>  			 * so that the user can update all four LEDs at once.
> diff --git a/include/linux/mfd/cros_ec_commands.h b/include/linux/mfd=
/cros_ec_commands.h
> index a49cd41feea7..13b630c10d4c 100644
> --- a/include/linux/mfd/cros_ec_commands.h
> +++ b/include/linux/mfd/cros_ec_commands.h
> @@ -515,7 +515,7 @@ struct ec_host_response {
>  /*
>   * Notes on commands:
>   *
> - * Each command is an 8-byte command value.  Commands which take par=
ams or
> + * Each command is an 16-bit command value.  Commands which take par=
ams or
>   * return response data specify structs for that data.  If no struct=
 is
>   * specified, the command does not input or output data, respectivel=
y.
>   * Parameter/response length is implicit in the structs.  Some under=
lying
> @@ -966,7 +966,7 @@ struct rgb_s {
>  /* List of tweakable parameters. NOTE: It's __packed so it can be se=
nt in a
>   * host command, but the alignment is the same regardless. Keep it t=
hat way.
>   */
> -struct lightbar_params {
> +struct lightbar_params_v0 {
>  	/* Timing */
>  	int32_t google_ramp_up;
>  	int32_t google_ramp_down;
> @@ -1000,32 +1000,81 @@ struct lightbar_params {
>  	struct rgb_s color[8];			/* 0-3 are Google colors */
>  } __packed;
> =20
> +struct lightbar_params_v1 {
> +	/* Timing */
> +	int32_t google_ramp_up;
> +	int32_t google_ramp_down;
> +	int32_t s3s0_ramp_up;
> +	int32_t s0_tick_delay[2];		/* AC=3D0/1 */
> +	int32_t s0a_tick_delay[2];		/* AC=3D0/1 */
> +	int32_t s0s3_ramp_down;
> +	int32_t s3_sleep_for;
> +	int32_t s3_ramp_up;
> +	int32_t s3_ramp_down;
> +	int32_t tap_tick_delay;
> +	int32_t tap_display_time;
> +
> +	/* Tap-for-battery params */
> +	uint8_t tap_pct_red;
> +	uint8_t tap_pct_green;
> +	uint8_t tap_seg_min_on;
> +	uint8_t tap_seg_max_on;
> +	uint8_t tap_seg_osc;
> +	uint8_t tap_idx[3];
> +
> +	/* Oscillation */
> +	uint8_t osc_min[2];			/* AC=3D0/1 */
> +	uint8_t osc_max[2];			/* AC=3D0/1 */
> +	uint8_t w_ofs[2];			/* AC=3D0/1 */
> +
> +	/* Brightness limits based on the backlight and AC. */
> +	uint8_t bright_bl_off_fixed[2];		/* AC=3D0/1 */
> +	uint8_t bright_bl_on_min[2];		/* AC=3D0/1 */
> +	uint8_t bright_bl_on_max[2];		/* AC=3D0/1 */
> +
> +	/* Battery level thresholds */
> +	uint8_t battery_threshold[LB_BATTERY_LEVELS - 1];
> +
> +	/* Map [AC][battery_level] to color index */
> +	uint8_t s0_idx[2][LB_BATTERY_LEVELS];	/* AP is running */
> +	uint8_t s3_idx[2][LB_BATTERY_LEVELS];	/* AP is sleeping */
> +
> +	/* Color palette */
> +	struct rgb_s color[8];			/* 0-3 are Google colors */
> +} __packed;
> +
>  struct ec_params_lightbar {
>  	uint8_t cmd;		      /* Command (see enum lightbar_command) */
>  	union {
>  		struct {
>  			/* no args */
> -		} dump, off, on, init, get_seq, get_params, version;
> +		} dump, off, on, init, get_seq, get_params_v0, get_params_v1,
> +			version, get_brightness, get_demo;
> =20
> -		struct num {
> +		struct {
>  			uint8_t num;
> -		} brightness, seq, demo;
> +		} set_brightness, seq, demo;
> =20
> -		struct reg {
> +		struct {
>  			uint8_t ctrl, reg, value;
>  		} reg;
> =20
> -		struct rgb {
> +		struct {
>  			uint8_t led, red, green, blue;
> -		} rgb;
> +		} set_rgb;
> +
> +		struct {
> +			uint8_t led;
> +		} get_rgb;
> =20
> -		struct lightbar_params set_params;
> +		struct lightbar_params_v0 set_params_v0;
> +		struct lightbar_params_v1 set_params_v1;
>  	};
>  } __packed;
> =20
>  struct ec_response_lightbar {
>  	union {
> -		struct dump {
> +		struct {
>  			struct {
>  				uint8_t reg;
>  				uint8_t ic0;
> @@ -1033,20 +1082,26 @@ struct ec_response_lightbar {
>  			} vals[23];
>  		} dump;
> =20
> -		struct get_seq {
> +		struct  {
>  			uint8_t num;
> -		} get_seq;
> +		} get_seq, get_brightness, get_demo;
> =20
> -		struct lightbar_params get_params;
> +		struct lightbar_params_v0 get_params_v0;
> +		struct lightbar_params_v1 get_params_v1;
> =20
> -		struct version {
> +		struct {
>  			uint32_t num;
>  			uint32_t flags;
>  		} version;
> =20
>  		struct {
> +			uint8_t red, green, blue;
> +		} get_rgb;
> +
> +		struct {
>  			/* no return params */
> -		} off, on, init, brightness, seq, reg, rgb, demo, set_params;
> +		} off, on, init, set_brightness, seq, reg, set_rgb,
> +			demo, set_params_v0, set_params_v1;
>  	};
>  } __packed;
> =20
> @@ -1056,15 +1111,20 @@ enum lightbar_command {
>  	LIGHTBAR_CMD_OFF =3D 1,
>  	LIGHTBAR_CMD_ON =3D 2,
>  	LIGHTBAR_CMD_INIT =3D 3,
> -	LIGHTBAR_CMD_BRIGHTNESS =3D 4,
> +	LIGHTBAR_CMD_SET_BRIGHTNESS =3D 4,
>  	LIGHTBAR_CMD_SEQ =3D 5,
>  	LIGHTBAR_CMD_REG =3D 6,
> -	LIGHTBAR_CMD_RGB =3D 7,
> +	LIGHTBAR_CMD_SET_RGB =3D 7,
>  	LIGHTBAR_CMD_GET_SEQ =3D 8,
>  	LIGHTBAR_CMD_DEMO =3D 9,
> -	LIGHTBAR_CMD_GET_PARAMS =3D 10,
> -	LIGHTBAR_CMD_SET_PARAMS =3D 11,
> +	LIGHTBAR_CMD_GET_PARAMS_V0 =3D 10,
> +	LIGHTBAR_CMD_SET_PARAMS_V0 =3D 11,
>  	LIGHTBAR_CMD_VERSION =3D 12,
> +	LIGHTBAR_CMD_GET_BRIGHTNESS =3D 13,
> +	LIGHTBAR_CMD_GET_RGB =3D 14,
> +	LIGHTBAR_CMD_GET_DEMO =3D 15,
> +	LIGHTBAR_CMD_GET_PARAMS_V1 =3D 16,
> +	LIGHTBAR_CMD_SET_PARAMS_V1 =3D 17,
>  	LIGHTBAR_NUM_CMDS
>  };
> =20
> @@ -1421,8 +1481,40 @@ struct ec_response_rtc {
>  /*******************************************************************=
**********/
>  /* Port80 log access */
> =20
> +/* Maximum entries that can be read/written in a single command */
> +#define EC_PORT80_SIZE_MAX 32
> +
>  /* Get last port80 code from previous boot */
>  #define EC_CMD_PORT80_LAST_BOOT 0x48
> +#define EC_CMD_PORT80_READ 0x48
> +
> +enum ec_port80_subcmd {
> +	EC_PORT80_GET_INFO =3D 0,
> +	EC_PORT80_READ_BUFFER,
> +};
> +
> +struct ec_params_port80_read {
> +	uint16_t subcmd;
> +	union {
> +		struct {
> +			uint32_t offset;
> +			uint32_t num_entries;
> +		} read_buffer;
> +	};
> +} __packed;
> +
> +struct ec_response_port80_read {
> +	union {
> +		struct {
> +			uint32_t writes;
> +			uint32_t history_size;
> +			uint32_t last_boot;
> +		} get_info;
> +		struct {
> +			uint16_t codes[EC_PORT80_SIZE_MAX];
> +		} data;
> +	};
> +} __packed;
> =20
>  struct ec_response_port80_last_boot {
>  	uint16_t code;
> @@ -1782,6 +1874,7 @@ struct ec_params_gpio_set {
>  /* Get GPIO value */
>  #define EC_CMD_GPIO_GET 0x93
> =20
> +/* Version 0 of input params and response */
>  struct ec_params_gpio_get {
>  	char name[32];
>  } __packed;
> @@ -1789,6 +1882,38 @@ struct ec_response_gpio_get {
>  	uint8_t val;
>  } __packed;
> =20
> +/* Version 1 of input params and response */
> +struct ec_params_gpio_get_v1 {
> +	uint8_t subcmd;
> +	union {
> +		struct {
> +			char name[32];
> +		} get_value_by_name;
> +		struct {
> +			uint8_t index;
> +		} get_info;
> +	};
> +} __packed;
> +
> +struct ec_response_gpio_get_v1 {
> +	union {
> +		struct {
> +			uint8_t val;
> +		} get_value_by_name, get_count;
> +		struct {
> +			uint8_t val;
> +			char name[32];
> +			uint32_t flags;
> +		} get_info;
> +	};
> +} __packed;
> +
> +enum gpio_get_subcmd {
> +	EC_GPIO_GET_BY_NAME =3D 0,
> +	EC_GPIO_GET_COUNT =3D 1,
> +	EC_GPIO_GET_INFO =3D 2,
> +};
> +
>  /*******************************************************************=
**********/
>  /* I2C commands. Only available when flash write protect is unlocked=
=2E */
> =20
> @@ -1857,13 +1982,21 @@ struct ec_params_charge_control {
>  /*******************************************************************=
**********/
> =20
>  /*
> - * Cut off battery power output if the battery supports.
> + * Cut off battery power immediately or after the host has shut down=
=2E
>   *
> - * For unsupported battery, just don't implement this command and le=
ts EC
> - * return EC_RES_INVALID_COMMAND.
> + * return EC_RES_INVALID_COMMAND if unsupported by a board/battery.
> + *	  EC_RES_SUCCESS if the command was successful.
> + *	  EC_RES_ERROR if the cut off command failed.
>   */
> +
>  #define EC_CMD_BATTERY_CUT_OFF 0x99
> =20
> +#define EC_BATTERY_CUTOFF_FLAG_AT_SHUTDOWN	(1 << 0)
> +
> +struct ec_params_battery_cutoff {
> +	uint8_t flags;
> +} __packed;
> +
>  /*******************************************************************=
**********/
>  /* USB port mux control. */
> =20
> @@ -2142,6 +2275,32 @@ struct ec_params_sb_wr_block {
>  } __packed;
> =20
>  /*******************************************************************=
**********/
> +/* Battery vendor parameters
> + *
> + * Get or set vendor-specific parameters in the battery. Implementat=
ions may
> + * differ between boards or batteries. On a set operation, the respo=
nse
> + * contains the actual value set, which may be rounded or clipped fr=
om the
> + * requested value.
> + */
> +
> +#define EC_CMD_BATTERY_VENDOR_PARAM 0xb4
> +
> +enum ec_battery_vendor_param_mode {
> +	BATTERY_VENDOR_PARAM_MODE_GET =3D 0,
> +	BATTERY_VENDOR_PARAM_MODE_SET,
> +};
> +
> +struct ec_params_battery_vendor_param {
> +	uint32_t param;
> +	uint32_t value;
> +	uint8_t mode;
> +} __packed;
> +
> +struct ec_response_battery_vendor_param {
> +	uint32_t value;
> +} __packed;
> +
> +/*******************************************************************=
**********/
>  /* System commands */
> =20
>  /*
> @@ -2338,6 +2497,80 @@ struct ec_params_reboot_ec {
> =20
>  /*******************************************************************=
**********/
>  /*
> + * PD commands
> + *
> + * These commands are for PD MCU communication.
> + */
> +
> +/* EC to PD MCU exchange status command */
> +#define EC_CMD_PD_EXCHANGE_STATUS 0x100
> +
> +/* Status of EC being sent to PD */
> +struct ec_params_pd_status {
> +	int8_t batt_soc; /* battery state of charge */
> +} __packed;
> +
> +/* Status of PD being sent back to EC */
> +struct ec_response_pd_status {
> +	int8_t status;        /* PD MCU status */
> +	uint32_t curr_lim_ma; /* input current limit */
> +} __packed;
> +
> +/* Set USB type-C port role and muxes */
> +#define EC_CMD_USB_PD_CONTROL 0x101
> +
> +enum usb_pd_control_role {
> +	USB_PD_CTRL_ROLE_NO_CHANGE =3D 0,
> +	USB_PD_CTRL_ROLE_TOGGLE_ON =3D 1, /* =3D=3D AUTO */
> +	USB_PD_CTRL_ROLE_TOGGLE_OFF =3D 2,
> +	USB_PD_CTRL_ROLE_FORCE_SINK =3D 3,
> +	USB_PD_CTRL_ROLE_FORCE_SOURCE =3D 4,
> +};
> +
> +enum usb_pd_control_mux {
> +	USB_PD_CTRL_MUX_NO_CHANGE =3D 0,
> +	USB_PD_CTRL_MUX_NONE =3D 1,
> +	USB_PD_CTRL_MUX_USB =3D 2,
> +	USB_PD_CTRL_MUX_DP =3D 3,
> +	USB_PD_CTRL_MUX_DOCK =3D 4,
> +	USB_PD_CTRL_MUX_AUTO =3D 5,
> +};
> +
> +struct ec_params_usb_pd_control {
> +	uint8_t port;
> +	uint8_t role;
> +	uint8_t mux;
> +} __packed;
> +
> +/*******************************************************************=
**********/
> +/*
> + * Passthru commands
> + *
> + * Some platforms have sub-processors chained to each other.  For ex=
ample.
> + *
> + *     AP <--> EC <--> PD MCU
> + *
> + * The top 2 bits of the command number are used to indicate which d=
evice the
> + * command is intended for.  Device 0 is always the device receiving=
 the
> + * command; other device mapping is board-specific.
> + *
> + * When a device receives a command to be passed to a sub-processor,=
 it passes
> + * it on with the device number set back to 0.  This allows the sub-=
processor
> + * to remain blissfully unaware of whether the command originated on=
 the next
> + * device up the chain, or was passed through from the AP.
> + *
> + * In the above example, if the AP wants to send command 0x0002 to t=
he PD MCU,
> + *     AP sends command 0x4002 to the EC
> + *     EC sends command 0x0002 to the PD MCU
> + *     EC forwards PD MCU response back to the AP
> + */
> +
> +/* Offset and max command number for sub-device n */
> +#define EC_CMD_PASSTHRU_OFFSET(n) (0x4000 * (n))
> +#define EC_CMD_PASSTHRU_MAX(n) (EC_CMD_PASSTHRU_OFFSET(n) + 0x3fff)
> +
> +/*******************************************************************=
**********/
> +/*
>   * Deprecated constants. These constants have been renamed for clari=
ty. The
>   * meaning and size has not changed. Programs that use the old names=
 should
>   * switch to the new names soon, as the old names may not be carried=
 forward

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
