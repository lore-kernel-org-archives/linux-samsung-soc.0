From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] backlight: lcd: add driver for raster-type lcd's with
 gpio controlled panel reset
Date: Thu, 5 Jan 2012 22:46:58 -0800
Message-ID: <CAOesGMiMervHeVZeTitC20QScGhHOL2nqnmZTBRc17s-K1OhZA@mail.gmail.com>
References: <1325778146-27056-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1325778146-27056-1-git-send-email-thomas.abraham@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, lars@metafoo.de, kwangwoo.lee@gmail.com, patches@linaro.org, jg1.han@samsung.com, linux-kernel@vger.kernel.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, cbou@mail.ru, kyungmin.park@samsung.com, kgene.kim@samsung.com, rpurdie@rpsys.net, ben-linux@fluff.org, broonie@opensource.wolfsonmicro.com, augulis.darius@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

This looks much better than the previous approach. Some comments on
the binding below.

On Thu, Jan 5, 2012 at 7:42 AM, Thomas Abraham
<thomas.abraham@linaro.org> wrote:

> diff --git a/Documentation/devicetree/bindings/lcd/lcd-pwrctrl.txt b/Docu=
mentation/devicetree/bindings/lcd/lcd-pwrctrl.txt
> new file mode 100644
> index 0000000..941e2ff
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/lcd/lcd-pwrctrl.txt
> @@ -0,0 +1,39 @@
> +* Power controller for simple lcd panels
> +
> +Some LCD panels provide a simple control interface for the host system. =
The
> +control mechanism would include a nRESET line connected to a gpio of the=
 host
> +system and a Vcc supply line which the host can optionally be controlled=
 using
> +a voltage regulator. Such simple panels do not support serial command
> +interface (such as i2c or spi) or memory-mapped-io interface.
> +
> +Required properties:
> +- compatible: should be 'lcd,powerctrl'

The convention for names is "vendor,product", so it would be better to
name this something like "lcd-powercontrol"

> +- gpios: The GPIO number of the host system used to control the nRESET l=
ine.
> + =A0The format of the gpio specifier depends on the gpio controller of t=
he
> + =A0host system.
> +
> +Optional properties:
> +- lcd,pwrctrl-nreset-gpio-invert: When the nRESET line is asserted low, =
the
> + =A0lcd panel is reset and stays in reset mode as long as the nRESET lin=
e is
> + =A0asserted low. This is the default behaviour of most lcd panels. If a=
 lcd
> + =A0panel requires the nRESET line to be asserted high for panel reset, =
then
> + =A0this property is used.
> +- lcd,pwrctrl-min-uV: If a regulator controls the Vcc voltage of the lcd=
 panel,
> + =A0this property specifies the minimum voltage the regulator should sup=
ply.
> + =A0The value of this property should in in micro-volts.
> +- lcd,pwrctrl-max-uV: If a regulator controls the Vcc voltage of the lcd=
 panel,
> + =A0this property specifies the maximum voltage the regulator should lim=
it to
> + =A0on the Vcc line. The value of this property should in in micro-volts.
> +- vcc-lcd-supply: phandle of the regulator that controls the vcc supply =
to
> + =A0the lcd panel.

The above names are somewhat inconsistent. Why abbreviate powercontrol
in different ways between compatible and properties, for example.

Also, since there's no vendor to prefix with, it might just be easier
to avoid the prefix alltogether, or use a <word>-<property> prefix
instead, such as:

lcd-reset-gpios
lcd-reset-active-low   (some platforms can specify polarity in the
gpio specifier, so I'm not sure if this is needed?
lcd-power-min-uV
lcd-power-max-uV
lcd-power-supply

> +
> +Example:
> +
> + =A0 =A0 =A0 lcd_pwrctrl {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "lcd,powerctrl";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpios =3D <&gpe0 4 1 0 0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 lcd,pwrctrl-nreset-gpio-invert;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 lcd,pwrctrl-min-uV =3D <2500000>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 lcd,pwrctrl-max-uV =3D <3300000>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 lcd-vcc-supply - <&regulator7>;
> + =A0 =A0 =A0 };


[...]
> +
> +#ifdef CONFIG_OF
> +static void __devinit lcd_pwrctrl_parse_dt(struct device *dev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 struct lcd_pwrctrl_data *pdata)
> +{
> + =A0 =A0 =A0 struct device_node *np =3D dev->of_node;
> +
> + =A0 =A0 =A0 pdata->gpio =3D of_get_gpio(np, 0);
> + =A0 =A0 =A0 if (of_get_property(np, "lcd,pwrctrl-nreset-gpio-invert", N=
ULL))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pdata->invert =3D true;
> + =A0 =A0 =A0 of_property_read_u32(np, "lcd,pwrctrl-min-uV", &pdata->min_=
uV);
> + =A0 =A0 =A0 of_property_read_u32(np, "lcd,pwrctrl-max-uV", &pdata->max_=
uV);
> +}
> +#endif
> +
> +static int __devinit lcd_pwrctrl_probe(struct platform_device *pdev)
> +{
> + =A0 =A0 =A0 struct lcd_pwrctrl *lp;
> + =A0 =A0 =A0 struct lcd_pwrctrl_data *pdata =3D pdev->dev.platform_data;
> + =A0 =A0 =A0 struct device *dev =3D &pdev->dev;
> + =A0 =A0 =A0 int err;
> +
> +#ifdef CONFIG_OF
> + =A0 =A0 =A0 if (dev->of_node) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pdata =3D devm_kzalloc(dev, sizeof(*pdata),=
 GFP_KERNEL);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!pdata) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(dev, "memory alloca=
tion for pdata failed\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 lcd_pwrctrl_parse_dt(dev, pdata);
> + =A0 =A0 =A0 }
> +#endif

The usual way of handling this is by checking if pdata is NULL, and if
so, call lcd_pwrctrl_fill_pdata() that returns an allocated pdata
structure (and check pdata for NULL again). That can also be done by
doing a stub that returns NULL and not use ifdef in the C code.

[...]

> diff --git a/include/video/lcd_pwrctrl.h b/include/video/lcd_pwrctrl.h
> new file mode 100644
> index 0000000..75b6ce2
> --- /dev/null
> +++ b/include/video/lcd_pwrctrl.h
> @@ -0,0 +1,30 @@
> +/*
> + * Simple lcd panel power control driver.
> + *
> + * Copyright (c) 2011-2012 Samsung Electronics Co., Ltd.
> + * Copyright (c) 2011-2012 Linaro Ltd.
> + *
> + * This driver is derived from platform-lcd.h which was written by
> + * Ben Dooks <ben@simtec.co.uk>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> +*/
> +
> +/**
> + * struct lcd_pwrctrl_data - platform data for lcd_pwrctrl driver.
> + * @gpio: GPIO number of the host system that connects to nRESET line.
> + * @invert: True, if output of gpio connected to nRESET should be invert=
ed.
> + * @min_uV: Minimum required voltage output from the regulator. The volt=
age
> + * =A0 should be specified in micro-volts.
> + * @max_uV: Maximum acceptable voltage output from the regulator. The vo=
ltage
> + * =A0 should be specified in micro-volts.
> + */
> +struct lcd_pwrctrl_data {
> + =A0 =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 gpio;
> + =A0 =A0 =A0 bool =A0 =A0 =A0 =A0 =A0 =A0invert;
> + =A0 =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 min_uV;
> + =A0 =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 max_uV;
> +};

If this is a pure open firmware driver, then there is no need to
export this, you can just keep it internal to the C file.
