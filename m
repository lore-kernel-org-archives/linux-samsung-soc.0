From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 07/10] mfd: cros_ec: cleanup: remove unused fields from
 struct cros_ec_device
Date: Wed, 18 Jun 2014 08:41:39 +0100
Message-ID: <20140618074139.GE21030@lee--X1>
References: <1402954800-28215-1-git-send-email-dianders@chromium.org>
 <1402954800-28215-8-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f171.google.com ([209.85.223.171]:58837 "EHLO
	mail-ie0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933686AbaFRHlp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Jun 2014 03:41:45 -0400
Received: by mail-ie0-f171.google.com with SMTP id x19so392609ier.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Jun 2014 00:41:45 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1402954800-28215-8-git-send-email-dianders@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Andrew Bresticker <abrestic@chromium.org>, swarren@wwwdotorg.org, olof@lixom.net, Sonny Rao <sonnyrao@chromium.org>, linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Bill Richardson <wfrichar@chromium.org>, sjg@chromium.org, Wolfram Sang <wsa@the-dreams.de>, broonie@kernel.org, sameo@linux.intel.com, linux-kernel@vger.kernel.org

On Mon, 16 Jun 2014, Doug Anderson wrote:

> From: Bill Richardson <wfrichar@chromium.org>
>=20
> struct cros_ec_device has a superfluous "name" field. We can get all =
the
> debugging info we need from the existing ec_name and phys_name fields=
, so
> let's take out the extra field.
>=20
> Signed-off-by: Bill Richardson <wfrichar@chromium.org>
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> ---
>  drivers/mfd/cros_ec.c       | 2 +-
>  drivers/mfd/cros_ec_i2c.c   | 1 -
>  drivers/mfd/cros_ec_spi.c   | 1 -
>  include/linux/mfd/cros_ec.h | 2 --
>  4 files changed, 1 insertion(+), 5 deletions(-)

=46or the re-spin:
  Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/drivers/mfd/cros_ec.c b/drivers/mfd/cros_ec.c
> index 9304056..d242714 100644
> --- a/drivers/mfd/cros_ec.c
> +++ b/drivers/mfd/cros_ec.c
> @@ -138,7 +138,7 @@ int cros_ec_register(struct cros_ec_device *ec_de=
v)
>  		goto fail_mfd;
>  	}
> =20
> -	dev_info(dev, "Chrome EC (%s)\n", ec_dev->name);
> +	dev_info(dev, "Chrome EC device registered\n");
> =20
>  	return 0;
> =20
> diff --git a/drivers/mfd/cros_ec_i2c.c b/drivers/mfd/cros_ec_i2c.c
> index 37ed12f..5bb32f5 100644
> --- a/drivers/mfd/cros_ec_i2c.c
> +++ b/drivers/mfd/cros_ec_i2c.c
> @@ -132,7 +132,6 @@ static int cros_ec_i2c_probe(struct i2c_client *c=
lient,
>  		return -ENOMEM;
> =20
>  	i2c_set_clientdata(client, ec_dev);
> -	ec_dev->name =3D "I2C";
>  	ec_dev->dev =3D dev;
>  	ec_dev->priv =3D client;
>  	ec_dev->irq =3D client->irq;
> diff --git a/drivers/mfd/cros_ec_spi.c b/drivers/mfd/cros_ec_spi.c
> index 2d713fe..09ca789 100644
> --- a/drivers/mfd/cros_ec_spi.c
> +++ b/drivers/mfd/cros_ec_spi.c
> @@ -374,7 +374,6 @@ static int cros_ec_spi_probe(struct spi_device *s=
pi)
>  	cros_ec_spi_dt_probe(ec_spi, dev);
> =20
>  	spi_set_drvdata(spi, ec_dev);
> -	ec_dev->name =3D "SPI";
>  	ec_dev->dev =3D dev;
>  	ec_dev->priv =3D ec_spi;
>  	ec_dev->irq =3D spi->irq;
> diff --git a/include/linux/mfd/cros_ec.h b/include/linux/mfd/cros_ec.=
h
> index f27c037..2b0c598 100644
> --- a/include/linux/mfd/cros_ec.h
> +++ b/include/linux/mfd/cros_ec.h
> @@ -67,7 +67,6 @@ struct cros_ec_command {
>   * @command_recv: receive a response
>   * @command_sendrecv: send a command and receive a response
>   *
> - * @name: Name of this EC interface
>   * @priv: Private data
>   * @irq: Interrupt to use
>   * @din: input buffer (for data from EC)
> @@ -104,7 +103,6 @@ struct cros_ec_device {
>  				void *in_buf, int in_len);
> =20
>  	/* These are used to implement the platform-specific interface */
> -	const char *name;
>  	void *priv;
>  	int irq;
>  	uint8_t *din;

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
