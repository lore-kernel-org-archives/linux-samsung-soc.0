From: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 1/2] drm/panel: Add support for S6E3HA2 panel driver on
 TM2 board
Date: Tue, 27 Dec 2016 12:36:49 +0100
Message-ID: <693d8abd-12f4-2e04-fdf1-182a99056808@samsung.com>
References: <1482829548-20842-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20161227090606epcas5p2d71e13cc6d1bcd7f47bc5d92387f4e32@epcas5p2.samsung.com>
 <1482829548-20842-2-git-send-email-hoegeun.kwon@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1482829548-20842-2-git-send-email-hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Donghwa Lee <dh09.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Hoegeun Kwon,

Thanks for the patch.

On 27.12.2016 10:05, Hoegeun Kwon wrote:
> This patch add support for MIPI-DSI based S6E3HA2 AMOLED panel
> driver. This panel has 1440x2560 resolution in 5.7-inch physical
> panel in the TM2 device.
>
> Signed-off-by: Donghwa Lee <dh09.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
> Changes for V2:
>
> - Fixed the samsung,s6e3ha2.txt DT document.
>   - Added active high or low after the description of the GPIOs.
>   - Removed the reg and added a description of the virtual
>     channel number of a DSI peripheral.

I do not understand this change, according to Rob's comment for previous
patch:
> reg doesn't really work here unless this node is a child of the DSI 
> controller node. But if it is a child node, then you don't need the OF 
> graph.

As the panel is controlled via DSI bus the node should be a child of DSI
controller, and therefore 'reg' property is required. Nice novum for me
is that OF graph is not required in that case.

>
>  .../bindings/display/panel/samsung,s6e3ha2.txt     |  62 ++
>  drivers/gpu/drm/panel/Kconfig                      |   6 +
>  drivers/gpu/drm/panel/Makefile                     |   1 +
>  drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c      | 756 +++++++++++++++++++++
>  4 files changed, 825 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e3ha2.txt
>  create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
>
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha2.txt b/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha2.txt
> new file mode 100644
> index 0000000..6e989ee
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha2.txt
> @@ -0,0 +1,62 @@
> +Samsung S6E3HA2 5.7" 1440x2560 AMOLED panel
> +
> +Required properties:
> +  - compatible: "samsung,s6e3ha2"
> +  - vdd3-supply: core voltage supply
Shouldn't be 'I/O voltage supply' ?

> +  - vci-supply: voltage supply for analog circuits
> +  - reset-gpios: a GPIO spec for the reset pin (active high)

According to specs it is active low, logic in the driver should be also
adjusted.

> +  - enable-gpios: a GPIO spec for the panel enable pin (active high)
> +  - te-gpios: a GPIO spec for the tearing effect synchronization signal
> +    gpio pin (active high)
> +
> +Optional properties:
> +  - display-timings: timings for the connected panel as described by [1]

In case of panels timings should be provided by device driver, not by dts.

> +
> +The device node can contain one 'port' child node with one child
> +'endpoint' node, according to the bindings defined in [2]. This
> +node should describe panel's video bus.

This could be dropped according to Rob's advice.

> +
> +The virtual channel number of a DSI peripheral as described by [3].
> +Must be in the range from 0 to 3.
> +/* peripheral responds to virtual channel 0 */
> +peripheral@0 {
> +	compatible = "...";
> +	reg = <0>;
> +};
> +
> +[1]: Documentation/devicetree/bindings/display/panel/display-timing.txt
> +[2]: Documentation/devicetree/bindings/media/video-interfaces.txt
> +[3]: Documentation/devicetree/bindings/display/mipi-dsi-bus.txt
> +
> +Example:
> +
> +	panel@0 {
> +		...
> +
> +		compatible = "samsung,s6e3ha2";
> +		vdd3-supply = <&ldo27_reg>;
> +		vci-supply = <&ldo28_reg>;
> +		reset-gpios = <&gpg0 0 GPIO_ACTIVE_HIGH>;
> +		enable-gpios = <&gpf1 5 GPIO_ACTIVE_HIGH>;
> +		te-gpios = <&gpf1 3 GPIO_ACTIVE_HIGH>;
> +
> +		display-timings {
> +			timing-0 {
> +				clock-frequency = <0>;
> +				hactive = <1440>;
> +				vactive = <2560>;
> +				hfront-porch = <1>;
> +				hback-porch = <1>;
> +				hsync-len = <1>;
> +				vfront-porch = <1>;
> +				vback-porch = <15>;
> +				vsync-len = <1>;
> +			};
> +		};
> +
> +		port {
> +			dsi_in: endpoint {
> +				remote-endpoint = <&dsi_out>;
> +			};
> +		};
> +	};
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 62aba97..e1a2fcd 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -58,6 +58,12 @@ config DRM_PANEL_SAMSUNG_S6E8AA0
>  	select DRM_MIPI_DSI
>  	select VIDEOMODE_HELPERS
>  
> +config DRM_PANEL_SAMSUNG_S6E3HA2
> +	tristate "Samsung S6E3HA2 DSI video mode panel"
> +	depends on OF
> +	select DRM_MIPI_DSI

It should be "depends on" in case of panels.

> +	select VIDEOMODE_HELPERS
> +
>  config DRM_PANEL_SHARP_LQ101R1SX01
>  	tristate "Sharp LQ101R1SX01 panel"
>  	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index a5c7ec0..993699b 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -4,5 +4,6 @@ obj-$(CONFIG_DRM_PANEL_LG_LG4573) += panel-lg-lg4573.o
>  obj-$(CONFIG_DRM_PANEL_PANASONIC_VVX10F034N00) += panel-panasonic-vvx10f034n00.o
>  obj-$(CONFIG_DRM_PANEL_SAMSUNG_LD9040) += panel-samsung-ld9040.o
>  obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0) += panel-samsung-s6e8aa0.o
> +obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E3HA2) += panel-samsung-s6e3ha2.o

Shoudn't it be sorted?

