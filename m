From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v7 6/8] mfd: cros_ec: Support multiple EC in a system
Date: Mon, 15 Jun 2015 13:24:42 +0100
Message-ID: <20150615122442.GF3266@x1>
References: <1433847889-7220-1-git-send-email-javier.martinez@collabora.co.uk>
 <1433847889-7220-7-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:37343 "EHLO
	mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755174AbbFOMZA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Jun 2015 08:25:00 -0400
Received: by wifx6 with SMTP id x6so76387142wif.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Jun 2015 05:24:59 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1433847889-7220-7-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, Alexandru M Stan <amstan@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>

On Tue, 09 Jun 2015, Javier Martinez Canillas wrote:

> From: Gwendal Grignou <gwendal@chromium.org>
>=20
> Chromebooks can have more than one Embedded Controller so the
> cros_ec device id has to be incremented for each EC registered.
>=20
> Add a new structure to represent multiple EC as different char
> devices (e.g: /dev/cros_ec, /dev/cros_pd). It connects to
> cros_ec_device and allows sysfs inferface for cros_pd.
>=20
> Also reduce number of allocated objects, make chromeos sysfs
> class object a static and add refcounting to prevent object
> deletion while command is in progress.
>=20
> Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
> Reviewed-by: Dmitry Torokhov <dtor@chromium.org>
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co=
=2Euk>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Acked-by: Lee Jones <lee.jones@linaro.org>
> Acked-by: Olof Johansson <olof@lixom.net>

Applied, thanks.

