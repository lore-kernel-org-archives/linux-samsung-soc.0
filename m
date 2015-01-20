From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH RESEND v2 3/7] mfd: cros_ec: Add cros_ec_lpc driver for
 x86 devices
Date: Tue, 20 Jan 2015 08:11:04 +0000
Message-ID: <20150120081104.GT21886@x1>
References: <1420205572-2640-1-git-send-email-javier.martinez@collabora.co.uk>
 <1420205572-2640-4-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f177.google.com ([209.85.223.177]:62138 "EHLO
	mail-ie0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750722AbbATILK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Jan 2015 03:11:10 -0500
Received: by mail-ie0-f177.google.com with SMTP id at20so9417983iec.8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Jan 2015 00:11:09 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1420205572-2640-4-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Jonathan Corbet <corbet@lwn.net>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 02 Jan 2015, Javier Martinez Canillas wrote:

> From: Bill Richardson <wfrichar@chromium.org>
>=20
> This adds the LPC interface to the Chrome OS EC. Like the
> I2C and SPI drivers, this allows userspace access to the EC.

I'm fairly certain that this is _not_ an MFD device.  Please locate it
to the proper subsystem (input?).

> Signed-off-by: Bill Richardson <wfrichar@chromium.org>
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co=
=2Euk>
> ---
>=20
> Changes since v1: None, new patch.
>=20
>  drivers/mfd/Kconfig       |  10 ++
>  drivers/mfd/Makefile      |   1 +
>  drivers/mfd/cros_ec_lpc.c | 305 ++++++++++++++++++++++++++++++++++++=
++++++++++
>  3 files changed, 316 insertions(+)
>  create mode 100644 drivers/mfd/cros_ec_lpc.c
>=20
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 2e6b731..7563786 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -110,6 +110,16 @@ config MFD_CROS_EC_I2C
>  	  a checksum. Failing accesses will be retried three times to
>  	  improve reliability.
> =20
> +config MFD_CROS_EC_LPC
> +	tristate "ChromeOS Embedded Controller (LPC)"
> +	depends on MFD_CROS_EC
> +
> +	help
> +	  If you say Y here, you get support for talking to the ChromeOS EC
> +	  over an LPC bus. This uses a simple byte-level protocol with a
> +	  checksum. This is used for userspace access only. The kernel
> +	  typically has its own communication methods.
> +
>  config MFD_CROS_EC_SPI
>  	tristate "ChromeOS Embedded Controller (SPI)"
>  	depends on MFD_CROS_EC && SPI && OF
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 53467e2..94c1516 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -11,6 +11,7 @@ obj-$(CONFIG_MFD_ASIC3)		+=3D asic3.o tmio_core.o
>  obj-$(CONFIG_MFD_BCM590XX)	+=3D bcm590xx.o
>  obj-$(CONFIG_MFD_CROS_EC)	+=3D cros_ec.o
>  obj-$(CONFIG_MFD_CROS_EC_I2C)	+=3D cros_ec_i2c.o
> +obj-$(CONFIG_MFD_CROS_EC_LPC)	+=3D cros_ec_lpc.o
>  obj-$(CONFIG_MFD_CROS_EC_SPI)	+=3D cros_ec_spi.o
> =20
>  rtsx_pci-objs			:=3D rtsx_pcr.o rtsx_gops.o rts5209.o rts5229.o rtl8=
411.o rts5227.o rts5249.o
> diff --git a/drivers/mfd/cros_ec_lpc.c b/drivers/mfd/cros_ec_lpc.c
> new file mode 100644
> index 0000000..700e4cf
> --- /dev/null
> +++ b/drivers/mfd/cros_ec_lpc.c
> @@ -0,0 +1,305 @@
> +/*
> + * cros_ec_lpc - LPC access to the Chrome OS Embedded Controller
> + *
> + * Copyright (C) 2012-2015 Google, Inc
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
> + * This driver uses the Chrome OS EC byte-level message-based protoc=
ol for
> + * communicating the keyboard state (which keys are pressed) from a =
keyboard EC
> + * to the AP over some bus (such as i2c, lpc, spi).  The EC does deb=
ouncing,
> + * but everything else (including deghosting) is done here.  The mai=
n
> + * motivation for this is to keep the EC firmware as simple as possi=
ble, since
> + * it cannot be easily upgraded and EC flash/IRAM space is relativel=
y
> + * expensive.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/mfd/cros_ec.h>
> +#include <linux/mfd/cros_ec_commands.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/printk.h>
> +
> +#define MYNAME "cros_ec_lpc"
> +
> +static int ec_response_timed_out(void)
> +{
> +	unsigned long one_second =3D jiffies + HZ;
> +
> +	usleep_range(200, 300);
> +	do {
> +		if (!(inb(EC_LPC_ADDR_HOST_CMD) & EC_LPC_STATUS_BUSY_MASK))
> +			return 0;
> +		usleep_range(100, 200);
> +	} while (time_before(jiffies, one_second));
> +
> +	return 1;
> +}
> +
> +static int cros_ec_cmd_xfer_lpc(struct cros_ec_device *ec,
> +				struct cros_ec_command *msg)
> +{
> +	struct ec_lpc_host_args args;
> +	int csum;
> +	int i;
> +	int ret =3D 0;
> +
> +	if (msg->outsize > EC_PROTO2_MAX_PARAM_SIZE ||
> +	    msg->insize > EC_PROTO2_MAX_PARAM_SIZE) {
> +		dev_err(ec->dev,
> +			"invalid buffer sizes (out %d, in %d)\n",
> +			msg->outsize, msg->insize);
> +		return -EINVAL;
> +	}
> +
> +	/* Now actually send the command to the EC and get the result */
> +	args.flags =3D EC_HOST_ARGS_FLAG_FROM_HOST;
> +	args.command_version =3D msg->version;
> +	args.data_size =3D msg->outsize;
> +
> +	/* Initialize checksum */
> +	csum =3D msg->command + args.flags +
> +		args.command_version + args.data_size;
> +
> +	/* Copy data and update checksum */
> +	for (i =3D 0; i < msg->outsize; i++) {
> +		outb(msg->outdata[i], EC_LPC_ADDR_HOST_PARAM + i);
> +		csum +=3D msg->outdata[i];
> +	}
> +
> +	/* Finalize checksum and write args */
> +	args.checksum =3D csum & 0xFF;
> +	outb(args.flags, EC_LPC_ADDR_HOST_ARGS);
> +	outb(args.command_version, EC_LPC_ADDR_HOST_ARGS + 1);
> +	outb(args.data_size, EC_LPC_ADDR_HOST_ARGS + 2);
> +	outb(args.checksum, EC_LPC_ADDR_HOST_ARGS + 3);
> +
> +	/* Here we go */
> +	outb(msg->command, EC_LPC_ADDR_HOST_CMD);
> +
> +	if (ec_response_timed_out()) {
> +		dev_warn(ec->dev, "EC responsed timed out\n");
> +		ret =3D -EIO;
> +		goto done;
> +	}
> +
> +	/* Check result */
> +	msg->result =3D inb(EC_LPC_ADDR_HOST_DATA);
> +	switch (msg->result) {
> +	case EC_RES_SUCCESS:
> +		break;
> +	case EC_RES_IN_PROGRESS:
> +		ret =3D -EAGAIN;
> +		dev_dbg(ec->dev, "command 0x%02x in progress\n",
> +			msg->command);
> +		goto done;
> +	default:
> +		dev_dbg(ec->dev, "command 0x%02x returned %d\n",
> +			msg->command, msg->result);
> +	}
> +
> +	/* Read back args */
> +	args.flags =3D inb(EC_LPC_ADDR_HOST_ARGS);
> +	args.command_version =3D inb(EC_LPC_ADDR_HOST_ARGS + 1);
> +	args.data_size =3D inb(EC_LPC_ADDR_HOST_ARGS + 2);
> +	args.checksum =3D inb(EC_LPC_ADDR_HOST_ARGS + 3);
> +
> +	if (args.data_size > msg->insize) {
> +		dev_err(ec->dev,
> +			"packet too long (%d bytes, expected %d)",
> +			args.data_size, msg->insize);
> +		ret =3D -ENOSPC;
> +		goto done;
> +	}
> +
> +	/* Start calculating response checksum */
> +	csum =3D msg->command + args.flags +
> +		args.command_version + args.data_size;
> +
> +	/* Read response and update checksum */
> +	for (i =3D 0; i < args.data_size; i++) {
> +		msg->indata[i] =3D inb(EC_LPC_ADDR_HOST_PARAM + i);
> +		csum +=3D msg->indata[i];
> +	}
> +
> +	/* Verify checksum */
> +	if (args.checksum !=3D (csum & 0xFF)) {
> +		dev_err(ec->dev,
> +			"bad packet checksum, expected %02x, got %02x\n",
> +			args.checksum, csum & 0xFF);
> +		ret =3D -EBADMSG;
> +		goto done;
> +	}
> +
> +	/* Return actual amount of data received */
> +	ret =3D args.data_size;
> +done:
> +	return ret;
> +}
> +
> +/* Returns num bytes read, or negative on error. Doesn't need lockin=
g. */
> +static int cros_ec_lpc_readmem(struct cros_ec_device *ec, unsigned i=
nt offset,
> +			       unsigned int bytes, void *dest)
> +{
> +	int i =3D offset;
> +	char *s =3D dest;
> +	int cnt =3D 0;
> +
> +	if (offset >=3D EC_MEMMAP_SIZE - bytes)
> +		return -EINVAL;
> +
> +	/* fixed length */
> +	if (bytes) {
> +		for (; cnt < bytes; i++, s++, cnt++)
> +			*s =3D inb(EC_LPC_ADDR_MEMMAP + i);
> +		return cnt;
> +	}
> +
> +	/* string */
> +	for (; i < EC_MEMMAP_SIZE; i++, s++) {
> +		*s =3D inb(EC_LPC_ADDR_MEMMAP + i);
> +		cnt++;
> +		if (!*s)
> +			break;
> +	}
> +
> +	return cnt;
> +}
> +
> +static int cros_ec_lpc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct cros_ec_device *ec_dev;
> +	int err =3D -ENOTTY;
> +
> +	if (!request_region(EC_LPC_ADDR_MEMMAP, EC_MEMMAP_SIZE, MYNAME)) {
> +		dev_warn(dev, "couldn't reserve memmap region\n");
> +		goto failed_memmap;
> +	}
> +
> +	if ((inb(EC_LPC_ADDR_MEMMAP + EC_MEMMAP_ID) !=3D 'E') ||
> +	    (inb(EC_LPC_ADDR_MEMMAP + EC_MEMMAP_ID + 1) !=3D 'C')) {
> +		dev_warn(dev, "EC ID not detected\n");
> +		goto failed_ec_probe;
> +	}
> +
> +	if (!request_region(EC_HOST_CMD_REGION0, EC_HOST_CMD_REGION_SIZE,
> +			    MYNAME)) {
> +		dev_warn(dev, "couldn't reserve region0\n");
> +		goto failed_region0;
> +	}
> +	if (!request_region(EC_HOST_CMD_REGION1, EC_HOST_CMD_REGION_SIZE,
> +			    MYNAME)) {
> +		dev_warn(dev, "couldn't reserve region1\n");
> +		goto failed_region1;
> +	}
> +
> +	ec_dev =3D devm_kzalloc(dev, sizeof(*ec_dev), GFP_KERNEL);
> +	if (!ec_dev) {
> +		err =3D -ENOMEM;
> +		goto failed_ec_dev;
> +	}
> +
> +	platform_set_drvdata(pdev, ec_dev);
> +	ec_dev->dev =3D dev;
> +	ec_dev->ec_name =3D pdev->name;
> +	ec_dev->phys_name =3D dev_name(dev);
> +	ec_dev->parent =3D dev;
> +	ec_dev->cmd_xfer =3D cros_ec_cmd_xfer_lpc;
> +	ec_dev->cmd_readmem =3D cros_ec_lpc_readmem;
> +
> +	err =3D cros_ec_register(ec_dev);
> +	if (err) {
> +		dev_warn(dev, "couldn't register ec_dev\n");
> +		goto failed_ec_dev;
> +	}
> +
> +	return 0;
> +
> +failed_ec_dev:
> +	release_region(EC_HOST_CMD_REGION1, EC_HOST_CMD_REGION_SIZE);
> +failed_region1:
> +	release_region(EC_HOST_CMD_REGION0, EC_HOST_CMD_REGION_SIZE);
> +failed_region0:
> +failed_ec_probe:
> +	release_region(EC_LPC_ADDR_MEMMAP, EC_MEMMAP_SIZE);
> +failed_memmap:
> +	return err;
> +}
> +
> +static int cros_ec_lpc_remove(struct platform_device *pdev)
> +{
> +	struct cros_ec_device *ec_dev;
> +
> +	ec_dev =3D platform_get_drvdata(pdev);
> +	cros_ec_remove(ec_dev);
> +
> +	release_region(EC_HOST_CMD_REGION1, EC_HOST_CMD_REGION_SIZE);
> +	release_region(EC_HOST_CMD_REGION0, EC_HOST_CMD_REGION_SIZE);
> +	release_region(EC_LPC_ADDR_MEMMAP, EC_MEMMAP_SIZE);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver cros_ec_lpc_driver =3D {
> +	.driver =3D {
> +		.name =3D MYNAME,
> +		.owner =3D THIS_MODULE,
> +	},
> +	.probe =3D cros_ec_lpc_probe,
> +	.remove =3D cros_ec_lpc_remove,
> +};
> +
> +static void do_nothing(struct device *dev)
> +{
> +	/* not a physical device */
> +}
> +
> +static struct platform_device cros_ec_lpc_device =3D {
> +	.name =3D MYNAME,
> +	.dev =3D {
> +		.release =3D do_nothing,
> +	},
> +};
> +
> +static int __init cros_ec_lpc_init(void)
> +{
> +	int ret;
> +
> +	/* Register the driver */
> +	ret =3D platform_driver_register(&cros_ec_lpc_driver);
> +	if (ret < 0) {
> +		pr_warn(MYNAME ": can't register driver: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* Register the device, and it'll get hooked up automatically */
> +	ret =3D platform_device_register(&cros_ec_lpc_device);
> +	if (ret < 0) {
> +		pr_warn(MYNAME ": can't register device: %d\n", ret);
> +		platform_driver_unregister(&cros_ec_lpc_driver);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void __exit cros_ec_lpc_exit(void)
> +{
> +	platform_device_unregister(&cros_ec_lpc_device);
> +	platform_driver_unregister(&cros_ec_lpc_driver);
> +}
> +
> +module_init(cros_ec_lpc_init);
> +module_exit(cros_ec_lpc_exit);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("ChromeOS EC LPC driver");

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
