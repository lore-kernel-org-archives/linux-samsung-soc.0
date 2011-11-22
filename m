From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 1/8 v3] pinctrl: add a generic pin config interface
Date: Tue, 22 Nov 2011 16:22:09 +0530
Message-ID: <CAJuYYwRFGn+Efu80yjszuBof5omN1RvKjz7efh8bwK2t-MUj+A@mail.gmail.com>
References: <1321904871-32278-1-git-send-email-linus.walleij@stericsson.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:43850 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753235Ab1KVKwK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Nov 2011 05:52:10 -0500
In-Reply-To: <1321904871-32278-1-git-send-email-linus.walleij@stericsson.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@stericsson.com>
Cc: linux-kernel@vger.kernel.org, Stephen Warren <swarren@nvidia.com>, Grant Likely <grant.likely@secretlab.ca>, Barry Song <21cnbao@gmail.com>, Shawn Guo <shawn.guo@freescale.com>, Dong Aisheng <dong.aisheng@linaro.org>, Rajendra Nayak <rajendra.nayak@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

Hi Linus,

On 22 November 2011 01:17, Linus Walleij <linus.walleij@stericsson.com>=
 wrote:
> From: Linus Walleij <linus.walleij@linaro.org>
>
> This add per-pin and per-group pin config interfaces for biasing,
> driving and other such electronic properties. The intention is
> clearly to enumerate all things you can do with pins, hoping that
> these are enumerable.

[...]

> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> =A0Documentation/pinctrl.txt =A0 =A0 =A0 | =A0105 +++++++++++-
> =A0drivers/pinctrl/Kconfig =A0 =A0 =A0 =A0 | =A0 =A05 +-
> =A0drivers/pinctrl/Makefile =A0 =A0 =A0 =A0| =A0 =A01 +
> =A0drivers/pinctrl/core.c =A0 =A0 =A0 =A0 =A0| =A0 19 ++
> =A0drivers/pinctrl/core.h =A0 =A0 =A0 =A0 =A0| =A0 10 +
> =A0drivers/pinctrl/pinconf.c =A0 =A0 =A0 | =A0366 +++++++++++++++++++=
++++++++++++++++++++
> =A0drivers/pinctrl/pinconf.h =A0 =A0 =A0 | =A0 41 +++++
> =A0include/linux/pinctrl/pinconf.h | =A0209 ++++++++++++++++++++++
> =A0include/linux/pinctrl/pinctrl.h | =A0 10 +-
> =A09 files changed, 755 insertions(+), 11 deletions(-)
> =A0create mode 100644 drivers/pinctrl/pinconf.c
> =A0create mode 100644 drivers/pinctrl/pinconf.h
> =A0create mode 100644 include/linux/pinctrl/pinconf.h
>

[...]


> diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
> index 74dee43..4b30a28 100644
> --- a/drivers/pinctrl/core.h
> +++ b/drivers/pinctrl/core.h
> @@ -9,6 +9,10 @@
> =A0* License terms: GNU General Public License (GPL) version 2
> =A0*/
>
> +#include <linux/pinctrl/pinconf.h>
> +
> +struct pinctrl_gpio_range;
> +
> =A0/**
> =A0* struct pinctrl_dev - pin control class device
> =A0* @node: node to include this pin controller in the global pin con=
troller list
> @@ -52,6 +56,8 @@ struct pinctrl_dev {
> =A0* @mux_requested: whether the pin is already requested by pinmux o=
r not
> =A0* @mux_function: a named muxing function for the pin that will be =
passed to
> =A0* =A0 =A0 subdrivers and shown in debugfs etc
> + * @config_lock: a lock to protect the pin configuration portions
> + * @pin_configs: a list of configuration settings for this pin
> =A0*/
> =A0struct pin_desc {
> =A0 =A0 =A0 =A0struct pinctrl_dev *pctldev;
> @@ -61,6 +67,10 @@ struct pin_desc {
> =A0#ifdef CONFIG_PINMUX
> =A0 =A0 =A0 =A0const char *mux_function;
> =A0#endif
> +#ifdef CONFIG_PINCONF
> + =A0 =A0 =A0 struct mutex config_lock;
> + =A0 =A0 =A0 struct pin_config config;


Some platforms (like exynos) can read back the current pin_config from
the hardware registers. For such platforms, 'config' would consume
additional space which will not be used. Can 'config' be made a
pointer and memory for it allocated in 'pinctrl_register_one_pin' only
if the pin-controller requires it. Maybe, 'struct pinctrl_desc' can
have a additional member to describe some of its characteristics such
as ability to read back pin configuration from registers.


> +#endif
> =A0};
>
> =A0struct pinctrl_dev *get_pinctrl_dev_from_dev(struct device *dev,
> diff --git a/drivers/pinctrl/pinconf.c b/drivers/pinctrl/pinconf.c
> new file mode 100644
> index 0000000..dc59c04
> --- /dev/null
> +++ b/drivers/pinctrl/pinconf.c

[...]

> +int pin_config(struct pinctrl_dev *pctldev, int pin,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0const struct pin_config_tuple *configs,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned num_configs)
> +{
> + =A0 =A0 =A0 const struct pinconf_ops *ops =3D pctldev->desc->confop=
s;
> + =A0 =A0 =A0 struct pin_desc *desc;
> + =A0 =A0 =A0 struct pin_config *conf;
> + =A0 =A0 =A0 int ret;
> +
> + =A0 =A0 =A0 desc =3D pin_desc_get(pctldev, pin);
> + =A0 =A0 =A0 if (desc =3D=3D NULL) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pctldev->dev, "tried to config=
ure unregistered pin\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 conf =3D &desc->config;
> +
> + =A0 =A0 =A0 if (!ops || !ops->pin_config) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pctldev->dev, "cannot configur=
e pin, missing "
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "config function in dri=
ver\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 mutex_lock(&desc->config_lock);
> + =A0 =A0 =A0 ret =3D ops->pin_config(pctldev, conf, pin, configs, nu=
m_configs);
> + =A0 =A0 =A0 if (ret) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pctldev->dev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "unable to set pin conf=
iguration on pin %d\n", pin);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 pinconf_update_states(conf, configs, num_configs);
> + =A0 =A0 =A0 mutex_unlock(&desc->config_lock);
> +
> + =A0 =A0 =A0 return 0;
> +}

EXPORT_SYMBOL(pin_config); here ?

> +
> +int pin_config_group(struct pinctrl_dev *pctldev, const char *pin_gr=
oup,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const struct pin_config_tupl=
e *configs,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned num_configs)
> +{
> + =A0 =A0 =A0 const struct pinctrl_ops *pctlops =3D pctldev->desc->pc=
tlops;
> + =A0 =A0 =A0 const struct pinconf_ops *ops =3D pctldev->desc->confop=
s;
> + =A0 =A0 =A0 int selector;
> + =A0 =A0 =A0 const unsigned *pins;
> + =A0 =A0 =A0 unsigned num_pins;
> + =A0 =A0 =A0 int ret;
> + =A0 =A0 =A0 int i;
> +
> + =A0 =A0 =A0 if (!ops || (!ops->pin_config_group && !ops->pin_config=
)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pctldev->dev, "cannot configur=
e pin group, missing "
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "config function in dri=
ver\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 selector =3D pinctrl_get_group_selector(pctldev, pin_gr=
oup);
> + =A0 =A0 =A0 if (selector < 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return selector;
> +
> + =A0 =A0 =A0 ret =3D pctlops->get_group_pins(pctldev, selector, &pin=
s, &num_pins);
> + =A0 =A0 =A0 if (ret) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pctldev->dev, "cannot configur=
e pin group, error "
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "getting pins\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* If the pin controller supports handling entire gro=
ups we use that
> + =A0 =A0 =A0 =A0* capability.
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 if (ops->pin_config_group) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D ops->pin_config_group(pctldev, =
selector,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 configs, num_configs);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Success, update per-pin state */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret =3D=3D 0) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (i =3D 0; i < num_p=
ins; i++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct =
pin_desc *desc;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 desc =3D=
 pin_desc_get(pctldev, pins[i]);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (des=
c =3D=3D NULL) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 dev_err(&pctldev->dev, "error updating state\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 return -EINVAL;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mutex_l=
ock(&desc->config_lock);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pinconf=
_update_states(&desc->config,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 configs, num_configs);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mutex_u=
nlock(&desc->config_lock);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* If the pin controller prefer that =
a certain group be handled
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* pin-by-pin as well, it returns -EA=
GAIN.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret !=3D -EAGAIN)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* If the controller cannot handle entire groups, we =
configure each pin
> + =A0 =A0 =A0 =A0* individually.
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 for (i =3D 0; i < num_pins; i++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D pin_config(pctldev, pins[i], co=
nfigs, num_configs);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret < 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 return 0;
> +}

EXPORT_SYMBOL(pin_config_group); here ?

> +
> +int pinconf_check_ops(const struct pinconf_ops *ops)
> +{

[...]

> diff --git a/include/linux/pinctrl/pinconf.h b/include/linux/pinctrl/=
pinconf.h
> new file mode 100644
> index 0000000..45e424b
> --- /dev/null
> +++ b/include/linux/pinctrl/pinconf.h
> @@ -0,0 +1,209 @@
> +/*
> + * Interface the pinconfig portions of the pinctrl subsystem
> + *
> + * Copyright (C) 2011 ST-Ericsson SA
> + * Written on behalf of Linaro for ST-Ericsson
> + * This interface is used in the core to keep track of pins.
> + *
> + * Author: Linus Walleij <linus.walleij@linaro.org>
> + *
> + * License terms: GNU General Public License (GPL) version 2
> + */
> +#ifndef __LINUX_PINCTRL_PINCONF_H
> +#define __LINUX_PINCTRL_PINCONF_H
> +

[...]

> +enum pin_config_param {
> + =A0 =A0 =A0 PIN_CONFIG_BIAS_DISABLE,
> + =A0 =A0 =A0 PIN_CONFIG_BIAS_HIGH_IMPEDANCE,
> + =A0 =A0 =A0 PIN_CONFIG_BIAS_PULL_UP,
> + =A0 =A0 =A0 PIN_CONFIG_BIAS_PULL_DOWN,
> + =A0 =A0 =A0 PIN_CONFIG_BIAS_HIGH,
> + =A0 =A0 =A0 PIN_CONFIG_BIAS_GROUND,
> + =A0 =A0 =A0 PIN_CONFIG_DRIVE_PUSH_PULL,
> + =A0 =A0 =A0 PIN_CONFIG_DRIVE_OPEN_DRAIN,
> + =A0 =A0 =A0 PIN_CONFIG_DRIVE_OPEN_SOURCE,
> + =A0 =A0 =A0 PIN_CONFIG_DRIVE_OFF,
> + =A0 =A0 =A0 PIN_CONFIG_INPUT_SCHMITT,
> + =A0 =A0 =A0 PIN_CONFIG_INPUT_DEBOUNCE,
> + =A0 =A0 =A0 PIN_CONFIG_SLEW_RATE_RISING,
> + =A0 =A0 =A0 PIN_CONFIG_SLEW_RATE_FALLING,
> + =A0 =A0 =A0 PIN_CONFIG_POWER_SOURCE,
> + =A0 =A0 =A0 PIN_CONFIG_LOW_POWER_MODE,
> + =A0 =A0 =A0 PIN_CONFIG_WAKEUP,
> + =A0 =A0 =A0 PIN_CONFIG_END,
> +};

=46or all Samsung SoC's, PIN_CONFIG_BIAS_PULL_UP,
PIN_CONFIG_BIAS_PULL_DOWN and PIN_CONFIG_DRIVE_PUSH_PULL would be
sufficient. So the above list of config options is fine for all
Samsung platforms.

> +
> +/**
> + * struct pin_config_tuple - a composite parameter and argument conf=
ig item
> + * @param: the parameter to configure
> + * @data: argument to the parameter, meaning depend on parameter
> + */

[...]

> +extern int pin_config(struct pinctrl_dev *pctldev, int pin,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const struct pin_config_tup=
le *configs,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned num_configs);


Is the 'pin' number expected to be local to the pin-controller
represented by 'pctldev' ?  There can be multiple pin-controllers in a
system, so it would be easier if 'pin' parameter above is a
system-wide pin number, and the caller of 'pin_config' need not know
which pin-controller manages 'pin'. Ideally, 'pctldev' should not be
included in the parameter list.


> +extern int pin_config_group(struct pinctrl_dev *pctldev, const char =
*pin_group,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const struct pi=
n_config_tuple *configs,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned num_co=
nfigs);
> +

[...]


Thanks for this patch.

Regards,
Thomas.