>  obj-$(CONFIG_DRM_PANEL_SHARP_LQ101R1SX01) += panel-sharp-lq101r1sx01.o
>  obj-$(CONFIG_DRM_PANEL_SHARP_LS043T1LE01) += panel-sharp-ls043t1le01.o
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c b/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
> new file mode 100644
> index 0000000..a6ad63b
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
> @@ -0,0 +1,756 @@
> +/*
> + * MIPI-DSI based s6e3ha2 AMOLED 5.7 inch panel driver.
> + *
> + * Copyright (c) 2016 Samsung Electronics Co., Ltd.
> + * Donghwa Lee <dh09.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> + * Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> + * Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#include <drm/drmP.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_panel.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/regulator/consumer.h>
> +#include <video/mipi_display.h>
> +#include <video/of_videomode.h>
> +#include <video/videomode.h>
> +#include <linux/backlight.h>
> +
> +#define S6E3HA2_MIN_BRIGHTNESS		0
> +#define S6E3HA2_MAX_BRIGHTNESS		100
> +#define S6E3HA2_DEFAULT_BRIGHTNESS	80
> +
> +#define S6E3HA2_NUM_GAMMA_STEPS		46
> +#define S6E3HA2_GAMMA_CMD_CNT		35
> +#define S6E3HA2_VINT_STATUS_MAX		10
> +
> +static const u8 gamma_tbl[S6E3HA2_NUM_GAMMA_STEPS][S6E3HA2_GAMMA_CMD_CNT] = {
> +	{ 0x00, 0xb8, 0x00, 0xc3, 0x00, 0xb1, 0x89, 0x87, 0x87, 0x82, 0x83,
> +	  0x85, 0x88, 0x8b, 0x8b, 0x84, 0x88, 0x82, 0x82, 0x89, 0x86, 0x8c,
> +	  0x94, 0x84, 0xb1, 0xaf, 0x8e, 0xcf, 0xad, 0xc9, 0x00, 0x00, 0x00,
> +	  0x00, 0x00 },
> +	{ 0x00, 0xb8, 0x00, 0xc3, 0x00, 0xb1, 0x89, 0x87, 0x87, 0x84, 0x84,
> +	  0x85, 0x87, 0x8b, 0x8a, 0x84, 0x88, 0x82, 0x82, 0x89, 0x86, 0x8a,
> +	  0x93, 0x84, 0xb0, 0xae, 0x8e, 0xc9, 0xa8, 0xc5, 0x00, 0x00, 0x00,
> +	  0x00, 0x00 },
> +	{ 0x00, 0xb8, 0x00, 0xc3, 0x00, 0xb1, 0x89, 0x87, 0x87, 0x83, 0x83,
> +	  0x85, 0x86, 0x8a, 0x8a, 0x84, 0x88, 0x81, 0x84, 0x8a, 0x88, 0x8a,
> +	  0x91, 0x84, 0xb1, 0xae, 0x8b, 0xd5, 0xb2, 0xcc, 0x00, 0x00, 0x00,
> +	  0x00, 0x00 },
> +	{ 0x00, 0xb8, 0x00, 0xc3, 0x00, 0xb1, 0x89, 0x87, 0x87, 0x83, 0x83,
> +	  0x85, 0x86, 0x8a, 0x8a, 0x84, 0x87, 0x81, 0x84, 0x8a, 0x87, 0x8a,
> +	  0x91, 0x85, 0xae, 0xac, 0x8a, 0xc3, 0xa3, 0xc0, 0x00, 0x00, 0x00,
> +	  0x00, 0x00 },
> +	{ 0x00, 0xb8, 0x00, 0xc3, 0x00, 0xb1, 0x88, 0x86, 0x87, 0x85, 0x85,
> +	  0x86, 0x85, 0x88, 0x89, 0x84, 0x89, 0x82, 0x84, 0x87, 0x85, 0x8b,
> +	  0x91, 0x88, 0xad, 0xab, 0x8a, 0xb7, 0x9b, 0xb6, 0x00, 0x00, 0x00,
> +	  0x00, 0x00 },
> +	{ 0x00, 0xb8, 0x00, 0xc3, 0x00, 0xb1, 0x89, 0x87, 0x87, 0x83, 0x83,
> +	  0x85, 0x86, 0x89, 0x8a, 0x84, 0x89, 0x83, 0x83, 0x86, 0x84, 0x8b,
> +	  0x90, 0x84, 0xb0, 0xae, 0x8b, 0xce, 0xad, 0xc8, 0x00, 0x00, 0x00,
> +	  0x00, 0x00 },
> +	{ 0x00, 0xb8, 0x00, 0xc3, 0x00, 0xb1, 0x89, 0x87, 0x87, 0x83, 0x83,
> +	  0x85, 0x87, 0x89, 0x8a, 0x83, 0x87, 0x82, 0x85, 0x88, 0x87, 0x89,
> +	  0x8f, 0x84, 0xac, 0xaa, 0x89, 0xb1, 0x98, 0xaf, 0x00, 0x00, 0x00,
> +	  0x00, 0x00 },
> +	{ 0x00, 0xb8, 0x00, 0xc3, 0x00, 0xb1, 0x89, 0x87, 0x87, 0x83, 0x83,
> +	  0x85, 0x86, 0x88, 0x89, 0x84, 0x88, 0x83, 0x82, 0x85, 0x84, 0x8c,
> +	  0x91, 0x86, 0xac, 0xaa, 0x89, 0xc2, 0xa5, 0xbd, 0x00, 0x00, 0x00,
> +	  0x00, 0x00 },
> +	{ 0x00, 0xb8, 0x00, 0xc3, 0x00, 0xb1, 0x88, 0x86, 0x87, 0x84, 0x84,
> +	  0x85, 0x87, 0x89, 0x8a, 0x83, 0x87, 0x82, 0x85, 0x88, 0x87, 0x88,
> +	  0x8b, 0x82, 0xad, 0xaa, 0x8a, 0xc2, 0xa5, 0xbd, 0x00, 0x00, 0x00,
> +	  0x00, 0x00 },
> +	{ 0x00, 0xb8, 0x00, 0xc3, 0x00, 0xb1, 0x89, 0x87, 0x87, 0x83, 0x83,
> +	  0x85, 0x86, 0x87, 0x89, 0x84, 0x88, 0x83, 0x82, 0x85, 0x84, 0x8a,
> +	  0x8e, 0x84, 0xae, 0xac, 0x89, 0xda, 0xb7, 0xd0, 0x00, 0x00, 0x00,
> +	  0x00, 0x00 },
> +	{ 0x00, 0xb8, 0x00, 0xc3, 0x00, 0xb1, 0x88, 0x86, 0x87, 0x84, 0x84,
> +	  0x85, 0x86, 0x87, 0x89, 0x84, 0x88, 0x83, 0x80, 0x83, 0x82, 0x8b,
> +	  0x8e, 0x85, 0xac, 0xaa, 0x89, 0xc8, 0xaa, 0xc1, 0x00, 0x00, 0x00,
> +	  0x00, 0x00 },
> +	{ 0x00, 0xb8, 0x00, 0xc3, 0x00, 0xb1, 0x88, 0x86, 0x87, 0x84, 0x84,
> +	  0x85, 0x86, 0x87, 0x89, 0x81, 0x85, 0x81, 0x84, 0x86, 0x84, 0x8c,
> +	  0x8c, 0x84, 0xa9, 0xa8, 0x87, 0xa3, 0x92, 0xa1, 0x00, 0x00, 0x00,
> +	  0x00, 0x00 },
> +	{ 0x00, 0xb8, 0x00, 0xc3, 0x00, 0xb1, 0x88, 0x86, 0x87, 0x84, 0x84,
> +	  0x85, 0x86, 0x87, 0x89, 0x84, 0x86, 0x83, 0x80, 0x83, 0x81, 0x8c,
> +	  0x8d, 0x84, 0xaa, 0xaa, 0x89, 0xce, 0xaf, 0xc5, 0x00, 0x00, 0x00,
> +	  0x00, 0x00 },
> +	{ 0x00, 0xb8, 0x00, 0xc3, 0x00, 0xb1, 0x88, 0x86, 0x87, 0x84, 0x84,
> +	  0x85, 0x86, 0x87, 0x89, 0x81, 0x83, 0x80, 0x83, 0x85, 0x85, 0x8c,
> +	  0x8c, 0x84, 0xa8, 0xa8, 0x88, 0xb5, 0x9f, 0xb0, 0x00, 0x00, 0x00,
> +	  0x00, 0x00 },
> +	{ 0x00, 0xb8, 0x00, 0xc3, 0x00, 0xb1, 0x88, 0x86, 0x87, 0x84, 0x84,
> +	  0x86, 0x86, 0x87, 0x88, 0x81, 0x83, 0x80, 0x83, 0x85, 0x85, 0x8c,
> +	  0x8b, 0x84, 0xab, 0xa8, 0x86, 0xd4, 0xb4, 0xc9, 0x00, 0x00, 0x00,
> +	  0x00, 0x00 },
> +	{ 0x00, 0xb8, 0x00, 0xc3, 0x00, 0xb1, 0x88, 0x86, 0x87, 0x84, 0x84,
> +	  0x86, 0x86, 0x87, 0x88, 0x81, 0x83, 0x80, 0x84, 0x84, 0x85, 0x8b,
> +	  0x8a, 0x83, 0xa6, 0xa5, 0x84, 0xbb, 0xa4, 0xb3, 0x00, 0x00, 0x00,
> +	  0x00, 0x00 },
> +	{ 0x00, 0xb8, 0x00, 0xc3, 0x00, 0xb1, 0x88, 0x86, 0x87, 0x84, 0x84,
> +	  0x86, 0x85, 0x86, 0x86, 0x82, 0x85, 0x81, 0x82, 0x83, 0x84, 0x8e,
> +	  0x8b, 0x83, 0xa4, 0xa3, 0x8a, 0xa1, 0x93, 0x9d, 0x00, 0x00, 0x00,
> +	  0x00, 0x00 },
> +	{ 0x00, 0xb8, 0x00, 0xc3, 0x00, 0xb1, 0x88, 0x86, 0x87, 0x83, 0x83,
> +	  0x85, 0x86, 0x87, 0x87, 0x82, 0x85, 0x81, 0x82, 0x82, 0x84, 0x8e,
> +	  0x8b, 0x83, 0xa4, 0xa2, 0x86, 0xc1, 0xa9, 0xb7, 0x00, 0x00, 0x00,
> +	  0x00, 0x00 },
> +	{ 0x00, 0xb8, 0x00, 0xc3, 0x00, 0xb1, 0x88, 0x86, 0x87, 0x83, 0x83,
> +	  0x85, 0x86, 0x87, 0x87, 0x82, 0x85, 0x81, 0x82, 0x82, 0x84, 0x8d,
> +	  0x89, 0x82, 0xa2, 0xa1, 0x84, 0xa7, 0x98, 0xa1, 0x00, 0x00, 0x00,
> +	  0x00, 0x00 },
> +	{ 0x00, 0xb8, 0x00, 0xc3, 0x00, 0xb1, 0x88, 0x86, 0x87, 0x83, 0x83,
> +	  0x85, 0x86, 0x87, 0x87, 0x82, 0x85, 0x81, 0x83, 0x83, 0x85, 0x8c,
> +	  0x87, 0x7f, 0xa2, 0x9d, 0x88, 0x8d, 0x88, 0x8b, 0x00, 0x00, 0x00,
> +	  0x00, 0x00 },
> +	{ 0x00, 0xbb, 0x00, 0xc5, 0x00, 0xb4, 0x87, 0x86, 0x86, 0x84, 0x83,
> +	  0x86, 0x87, 0x87, 0x87, 0x80, 0x82, 0x7f, 0x86, 0x86, 0x88, 0x8a,
> +	  0x84, 0x7e, 0x9d, 0x9c, 0x82, 0x8d, 0x88, 0x8b, 0x00, 0x00, 0x00,
> +	  0x00, 0x00 },
> +	{ 0x00, 0xbd, 0x00, 0xc7, 0x00, 0xb7, 0x87, 0x85, 0x85, 0x84, 0x83,
> +	  0x86, 0x86, 0x86, 0x88, 0x81, 0x83, 0x80, 0x83, 0x84, 0x85, 0x8a,
> +	  0x85, 0x7e, 0x9c, 0x9b, 0x85, 0x80, 0x80, 0x80, 0x00, 0x00, 0x00,
> +	  0x00, 0x00 },
> +	{ 0x00, 0xc0, 0x00, 0xca, 0x00, 0xbb, 0x87, 0x86, 0x85, 0x83, 0x83,
> +	  0x85, 0x86, 0x86, 0x88, 0x81, 0x83, 0x80, 0x84, 0x85, 0x86, 0x89,
> +	  0x83, 0x7d, 0x9c, 0x99, 0x87, 0x7b, 0x7b, 0x7c, 0x00, 0x00, 0x00,
> +	  0x00, 0x00 },
> +	{ 0x00, 0xc4, 0x00, 0xcd, 0x00, 0xbe, 0x87, 0x86, 0x85, 0x83, 0x83,
> +	  0x86, 0x85, 0x85, 0x87, 0x81, 0x82, 0x80, 0x82, 0x82, 0x83, 0x8a,
> +	  0x85, 0x7f, 0x9f, 0x9b, 0x86, 0xb4, 0xa1, 0xac, 0x00, 0x00, 0x00,
> +	  0x00, 0x00 },
> +	{ 0x00, 0xc7, 0x00, 0xd0, 0x00, 0xc2, 0x87, 0x85, 0x85, 0x83, 0x82,
> +	  0x85, 0x85, 0x85, 0x86, 0x82, 0x83, 0x80, 0x82, 0x82, 0x84, 0x87,
> +	  0x86, 0x80, 0x9e, 0x9a, 0x87, 0xa7, 0x98, 0xa1, 0x00, 0x00, 0x00,
> +	  0x00, 0x00 },
> +	{ 0x00, 0xca, 0x00, 0xd2, 0x00, 0xc5, 0x87, 0x85, 0x84, 0x82, 0x82,
> +	  0x84, 0x85, 0x85, 0x86, 0x81, 0x82, 0x7f, 0x82, 0x82, 0x84, 0x88,
> +	  0x86, 0x81, 0x9d, 0x98, 0x86, 0x8d, 0x88, 0x8b, 0x00, 0x00, 0x00,
> +	  0x00, 0x00 },
> +	{ 0x00, 0xce, 0x00, 0xd6, 0x00, 0xca, 0x86, 0x85, 0x84, 0x83, 0x83,
> +	  0x85, 0x84, 0x84, 0x85, 0x81, 0x82, 0x80, 0x81, 0x81, 0x82, 0x89,
> +	  0x86, 0x81, 0x9c, 0x97, 0x86, 0xa7, 0x98, 0xa1, 0x00, 0x00, 0x00,
> +	  0x00, 0x00 },
> +	{ 0x00, 0xd1, 0x00, 0xd9, 0x00, 0xce, 0x86, 0x84, 0x83, 0x83, 0x82,
> +	  0x85, 0x85, 0x85, 0x86, 0x81, 0x83, 0x81, 0x82, 0x82, 0x83, 0x86,
> +	  0x83, 0x7f, 0x99, 0x95, 0x86, 0xbb, 0xa4, 0xb3, 0x00, 0x00, 0x00,
> +	  0x00, 0x00 },
> +	{ 0x00, 0xd4, 0x00, 0xdb, 0x00, 0xd1, 0x86, 0x85, 0x83, 0x83, 0x82,
> +	  0x85, 0x84, 0x84, 0x85, 0x80, 0x83, 0x82, 0x80, 0x80, 0x81, 0x87,
> +	  0x84, 0x81, 0x98, 0x93, 0x85, 0xae, 0x9c, 0xa8, 0x00, 0x00, 0x00,
> +	  0x00, 0x00 },
> +	{ 0x00, 0xd8, 0x00, 0xde, 0x00, 0xd6, 0x86, 0x84, 0x83, 0x81, 0x81,
> +	  0x83, 0x85, 0x85, 0x85, 0x82, 0x83, 0x81, 0x81, 0x81, 0x83, 0x86,
> +	  0x84, 0x80, 0x98, 0x91, 0x85, 0x7b, 0x7b, 0x7c, 0x00, 0x00, 0x00,
> +	  0x00, 0x00 },
> +	{ 0x00, 0xdc, 0x00, 0xe2, 0x00, 0xda, 0x85, 0x84, 0x83, 0x82, 0x82,
> +	  0x84, 0x84, 0x84, 0x85, 0x81, 0x82, 0x82, 0x80, 0x80, 0x81, 0x83,
> +	  0x82, 0x7f, 0x99, 0x93, 0x86, 0x94, 0x8b, 0x92, 0x00, 0x00, 0x00,
> +	  0x00, 0x00 },
> +	{ 0x00, 0xdf, 0x00, 0xe5, 0x00, 0xde, 0x85, 0x84, 0x82, 0x82, 0x82,
> +	  0x84, 0x83, 0x83, 0x84, 0x81, 0x81, 0x80, 0x83, 0x82, 0x84, 0x82,
> +	  0x81, 0x7f, 0x99, 0x92, 0x86, 0x7b, 0x7b, 0x7c, 0x00, 0x00, 0x00,
> +	  0x00, 0x00 },
> +	{ 0x00, 0xe4, 0x00, 0xe9, 0x00, 0xe3, 0x84, 0x83, 0x82, 0x81, 0x81,
> +	  0x82, 0x83, 0x83, 0x84, 0x80, 0x81, 0x80, 0x83, 0x83, 0x84, 0x80,
> +	  0x81, 0x7c, 0x99, 0x92, 0x87, 0xa1, 0x93, 0x9d, 0x00, 0x00, 0x00,
> +	  0x00, 0x00 },
> +	{ 0x00, 0xe4, 0x00, 0xe9, 0x00, 0xe3, 0x85, 0x84, 0x83, 0x81, 0x81,
> +	  0x82, 0x82, 0x82, 0x83, 0x80, 0x81, 0x80, 0x81, 0x80, 0x82, 0x83,
> +	  0x82, 0x80, 0x91, 0x8d, 0x83, 0x9a, 0x90, 0x96, 0x00, 0x00, 0x00,
> +	  0x00, 0x00 },
> +	{ 0x00, 0xe4, 0x00, 0xe9, 0x00, 0xe3, 0x84, 0x83, 0x82, 0x81, 0x81,
> +	  0x82, 0x83, 0x83, 0x84, 0x80, 0x81, 0x80, 0x81, 0x80, 0x82, 0x83,
> +	  0x81, 0x7f, 0x91, 0x8c, 0x82, 0x8d, 0x88, 0x8b, 0x00, 0x00, 0x00,
> +	  0x00, 0x00 },
> +	{ 0x00, 0xe4, 0x00, 0xe9, 0x00, 0xe3, 0x84, 0x83, 0x82, 0x81, 0x81,
> +	  0x82, 0x83, 0x83, 0x83, 0x82, 0x82, 0x81, 0x81, 0x80, 0x82, 0x82,
> +	  0x82, 0x7f, 0x94, 0x89, 0x84, 0x80, 0x80, 0x80, 0x00, 0x00, 0x00,
> +	  0x00, 0x00 },
> +	{ 0x00, 0xe4, 0x00, 0xe9, 0x00, 0xe3, 0x84, 0x83, 0x82, 0x81, 0x81,
> +	  0x82, 0x83, 0x83, 0x83, 0x82, 0x82, 0x81, 0x81, 0x80, 0x82, 0x83,
> +	  0x82, 0x7f, 0x91, 0x85, 0x81, 0x80, 0x80, 0x80, 0x00, 0x00, 0x00,
> +	  0x00, 0x00 },
> +	{ 0x00, 0xe4, 0x00, 0xe9, 0x00, 0xe3, 0x84, 0x83, 0x82, 0x81, 0x81,
> +	  0x82, 0x83, 0x83, 0x83, 0x80, 0x80, 0x7f, 0x83, 0x82, 0x84, 0x83,
> +	  0x82, 0x7f, 0x90, 0x84, 0x81, 0x9a, 0x90, 0x96, 0x00, 0x00, 0x00,
> +	  0x00, 0x00 },
> +	{ 0x00, 0xe4, 0x00, 0xe9, 0x00, 0xe3, 0x84, 0x83, 0x82, 0x80, 0x80,
> +	  0x82, 0x83, 0x83, 0x83, 0x80, 0x80, 0x7f, 0x80, 0x80, 0x81, 0x81,
> +	  0x82, 0x83, 0x7e, 0x80, 0x7c, 0xa4, 0x97, 0x9f, 0x00, 0x00, 0x00,
> +	  0x00, 0x00 },
> +	{ 0x00, 0xe9, 0x00, 0xec, 0x00, 0xe8, 0x84, 0x83, 0x82, 0x81, 0x81,
> +	  0x82, 0x82, 0x82, 0x83, 0x7f, 0x7f, 0x7f, 0x81, 0x80, 0x82, 0x83,
> +	  0x83, 0x84, 0x79, 0x7c, 0x79, 0xb1, 0xa0, 0xaa, 0x00, 0x00, 0x00,
> +	  0x00, 0x00 },
> +	{ 0x00, 0xed, 0x00, 0xf0, 0x00, 0xec, 0x83, 0x83, 0x82, 0x80, 0x80,
> +	  0x81, 0x82, 0x82, 0x82, 0x7f, 0x7f, 0x7e, 0x81, 0x81, 0x82, 0x80,
> +	  0x81, 0x81, 0x84, 0x84, 0x83, 0x80, 0x80, 0x80, 0x00, 0x00, 0x00,
> +	  0x00, 0x00 },
> +	{ 0x00, 0xf1, 0x00, 0xf4, 0x00, 0xf1, 0x83, 0x82, 0x82, 0x80, 0x80,
> +	  0x81, 0x82, 0x82, 0x82, 0x80, 0x80, 0x80, 0x80, 0x80, 0x81, 0x7d,
> +	  0x7e, 0x7f, 0x84, 0x84, 0x83, 0x80, 0x80, 0x80, 0x00, 0x00, 0x00,
> +	  0x00, 0x00 },
> +	{ 0x00, 0xf6, 0x00, 0xf7, 0x00, 0xf5, 0x82, 0x82, 0x81, 0x80, 0x80,
> +	  0x80, 0x82, 0x82, 0x82, 0x80, 0x80, 0x80, 0x7f, 0x7f, 0x7f, 0x82,
> +	  0x82, 0x82, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x00, 0x00, 0x00,
> +	  0x00, 0x00 },
> +	{ 0x00, 0xfa, 0x00, 0xfb, 0x00, 0xfa, 0x81, 0x81, 0x81, 0x80, 0x80,
> +	  0x80, 0x82, 0x82, 0x82, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
> +	  0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x00, 0x00, 0x00,
> +	  0x00, 0x00 },
> +	{ 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0x80, 0x80, 0x80, 0x80, 0x80,
> +	  0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
> +	  0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x00, 0x00, 0x00,
> +	  0x00, 0x00 },
> +	{ 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0x80, 0x80, 0x80, 0x80, 0x80,
> +	  0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
> +	  0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x00, 0x00, 0x00,
> +	  0x00, 0x00 }
> +};
> +
> +unsigned char VINT_TABLE[S6E3HA2_VINT_STATUS_MAX] = {

Lower case names.

> +	0x18, 0x19, 0x1a, 0x1b, 0x1c,
> +	0x1d, 0x1e, 0x1f, 0x20, 0x21
> +};
> +
> +struct s6e3ha2 {
> +	struct device *dev;
> +	struct drm_panel panel;
> +	struct backlight_device *bl_dev;
> +
> +	struct regulator_bulk_data supplies[2];
> +	struct gpio_desc *reset_gpio;
> +	struct gpio_desc *enable_gpio;
> +	u32 power_on_delay;
> +	u32 reset_delay;
> +	struct videomode vm;
> +
> +	/* This field is tested by functions directly accessing DSI bus before
> +	 * transfer, transfer is skipped if it is set. In case of transfer
> +	 * failure or unexpected response the field is set to error value.
> +	 * Such construct allows to eliminate many checks in higher level
> +	 * functions.
> +	 */
> +	int error;
> +};
> +
> +static int  s6e3ha2_clear_error(struct s6e3ha2 *ctx)
> +{
> +	int ret = ctx->error;
> +
> +	ctx->error = 0;
> +	return ret;
> +}
> +
> +static void s6e3ha2_dcs_write(struct s6e3ha2 *ctx, const void *data, size_t len)
> +{
> +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> +	ssize_t ret;
> +
> +	if (ctx->error < 0)
> +		return;
> +
> +	ret = mipi_dsi_dcs_write_buffer(dsi, data, len);
> +	if (ret < 0) {
> +		dev_err(ctx->dev, "error %zd writing dcs seq: %*ph\n",
> +						ret, (int)len, data);
> +		ctx->error = ret;
> +	}
> +}
> +
> +#define s6e3ha2_dcs_write_seq_static(ctx, seq...) do {	\
> +	static const u8 d[] = { seq };			\
> +	s6e3ha2_dcs_write(ctx, d, ARRAY_SIZE(d));	\
> +} while (0)
> +
> +static void s6e3ha2_test_key_on_f0(struct s6e3ha2 *ctx)
> +{
> +	s6e3ha2_dcs_write_seq_static(ctx, 0xf0, 0x5a, 0x5a);
> +}
> +
> +static void s6e3ha2_test_key_off_f0(struct s6e3ha2 *ctx)
> +{
> +	s6e3ha2_dcs_write_seq_static(ctx, 0xf0, 0xa5, 0xa5);
> +}
> +
> +static void s6e3ha2_test_key_on_fc(struct s6e3ha2 *ctx)
> +{
> +	s6e3ha2_dcs_write_seq_static(ctx, 0xfc, 0x5a, 0x5a);
> +}
> +
> +static void s6e3ha2_test_key_off_fc(struct s6e3ha2 *ctx)
> +{
> +	s6e3ha2_dcs_write_seq_static(ctx, 0xfc, 0xa5, 0xa5);
> +}
> +
> +static void s6e3ha2_single_dsi_set(struct s6e3ha2 *ctx)
> +{
> +	s6e3ha2_dcs_write_seq_static(ctx, 0xf2, 0x67);
> +	s6e3ha2_dcs_write_seq_static(ctx, 0xf9, 0x09);
> +}
> +
> +static void s6e3ha2_freq_calibration(struct s6e3ha2 *ctx)
> +{
> +	s6e3ha2_dcs_write_seq_static(ctx, 0xfd, 0x1c);
> +	s6e3ha2_dcs_write_seq_static(ctx, 0xfe, 0x20, 0x39);
> +	s6e3ha2_dcs_write_seq_static(ctx, 0xfe, 0xa0);
> +	s6e3ha2_dcs_write_seq_static(ctx, 0xfe, 0x20);
> +	s6e3ha2_dcs_write_seq_static(ctx, 0xce, 0x03, 0x3b, 0x12, 0x62,
> +		0x40, 0x80, 0xc0, 0x28, 0x28, 0x28, 0x28, 0x39, 0xc5);
> +}
> +
> +static void s6e3ha2_aor_control(struct s6e3ha2 *ctx)
> +{
> +	s6e3ha2_dcs_write_seq_static(ctx, 0xb2, 0x03, 0x10);
> +}
> +
> +static void s6e3ha2_caps_elvss_set(struct s6e3ha2 *ctx)
> +{
> +	s6e3ha2_dcs_write_seq_static(ctx, 0xb6, 0x9c, 0x0a);
> +}
> +
> +static void s6e3ha2_acl_off(struct s6e3ha2 *ctx)
> +{
> +	s6e3ha2_dcs_write_seq_static(ctx, 0x55, 0x00);
> +}
> +
> +static void s6e3ha2_acl_off_opr(struct s6e3ha2 *ctx)
> +{
> +	s6e3ha2_dcs_write_seq_static(ctx, 0xb5, 0x40);
> +}
> +
> +static void s6e3ha2_test_global(struct s6e3ha2 *ctx)
> +{
> +	s6e3ha2_dcs_write_seq_static(ctx, 0xb0, 0x07);
> +}
> +
> +static void s6e3ha2_test(struct s6e3ha2 *ctx)
> +{
> +	s6e3ha2_dcs_write_seq_static(ctx, 0xb8, 0x19);
> +}
> +
> +static void s6e3ha2_touch_hsync_on1(struct s6e3ha2 *ctx) {
> +	s6e3ha2_dcs_write_seq_static(ctx,
> +			0xbd, 0x33, 0x11, 0x02, 0x16, 0x02, 0x16);
> +}
> +
> +static void s6e3ha2_pentile_control(struct s6e3ha2 *ctx)
> +{
> +	s6e3ha2_dcs_write_seq_static(ctx, 0xc0, 0x00, 0x00, 0xd8, 0xd8);
> +}
> +
> +static void s6e3ha2_poc_global(struct s6e3ha2 *ctx)
> +{
> +	s6e3ha2_dcs_write_seq_static(ctx, 0xb0, 0x20);
> +}
> +
> +static void s6e3ha2_poc_setting(struct s6e3ha2 *ctx)
> +{
> +	s6e3ha2_dcs_write_seq_static(ctx, 0xfe, 0x08);
> +}
> +
> +static void s6e3ha2_pcd_set_off(struct s6e3ha2 *ctx)
> +{
> +	s6e3ha2_dcs_write_seq_static(ctx, 0xcc, 0x40, 0x51);
> +}
> +
> +static void s6e3ha2_err_fg_set(struct s6e3ha2 *ctx)
> +{
> +	s6e3ha2_dcs_write_seq_static(ctx, 0xed, 0x44);
> +}
> +
> +static void s6e3ha2_hbm_off(struct s6e3ha2 *ctx)
> +{
> +	s6e3ha2_dcs_write_seq_static(ctx, 0x53, 0x00);
> +}
> +
> +static void s6e3ha2_te_start_setting(struct s6e3ha2 *ctx)
> +{
> +	s6e3ha2_dcs_write_seq_static(ctx, 0xb9, 0x10, 0x09, 0xff, 0x00, 0x09);
> +}
> +
> +static void s6e3ha2_gamma_update(struct s6e3ha2 *ctx)
> +{
> +	s6e3ha2_dcs_write_seq_static(ctx, 0xf7, 0x03);
> +	ndelay(100); /* need for 100ns delay */
> +	s6e3ha2_dcs_write_seq_static(ctx, 0xf7, 0x00);
> +}
> +
> +static int s6e3ha2_get_brightness(struct backlight_device *bl_dev)
> +{
> +	return bl_dev->props.brightness;
> +}
> +
> +static void s6e3ha2_set_vint(struct s6e3ha2 *ctx) {

Curly bracket should be on new line.

> +	struct backlight_device *bl_dev = ctx->bl_dev;
> +	unsigned int brightness = bl_dev->props.brightness;
> +	unsigned char data[] = { 0xf4, 0x8b,
> +			VINT_TABLE[brightness * (S6E3HA2_VINT_STATUS_MAX - 1) /
> +			S6E3HA2_MAX_BRIGHTNESS] };
> +
> +	s6e3ha2_dcs_write(ctx, data, 3);
> +}
> +
> +static unsigned int s6e3ha2_get_brightness_index(unsigned int brightness)
> +{
> +	return (brightness * (S6E3HA2_NUM_GAMMA_STEPS - 1)) /
> +		S6E3HA2_MAX_BRIGHTNESS;
> +}
> +
> +static int s6e3ha2_update_gamma(struct s6e3ha2 *ctx, unsigned int brightness)
> +{
> +	struct backlight_device *bl_dev = ctx->bl_dev;
> +	unsigned int index = s6e3ha2_get_brightness_index(brightness);
> +	u8 data[S6E3HA2_GAMMA_CMD_CNT + 1] = { 0xca, };
> +
> +	memcpy(data + 1, gamma_tbl + index, S6E3HA2_GAMMA_CMD_CNT);
> +	s6e3ha2_dcs_write(ctx, data, ARRAY_SIZE(data));
> +
> +	s6e3ha2_gamma_update(ctx);
> +	bl_dev->props.brightness = brightness;
> +
> +	return 0;
> +}
> +
> +static int s6e3ha2_set_brightness(struct backlight_device *bl_dev)
> +{
> +	struct s6e3ha2 *ctx = (struct s6e3ha2 *)bl_get_data(bl_dev);
> +	unsigned int brightness = bl_dev->props.brightness;
> +
> +	if (brightness < S6E3HA2_MIN_BRIGHTNESS ||
> +		brightness > bl_dev->props.max_brightness) {
> +		dev_err(ctx->dev, "Invalid brightness: %u\n", brightness);
> +		return -EINVAL;
> +	}
> +
> +	if (bl_dev->props.power > FB_BLANK_NORMAL) {
> +		dev_err(ctx->dev,
> +			"panel must be at least in fb blank normal state\n");

This message adds unnecessary noise to the logs, it should be definitely
removed.
I do not know how this callback should react here, it would be good to
verify it in documentation of backlight interface, or other drivers.

> +		return -EPERM;
> +	}
> +
> +	s6e3ha2_test_key_on_f0(ctx);
> +	s6e3ha2_update_gamma(ctx, brightness);
> +	s6e3ha2_aor_control(ctx);
> +	s6e3ha2_set_vint(ctx);
> +	s6e3ha2_test_key_off_f0(ctx);
> +
> +	return ctx->error;

I think 'return s6e3ha2_clear_error(ctx);' would be better here, but
this is just my suggestion.
By the way, backlight framework is not synchronized with drm framework,
so there are possible races here.

> +}
> +
> +static const struct backlight_ops s6e3ha2_bl_ops = {
> +	.get_brightness = s6e3ha2_get_brightness,
> +	.update_status = s6e3ha2_set_brightness,
> +};
> +
> +static void s6e3ha2_panel_init(struct s6e3ha2 *ctx)
> +{
> +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> +	u32 reset_delay = ctx->reset_delay * 1000;
> +
> +	mipi_dsi_dcs_exit_sleep_mode(dsi);
> +	usleep_range(reset_delay, reset_delay + 1000);
> +
> +	s6e3ha2_test_key_on_f0(ctx);
> +	s6e3ha2_single_dsi_set(ctx);
> +	s6e3ha2_test_key_on_fc(ctx);
> +	s6e3ha2_freq_calibration(ctx);
> +	s6e3ha2_test_key_off_fc(ctx);
> +	s6e3ha2_test_key_off_f0(ctx);
> +}
> +
> +static int s6e3ha2_power_off(struct s6e3ha2 *ctx)
> +{
> +	return regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +}
> +
> +static int s6e3ha2_disable(struct drm_panel *panel)
> +{
> +	struct s6e3ha2 *ctx = container_of(panel, struct s6e3ha2, panel);
> +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> +
> +	mipi_dsi_dcs_enter_sleep_mode(dsi);
> +	if (ctx->error != 0)
> +		goto err;
> +
> +	mipi_dsi_dcs_set_display_off(dsi);
> +	if (ctx->error != 0)
> +		goto err;
> +
> +	msleep(40);
> +	ctx->bl_dev->props.power = FB_BLANK_NORMAL;
> +
> +	return 0;
> +err:
> +	return ctx->error;
> +}
> +
> +static int s6e3ha2_unprepare(struct drm_panel *panel)
> +{
> +	struct s6e3ha2 *ctx = container_of(panel, struct s6e3ha2, panel);
> +	int ret;
> +
> +	ret = s6e3ha2_clear_error(ctx);
> +	if (!ret)
> +		ctx->bl_dev->props.power = FB_BLANK_POWERDOWN;
> +
> +	return s6e3ha2_power_off(ctx);
> +}
> +
> +static int s6e3ha2_power_on(struct s6e3ha2 *ctx)
> +{
> +	u32 reset_delay = ctx->reset_delay * 1000;
> +	int ret;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +	if (ret < 0)
> +		return ret;
> +
> +	msleep(ctx->power_on_delay);
> +
> +	gpiod_set_value(ctx->enable_gpio, 0);
> +	usleep_range(reset_delay, reset_delay + 1000);
> +	gpiod_set_value(ctx->enable_gpio, 1);
> +
> +	gpiod_set_value(ctx->reset_gpio, 0);
> +	usleep_range(reset_delay, reset_delay + 1000);
> +	gpiod_set_value(ctx->reset_gpio, 1);
> +	usleep_range(reset_delay, reset_delay + 1000);
> +
> +	return 0;
> +}
> +static int s6e3ha2_prepare(struct drm_panel *panel)
> +{
> +	struct s6e3ha2 *ctx = container_of(panel, struct s6e3ha2, panel);
> +	int ret;
> +
> +	ret = s6e3ha2_power_on(ctx);
> +	if (ret < 0)
> +		return ret;
> +
> +	s6e3ha2_panel_init(ctx);
> +
> +	ret = s6e3ha2_clear_error(ctx);
> +	if (ret < 0) {
> +		s6e3ha2_power_off(ctx);
> +		return ret;
> +	}
> +
> +	ctx->bl_dev->props.power = FB_BLANK_NORMAL;
> +
> +	return 0;
> +}
> +
> +static int s6e3ha2_enable(struct drm_panel *panel)
> +{
> +	struct s6e3ha2 *ctx = container_of(panel, struct s6e3ha2, panel);
> +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> +
> +	/* common setting */
> +	mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> +
> +	s6e3ha2_test_key_on_f0(ctx);
> +	s6e3ha2_test_key_on_fc(ctx);
> +	s6e3ha2_touch_hsync_on1(ctx);
> +	s6e3ha2_pentile_control(ctx);
> +	s6e3ha2_poc_global(ctx);
> +	s6e3ha2_poc_setting(ctx);
> +	s6e3ha2_test_key_off_fc(ctx);
> +
> +	/* pcd setting off for TB */
> +	s6e3ha2_pcd_set_off(ctx);
> +	s6e3ha2_err_fg_set(ctx);
> +	s6e3ha2_te_start_setting(ctx);
> +
> +	/* brightness setting */
> +	s6e3ha2_set_brightness(ctx->bl_dev);
> +	s6e3ha2_aor_control(ctx);
> +	s6e3ha2_caps_elvss_set(ctx);
> +	s6e3ha2_gamma_update(ctx);
> +	s6e3ha2_acl_off(ctx);
> +	s6e3ha2_acl_off_opr(ctx);
> +	s6e3ha2_hbm_off(ctx);
> +
> +	/* elvss temp compensation */
> +	s6e3ha2_test_global(ctx);
> +	s6e3ha2_test(ctx);
> +	s6e3ha2_test_key_off_f0(ctx);
> +
> +	mipi_dsi_dcs_set_display_on(dsi);
> +	if (ctx->error != 0)
> +		return ctx->error;
> +
> +	ctx->bl_dev->props.power = FB_BLANK_UNBLANK;
> +
> +	return 0;
> +}
> +
> +static int s6e3ha2_get_modes(struct drm_panel *panel)
> +{
> +	struct drm_connector *connector = panel->connector;
> +	struct s6e3ha2 *ctx = container_of(panel, struct s6e3ha2, panel);
> +	struct drm_display_mode *mode;
> +
> +	mode = drm_mode_create(connector->dev);
> +	if (!mode) {
> +		DRM_ERROR("failed to create a new display mode\n");
> +		return 0;
> +	}
> +
> +	drm_display_mode_from_videomode(&ctx->vm, mode);
> +	mode->vrefresh = 60;
> +	mode->width_mm = 71;
> +	mode->height_mm = 125;
> +	connector->display_info.width_mm = mode->width_mm;
> +	connector->display_info.height_mm = mode->height_mm;
> +
> +	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +	drm_mode_probed_add(connector, mode);
> +
> +	return 1;
> +}
> +
> +static const struct drm_panel_funcs s6e3ha2_drm_funcs = {
> +	.disable = s6e3ha2_disable,
> +	.unprepare = s6e3ha2_unprepare,
> +	.prepare = s6e3ha2_prepare,
> +	.enable = s6e3ha2_enable,
> +	.get_modes = s6e3ha2_get_modes,
> +};
> +
> +static int s6e3ha2_parse_dt(struct s6e3ha2 *ctx)
> +{
> +	struct device *dev = ctx->dev;
> +	struct device_node *np = dev->of_node;
> +	int ret;
> +
> +	ret = of_get_videomode(dev->of_node, &ctx->vm, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	of_property_read_u32(np, "power-on-delay", &ctx->power_on_delay);
> +	of_property_read_u32(np, "reset-delay", &ctx->reset_delay);

These props are not described in bindings, anyway I think these
properties similarly to display-timings are panel specific, so they
should be hardcoded into the driver.

> +
> +	return 0;
> +}
> +
> +static int s6e3ha2_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct s6e3ha2 *ctx;
> +	int ret;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +
> +	ctx->dev = dev;
> +
> +	dsi->lanes = 4;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS;
> +
> +	ret = s6e3ha2_parse_dt(ctx);
> +	if (ret < 0)
> +		return ret;
> +
> +	ctx->supplies[0].supply = "vdd3";
> +	ctx->supplies[1].supply = "vci";
> +
> +	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies),
> +				      ctx->supplies);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to get regulators: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(ctx->reset_gpio)) {
> +		dev_err(dev, "cannot get reset-gpios %ld\n",
> +			PTR_ERR(ctx->reset_gpio));
> +		return PTR_ERR(ctx->reset_gpio);
> +	}
> +
> +	ctx->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_HIGH);
> +	if (IS_ERR(ctx->enable_gpio)) {
> +		dev_err(dev, "cannot get enable-gpios %ld\n",
> +			PTR_ERR(ctx->enable_gpio));
> +		return PTR_ERR(ctx->enable_gpio);
> +	}
> +
> +	ctx->bl_dev = backlight_device_register("s6e3ha2", dev, ctx,
> +						&s6e3ha2_bl_ops, NULL);
> +	if (IS_ERR(ctx->bl_dev)) {
> +		dev_err(dev, "failed to register backlight device\n");
> +		return PTR_ERR(ctx->bl_dev);
> +	}
> +
> +	ctx->bl_dev->props.max_brightness = S6E3HA2_MAX_BRIGHTNESS;
> +	ctx->bl_dev->props.brightness = S6E3HA2_DEFAULT_BRIGHTNESS;
> +	ctx->bl_dev->props.power = FB_BLANK_POWERDOWN;
> +
> +	drm_panel_init(&ctx->panel);
> +	ctx->panel.dev = dev;
> +	ctx->panel.funcs = &s6e3ha2_drm_funcs;
> +
> +	ret = drm_panel_add(&ctx->panel);
> +	if (ret < 0)
> +		goto unregister_backlight;
> +
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret < 0)
> +		goto remove_panel;
> +
> +	return ret;
> +
> +remove_panel:
> +	drm_panel_remove(&ctx->panel);
> +
> +unregister_backlight:
> +	backlight_device_unregister(ctx->bl_dev);
> +
> +	return ret;
> +}
> +
> +static int s6e3ha2_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct s6e3ha2 *ctx = mipi_dsi_get_drvdata(dsi);
> +
> +	mipi_dsi_detach(dsi);
> +	drm_panel_remove(&ctx->panel);
> +	backlight_device_unregister(ctx->bl_dev);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id s6e3ha2_of_match[] = {
> +	{ .compatible = "samsung,s6e3ha2" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, s6e3ha2_of_match);
> +
> +static struct mipi_dsi_driver s6e3ha2_driver = {
> +	.probe = s6e3ha2_probe,
> +	.remove = s6e3ha2_remove,
> +	.driver = {
> +		.name = "panel-samsung-s6e3ha2",
> +		.of_match_table = s6e3ha2_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(s6e3ha2_driver);
> +
> +MODULE_AUTHOR("Donghwa Lee <dh09.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>");
> +MODULE_AUTHOR("Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>");
> +MODULE_AUTHOR("Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>");
> +MODULE_DESCRIPTION("MIPI-DSI based s6e3ha2 AMOLED Panel Driver");
> +MODULE_LICENSE("GPL v2");


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
