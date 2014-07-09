From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v7 18/24] mfd: max77686: Add Maxim 77802 PMIC support
Date: Wed, 9 Jul 2014 16:31:46 +0100
Message-ID: <20140709153146.GJ2635@lee--X1>
References: <1404505467-26526-1-git-send-email-javier.martinez@collabora.co.uk>
 <1404505467-26526-19-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1404505467-26526-19-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Mark Brown <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Yadwinder Singh Brar <yadi.brar01@gmail.com>, Tushar Behera <trblinux@gmail.com>, Andreas Farber <afaerber@suse.de>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 04 Jul 2014, Javier Martinez Canillas wrote:
> Maxim MAX77802 is a power management chip that contains 10 high
> efficiency Buck regulators, 32 Low-dropout (LDO) regulators used
> to power up application processors and peripherals, a 2-channel
> 32kHz clock outputs, a Real-Time-Clock (RTC) and a I2C interface
> to program the individual regulators, clocks outputs and the RTC.
>=20
> This patch adds support for MAX77802 to the MAX77686 driver and is
> based on a driver added to the Chrome OS kernel 3.8 by Simon Glass.
>=20
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co=
=2Euk>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---

[...]

>  static const struct i2c_device_id max77686_i2c_id[] =3D {
>  	{ "max77686", TYPE_MAX77686 },
> +	{ "max77802", TYPE_MAX77802 },
>  	{ }

There's no point in filling this in.  Just empty it completely.

Once you've done that, resubmit the patchset with my:

Acked-by: Lee Jones <lee.jones@linaro.org>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
