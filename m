From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH] iio: adc: Replace license text w/ SPDX identifier
Date: Sat, 1 Dec 2018 16:55:50 +0000
Message-ID: <20181201165550.51a78366@archlinux>
References: <20181128175312.9634-1-matheus.bernardino@usp.br>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181128175312.9634-1-matheus.bernardino@usp.br>
Sender: linux-kernel-owner@vger.kernel.org
To: Matheus Tavares <matheus.bernardino@usp.br>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Hartmut Knaack <knaack.h@gmx.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Ludovic Desroches <ludovic.desroches@microchip.com>, Eugen Hristev <eugen.hristev@microchip.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Support Opensource <support.opensource@diasemi.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.o>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, 28 Nov 2018 15:53:12 -0200
Matheus Tavares <matheus.bernardino@usp.br> wrote:

> From: Lucas Santos <ilucas.ms@gmail.com>
> 
> This patch removes all license boilerplate texts from the .c and .h
> files at drivers/iio/adc/ and, instead, adds the proper SPDX license
> identifiers.
> 
> Signed-off-by: Lucas Santos <ilucas.ms@gmail.com>
> Signed-off-by: Matheus Tavares <matheus.bernardino@usp.br>
Hi Lucas, Matheus,

Doing this as a large all at once patch may seem like a good idea, but...

Whilst it is now kernel policy (sort of) to use SPDX, that doesn't
correspond to converting all code without input from the original
authors.

As such, I am normally only happy to apply SPDX patches with an
ack from either the original author, or at least someone from the
company who holds the copyright.

I have expressed before that I actually consider these mostly
noise and so am not keen at all unless there is other work
being done on a particular driver.

So please split this up into at least separate patches
for each of the copyright holders, so they can provide an ACK
if they are happy with this change.

