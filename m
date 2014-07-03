From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 09/10] mfd: cros_ec: ec_dev->cmd_xfer() returns number
 of bytes received from EC
Date: Thu, 3 Jul 2014 08:31:55 +0100
Message-ID: <20140703073155.GG30534@lee--X1>
References: <1403115247-8853-1-git-send-email-dianders@chromium.org>
 <1403115247-8853-10-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1403115247-8853-10-git-send-email-dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Bill Richardson <wfrichar-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, 18 Jun 2014, Doug Anderson wrote:

> From: Bill Richardson <wfrichar-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>=20
> When communicating with the EC, the cmd_xfer() function should return=
 the
> number of bytes it received from the EC, or negative on error.
>=20
> Signed-off-by: Bill Richardson <wfrichar-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
> Changes in v2: None
>=20
>  drivers/i2c/busses/i2c-cros-ec-tunnel.c | 2 +-
>  drivers/mfd/cros_ec_i2c.c               | 2 +-
>  drivers/mfd/cros_ec_spi.c               | 2 +-
>  include/linux/mfd/cros_ec.h             | 8 ++++----
>  4 files changed, 7 insertions(+), 7 deletions(-)

Patch applied with Wolfram's Ack.

Clause: There is a chance that this patch might not be seen in -next
for ~24-48hrs.  If it's not there by 72hrs, feel free to poke.

> diff --git a/drivers/i2c/busses/i2c-cros-ec-tunnel.c b/drivers/i2c/bu=
sses/i2c-cros-ec-tunnel.c
> index dd07818..05e033c 100644
> --- a/drivers/i2c/busses/i2c-cros-ec-tunnel.c
> +++ b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
> @@ -228,7 +228,7 @@ static int ec_i2c_xfer(struct i2c_adapter *adap, =
struct i2c_msg i2c_msgs[],
>  	msg.insize =3D response_len;
> =20
>  	result =3D bus->ec->cmd_xfer(bus->ec, &msg);
> -	if (result)
> +	if (result < 0)
>  		goto exit;
> =20
>  	result =3D ec_i2c_parse_response(response, i2c_msgs, &num);
> diff --git a/drivers/mfd/cros_ec_i2c.c b/drivers/mfd/cros_ec_i2c.c
> index 189e7d1..fd7a546 100644
> --- a/drivers/mfd/cros_ec_i2c.c
> +++ b/drivers/mfd/cros_ec_i2c.c
> @@ -111,7 +111,7 @@ static int cros_ec_cmd_xfer_i2c(struct cros_ec_de=
vice *ec_dev,
>  		goto done;
>  	}
> =20
> -	ret =3D 0;
> +	ret =3D i2c_msg[1].buf[1];
>   done:
>  	kfree(in_buf);
>  	kfree(out_buf);
> diff --git a/drivers/mfd/cros_ec_spi.c b/drivers/mfd/cros_ec_spi.c
> index c975087..2ad6815 100644
> --- a/drivers/mfd/cros_ec_spi.c
> +++ b/drivers/mfd/cros_ec_spi.c
> @@ -324,7 +324,7 @@ static int cros_ec_cmd_xfer_spi(struct cros_ec_de=
vice *ec_dev,
>  		goto exit;
>  	}
> =20
> -	ret =3D 0;
> +	ret =3D len;
>  exit:
>  	mutex_unlock(&ec_spi->lock);
>  	return ret;
> diff --git a/include/linux/mfd/cros_ec.h b/include/linux/mfd/cros_ec.=
h
> index 1f79f16..0ebf26f 100644
> --- a/include/linux/mfd/cros_ec.h
> +++ b/include/linux/mfd/cros_ec.h
> @@ -41,7 +41,7 @@ enum {
>   * @outdata: Outgoing data to EC
>   * @outsize: Outgoing length in bytes
>   * @indata: Where to put the incoming data from EC
> - * @insize: Incoming length in bytes (filled in by EC)
> + * @insize: Max number of bytes to accept from EC
>   * @result: EC's response to the command (separate from communicatio=
n failure)
>   */
>  struct cros_ec_command {
> @@ -64,9 +64,9 @@ struct cros_ec_command {
>   * sleep at the last suspend
>   * @event_notifier: interrupt event notifier for transport devices
>   * @cmd_xfer: send command to EC and get response
> - *     Returns 0 if the communication succeeded, but that doesn't me=
an the EC
> - *     was happy with the command it got. Caller should check msg.re=
sult for
> - *     the EC's result code.
> + *     Returns the number of bytes received if the communication suc=
ceeded, but
> + *     that doesn't mean the EC was happy with the command. The call=
er
> + *     should check msg.result for the EC's result code.
>   *
>   * @priv: Private data
>   * @irq: Interrupt to use

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
