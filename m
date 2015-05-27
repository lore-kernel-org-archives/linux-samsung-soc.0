From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 7/7] mfd: cros_ec: spi: Add delay for asserting CS
Date: Wed, 27 May 2015 10:14:50 +0100
Message-ID: <20150527091450.GY11677@x1>
References: <1432309340-13688-1-git-send-email-javier.martinez@collabora.co.uk>
 <1432309340-13688-8-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f43.google.com ([74.125.82.43]:34029 "EHLO
	mail-wg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751210AbbE0JOz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 May 2015 05:14:55 -0400
Received: by wgv5 with SMTP id 5so3774505wgv.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 May 2015 02:14:54 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1432309340-13688-8-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, Alexandru M Stan <amstan@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Zhong <zyw@rock-chips.com>

On Fri, 22 May 2015, Javier Martinez Canillas wrote:

> From: Alexandru M Stan <amstan@chromium.org>
>=20
> Some ECs need a little time for waking up before they can accept
> SPI data at a high speed. This is configurable via a DT property
> "google,cros-ec-spi-pre-delay".
>=20
> If this property isn't set, then no delay will be added. However,
> if set it will cause a delay equal to the value passed to it to
> be inserted at the beginning of a transaction.
>=20
> Signed-off-by: Alexandru M Stan <amstan@chromium.org>
> Reviewed-by: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Chris Zhong <zyw@rock-chips.com>
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co=
=2Euk>
> ---
>=20
> Changes since v2: None
>=20
> Changes since v1: None, new patch
> ---
>  Documentation/devicetree/bindings/mfd/cros-ec.txt |  4 ++++
>  drivers/mfd/cros_ec_spi.c                         | 21 +++++++++++++=
++++++--

These two should be separate patches.

>  2 files changed, 23 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/cros-ec.txt b/Docu=
mentation/devicetree/bindings/mfd/cros-ec.txt
> index 8009c3d87f33..1777916e9e28 100644
> --- a/Documentation/devicetree/bindings/mfd/cros-ec.txt
> +++ b/Documentation/devicetree/bindings/mfd/cros-ec.txt
> @@ -18,6 +18,10 @@ Required properties (SPI):
>  - reg: SPI chip select
> =20
>  Optional properties (SPI):
> +- google,cros-ec-spi-pre-delay: Some implementations of the EC need =
a little
> +  time to wake up from sleep before they can receive SPI transfers a=
t a high
> +  clock rate. This property specifies the delay, in usecs, between t=
he
> +  assertion of the CS to the start of the first clock pulse.
>  - google,cros-ec-spi-msg-delay: Some implementations of the EC requi=
re some
>    additional processing time in order to accept new transactions. If=
 the delay
>    between transactions is not long enough the EC may not be able to =
respond

When re-submitting as seperate patches:
  Acked-by: Lee Jones <lee.jones@linaro.org>

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

And for this patch:
  Acked-by: Lee Jones <lee.jones@linaro.org>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