> ---
>=20
> Changes since v6:
>  - Add Lee Jones Acked-by tag.
>  - Add Olof Johansson Acked-by tag.
>  - Use proper english sentences for mfd_add_devices() error condition=
=2E
>    Suggested by Lee Jones.
>=20
> Changes since v5:
>  - Don't allow to change the device name from DT. Suggested by Lee Jo=
nes.
>  - Expand error messages in case of mfd_add_devices() failure.
>    Suggested by Lee Jones.
>=20
> Changes since v4:
>  - Use cros-ec-name DT property instead of devname. Suggested by Lee =
Jones.
>  - Pass PLATFORM_DEVID_AUTO directly to mfd_add_devices().
>    Suggested by Lee Jones.
>  - Add Heiko Stuebner tested-by tag.
>  - Fix get_version by passing the cmd_offset to EC_CMD_GET_VERSION.
>=20
> Changes since v3:
>  - Add defines for the EC and PD index constants.
>  - Remove cros_ec_dev_register() and declare the mfd_cells as static =
structs.
>    Suggested by Lee Jones.
>  - Add a new line before the return statement in cros_ec_dev_register=
().
>    Suggested by Lee Jones.
>=20
> Changes since v2: None
>=20
> Changes since v1:
>   - Squash patch that adds support to represent EC's as different
>     char devices (e.g: /dev/cros_ec, /dev/cros_pd):
>     https://chromium-review.googlesource.com/#/c/217297/
>     Suggested by Gwendal Grignou
>   - Use cros_ec instead of cros-ec in the subject line to be consiste=
nt.
>     Suggested by Gwendal Grignou
> ---
>  drivers/input/keyboard/cros_ec_keyb.c      |   2 +-
>  drivers/mfd/cros_ec.c                      |  54 ++++++++++--
>  drivers/mfd/cros_ec_i2c.c                  |   1 -
>  drivers/mfd/cros_ec_spi.c                  |   1 -
>  drivers/platform/chrome/cros_ec_dev.c      | 130 +++++++++++++++++++=
+---------
>  drivers/platform/chrome/cros_ec_dev.h      |   7 --
>  drivers/platform/chrome/cros_ec_lightbar.c |  75 +++++++++--------
>  drivers/platform/chrome/cros_ec_lpc.c      |   1 -
>  drivers/platform/chrome/cros_ec_sysfs.c    |  48 +++++------
>  include/linux/mfd/cros_ec.h                |  44 ++++++++--
>  10 files changed, 236 insertions(+), 127 deletions(-)
>=20
> diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/ke=
yboard/cros_ec_keyb.c
> index 974154a74505..b01966dc7eb3 100644
> --- a/drivers/input/keyboard/cros_ec_keyb.c
> +++ b/drivers/input/keyboard/cros_ec_keyb.c
> @@ -275,7 +275,7 @@ static int cros_ec_keyb_probe(struct platform_dev=
ice *pdev)
>  	ckdev->dev =3D dev;
>  	dev_set_drvdata(&pdev->dev, ckdev);
> =20
> -	idev->name =3D ec->ec_name;
> +	idev->name =3D CROS_EC_DEV_NAME;
>  	idev->phys =3D ec->phys_name;
>  	__set_bit(EV_REP, idev->evbit);
> =20
> diff --git a/drivers/mfd/cros_ec.c b/drivers/mfd/cros_ec.c
> index 08d82bfc5268..11b1884bce62 100644
> --- a/drivers/mfd/cros_ec.c
> +++ b/drivers/mfd/cros_ec.c
> @@ -24,11 +24,29 @@
>  #include <linux/mfd/core.h>
>  #include <linux/mfd/cros_ec.h>
> =20
> -static const struct mfd_cell cros_devs[] =3D {
> -	{
> -		.name =3D "cros-ec-ctl",
> -		.id =3D PLATFORM_DEVID_AUTO,
> -	},
> +#define CROS_EC_DEV_EC_INDEX 0
> +#define CROS_EC_DEV_PD_INDEX 1
> +
> +struct cros_ec_platform ec_p =3D {
> +	.ec_name =3D CROS_EC_DEV_NAME,
> +	.cmd_offset =3D EC_CMD_PASSTHRU_OFFSET(CROS_EC_DEV_EC_INDEX),
> +};
> +
> +struct cros_ec_platform pd_p =3D {
> +	.ec_name =3D CROS_EC_DEV_PD_NAME,
> +	.cmd_offset =3D EC_CMD_PASSTHRU_OFFSET(CROS_EC_DEV_PD_INDEX),
> +};
> +
> +struct mfd_cell ec_cell =3D {
> +	.name =3D "cros-ec-ctl",
> +	.platform_data =3D &ec_p,
> +	.pdata_size =3D sizeof(ec_p),
> +};
> +
> +struct mfd_cell ec_pd_cell =3D {
> +	.name =3D "cros-ec-ctl",
> +	.platform_data =3D &pd_p,
> +	.pdata_size =3D sizeof(pd_p),
>  };
> =20
>  int cros_ec_register(struct cros_ec_device *ec_dev)
> @@ -52,14 +70,34 @@ int cros_ec_register(struct cros_ec_device *ec_de=
v)
> =20
>  	cros_ec_query_all(ec_dev);
> =20
> -	err =3D mfd_add_devices(dev, 0, cros_devs,
> -			      ARRAY_SIZE(cros_devs),
> +	err =3D mfd_add_devices(ec_dev->dev, PLATFORM_DEVID_AUTO, &ec_cell,=
 1,
>  			      NULL, ec_dev->irq, NULL);
>  	if (err) {
> -		dev_err(dev, "failed to add mfd devices\n");
> +		dev_err(dev,
> +			"Failed to register Embedded Controller subdevice %d\n",
> +			err);
>  		return err;
>  	}
> =20
> +	if (ec_dev->max_passthru) {
> +		/*
> +		 * Register a PD device as well on top of this device.
> +		 * We make the following assumptions:
> +		 * - behind an EC, we have a pd
> +		 * - only one device added.
> +		 * - the EC is responsive at init time (it is not true for a
> +		 *   sensor hub.
> +		 */
> +		err =3D mfd_add_devices(ec_dev->dev, PLATFORM_DEVID_AUTO,
> +				      &ec_pd_cell, 1, NULL, ec_dev->irq, NULL);
> +		if (err) {
> +			dev_err(dev,
> +				"Failed to register Power Delivery subdevice %d\n",
> +				err);
> +			return err;
> +		}
> +	}
> +
>  	if (IS_ENABLED(CONFIG_OF) && dev->of_node) {
>  		err =3D of_platform_populate(dev->of_node, NULL, NULL, dev);
>  		if (err) {
> diff --git a/drivers/mfd/cros_ec_i2c.c b/drivers/mfd/cros_ec_i2c.c
> index 22e8a4ae1711..b9a0963ca5c3 100644
> --- a/drivers/mfd/cros_ec_i2c.c
> +++ b/drivers/mfd/cros_ec_i2c.c
> @@ -302,7 +302,6 @@ static int cros_ec_i2c_probe(struct i2c_client *c=
lient,
>  	ec_dev->irq =3D client->irq;
>  	ec_dev->cmd_xfer =3D cros_ec_cmd_xfer_i2c;
>  	ec_dev->pkt_xfer =3D cros_ec_pkt_xfer_i2c;
> -	ec_dev->ec_name =3D client->name;
>  	ec_dev->phys_name =3D client->adapter->name;
>  	ec_dev->din_size =3D sizeof(struct ec_host_response_i2c) +
>  			   sizeof(struct ec_response_get_protocol_info);
> diff --git a/drivers/mfd/cros_ec_spi.c b/drivers/mfd/cros_ec_spi.c
> index 4e6f2f6b1095..faba03e2f1ef 100644
> --- a/drivers/mfd/cros_ec_spi.c
> +++ b/drivers/mfd/cros_ec_spi.c
> @@ -637,7 +637,6 @@ static int cros_ec_spi_probe(struct spi_device *s=
pi)
>  	ec_dev->irq =3D spi->irq;
>  	ec_dev->cmd_xfer =3D cros_ec_cmd_xfer_spi;
>  	ec_dev->pkt_xfer =3D cros_ec_pkt_xfer_spi;
> -	ec_dev->ec_name =3D ec_spi->spi->modalias;
>  	ec_dev->phys_name =3D dev_name(&ec_spi->spi->dev);
>  	ec_dev->din_size =3D EC_MSG_PREAMBLE_COUNT +
>  			   sizeof(struct ec_host_response) +
> diff --git a/drivers/platform/chrome/cros_ec_dev.c b/drivers/platform=
/chrome/cros_ec_dev.c
> index 14111e32658b..2f4099820480 100644
> --- a/drivers/platform/chrome/cros_ec_dev.c
> +++ b/drivers/platform/chrome/cros_ec_dev.c
> @@ -27,11 +27,22 @@
> =20
>  /* Device variables */
>  #define CROS_MAX_DEV 128
> -static struct class *cros_class;
>  static int ec_major;
> =20
> +static const struct attribute_group *cros_ec_groups[] =3D {
> +	&cros_ec_attr_group,
> +	&cros_ec_lightbar_attr_group,
> +	NULL,
> +};
> +
> +static struct class cros_class =3D {
> +	.owner          =3D THIS_MODULE,
> +	.name           =3D "chromeos",
> +	.dev_groups     =3D cros_ec_groups,
> +};
> +
>  /* Basic communication */
> -static int ec_get_version(struct cros_ec_device *ec, char *str, int =
maxlen)
> +static int ec_get_version(struct cros_ec_dev *ec, char *str, int max=
len)
>  {
>  	struct ec_response_get_version *resp;
>  	static const char * const current_image_name[] =3D {
> @@ -45,11 +56,11 @@ static int ec_get_version(struct cros_ec_device *=
ec, char *str, int maxlen)
>  		return -ENOMEM;
> =20
>  	msg->version =3D 0;
> -	msg->command =3D EC_CMD_GET_VERSION;
> +	msg->command =3D EC_CMD_GET_VERSION + ec->cmd_offset;
>  	msg->insize =3D sizeof(*resp);
>  	msg->outsize =3D 0;
> =20
> -	ret =3D cros_ec_cmd_xfer(ec, msg);
> +	ret =3D cros_ec_cmd_xfer(ec->ec_dev, msg);
>  	if (ret < 0)
>  		goto exit;
> =20
> @@ -78,8 +89,10 @@ exit:
>  /* Device file ops */
>  static int ec_device_open(struct inode *inode, struct file *filp)
>  {
> -	filp->private_data =3D container_of(inode->i_cdev,
> -					  struct cros_ec_device, cdev);
> +	struct cros_ec_dev *ec =3D container_of(inode->i_cdev,
> +					      struct cros_ec_dev, cdev);
> +	filp->private_data =3D ec;
> +	nonseekable_open(inode, filp);
>  	return 0;
>  }
> =20
> @@ -91,7 +104,7 @@ static int ec_device_release(struct inode *inode, =
struct file *filp)
>  static ssize_t ec_device_read(struct file *filp, char __user *buffer=
,
>  			      size_t length, loff_t *offset)
>  {
> -	struct cros_ec_device *ec =3D filp->private_data;
> +	struct cros_ec_dev *ec =3D filp->private_data;
>  	char msg[sizeof(struct ec_response_get_version) +
>  		 sizeof(CROS_EC_DEV_VERSION)];
>  	size_t count;
> @@ -114,7 +127,7 @@ static ssize_t ec_device_read(struct file *filp, =
char __user *buffer,
>  }
> =20
>  /* Ioctls */
> -static long ec_device_ioctl_xcmd(struct cros_ec_device *ec, void __u=
ser *arg)
> +static long ec_device_ioctl_xcmd(struct cros_ec_dev *ec, void __user=
 *arg)
>  {
>  	long ret;
>  	struct cros_ec_command u_cmd;
> @@ -133,7 +146,8 @@ static long ec_device_ioctl_xcmd(struct cros_ec_d=
evice *ec, void __user *arg)
>  		goto exit;
>  	}
> =20
> -	ret =3D cros_ec_cmd_xfer(ec, s_cmd);
> +	s_cmd->command +=3D ec->cmd_offset;
> +	ret =3D cros_ec_cmd_xfer(ec->ec_dev, s_cmd);
>  	/* Only copy data to userland if data was received. */
>  	if (ret < 0)
>  		goto exit;
> @@ -145,19 +159,21 @@ exit:
>  	return ret;
>  }
> =20
> -static long ec_device_ioctl_readmem(struct cros_ec_device *ec, void =
__user *arg)
> +static long ec_device_ioctl_readmem(struct cros_ec_dev *ec, void __u=
ser *arg)
>  {
> +	struct cros_ec_device *ec_dev =3D ec->ec_dev;
>  	struct cros_ec_readmem s_mem =3D { };
>  	long num;
> =20
>  	/* Not every platform supports direct reads */
> -	if (!ec->cmd_readmem)
> +	if (!ec_dev->cmd_readmem)
>  		return -ENOTTY;
> =20
>  	if (copy_from_user(&s_mem, arg, sizeof(s_mem)))
>  		return -EFAULT;
> =20
> -	num =3D ec->cmd_readmem(ec, s_mem.offset, s_mem.bytes, s_mem.buffer=
);
> +	num =3D ec_dev->cmd_readmem(ec_dev, s_mem.offset, s_mem.bytes,
> +				  s_mem.buffer);
>  	if (num <=3D 0)
>  		return num;
> =20
> @@ -170,7 +186,7 @@ static long ec_device_ioctl_readmem(struct cros_e=
c_device *ec, void __user *arg)
>  static long ec_device_ioctl(struct file *filp, unsigned int cmd,
>  			    unsigned long arg)
>  {
> -	struct cros_ec_device *ec =3D filp->private_data;
> +	struct cros_ec_dev *ec =3D filp->private_data;
> =20
>  	if (_IOC_TYPE(cmd) !=3D CROS_EC_DEV_IOC)
>  		return -ENOTTY;
> @@ -193,45 +209,81 @@ static const struct file_operations fops =3D {
>  	.unlocked_ioctl =3D ec_device_ioctl,
>  };
> =20
> +static void __remove(struct device *dev)
> +{
> +	struct cros_ec_dev *ec =3D container_of(dev, struct cros_ec_dev,
> +					      class_dev);
> +	kfree(ec);
> +}
> +
>  static int ec_device_probe(struct platform_device *pdev)
>  {
> -	struct cros_ec_device *ec =3D dev_get_drvdata(pdev->dev.parent);
> -	int retval =3D -ENOTTY;
> -	dev_t devno =3D MKDEV(ec_major, 0);
> +	int retval =3D -ENOMEM;
> +	struct device *dev =3D &pdev->dev;
> +	struct cros_ec_platform *ec_platform =3D dev_get_platdata(dev);
> +	dev_t devno =3D MKDEV(ec_major, pdev->id);
> +	struct cros_ec_dev *ec =3D kzalloc(sizeof(*ec), GFP_KERNEL);
> +
> +	if (!ec)
> +		return retval;
> =20
> -	/* Instantiate it (and remember the EC) */
> +	dev_set_drvdata(dev, ec);
> +	ec->ec_dev =3D dev_get_drvdata(dev->parent);
> +	ec->dev =3D dev;
> +	ec->cmd_offset =3D ec_platform->cmd_offset;
> +	device_initialize(&ec->class_dev);
>  	cdev_init(&ec->cdev, &fops);
> =20
> +	/*
> +	 * Add the character device
> +	 * Link cdev to the class device to be sure device is not used
> +	 * before unbinding it.
> +	 */
> +	ec->cdev.kobj.parent =3D &ec->class_dev.kobj;
>  	retval =3D cdev_add(&ec->cdev, devno, 1);
>  	if (retval) {
> -		dev_err(&pdev->dev, ": failed to add character device\n");
> -		return retval;
> +		dev_err(dev, ": failed to add character device\n");
> +		goto cdev_add_failed;
>  	}
> =20
> -	ec->vdev =3D device_create(cros_class, NULL, devno, ec,
> -				 CROS_EC_DEV_NAME);
> -	if (IS_ERR(ec->vdev)) {
> -		retval =3D PTR_ERR(ec->vdev);
> -		dev_err(&pdev->dev, ": failed to create device\n");
> -		cdev_del(&ec->cdev);
> -		return retval;
> +	/*
> +	 * Add the class device
> +	 * Link to the character device for creating the /dev entry
> +	 * in devtmpfs.
> +	 */
> +	ec->class_dev.devt =3D ec->cdev.dev;
> +	ec->class_dev.class =3D &cros_class;
> +	ec->class_dev.parent =3D dev;
> +	ec->class_dev.release =3D __remove;
> +
> +	retval =3D dev_set_name(&ec->class_dev, "%s", ec_platform->ec_name)=
;
> +	if (retval) {
> +		dev_err(dev, "dev_set_name failed =3D> %d\n", retval);
> +		goto set_named_failed;
>  	}
> =20
> -	/* Initialize extra interfaces */
> -	ec_dev_sysfs_init(ec);
> -	ec_dev_lightbar_init(ec);
> +	retval =3D device_add(&ec->class_dev);
> +	if (retval) {
> +		dev_err(dev, "device_register failed =3D> %d\n", retval);
> +		goto dev_reg_failed;
> +	}
> =20
>  	return 0;
> +
> +dev_reg_failed:
> +set_named_failed:
> +	dev_set_drvdata(dev, NULL);
> +	cdev_del(&ec->cdev);
> +cdev_add_failed:
> +	kfree(ec);
> +	return retval;
>  }
> =20
>  static int ec_device_remove(struct platform_device *pdev)
>  {
> -	struct cros_ec_device *ec =3D dev_get_drvdata(pdev->dev.parent);
> -
> -	ec_dev_lightbar_remove(ec);
> -	ec_dev_sysfs_remove(ec);
> -	device_destroy(cros_class, MKDEV(ec_major, 0));
> +	struct cros_ec_dev *ec =3D dev_get_drvdata(&pdev->dev);
>  	cdev_del(&ec->cdev);
> +	device_unregister(&ec->class_dev);
>  	return 0;
>  }
> =20
> @@ -254,10 +306,10 @@ static int __init cros_ec_dev_init(void)
>  	int ret;
>  	dev_t dev =3D 0;
> =20
> -	cros_class =3D class_create(THIS_MODULE, "chromeos");
> -	if (IS_ERR(cros_class)) {
> +	ret  =3D class_register(&cros_class);
> +	if (ret) {
>  		pr_err(CROS_EC_DEV_NAME ": failed to register device class\n");
> -		return PTR_ERR(cros_class);
> +		return ret;
>  	}
> =20
>  	/* Get a range of minor numbers (starting with 0) to work with */
> @@ -279,7 +331,7 @@ static int __init cros_ec_dev_init(void)
>  failed_devreg:
>  	unregister_chrdev_region(MKDEV(ec_major, 0), CROS_MAX_DEV);
>  failed_chrdevreg:
> -	class_destroy(cros_class);
> +	class_unregister(&cros_class);
>  	return ret;
>  }
> =20
> @@ -287,7 +339,7 @@ static void __exit cros_ec_dev_exit(void)
>  {
>  	platform_driver_unregister(&cros_ec_dev_driver);
>  	unregister_chrdev(ec_major, CROS_EC_DEV_NAME);
> -	class_destroy(cros_class);
> +	class_unregister(&cros_class);
>  }
> =20
>  module_init(cros_ec_dev_init);
> diff --git a/drivers/platform/chrome/cros_ec_dev.h b/drivers/platform=
/chrome/cros_ec_dev.h
> index 45d67f7e518c..bfd2c84c3571 100644
> --- a/drivers/platform/chrome/cros_ec_dev.h
> +++ b/drivers/platform/chrome/cros_ec_dev.h
> @@ -24,7 +24,6 @@
>  #include <linux/types.h>
>  #include <linux/mfd/cros_ec.h>
> =20
> -#define CROS_EC_DEV_NAME "cros_ec"
>  #define CROS_EC_DEV_VERSION "1.0.0"
> =20
>  /*
> @@ -44,10 +43,4 @@ struct cros_ec_readmem {
>  #define CROS_EC_DEV_IOCXCMD   _IOWR(CROS_EC_DEV_IOC, 0, struct cros_=
ec_command)
>  #define CROS_EC_DEV_IOCRDMEM  _IOWR(CROS_EC_DEV_IOC, 1, struct cros_=
ec_readmem)
> =20
> -void ec_dev_sysfs_init(struct cros_ec_device *);
> -void ec_dev_sysfs_remove(struct cros_ec_device *);
> -
> -void ec_dev_lightbar_init(struct cros_ec_device *);
> -void ec_dev_lightbar_remove(struct cros_ec_device *);
> -
>  #endif /* _CROS_EC_DEV_H_ */
> diff --git a/drivers/platform/chrome/cros_ec_lightbar.c b/drivers/pla=
tform/chrome/cros_ec_lightbar.c
> index 6e1986a2dce1..144e09df9b84 100644
> --- a/drivers/platform/chrome/cros_ec_lightbar.c
> +++ b/drivers/platform/chrome/cros_ec_lightbar.c
> @@ -92,7 +92,7 @@ out:
>  	return ret;
>  }
> =20
> -static struct cros_ec_command *alloc_lightbar_cmd_msg(void)
> +static struct cros_ec_command *alloc_lightbar_cmd_msg(struct cros_ec=
_dev *ec)
>  {
>  	struct cros_ec_command *msg;
>  	int len;
> @@ -105,14 +105,14 @@ static struct cros_ec_command *alloc_lightbar_c=
md_msg(void)
>  		return NULL;
> =20
>  	msg->version =3D 0;
> -	msg->command =3D EC_CMD_LIGHTBAR_CMD;
> +	msg->command =3D EC_CMD_LIGHTBAR_CMD + ec->cmd_offset;
>  	msg->outsize =3D sizeof(struct ec_params_lightbar);
>  	msg->insize =3D sizeof(struct ec_response_lightbar);
> =20
>  	return msg;
>  }
> =20
> -static int get_lightbar_version(struct cros_ec_device *ec,
> +static int get_lightbar_version(struct cros_ec_dev *ec,
>  				uint32_t *ver_ptr, uint32_t *flg_ptr)
>  {
>  	struct ec_params_lightbar *param;
> @@ -120,13 +120,13 @@ static int get_lightbar_version(struct cros_ec_=
device *ec,
>  	struct cros_ec_command *msg;
>  	int ret;
> =20
> -	msg =3D alloc_lightbar_cmd_msg();
> +	msg =3D alloc_lightbar_cmd_msg(ec);
>  	if (!msg)
>  		return 0;
> =20
>  	param =3D (struct ec_params_lightbar *)msg->data;
>  	param->cmd =3D LIGHTBAR_CMD_VERSION;
> -	ret =3D cros_ec_cmd_xfer(ec, msg);
> +	ret =3D cros_ec_cmd_xfer(ec->ec_dev, msg);
>  	if (ret < 0) {
>  		ret =3D 0;
>  		goto exit;
> @@ -165,7 +165,8 @@ static ssize_t version_show(struct device *dev,
>  			    struct device_attribute *attr, char *buf)
>  {
>  	uint32_t version =3D 0, flags =3D 0;
> -	struct cros_ec_device *ec =3D dev_get_drvdata(dev);
> +	struct cros_ec_dev *ec =3D container_of(dev,
> +					      struct cros_ec_dev, class_dev);
>  	int ret;
> =20
>  	ret =3D lb_throttle();
> @@ -187,12 +188,13 @@ static ssize_t brightness_store(struct device *=
dev,
>  	struct cros_ec_command *msg;
>  	int ret;
>  	unsigned int val;
> -	struct cros_ec_device *ec =3D dev_get_drvdata(dev);
> +	struct cros_ec_dev *ec =3D container_of(dev,
> +					      struct cros_ec_dev, class_dev);
> =20
>  	if (kstrtouint(buf, 0, &val))
>  		return -EINVAL;
> =20
> -	msg =3D alloc_lightbar_cmd_msg();
> +	msg =3D alloc_lightbar_cmd_msg(ec);
>  	if (!msg)
>  		return -ENOMEM;
> =20
> @@ -203,7 +205,7 @@ static ssize_t brightness_store(struct device *de=
v,
>  	if (ret)
>  		goto exit;
> =20
> -	ret =3D cros_ec_cmd_xfer(ec, msg);
> +	ret =3D cros_ec_cmd_xfer(ec->ec_dev, msg);
>  	if (ret < 0)
>  		goto exit;
> =20
> @@ -231,11 +233,12 @@ static ssize_t led_rgb_store(struct device *dev=
, struct device_attribute *attr,
>  {
>  	struct ec_params_lightbar *param;
>  	struct cros_ec_command *msg;
> -	struct cros_ec_device *ec =3D dev_get_drvdata(dev);
> +	struct cros_ec_dev *ec =3D container_of(dev,
> +					      struct cros_ec_dev, class_dev);
>  	unsigned int val[4];
>  	int ret, i =3D 0, j =3D 0, ok =3D 0;
> =20
> -	msg =3D alloc_lightbar_cmd_msg();
> +	msg =3D alloc_lightbar_cmd_msg(ec);
>  	if (!msg)
>  		return -ENOMEM;
> =20
> @@ -268,7 +271,7 @@ static ssize_t led_rgb_store(struct device *dev, =
struct device_attribute *attr,
>  					return ret;
>  			}
> =20
> -			ret =3D cros_ec_cmd_xfer(ec, msg);
> +			ret =3D cros_ec_cmd_xfer(ec->ec_dev, msg);
>  			if (ret < 0)
>  				goto exit;
> =20
> @@ -304,9 +307,10 @@ static ssize_t sequence_show(struct device *dev,
>  	struct ec_response_lightbar *resp;
>  	struct cros_ec_command *msg;
>  	int ret;
> -	struct cros_ec_device *ec =3D dev_get_drvdata(dev);
> +	struct cros_ec_dev *ec =3D container_of(dev,
> +					      struct cros_ec_dev, class_dev);
> =20
> -	msg =3D alloc_lightbar_cmd_msg();
> +	msg =3D alloc_lightbar_cmd_msg(ec);
>  	if (!msg)
>  		return -ENOMEM;
> =20
> @@ -316,7 +320,7 @@ static ssize_t sequence_show(struct device *dev,
>  	if (ret)
>  		goto exit;
> =20
> -	ret =3D cros_ec_cmd_xfer(ec, msg);
> +	ret =3D cros_ec_cmd_xfer(ec->ec_dev, msg);
>  	if (ret < 0)
>  		goto exit;
> =20
> @@ -345,9 +349,10 @@ static ssize_t sequence_store(struct device *dev=
, struct device_attribute *attr,
>  	struct cros_ec_command *msg;
>  	unsigned int num;
>  	int ret, len;
> -	struct cros_ec_device *ec =3D dev_get_drvdata(dev);
> +	struct cros_ec_dev *ec =3D container_of(dev,
> +					      struct cros_ec_dev, class_dev);
> =20
> -	msg =3D alloc_lightbar_cmd_msg();
> +	msg =3D alloc_lightbar_cmd_msg(ec);
>  	if (!msg)
>  		return -ENOMEM;
> =20
> @@ -372,7 +377,7 @@ static ssize_t sequence_store(struct device *dev,=
 struct device_attribute *attr,
>  	if (ret)
>  		return ret;
> =20
> -	ret =3D cros_ec_cmd_xfer(ec, msg);
> +	ret =3D cros_ec_cmd_xfer(ec->ec_dev, msg);
>  	if (ret < 0)
>  		return ret;
> =20
> @@ -397,25 +402,27 @@ static struct attribute *__lb_cmds_attrs[] =3D =
{
>  	&dev_attr_sequence.attr,
>  	NULL,
>  };
> -static struct attribute_group lb_cmds_attr_group =3D {
> -	.name =3D "lightbar",
> -	.attrs =3D __lb_cmds_attrs,
> -};
> =20
> -void ec_dev_lightbar_init(struct cros_ec_device *ec)
> +static umode_t cros_ec_lightbar_attrs_are_visible(struct kobject *ko=
bj,
> +						  struct attribute *a, int n)
>  {
> -	int ret =3D 0;
> +	struct device *dev =3D container_of(kobj, struct device, kobj);
> +	struct cros_ec_dev *ec =3D container_of(dev,
> +					      struct cros_ec_dev, class_dev);
> +	struct platform_device *pdev =3D container_of(ec->dev,
> +						   struct platform_device, dev);
> +	if (pdev->id !=3D 0)
> +		return 0;
> =20
>  	/* Only instantiate this stuff if the EC has a lightbar */
> -	if (!get_lightbar_version(ec, NULL, NULL))
> -		return;
> -
> -	ret =3D sysfs_create_group(&ec->vdev->kobj, &lb_cmds_attr_group);
> -	if (ret)
> -		pr_warn("sysfs_create_group() failed: %d\n", ret);
> +	if (get_lightbar_version(ec, NULL, NULL))
> +		return a->mode;
> +	else
> +		return 0;
>  }
> =20
> -void ec_dev_lightbar_remove(struct cros_ec_device *ec)
> -{
> -	sysfs_remove_group(&ec->vdev->kobj, &lb_cmds_attr_group);
> -}
> +struct attribute_group cros_ec_lightbar_attr_group =3D {
> +	.name =3D "lightbar",
> +	.attrs =3D __lb_cmds_attrs,
> +	.is_visible =3D cros_ec_lightbar_attrs_are_visible,
> +};
> diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform=
/chrome/cros_ec_lpc.c
> index 92b633324aaa..f9a245465fd0 100644
> --- a/drivers/platform/chrome/cros_ec_lpc.c
> +++ b/drivers/platform/chrome/cros_ec_lpc.c
> @@ -273,7 +273,6 @@ static int cros_ec_lpc_probe(struct platform_devi=
ce *pdev)
> =20
>  	platform_set_drvdata(pdev, ec_dev);
>  	ec_dev->dev =3D dev;
> -	ec_dev->ec_name =3D pdev->name;
>  	ec_dev->phys_name =3D dev_name(dev);
>  	ec_dev->cmd_xfer =3D cros_ec_cmd_xfer_lpc;
>  	ec_dev->pkt_xfer =3D cros_ec_pkt_xfer_lpc;
> diff --git a/drivers/platform/chrome/cros_ec_sysfs.c b/drivers/platfo=
rm/chrome/cros_ec_sysfs.c
> index 78ba82d670cb..f3baf9973989 100644
> --- a/drivers/platform/chrome/cros_ec_sysfs.c
> +++ b/drivers/platform/chrome/cros_ec_sysfs.c
> @@ -72,7 +72,8 @@ static ssize_t store_ec_reboot(struct device *dev,
>  	int got_cmd =3D 0, offset =3D 0;
>  	int i;
>  	int ret;
> -	struct cros_ec_device *ec =3D dev_get_drvdata(dev);
> +	struct cros_ec_dev *ec =3D container_of(dev,
> +					      struct cros_ec_dev, class_dev);
> =20
>  	msg =3D kmalloc(sizeof(*msg) + sizeof(*param), GFP_KERNEL);
>  	if (!msg)
> @@ -112,10 +113,10 @@ static ssize_t store_ec_reboot(struct device *d=
ev,
>  	}
> =20
>  	msg->version =3D 0;
> -	msg->command =3D EC_CMD_REBOOT_EC;
> +	msg->command =3D EC_CMD_REBOOT_EC + ec->cmd_offset;
>  	msg->outsize =3D sizeof(*param);
>  	msg->insize =3D 0;
> -	ret =3D cros_ec_cmd_xfer(ec, msg);
> +	ret =3D cros_ec_cmd_xfer(ec->ec_dev, msg);
>  	if (ret < 0) {
>  		count =3D ret;
>  		goto exit;
> @@ -139,7 +140,8 @@ static ssize_t show_ec_version(struct device *dev=
,
>  	struct cros_ec_command *msg;
>  	int ret;
>  	int count =3D 0;
> -	struct cros_ec_device *ec =3D dev_get_drvdata(dev);
> +	struct cros_ec_dev *ec =3D container_of(dev,
> +					      struct cros_ec_dev, class_dev);
> =20
>  	msg =3D kmalloc(sizeof(*msg) + EC_HOST_PARAM_SIZE, GFP_KERNEL);
>  	if (!msg)
> @@ -147,10 +149,10 @@ static ssize_t show_ec_version(struct device *d=
ev,
> =20
>  	/* Get versions. RW may change. */
>  	msg->version =3D 0;
> -	msg->command =3D EC_CMD_GET_VERSION;
> +	msg->command =3D EC_CMD_GET_VERSION + ec->cmd_offset;
>  	msg->insize =3D sizeof(*r_ver);
>  	msg->outsize =3D 0;
> -	ret =3D cros_ec_cmd_xfer(ec, msg);
> +	ret =3D cros_ec_cmd_xfer(ec->ec_dev, msg);
>  	if (ret < 0) {
>  		count =3D ret;
>  		goto exit;
> @@ -175,9 +177,9 @@ static ssize_t show_ec_version(struct device *dev=
,
>  			    image_names[r_ver->current_image] : "?"));
> =20
>  	/* Get build info. */
> -	msg->command =3D EC_CMD_GET_BUILD_INFO;
> +	msg->command =3D EC_CMD_GET_BUILD_INFO + ec->cmd_offset;
>  	msg->insize =3D EC_HOST_PARAM_SIZE;
> -	ret =3D cros_ec_cmd_xfer(ec, msg);
> +	ret =3D cros_ec_cmd_xfer(ec->ec_dev, msg);
>  	if (ret < 0)
>  		count +=3D scnprintf(buf + count, PAGE_SIZE - count,
>  				   "Build info:    XFER ERROR %d\n", ret);
> @@ -191,9 +193,9 @@ static ssize_t show_ec_version(struct device *dev=
,
>  	}
> =20
>  	/* Get chip info. */
> -	msg->command =3D EC_CMD_GET_CHIP_INFO;
> +	msg->command =3D EC_CMD_GET_CHIP_INFO + ec->cmd_offset;
>  	msg->insize =3D sizeof(*r_chip);
> -	ret =3D cros_ec_cmd_xfer(ec, msg);
> +	ret =3D cros_ec_cmd_xfer(ec->ec_dev, msg);
>  	if (ret < 0)
>  		count +=3D scnprintf(buf + count, PAGE_SIZE - count,
>  				   "Chip info:     XFER ERROR %d\n", ret);
> @@ -215,9 +217,9 @@ static ssize_t show_ec_version(struct device *dev=
,
>  	}
> =20
>  	/* Get board version */
> -	msg->command =3D EC_CMD_GET_BOARD_VERSION;
> +	msg->command =3D EC_CMD_GET_BOARD_VERSION + ec->cmd_offset;
>  	msg->insize =3D sizeof(*r_board);
> -	ret =3D cros_ec_cmd_xfer(ec, msg);
> +	ret =3D cros_ec_cmd_xfer(ec->ec_dev, msg);
>  	if (ret < 0)
>  		count +=3D scnprintf(buf + count, PAGE_SIZE - count,
>  				   "Board version: XFER ERROR %d\n", ret);
> @@ -243,7 +245,8 @@ static ssize_t show_ec_flashinfo(struct device *d=
ev,
>  	struct ec_response_flash_info *resp;
>  	struct cros_ec_command *msg;
>  	int ret;
> -	struct cros_ec_device *ec =3D dev_get_drvdata(dev);
> +	struct cros_ec_dev *ec =3D container_of(dev,
> +					      struct cros_ec_dev, class_dev);
> =20
>  	msg =3D kmalloc(sizeof(*msg) + sizeof(*resp), GFP_KERNEL);
>  	if (!msg)
> @@ -251,10 +254,10 @@ static ssize_t show_ec_flashinfo(struct device =
*dev,
> =20
>  	/* The flash info shouldn't ever change, but ask each time anyway. =
*/
>  	msg->version =3D 0;
> -	msg->command =3D EC_CMD_FLASH_INFO;
> +	msg->command =3D EC_CMD_FLASH_INFO + ec->cmd_offset;
>  	msg->insize =3D sizeof(*resp);
>  	msg->outsize =3D 0;
> -	ret =3D cros_ec_cmd_xfer(ec, msg);
> +	ret =3D cros_ec_cmd_xfer(ec->ec_dev, msg);
>  	if (ret < 0)
>  		goto exit;
>  	if (msg->result !=3D EC_RES_SUCCESS) {
> @@ -288,20 +291,7 @@ static struct attribute *__ec_attrs[] =3D {
>  	NULL,
>  };
> =20
> -static struct attribute_group ec_attr_group =3D {
> +struct attribute_group cros_ec_attr_group =3D {
>  	.attrs =3D __ec_attrs,
>  };
> =20
> -void ec_dev_sysfs_init(struct cros_ec_device *ec)
> -{
> -	int error;
> -
> -	error =3D sysfs_create_group(&ec->vdev->kobj, &ec_attr_group);
> -	if (error)
> -		pr_warn("failed to create group: %d\n", error);
> -}
> -
> -void ec_dev_sysfs_remove(struct cros_ec_device *ec)
> -{
> -	sysfs_remove_group(&ec->vdev->kobj, &ec_attr_group);
> -}
> diff --git a/include/linux/mfd/cros_ec.h b/include/linux/mfd/cros_ec.=
h
> index 92e13aaa450c..da72671a42fa 100644
> --- a/include/linux/mfd/cros_ec.h
> +++ b/include/linux/mfd/cros_ec.h
> @@ -17,10 +17,14 @@
>  #define __LINUX_MFD_CROS_EC_H
> =20
>  #include <linux/cdev.h>
> +#include <linux/device.h>
>  #include <linux/notifier.h>
>  #include <linux/mfd/cros_ec_commands.h>
>  #include <linux/mutex.h>
> =20
> +#define CROS_EC_DEV_NAME "cros_ec"
> +#define CROS_EC_DEV_PD_NAME "cros_pd"
> +
>  /*
>   * The EC is unresponsive for a time after a reboot command.  Add a
>   * simple delay to make sure that the bus stays locked.
> @@ -71,11 +75,8 @@ struct cros_ec_command {
>  /**
>   * struct cros_ec_device - Information about a ChromeOS EC device
>   *
> - * @ec_name: name of EC device (e.g. 'chromeos-ec')
>   * @phys_name: name of physical comms layer (e.g. 'i2c-4')
>   * @dev: Device pointer for physical comms device
> - * @vdev: Device pointer for virtual comms device
> - * @cdev: Character device structure for virtual comms device
>   * @was_wake_device: true if this device was set to wake the system =
from
>   * sleep at the last suspend
>   * @cmd_readmem: direct read of the EC memory-mapped region, if supp=
orted
> @@ -87,6 +88,7 @@ struct cros_ec_command {
>   *
>   * @priv: Private data
>   * @irq: Interrupt to use
> + * @id: Device id
>   * @din: input buffer (for data from EC)
>   * @dout: output buffer (for data to EC)
>   * \note
> @@ -109,11 +111,8 @@ struct cros_ec_command {
>  struct cros_ec_device {
> =20
>  	/* These are used by other drivers that want to talk to the EC */
> -	const char *ec_name;
>  	const char *phys_name;
>  	struct device *dev;
> -	struct device *vdev;
> -	struct cdev cdev;
>  	bool was_wake_device;
>  	struct class *cros_class;
>  	int (*cmd_readmem)(struct cros_ec_device *ec, unsigned int offset,
> @@ -138,6 +137,35 @@ struct cros_ec_device {
>  	struct mutex lock;
>  };
> =20
> +/* struct cros_ec_platform - ChromeOS EC platform information
> + *
> + * @ec_name: name of EC device (e.g. 'cros-ec', 'cros-pd', ...)
> + * used in /dev/ and sysfs.
> + * @cmd_offset: offset to apply for each command. Set when
> + * registering a devicde behind another one.
> + */
> +struct cros_ec_platform {
> +	const char *ec_name;
> +	u16 cmd_offset;
> +};
> +
> +/*
> + * struct cros_ec_dev - ChromeOS EC device entry point
> + *
> + * @class_dev: Device structure used in sysfs
> + * @cdev: Character device structure in /dev
> + * @ec_dev: cros_ec_device structure to talk to the physical device
> + * @dev: pointer to the platform device
> + * @cmd_offset: offset to apply for each command.
> + */
> +struct cros_ec_dev {
> +	struct device class_dev;
> +	struct cdev cdev;
> +	struct cros_ec_device *ec_dev;
> +	struct device *dev;
> +	u16 cmd_offset;
> +};
> +
>  /**
>   * cros_ec_suspend - Handle a suspend operation for the ChromeOS EC =
device
>   *
> @@ -224,4 +252,8 @@ int cros_ec_register(struct cros_ec_device *ec_de=
v);
>   */
>  int cros_ec_query_all(struct cros_ec_device *ec_dev);
> =20
> +/* sysfs stuff */
> +extern struct attribute_group cros_ec_attr_group;
> +extern struct attribute_group cros_ec_lightbar_attr_group;
> +
>  #endif /* __LINUX_MFD_CROS_EC_H */

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
