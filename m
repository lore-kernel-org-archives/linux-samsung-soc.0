From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH RESEND v2 2/7] mfd: cros_ec: Add char dev and virtual dev
 pointers
Date: Tue, 20 Jan 2015 07:50:11 +0000
Message-ID: <20150120075011.GS21886@x1>
References: <1420205572-2640-1-git-send-email-javier.martinez@collabora.co.uk>
 <1420205572-2640-3-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f180.google.com ([209.85.223.180]:52988 "EHLO
	mail-ie0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751933AbbATHuT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Jan 2015 02:50:19 -0500
Received: by mail-ie0-f180.google.com with SMTP id rl12so1611188iec.11
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Jan 2015 23:50:18 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1420205572-2640-3-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Jonathan Corbet <corbet@lwn.net>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 02 Jan 2015, Javier Martinez Canillas wrote:

> The ChromeOS Embedded Controller has to be accessed by applications.
> A virtual character device is used as an interface with user-space.
>=20
> Extend the struct cros_ec_device with the fields needed by the driver
> of this virtual character device.
>=20
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co=
=2Euk>
> ---
>=20
> Changes since v1: None, new patch.
>=20
>  include/linux/mfd/cros_ec.h | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/linux/mfd/cros_ec.h b/include/linux/mfd/cros_ec.=
h
> index 71675b1..324a346 100644
> --- a/include/linux/mfd/cros_ec.h
> +++ b/include/linux/mfd/cros_ec.h
> @@ -16,6 +16,7 @@
>  #ifndef __LINUX_MFD_CROS_EC_H
>  #define __LINUX_MFD_CROS_EC_H
> =20
> +#include <linux/cdev.h>
>  #include <linux/notifier.h>
>  #include <linux/mfd/cros_ec_commands.h>
>  #include <linux/mutex.h>
> @@ -59,9 +60,17 @@ struct cros_ec_command {
>   *
>   * @ec_name: name of EC device (e.g. 'chromeos-ec')
>   * @phys_name: name of physical comms layer (e.g. 'i2c-4')
> - * @dev: Device pointer
> + * @dev: Device pointer for physical comms device
> + * @vdev: Device pointer for virtual comms device
> + * @cdev: Character device structure for virtual comms device
>   * @was_wake_device: true if this device was set to wake the system =
from
>   * sleep at the last suspend
> + * @cmd_readmem: direct read of the EC memory-mapped region, if supp=
orted
> + *     @offset is within EC_LPC_ADDR_MEMMAP region.
> + *     @bytes: number of bytes to read. zero means "read a string" (=
including
> + *     the trailing '\0'). At most only EC_MEMMAP_SIZE bytes can be =
read.
> + *     Caller must ensure that the buffer is large enough for the re=
sult when
> + *     reading a string.
>   *
>   * @priv: Private data
>   * @irq: Interrupt to use
> @@ -90,8 +99,12 @@ struct cros_ec_device {
>  	const char *ec_name;
>  	const char *phys_name;
>  	struct device *dev;
> +	struct device *vdev;
> +	struct cdev cdev;
>  	bool was_wake_device;
>  	struct class *cros_class;
> +	int (*cmd_readmem)(struct cros_ec_device *ec, unsigned int offset,
> +			   unsigned int bytes, void *dest);

Is this safe?  Are you sure it's okay to provide an interface from
userspace to read (kernel?) memory?

>  	/* These are used to implement the platform-specific interface */
>  	void *priv;

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
