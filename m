From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v7 8/8] mfd: cros_ec: spi: Add delay for asserting CS
Date: Mon, 15 Jun 2015 13:25:18 +0100
Message-ID: <20150615122518.GH3266@x1>
References: <1433847889-7220-1-git-send-email-javier.martinez@collabora.co.uk>
 <1433847889-7220-9-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1433847889-7220-9-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, Alexandru M Stan <amstan@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Chris Zhong <zyw@rock-chips.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 09 Jun 2015, Javier Martinez Canillas wrote:

> From: Alexandru M Stan <amstan@chromium.org>
>=20
> Some ECs need a little time for waking up before they can accept
> SPI data at a high speed. This is configurable via a DT property
> "google,cros-ec-spi-pre-delay".
>=20
> This patch makes the cros_ec_spi driver to cause a delay before
> the beginning of a SPI transaction, to make sure that the EC has
> already woken up, if the property has been defined in the DTS.
>=20
> Signed-off-by: Alexandru M Stan <amstan@chromium.org>
> Reviewed-by: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Chris Zhong <zyw@rock-chips.com>
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co=
=2Euk>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Acked-by: Lee Jones <lee.jones@linaro.org>
> Acked-by: Olof Johansson <olof@lixom.net>

Applied, thanks.

> ---
>=20
> Changes since v6:
>  - Add Olof Johansson Acked-by tag
>=20
> Changes since v5: None.
>=20
> Changes since v4: None.
>=20
> Changes since v3:
>  - New patch, split DT binding and driver implementation as suggested
>    by Lee Jones.
>  - Add tested-by tag from Heiko Stuebner.
>  - Add acked-by tag from Lee Jones.
> ---
>  drivers/mfd/cros_ec_spi.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mfd/cros_ec_spi.c b/drivers/mfd/cros_ec_spi.c
> index faba03e2f1ef..16f228dc243f 100644
> --- a/drivers/mfd/cros_ec_spi.c
> +++ b/drivers/mfd/cros_ec_spi.c
> @@ -71,12 +71,15 @@
>   * @spi: SPI device we are connected to
>   * @last_transfer_ns: time that we last finished a transfer, or 0 if=
 there
>   *	if no record
> + * @start_of_msg_delay: used to set the delay_usecs on the spi_trans=
fer that
> + *      is sent when we want to turn on CS at the start of a transac=
tion.
>   * @end_of_msg_delay: used to set the delay_usecs on the spi_transfe=
r that
>   *      is sent when we want to turn off CS at the end of a transact=
ion.
>   */
>  struct cros_ec_spi {
>  	struct spi_device *spi;
>  	s64 last_transfer_ns;
> +	unsigned int start_of_msg_delay;
>  	unsigned int end_of_msg_delay;
>  };
> =20
> @@ -366,7 +369,7 @@ static int cros_ec_pkt_xfer_spi(struct cros_ec_de=
vice *ec_dev,
>  	struct ec_host_request *request;
>  	struct ec_host_response *response;
>  	struct cros_ec_spi *ec_spi =3D ec_dev->priv;
> -	struct spi_transfer trans;
> +	struct spi_transfer trans, trans_delay;
>  	struct spi_message msg;
>  	int i, len;
>  	u8 *ptr;
> @@ -393,13 +396,23 @@ static int cros_ec_pkt_xfer_spi(struct cros_ec_=
device *ec_dev,
>  		goto exit;
>  	}
> =20
> +	/*
> +	 * Leave a gap between CS assertion and clocking of data to allow t=
he
> +	 * EC time to wakeup.
> +	 */
> +	spi_message_init(&msg);
> +	if (ec_spi->start_of_msg_delay) {
> +		memset(&trans_delay, 0, sizeof(trans_delay));
> +		trans_delay.delay_usecs =3D ec_spi->start_of_msg_delay;
> +		spi_message_add_tail(&trans_delay, &msg);
> +	}
> +
>  	/* Transmit phase - send our message */
>  	memset(&trans, 0, sizeof(trans));
>  	trans.tx_buf =3D ec_dev->dout;
>  	trans.rx_buf =3D rx_buf;
>  	trans.len =3D len;
>  	trans.cs_change =3D 1;
> -	spi_message_init(&msg);
>  	spi_message_add_tail(&trans, &msg);
>  	ret =3D spi_sync(ec_spi->spi, &msg);
> =20
> @@ -602,6 +615,10 @@ static void cros_ec_spi_dt_probe(struct cros_ec_=
spi *ec_spi, struct device *dev)
>  	u32 val;
>  	int ret;
> =20
> +	ret =3D of_property_read_u32(np, "google,cros-ec-spi-pre-delay", &v=
al);
> +	if (!ret)
> +		ec_spi->start_of_msg_delay =3D val;
> +
>  	ret =3D of_property_read_u32(np, "google,cros-ec-spi-msg-delay", &v=
al);
>  	if (!ret)
>  		ec_spi->end_of_msg_delay =3D val;

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