Some companies will for example want their legal departments to
do a review of whether SPDX is acceptable for their past contributions.
(lots won't care btw - but the potential is there).

+CC Linus Walleij as one of his files doesn't have a license...

A few other comments inline...

Thanks,

Jonathan

> ---
>  drivers/iio/adc/ad7266.c             |  3 +--
>  drivers/iio/adc/ad7291.c             |  3 +--
>  drivers/iio/adc/ad7298.c             |  3 +--
>  drivers/iio/adc/ad7766.c             |  3 +--
>  drivers/iio/adc/ad7791.c             |  3 +--
>  drivers/iio/adc/ad7793.c             |  3 +--
>  drivers/iio/adc/ad7887.c             |  3 +--
>  drivers/iio/adc/ad7923.c             |  3 +--
>  drivers/iio/adc/ad799x.c             |  5 +----
>  drivers/iio/adc/ad_sigma_delta.c     |  3 +--
>  drivers/iio/adc/aspeed_adc.c         |  6 +-----
>  drivers/iio/adc/at91-sama5d2_adc.c   | 10 +---------
>  drivers/iio/adc/at91_adc.c           |  3 +--
>  drivers/iio/adc/axp20x_adc.c         |  5 +----
>  drivers/iio/adc/axp288_adc.c         | 13 +------------
>  drivers/iio/adc/bcm_iproc_adc.c      | 13 +------------
>  drivers/iio/adc/berlin2-adc.c        |  5 +----
>  drivers/iio/adc/cc10001_adc.c        |  6 +-----
>  drivers/iio/adc/cpcap-adc.c          | 10 +---------
>  drivers/iio/adc/da9150-gpadc.c       |  6 +-----
>  drivers/iio/adc/dln2-adc.c           |  5 +----
>  drivers/iio/adc/ep93xx_adc.c         |  5 +----
>  drivers/iio/adc/exynos_adc.c         | 11 +----------
>  drivers/iio/adc/fsl-imx25-gcq.c      |  5 +----
>  drivers/iio/adc/hi8435.c             |  6 +-----
>  drivers/iio/adc/hx711.c              |  6 +-----
>  drivers/iio/adc/imx7d_adc.c          |  6 +-----
>  drivers/iio/adc/ina2xx-adc.c         |  7 +------
>  drivers/iio/adc/lp8788_adc.c         |  5 +----
>  drivers/iio/adc/lpc18xx_adc.c        |  5 +----
>  drivers/iio/adc/lpc32xx_adc.c        | 15 +--------------
>  drivers/iio/adc/ltc2471.c            |  3 +--
>  drivers/iio/adc/ltc2485.c            |  5 +----
>  drivers/iio/adc/ltc2497.c            |  3 +--
>  drivers/iio/adc/max1027.c            |  5 +----
>  drivers/iio/adc/max1118.c            |  5 +----
>  drivers/iio/adc/max1363.c            |  5 +----
>  drivers/iio/adc/mcp320x.c            |  5 +----
>  drivers/iio/adc/mcp3422.c            |  6 +-----
>  drivers/iio/adc/men_z188_adc.c       |  5 +----
>  drivers/iio/adc/meson_saradc.c       |  5 +----
>  drivers/iio/adc/mt6577_auxadc.c      | 10 +---------
>  drivers/iio/adc/mxs-lradc-adc.c      | 11 +----------
>  drivers/iio/adc/nau7802.c            |  3 +--
>  drivers/iio/adc/palmas_gpadc.c       |  5 +----
>  drivers/iio/adc/qcom-pm8xxx-xoadc.c  |  1 +
>  drivers/iio/adc/qcom-spmi-iadc.c     | 10 +---------
>  drivers/iio/adc/qcom-spmi-vadc.c     | 10 +---------
>  drivers/iio/adc/rockchip_saradc.c    | 11 +----------
>  drivers/iio/adc/spear_adc.c          |  3 +--
>  drivers/iio/adc/stx104.c             | 10 +---------
>  drivers/iio/adc/sun4i-gpadc-iio.c    |  5 +----
>  drivers/iio/adc/ti-adc081c.c         |  5 +----
>  drivers/iio/adc/ti-adc0832.c         |  5 +----
>  drivers/iio/adc/ti-adc084s021.c      |  5 +----
>  drivers/iio/adc/ti-adc108s102.c      | 10 +---------
>  drivers/iio/adc/ti-adc12138.c        |  5 +----
>  drivers/iio/adc/ti-ads1015.c         |  5 +----
>  drivers/iio/adc/ti-ads8688.c         |  5 +----
>  drivers/iio/adc/ti-tlc4541.c         |  5 +----
>  drivers/iio/adc/ti_am335x_adc.c      | 10 +---------
>  drivers/iio/adc/twl4030-madc.c       | 16 +---------------
>  drivers/iio/adc/twl6030-gpadc.c      | 16 +---------------
>  drivers/iio/adc/vf610_adc.c          | 15 +--------------
>  drivers/iio/adc/viperboard_adc.c     |  7 +------
>  drivers/iio/adc/xilinx-xadc-core.c   |  3 +--
>  drivers/iio/adc/xilinx-xadc-events.c |  3 +--
>  drivers/iio/adc/xilinx-xadc.h        |  3 +--
>  68 files changed, 68 insertions(+), 361 deletions(-)
> 
...

> diff --git a/drivers/iio/adc/ina2xx-adc.c b/drivers/iio/adc/ina2xx-adc.c
> index bdd7cba6f6b0..9bbcca9df401 100644
> --- a/drivers/iio/adc/ina2xx-adc.c
> +++ b/drivers/iio/adc/ina2xx-adc.c
> @@ -1,20 +1,15 @@
> +// SPDX-License-Identifier: GPL-2.0+
Oh great, contradictory license text.   The first
part would normally imply GPL-2.0 and the second
is clearly GPL-2.0+

I'd leave this one be unless you can get input from the various
authors.

>  /*
>   * INA2XX Current and Power Monitors
>   *
>   * Copyright 2015 Baylibre SAS.
>   *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License version 2 as
> - * published by the Free Software Foundation.
> - *
>   * Based on linux/drivers/iio/adc/ad7291.c
>   * Copyright 2010-2011 Analog Devices Inc.
>   *
>   * Based on linux/drivers/hwmon/ina2xx.c
>   * Copyright 2012 Lothar Felten <l-felten@ti.com>
>   *
> - * Licensed under the GPL-2 or later.
> - *
>   * IIO driver for INA219-220-226-230-231
>   *
>   * Configurable 7-bit I2C slave address from 0x40 to 0x4F


...

> diff --git a/drivers/iio/adc/max1363.c b/drivers/iio/adc/max1363.c
> index a8d35aebee80..6d191ffc4c7e 100644
> --- a/drivers/iio/adc/max1363.c
> +++ b/drivers/iio/adc/max1363.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
>   /*
>    * iio/adc/max1363.c
>    * Copyright (C) 2008-2010 Jonathan Cameron
> @@ -9,10 +10,6 @@
>    * Copyright (C) 2000 Russell King
>    *
>    * Driver for max1363 and similar chips.
> -  *
> -  * This program is free software; you can redistribute it and/or modify
> -  * it under the terms of the GNU General Public License version 2 as
> -  * published by the Free Software Foundation.
>    */

This one's mine so in a separate patch you can add.

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> diff --git a/drivers/iio/adc/qcom-pm8xxx-xoadc.c b/drivers/iio/adc/qcom-pm8xxx-xoadc.c
> index c30c002f1fef..648136ed1f85 100644
> --- a/drivers/iio/adc/qcom-pm8xxx-xoadc.c
> +++ b/drivers/iio/adc/qcom-pm8xxx-xoadc.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0

Oh goody.  A file with out a license.  oops.
Thankfully an author we can easily get hold of!
Linus, what should it be?

>  /*
>   * Qualcomm PM8xxx PMIC XOADC driver
>   *
