From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 08/10] mfd: cros_ec: Check result code from EC messages
Date: Thu, 3 Jul 2014 08:31:29 +0100
Message-ID: <20140703073129.GF30534@lee--X1>
References: <1403115247-8853-1-git-send-email-dianders@chromium.org>
 <1403115247-8853-9-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1403115247-8853-9-git-send-email-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Andrew Bresticker <abrestic@chromium.org>, swarren@wwwdotorg.org, olof@lixom.net, Sonny Rao <sonnyrao@chromium.org>, linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Bill Richardson <wfrichar@chromium.org>, sjg@chromium.org, Wolfram Sang <wsa@the-dreams.de>, broonie@kernel.org, sameo@linux.intel.com, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, 18 Jun 2014, Doug Anderson wrote:

> From: Bill Richardson <wfrichar@chromium.org>
>=20
> Just because the host was able to talk to the EC doesn't mean that th=
e EC
> was happy with what it was told. Errors in communincation are not the=
 same
> as error messages from the EC itself.
>=20
> This change lets the EC report its errors separately.
>=20
> [dianders: Added common function to cros_ec.c]
>=20
> Signed-off-by: Bill Richardson <wfrichar@chromium.org>
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> ---
> Changes in v2:
> - Added common function to cros_ec.c
> - Changed to dev_dbg() as per http://crosreview.com/66726
>=20
>  drivers/mfd/cros_ec.c       | 18 ++++++++++++++++++
>  drivers/mfd/cros_ec_i2c.c   |  8 +++-----
>  drivers/mfd/cros_ec_spi.c   | 19 ++++++-------------
>  include/linux/mfd/cros_ec.h | 12 ++++++++++++
>  4 files changed, 39 insertions(+), 18 deletions(-)

Patch applied with Simon's Reviewed-by.

Clause: There is a chance that this patch might not be seen in -next
for ~24-48hrs.  If it's not there by 72hrs, feel free to poke.

> diff --git a/drivers/mfd/cros_ec.c b/drivers/mfd/cros_ec.c
> index 4851ed2..83e30c6 100644
> --- a/drivers/mfd/cros_ec.c
> +++ b/drivers/mfd/cros_ec.c
> @@ -44,6 +44,24 @@ int cros_ec_prepare_tx(struct cros_ec_device *ec_d=
ev,
>  }
>  EXPORT_SYMBOL(cros_ec_prepare_tx);
> =20
> +int cros_ec_check_result(struct cros_ec_device *ec_dev,
> +			 struct cros_ec_command *msg)
> +{
> +	switch (msg->result) {
> +	case EC_RES_SUCCESS:
> +		return 0;
> +	case EC_RES_IN_PROGRESS:
> +		dev_dbg(ec_dev->dev, "command 0x%02x in progress\n",
> +			msg->command);
> +		return -EAGAIN;
> +	default:
> +		dev_dbg(ec_dev->dev, "command 0x%02x returned %d\n",
> +			msg->command, msg->result);
> +		return 0;
> +	}
> +}
> +EXPORT_SYMBOL(cros_ec_check_result);
> +
>  static irqreturn_t ec_irq_thread(int irq, void *data)
>  {
>  	struct cros_ec_device *ec_dev =3D data;
> diff --git a/drivers/mfd/cros_ec_i2c.c b/drivers/mfd/cros_ec_i2c.c
> index 5bb32f5..189e7d1 100644
> --- a/drivers/mfd/cros_ec_i2c.c
> +++ b/drivers/mfd/cros_ec_i2c.c
> @@ -92,12 +92,10 @@ static int cros_ec_cmd_xfer_i2c(struct cros_ec_de=
vice *ec_dev,
>  	}
> =20
>  	/* check response error code */
> -	if (i2c_msg[1].buf[0]) {
> -		dev_warn(ec_dev->dev, "command 0x%02x returned an error %d\n",
> -			 msg->command, i2c_msg[1].buf[0]);
> -		ret =3D -EINVAL;
> +	msg->result =3D i2c_msg[1].buf[0];
> +	ret =3D cros_ec_check_result(ec_dev, msg);
> +	if (ret)
>  		goto done;
> -	}
> =20
>  	/* copy response packet payload and compute checksum */
>  	sum =3D in_buf[0] + in_buf[1];
> diff --git a/drivers/mfd/cros_ec_spi.c b/drivers/mfd/cros_ec_spi.c
> index 09ca789..c975087 100644
> --- a/drivers/mfd/cros_ec_spi.c
> +++ b/drivers/mfd/cros_ec_spi.c
> @@ -289,21 +289,14 @@ static int cros_ec_cmd_xfer_spi(struct cros_ec_=
device *ec_dev,
>  		goto exit;
>  	}
> =20
> -	/* check response error code */
>  	ptr =3D ec_dev->din;
> -	if (ptr[0]) {
> -		if (ptr[0] =3D=3D EC_RES_IN_PROGRESS) {
> -			dev_dbg(ec_dev->dev, "command 0x%02x in progress\n",
> -				ec_msg->command);
> -			ret =3D -EAGAIN;
> -			goto exit;
> -		}
> -		dev_warn(ec_dev->dev, "command 0x%02x returned an error %d\n",
> -			 ec_msg->command, ptr[0]);
> -		debug_packet(ec_dev->dev, "in_err", ptr, len);
> -		ret =3D -EINVAL;
> +
> +	/* check response error code */
> +	ec_msg->result =3D ptr[0];
> +	ret =3D cros_ec_check_result(ec_dev, ec_msg);
> +	if (ret)
>  		goto exit;
> -	}
> +
>  	len =3D ptr[1];
>  	sum =3D ptr[0] + ptr[1];
>  	if (len > ec_msg->insize) {
> diff --git a/include/linux/mfd/cros_ec.h b/include/linux/mfd/cros_ec.=
h
> index 60c0880..1f79f16 100644
> --- a/include/linux/mfd/cros_ec.h
> +++ b/include/linux/mfd/cros_ec.h
> @@ -143,6 +143,18 @@ int cros_ec_prepare_tx(struct cros_ec_device *ec=
_dev,
>  		       struct cros_ec_command *msg);
> =20
>  /**
> + * cros_ec_check_result - Check ec_msg->result
> + *
> + * This is used by ChromeOS EC drivers to check the ec_msg->result f=
or
> + * errors and to warn about them.
> + *
> + * @ec_dev: EC device
> + * @msg: Message to check
> + */
> +int cros_ec_check_result(struct cros_ec_device *ec_dev,
> +			 struct cros_ec_command *msg);
> +
> +/**
>   * cros_ec_remove - Remove a ChromeOS EC
>   *
>   * Call this to deregister a ChromeOS EC, then clean up any private =
data.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
