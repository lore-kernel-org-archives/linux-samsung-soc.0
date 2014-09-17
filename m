From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 5/6] mfd: cros_ec: wait for completion of commands
 that return IN_PROGRESS
Date: Wed, 17 Sep 2014 09:23:36 -0700
Message-ID: <20140917162336.GK30918@lee--X1>
References: <1410428289-18229-1-git-send-email-javier.martinez@collabora.co.uk>
 <1410428289-18229-6-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f175.google.com ([209.85.223.175]:42627 "EHLO
	mail-ie0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755347AbaIQQXl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Sep 2014 12:23:41 -0400
Received: by mail-ie0-f175.google.com with SMTP id lx4so2122132iec.34
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Sep 2014 09:23:40 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1410428289-18229-6-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Wolfram Sang <wsa@the-dreams.de>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Doug Anderson <dianders@chromium.org>, Simon Glass <sjg@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Andrew Bresticker <abrestic@chromium.org>, Derek Basehore <dbasehore@chromium.org>, Todd Broch <tbroch@chromium.org>, Olof Johansson <olof@lixom.net>, Andreas Faerber <afaerber@suse.de>, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org

On Thu, 11 Sep 2014, Javier Martinez Canillas wrote:

> From: Andrew Bresticker <abrestic@chromium.org>
>=20
> When an EC command returns EC_RES_IN_PROGRESS, we need to query
> the state of the EC until it indicates that it is no longer busy.
> Do this in cros_ec_cmd_xfer() under the EC's mutex so that other
> commands (e.g. keyboard, I2C passtru) aren't issued to the EC while
> it is working on the in-progress command.
>=20
> The delay in milliseconds and the number of retries are the values
> that were used by the flashrom tool when retrying commands.
>=20
> Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co=
=2Euk>
> ---
>=20
> Changes since v2:
>  - Explain in the commit message from where the delay and retry value=
s come from.
>    Commented by Andrew Bresticker.
>  - Move the needed definitions inside the if block. Suggested by Lee =
Jones.
>  - Only check if result is EC_RES_IN_PROGRESS instead of checking als=
o if ret is
>    -EAGAIN since the former implies the later. Suggested by Lee Jones=
=2E
>  - Use usleep_range() instead of msleep() since doesn't handle values=
 between 1~20.
>    Suggested by Lee Jones.
>=20
> Changes since v1:
>  - The *xfer() calls don't modify the passed cros_ec_command so there=
 is
>    no need to populate it inside the for loop. Suggested by Lee Jones=
=2E
>=20
>  drivers/mfd/cros_ec.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>=20
> diff --git a/drivers/mfd/cros_ec.c b/drivers/mfd/cros_ec.c
> index c53804a..af2fadf 100644
> --- a/drivers/mfd/cros_ec.c
> +++ b/drivers/mfd/cros_ec.c
> @@ -23,6 +23,10 @@
>  #include <linux/mfd/core.h>
>  #include <linux/mfd/cros_ec.h>
>  #include <linux/mfd/cros_ec_commands.h>
> +#include <linux/delay.h>
> +
> +#define EC_COMMAND_RETRIES	50
> +#define EC_RETRY_DELAY_MS	10
> =20
>  int cros_ec_prepare_tx(struct cros_ec_device *ec_dev,
>  		       struct cros_ec_command *msg)
> @@ -69,6 +73,36 @@ int cros_ec_cmd_xfer(struct cros_ec_device *ec_dev=
,
> =20
>  	mutex_lock(&ec_dev->lock);
>  	ret =3D ec_dev->cmd_xfer(ec_dev, msg);
> +	if (msg->result =3D=3D EC_RES_IN_PROGRESS) {
> +		int i;
> +		struct cros_ec_command status_msg;
> +		struct ec_response_get_comms_status status;
> +
> +		status_msg.version =3D 0;
> +		status_msg.command =3D EC_CMD_GET_COMMS_STATUS;
> +		status_msg.outdata =3D NULL;
> +		status_msg.outsize =3D 0;
> +		status_msg.indata =3D (uint8_t *)&status;
> +		status_msg.insize =3D sizeof(status);
> +
> +		/*
> +		 * Query the EC's status until it's no longer busy or
> +		 * we encounter an error.
> +		 */
> +		for (i =3D 0; i < EC_COMMAND_RETRIES; i++) {
> +			usleep_range(EC_RETRY_DELAY_MS, EC_RETRY_DELAY_MS + 1);

Remove the EC_RETRY_DELAY_MS define and place the values in raw.

You're now sleeping for 10us.  Did you test the changes?

> +			ret =3D ec_dev->cmd_xfer(ec_dev, &status_msg);
> +			if (ret < 0)
> +				break;
> +
> +			msg->result =3D status_msg.result;
> +			if (status_msg.result !=3D EC_RES_SUCCESS)
> +				break;
> +			if (!(status.flags & EC_COMMS_STATUS_PROCESSING))
> +				break;
> +		}
> +	}
>  	mutex_unlock(&ec_dev->lock);
> =20
>  	return ret;

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
