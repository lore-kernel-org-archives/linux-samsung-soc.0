From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] mfd: cros_ec_spi: set wakeup capability
Date: Wed, 18 Jun 2014 10:20:12 +0100
Message-ID: <20140618092012.GF23945@lee--X1>
References: <1402953143-24681-1-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1402953143-24681-1-git-send-email-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: broonie@kernel.org, Andrew Bresticker <abrestic@chromium.org>, swarren@wwwdotorg.org, olof@lixom.net, Sonny Rao <sonnyrao@chromium.org>, linux-samsung-soc@vger.kernel.org, Prathyush K <prathyush.k@samsung.com>, sameo@linux.intel.com, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

> From: Prathyush K <prathyush.k@samsung.com>
>=20
> Set the device as wakeup capable and register the wakeup source.
>=20
> Note: Though it makes more sense to have the SPI framework do this,
> (either via device tree or by board_info)
> this change is as per an existing mail chain:
> https://lkml.org/lkml/2009/8/27/291
>=20
> Signed-off-by: Prathyush K <prathyush.k@samsung.com>
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> ---
> Note that I don't have suspend/resume actually working upstream, but =
I
> see that /sys/bus/spi/drivers/cros-ec-spi/spi2.0/power/wakeup exists
> with this patch and doesn't exist without it.

Very well.  Applied, thanks.

>  drivers/mfd/cros_ec_spi.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/mfd/cros_ec_spi.c b/drivers/mfd/cros_ec_spi.c
> index 0b8d328..ef22dd5 100644
> --- a/drivers/mfd/cros_ec_spi.c
> +++ b/drivers/mfd/cros_ec_spi.c
> @@ -385,6 +385,8 @@ static int cros_ec_spi_probe(struct spi_device *s=
pi)
>  		return err;
>  	}
> =20
> +	device_init_wakeup(&spi->dev, true);
> +
>  	return 0;
>  }
> =20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
