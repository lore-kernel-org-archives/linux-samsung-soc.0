From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 04/10] mfd: cros_ec: Use a zero-length array for
 command data
Date: Wed, 13 May 2015 12:10:34 +0100
Message-ID: <20150513111034.GH3394@x1>
References: <1431166241-15775-1-git-send-email-javier.martinez@collabora.co.uk>
 <1431166241-15775-5-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f45.google.com ([74.125.82.45]:33730 "EHLO
	mail-wg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754474AbbEMLKj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 May 2015 07:10:39 -0400
Received: by wgin8 with SMTP id n8so39784346wgi.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 May 2015 04:10:38 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1431166241-15775-5-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, Alexandru M Stan <amstan@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 09 May 2015, Javier Martinez Canillas wrote:

> Commit 1b84f2a4cd4a ("mfd: cros_ec: Use fixed size arrays to transfer
> data with the EC") modified the struct cros_ec_command fields to not
> use pointers for the input and output buffers and use fixed length
> arrays instead.
>=20
> This change was made because the cros_ec ioctl API uses that struct
> cros_ec_command to allow user-space to send commands to the EC and
> to get data from the EC. So using pointers made the API not 64-bit
> safe. Unfortunately this approach was not flexible enough for all
> the use-cases since there may be a need to send larger commands
> on newer versions of the EC command protocol.
>=20
> So to avoid to choose a constant length that it may be too big for
> most commands and thus wasting memory and CPU cycles on copy from
> and to user-space or having a size that is too small for some big
> commands, use a zero-length array that is both 64-bit safe and
> flexible. The same buffer is used for both output and input data
> so the maximum of these values should be used to allocate it.
>=20
> Suggested-by: Gwendal Grignou <gwendal@chromium.org>
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co=
=2Euk>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> ---
>=20
> Changes since v1:
>  - Add Heiko Stuebner Tested-by tag
>  - Removed a new blank line at EOF warning. Reported by Heiko Stuebne=
r
>  - Use kmalloc instead of kzalloc when the message is later initializ=
ed
>    Suggested by Gwendal Grignou
>  - Pre-allocate struct cros_ec_command instead of dynamically allocat=
e it
>    whenever is possible. Suggested by Gwendal Grignou
>  - Pre-allocate buffers for the usual cases and only allocate dynamic=
ally
>    in the heap for bigger sizes. Suggested by Gwendal Grignou
>  - Don't access the cros_ec_command received from user-space before d=
oing
>    a copy_from_user. Suggested by Gwendal Grignou
>  - Only copy from user-space outsize bytes and copy_to_user insize by=
tes
>    Suggested by Gwendal Grignou
>  - ec_device_ioctl_xcmd() must return the numbers of bytes read and n=
ot 0
>    on success. Suggested by Gwendal Grignou
>  - Rename alloc_cmd_msg to alloc_lightbar_cmd_msg. Suggested by Gwend=
al Grignou
> ---
>  drivers/i2c/busses/i2c-cros-ec-tunnel.c    |  59 ++++++++---
>  drivers/input/keyboard/cros_ec_keyb.c      |  19 ++--
>  drivers/mfd/cros_ec.c                      |  18 ++--
>  drivers/mfd/cros_ec_i2c.c                  |   4 +-
>  drivers/mfd/cros_ec_spi.c                  |   2 +-
>  drivers/platform/chrome/cros_ec_dev.c      |  66 +++++++++----
>  drivers/platform/chrome/cros_ec_lightbar.c | 152 +++++++++++++++++++=
----------
>  drivers/platform/chrome/cros_ec_lpc.c      |   8 +-
>  drivers/platform/chrome/cros_ec_sysfs.c    |  92 +++++++++--------
>  include/linux/mfd/cros_ec.h                |   6 +-
>  10 files changed, 273 insertions(+), 153 deletions(-)

[...]

> diff --git a/drivers/mfd/cros_ec.c b/drivers/mfd/cros_ec.c
> index 1574a9352a6d..ee8aa8142932 100644
> --- a/drivers/mfd/cros_ec.c
> +++ b/drivers/mfd/cros_ec.c
> @@ -41,7 +41,7 @@ int cros_ec_prepare_tx(struct cros_ec_device *ec_de=
v,
>  	out[2] =3D msg->outsize;
>  	csum =3D out[0] + out[1] + out[2];
>  	for (i =3D 0; i < msg->outsize; i++)
> -		csum +=3D out[EC_MSG_TX_HEADER_BYTES + i] =3D msg->outdata[i];
> +		csum +=3D out[EC_MSG_TX_HEADER_BYTES + i] =3D msg->data[i];
>  	out[EC_MSG_TX_HEADER_BYTES + msg->outsize] =3D (uint8_t)(csum & 0xf=
f);
> =20
>  	return EC_MSG_TX_PROTO_BYTES + msg->outsize;
> @@ -75,11 +75,13 @@ int cros_ec_cmd_xfer(struct cros_ec_device *ec_de=
v,
>  	ret =3D ec_dev->cmd_xfer(ec_dev, msg);
>  	if (msg->result =3D=3D EC_RES_IN_PROGRESS) {
>  		int i;
> -		struct cros_ec_command status_msg =3D { };
> +		struct cros_ec_command *status_msg;
>  		struct ec_response_get_comms_status *status;
> +		u8 buf[sizeof(*status_msg) + sizeof(*status)] =3D { };

This sort of thing is usually frowned upon.  Can you allocate and free
buf's memory using the normal kernel helpers please?

[...]

> diff --git a/include/linux/mfd/cros_ec.h b/include/linux/mfd/cros_ec.=
h
> index 14cf522123dd..7eee38abd02a 100644
> --- a/include/linux/mfd/cros_ec.h
> +++ b/include/linux/mfd/cros_ec.h
> @@ -42,8 +42,7 @@ enum {
>   * @outsize: Outgoing length in bytes
>   * @insize: Max number of bytes to accept from EC
>   * @result: EC's response to the command (separate from communicatio=
n failure)
> - * @outdata: Outgoing data to EC
> - * @indata: Where to put the incoming data from EC
> + * @data: Where to put the incoming data from EC and outgoing data t=
o EC
>   */
>  struct cros_ec_command {
>  	uint32_t version;
> @@ -51,8 +50,7 @@ struct cros_ec_command {
>  	uint32_t outsize;
>  	uint32_t insize;
>  	uint32_t result;
> -	uint8_t outdata[EC_PROTO2_MAX_PARAM_SIZE];
> -	uint8_t indata[EC_PROTO2_MAX_PARAM_SIZE];
> +	uint8_t data[0];

uint8_t *data?

>  };
> =20
>  /**

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
