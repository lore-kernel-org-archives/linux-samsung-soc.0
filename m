From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v7 3/8] mfd: cros_ec: Move protocol helpers out of the
 MFD driver
Date: Mon, 15 Jun 2015 13:23:38 +0100
Message-ID: <20150615122338.GC3266@x1>
References: <1433847889-7220-1-git-send-email-javier.martinez@collabora.co.uk>
 <1433847889-7220-4-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:33431 "EHLO
	mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932186AbbFOMXt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Jun 2015 08:23:49 -0400
Received: by wiwd19 with SMTP id d19so73312044wiw.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Jun 2015 05:23:48 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1433847889-7220-4-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, Alexandru M Stan <amstan@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org

On Tue, 09 Jun 2015, Javier Martinez Canillas wrote:

> The MFD driver should only have the logic to instantiate its child de=
vices
> and setup any shared resources that will be used by the subdevices dr=
ivers.
>=20
> The cros_ec MFD is more complex than expected since it also has helpe=
rs to
> communicate with the EC. So the driver will only get more bigger as o=
ther
> protocols are supported in the future. So move the communication prot=
ocol
> helpers to its own driver as drivers/platform/chrome/cros_ec_proto.c.
>=20
> Suggested-by: Lee Jones <lee.jones@linaro.org>
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
> Changes since v5: None
>=20
> Changes since v4: None
>=20
> Changes since v3:
>  - Added tested-by tag from Heiko Stuebner.
>  - Added acked-by tag from Lee Jones.
>=20
> Changes since v2: None, new patch.
> ---
>  drivers/i2c/busses/Kconfig              |   2 +-
>  drivers/input/keyboard/Kconfig          |   2 +-
>  drivers/mfd/Kconfig                     |   6 +-
>  drivers/mfd/cros_ec.c                   |  96 ----------------------=
----
>  drivers/platform/chrome/Kconfig         |   9 ++-
>  drivers/platform/chrome/Makefile        |   1 +
>  drivers/platform/chrome/cros_ec_proto.c | 115 ++++++++++++++++++++++=
++++++++++
>  7 files changed, 129 insertions(+), 102 deletions(-)
>  create mode 100644 drivers/platform/chrome/cros_ec_proto.c
>=20
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 2255af23b9c7..5f1c1c4f5d87 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -1103,7 +1103,7 @@ config I2C_SIBYTE
> =20
>  config I2C_CROS_EC_TUNNEL
>  	tristate "ChromeOS EC tunnel I2C bus"
> -	depends on MFD_CROS_EC
> +	depends on CROS_EC_PROTO
>  	help
>  	  If you say yes here you get an I2C bus that will tunnel i2c comma=
nds
>  	  through to the other side of the ChromeOS EC to the i2c bus
> diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/=
Kconfig
> index 106fbac7f8c5..e8eb60c6d83e 100644
> --- a/drivers/input/keyboard/Kconfig
> +++ b/drivers/input/keyboard/Kconfig
> @@ -677,7 +677,7 @@ config KEYBOARD_W90P910
>  config KEYBOARD_CROS_EC
>  	tristate "ChromeOS EC keyboard"
>  	select INPUT_MATRIXKMAP
> -	depends on MFD_CROS_EC
> +	depends on CROS_EC_PROTO
>  	help
>  	  Say Y here to enable the matrix keyboard used by ChromeOS devices
>  	  and implemented on the ChromeOS EC. You must enable one bus optio=
n
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index d5ad04dad081..cf3b86d441f7 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -94,6 +94,8 @@ config MFD_AXP20X
>  config MFD_CROS_EC
>  	tristate "ChromeOS Embedded Controller"
>  	select MFD_CORE
> +	select CHROME_PLATFORMS
> +	select CROS_EC_PROTO
>  	help
>  	  If you say Y here you get support for the ChromeOS Embedded
>  	  Controller (EC) providing keyboard, battery and power services.
> @@ -102,7 +104,7 @@ config MFD_CROS_EC
> =20
>  config MFD_CROS_EC_I2C
>  	tristate "ChromeOS Embedded Controller (I2C)"
> -	depends on MFD_CROS_EC && I2C
> +	depends on MFD_CROS_EC && CROS_EC_PROTO && I2C
> =20
>  	help
>  	  If you say Y here, you get support for talking to the ChromeOS
> @@ -112,7 +114,7 @@ config MFD_CROS_EC_I2C
> =20
>  config MFD_CROS_EC_SPI
>  	tristate "ChromeOS Embedded Controller (SPI)"
> -	depends on MFD_CROS_EC && SPI && OF
> +	depends on MFD_CROS_EC && CROS_EC_PROTO && SPI && OF
> =20
>  	---help---
>  	  If you say Y here, you get support for talking to the ChromeOS EC
> diff --git a/drivers/mfd/cros_ec.c b/drivers/mfd/cros_ec.c
> index 4a0f6dfcd376..d857f6a2b57b 100644
> --- a/drivers/mfd/cros_ec.c
> +++ b/drivers/mfd/cros_ec.c
> @@ -23,102 +23,6 @@
>  #include <linux/module.h>
>  #include <linux/mfd/core.h>
>  #include <linux/mfd/cros_ec.h>
> -#include <linux/mfd/cros_ec_commands.h>
> -#include <linux/delay.h>
> -
> -#define EC_COMMAND_RETRIES	50
> -
> -int cros_ec_prepare_tx(struct cros_ec_device *ec_dev,
> -		       struct cros_ec_command *msg)
> -{
> -	uint8_t *out;
> -	int csum, i;
> -
> -	BUG_ON(msg->outsize > EC_PROTO2_MAX_PARAM_SIZE);
> -	out =3D ec_dev->dout;
> -	out[0] =3D EC_CMD_VERSION0 + msg->version;
> -	out[1] =3D msg->command;
> -	out[2] =3D msg->outsize;
> -	csum =3D out[0] + out[1] + out[2];
> -	for (i =3D 0; i < msg->outsize; i++)
> -		csum +=3D out[EC_MSG_TX_HEADER_BYTES + i] =3D msg->data[i];
> -	out[EC_MSG_TX_HEADER_BYTES + msg->outsize] =3D (uint8_t)(csum & 0xf=
f);
> -
> -	return EC_MSG_TX_PROTO_BYTES + msg->outsize;
> -}
> -EXPORT_SYMBOL(cros_ec_prepare_tx);
> -
> -int cros_ec_check_result(struct cros_ec_device *ec_dev,
> -			 struct cros_ec_command *msg)
> -{
> -	switch (msg->result) {
> -	case EC_RES_SUCCESS:
> -		return 0;
> -	case EC_RES_IN_PROGRESS:
> -		dev_dbg(ec_dev->dev, "command 0x%02x in progress\n",
> -			msg->command);
> -		return -EAGAIN;
> -	default:
> -		dev_dbg(ec_dev->dev, "command 0x%02x returned %d\n",
> -			msg->command, msg->result);
> -		return 0;
> -	}
> -}
> -EXPORT_SYMBOL(cros_ec_check_result);
> -
> -int cros_ec_cmd_xfer(struct cros_ec_device *ec_dev,
> -		     struct cros_ec_command *msg)
> -{
> -	int ret;
> -
> -	mutex_lock(&ec_dev->lock);
> -	ret =3D ec_dev->cmd_xfer(ec_dev, msg);
> -	if (msg->result =3D=3D EC_RES_IN_PROGRESS) {
> -		int i;
> -		struct cros_ec_command *status_msg;
> -		struct ec_response_get_comms_status *status;
> -
> -		status_msg =3D kmalloc(sizeof(*status_msg) + sizeof(*status),
> -				     GFP_KERNEL);
> -		if (!status_msg) {
> -			ret =3D -ENOMEM;
> -			goto exit;
> -		}
> -
> -		status_msg->version =3D 0;
> -		status_msg->command =3D EC_CMD_GET_COMMS_STATUS;
> -		status_msg->insize =3D sizeof(*status);
> -		status_msg->outsize =3D 0;
> -
> -		/*
> -		 * Query the EC's status until it's no longer busy or
> -		 * we encounter an error.
> -		 */
> -		for (i =3D 0; i < EC_COMMAND_RETRIES; i++) {
> -			usleep_range(10000, 11000);
> -
> -			ret =3D ec_dev->cmd_xfer(ec_dev, status_msg);
> -			if (ret < 0)
> -				break;
> -
> -			msg->result =3D status_msg->result;
> -			if (status_msg->result !=3D EC_RES_SUCCESS)
> -				break;
> -
> -			status =3D (struct ec_response_get_comms_status *)
> -				 status_msg->data;
> -			if (!(status->flags & EC_COMMS_STATUS_PROCESSING))
> -				break;
> -		}
> -
> -		kfree(status_msg);
> -	}
> -exit:
> -	mutex_unlock(&ec_dev->lock);
> -
> -	return ret;
> -}
> -EXPORT_SYMBOL(cros_ec_cmd_xfer);
> =20
>  static const struct mfd_cell cros_devs[] =3D {
>  	{
> diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrom=
e/Kconfig
> index 2a6531a5fde8..cb1329919527 100644
> --- a/drivers/platform/chrome/Kconfig
> +++ b/drivers/platform/chrome/Kconfig
> @@ -40,7 +40,7 @@ config CHROMEOS_PSTORE
> =20
>  config CROS_EC_CHARDEV
>          tristate "Chrome OS Embedded Controller userspace device int=
erface"
> -        depends on MFD_CROS_EC
> +        depends on CROS_EC_PROTO
>          ---help---
>            This driver adds support to talk with the ChromeOS EC from=
 userspace.
> =20
> @@ -49,7 +49,7 @@ config CROS_EC_CHARDEV
> =20
>  config CROS_EC_LPC
>          tristate "ChromeOS Embedded Controller (LPC)"
> -        depends on MFD_CROS_EC && (X86 || COMPILE_TEST)
> +        depends on MFD_CROS_EC && CROS_EC_PROTO && (X86 || COMPILE_T=
EST)
>          help
>            If you say Y here, you get support for talking to the Chro=
meOS EC
>            over an LPC bus. This uses a simple byte-level protocol wi=
th a
> @@ -59,4 +59,9 @@ config CROS_EC_LPC
>            To compile this driver as a module, choose M here: the
>            module will be called cros_ec_lpc.
> =20
> +config CROS_EC_PROTO
> +        bool
> +        help
> +          ChromeOS EC communication protocol helpers.
> +
>  endif # CHROMEOS_PLATFORMS
> diff --git a/drivers/platform/chrome/Makefile b/drivers/platform/chro=
me/Makefile
> index bd8d8601e875..4a11b010f5d8 100644
> --- a/drivers/platform/chrome/Makefile
> +++ b/drivers/platform/chrome/Makefile
> @@ -4,3 +4,4 @@ obj-$(CONFIG_CHROMEOS_PSTORE)	+=3D chromeos_pstore.o
>  cros_ec_devs-objs               :=3D cros_ec_dev.o cros_ec_sysfs.o c=
ros_ec_lightbar.o
>  obj-$(CONFIG_CROS_EC_CHARDEV)   +=3D cros_ec_devs.o
>  obj-$(CONFIG_CROS_EC_LPC)       +=3D cros_ec_lpc.o
> +obj-$(CONFIG_CROS_EC_PROTO)	+=3D cros_ec_proto.o
> diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platfo=
rm/chrome/cros_ec_proto.c
> new file mode 100644
> index 000000000000..58e98a24fd08
> --- /dev/null
> +++ b/drivers/platform/chrome/cros_ec_proto.c
> @@ -0,0 +1,115 @@
> +/*
> + * ChromeOS EC communication protocol helper functions
> + *
> + * Copyright (C) 2015 Google, Inc
> + *
> + * This software is licensed under the terms of the GNU General Publ=
ic
> + * License version 2, as published by the Free Software Foundation, =
and
> + * may be copied, distributed, and modified under those terms.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + */
> +
> +#include <linux/mfd/cros_ec.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +
> +#define EC_COMMAND_RETRIES	50
> +
> +int cros_ec_prepare_tx(struct cros_ec_device *ec_dev,
> +		       struct cros_ec_command *msg)
> +{
> +	uint8_t *out;
> +	int csum, i;
> +
> +	BUG_ON(msg->outsize > EC_PROTO2_MAX_PARAM_SIZE);
> +	out =3D ec_dev->dout;
> +	out[0] =3D EC_CMD_VERSION0 + msg->version;
> +	out[1] =3D msg->command;
> +	out[2] =3D msg->outsize;
> +	csum =3D out[0] + out[1] + out[2];
> +	for (i =3D 0; i < msg->outsize; i++)
> +		csum +=3D out[EC_MSG_TX_HEADER_BYTES + i] =3D msg->data[i];
> +	out[EC_MSG_TX_HEADER_BYTES + msg->outsize] =3D (uint8_t)(csum & 0xf=
f);
> +
> +	return EC_MSG_TX_PROTO_BYTES + msg->outsize;
> +}
> +EXPORT_SYMBOL(cros_ec_prepare_tx);
> +
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
> +int cros_ec_cmd_xfer(struct cros_ec_device *ec_dev,
> +		     struct cros_ec_command *msg)
> +{
> +	int ret;
> +
> +	mutex_lock(&ec_dev->lock);
> +	ret =3D ec_dev->cmd_xfer(ec_dev, msg);
> +	if (msg->result =3D=3D EC_RES_IN_PROGRESS) {
> +		int i;
> +		struct cros_ec_command *status_msg;
> +		struct ec_response_get_comms_status *status;
> +
> +		status_msg =3D kmalloc(sizeof(*status_msg) + sizeof(*status),
> +				     GFP_KERNEL);
> +		if (!status_msg) {
> +			ret =3D -ENOMEM;
> +			goto exit;
> +		}
> +
> +		status_msg->version =3D 0;
> +		status_msg->command =3D EC_CMD_GET_COMMS_STATUS;
> +		status_msg->insize =3D sizeof(*status);
> +		status_msg->outsize =3D 0;
> +
> +		/*
> +		 * Query the EC's status until it's no longer busy or
> +		 * we encounter an error.
> +		 */
> +		for (i =3D 0; i < EC_COMMAND_RETRIES; i++) {
> +			usleep_range(10000, 11000);
> +
> +			ret =3D ec_dev->cmd_xfer(ec_dev, status_msg);
> +			if (ret < 0)
> +				break;
> +
> +			msg->result =3D status_msg->result;
> +			if (status_msg->result !=3D EC_RES_SUCCESS)
> +				break;
> +
> +			status =3D (struct ec_response_get_comms_status *)
> +				 status_msg->data;
> +			if (!(status->flags & EC_COMMS_STATUS_PROCESSING))
> +				break;
> +		}
> +
> +		kfree(status_msg);
> +	}
> +exit:
> +	mutex_unlock(&ec_dev->lock);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(cros_ec_cmd_xfer);

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
