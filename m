From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7 1/8] mfd: cros_ec: Use a zero-length array for command
 data
Date: Mon, 15 Jun 2015 13:22:45 +0100
Message-ID: <20150615122245.GA3266@x1>
References: <1433847889-7220-1-git-send-email-javier.martinez@collabora.co.uk>
 <1433847889-7220-2-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1433847889-7220-2-git-send-email-javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Bill Richardson <wfrichar-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Simon Glass <sjg-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Gwendal Grignou <gwendal-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Stephen Barber <smbarber-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Filipe Brandenburger <filbranden-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Todd Broch <tbroch-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Alexandru M Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 09 Jun 2015, Javier Martinez Canillas wrote:

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
> Suggested-by: Gwendal Grignou <gwendal-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8rSCDK34cm6iQ@public.gmane.org=
=2Euk>
> Tested-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Acked-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>

Applied, thanks.

> ---
>=20
> Changes since v6:
>  - Add Olof Johansson Acked-by tag.
>=20
> Changes since v5: None
>=20
> Changes since v4: None
>=20
> Changes since v3:
>  - Added acked-by tag from Lee Jones.
>=20
> Changes since v2:
>  - Set the version field in the cros_ec_command. Reported by Heiko St=
uebner.
>  - Use kmalloc/kfree instead of pre-allocating using variables in the=
 stack.
>    Suggested by Lee Jones.
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
>  drivers/i2c/busses/i2c-cros-ec-tunnel.c    |  45 ++++++---
>  drivers/input/keyboard/cros_ec_keyb.c      |  29 ++++--
>  drivers/mfd/cros_ec.c                      |  28 ++++--
>  drivers/mfd/cros_ec_i2c.c                  |   4 +-
>  drivers/mfd/cros_ec_spi.c                  |   2 +-
>  drivers/platform/chrome/cros_ec_dev.c      |  65 +++++++-----
>  drivers/platform/chrome/cros_ec_lightbar.c | 152 +++++++++++++++++++=
---------
>  drivers/platform/chrome/cros_ec_lpc.c      |   8 +-
>  drivers/platform/chrome/cros_ec_sysfs.c    | 154 ++++++++++++++++++-=
----------
>  include/linux/mfd/cros_ec.h                |   6 +-
>  10 files changed, 318 insertions(+), 175 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-cros-ec-tunnel.c b/drivers/i2c/bu=
sses/i2c-cros-ec-tunnel.c
> index fa8dedd8c3a2..a0d95ff682ae 100644
> --- a/drivers/i2c/busses/i2c-cros-ec-tunnel.c
> +++ b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
> @@ -182,8 +182,9 @@ static int ec_i2c_xfer(struct i2c_adapter *adap, =
struct i2c_msg i2c_msgs[],
>  	const u16 bus_num =3D bus->remote_bus;
>  	int request_len;
>  	int response_len;
> +	int alloc_size;
>  	int result;
> -	struct cros_ec_command msg =3D { };
> +	struct cros_ec_command *msg;
> =20
>  	request_len =3D ec_i2c_count_message(i2c_msgs, num);
>  	if (request_len < 0) {
> @@ -198,25 +199,39 @@ static int ec_i2c_xfer(struct i2c_adapter *adap=
, struct i2c_msg i2c_msgs[],
>  		return response_len;
>  	}
> =20
> -	result =3D ec_i2c_construct_message(msg.outdata, i2c_msgs, num, bus=
_num);
> -	if (result)
> -		return result;
> +	alloc_size =3D max(request_len, response_len);
> +	msg =3D kmalloc(sizeof(*msg) + alloc_size, GFP_KERNEL);
> +	if (!msg)
> +		return -ENOMEM;
> =20
> -	msg.version =3D 0;
> -	msg.command =3D EC_CMD_I2C_PASSTHRU;
> -	msg.outsize =3D request_len;
> -	msg.insize =3D response_len;
> +	result =3D ec_i2c_construct_message(msg->data, i2c_msgs, num, bus_n=
um);
> +	if (result) {
> +		dev_err(dev, "Error constructing EC i2c message %d\n", result);
> +		goto exit;
> +	}
> =20
> -	result =3D cros_ec_cmd_xfer(bus->ec, &msg);
> -	if (result < 0)
> -		return result;
> +	msg->version =3D 0;
> +	msg->command =3D EC_CMD_I2C_PASSTHRU;
> +	msg->outsize =3D request_len;
> +	msg->insize =3D response_len;
> =20
> -	result =3D ec_i2c_parse_response(msg.indata, i2c_msgs, &num);
> -	if (result < 0)
> -		return result;
> +	result =3D cros_ec_cmd_xfer(bus->ec, msg);
> +	if (result < 0) {
> +		dev_err(dev, "Error transferring EC i2c message %d\n", result);
> +		goto exit;
> +	}
> +
> +	result =3D ec_i2c_parse_response(msg->data, i2c_msgs, &num);
> +	if (result < 0) {
> +		dev_err(dev, "Error parsing EC i2c message %d\n", result);
> +		goto exit;
> +	}
> =20
>  	/* Indicate success by saying how many messages were sent */
> -	return num;
> +	result =3D num;
> +exit:
> +	kfree(msg);
> +	return result;
>  }
> =20
>  static u32 ec_i2c_functionality(struct i2c_adapter *adap)
> diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/ke=
yboard/cros_ec_keyb.c
> index b50c5b8b8a4d..974154a74505 100644
> --- a/drivers/input/keyboard/cros_ec_keyb.c
> +++ b/drivers/input/keyboard/cros_ec_keyb.c
> @@ -148,19 +148,28 @@ static void cros_ec_keyb_process(struct cros_ec=
_keyb *ckdev,
> =20
>  static int cros_ec_keyb_get_state(struct cros_ec_keyb *ckdev, uint8_=
t *kb_state)
>  {
> -	int ret;
> -	struct cros_ec_command msg =3D {
> -		.command =3D EC_CMD_MKBP_STATE,
> -		.insize =3D ckdev->cols,
> -	};
> +	int ret =3D 0;
> +	struct cros_ec_command *msg;
> =20
> -	ret =3D cros_ec_cmd_xfer(ckdev->ec, &msg);
> -	if (ret < 0)
> -		return ret;
> +	msg =3D kmalloc(sizeof(*msg) + ckdev->cols, GFP_KERNEL);
> +	if (!msg)
> +		return -ENOMEM;
> =20
> -	memcpy(kb_state, msg.indata, ckdev->cols);
> +	msg->version =3D 0;
> +	msg->command =3D EC_CMD_MKBP_STATE;
> +	msg->insize =3D ckdev->cols;
> +	msg->outsize =3D 0;
> =20
> -	return 0;
> +	ret =3D cros_ec_cmd_xfer(ckdev->ec, msg);
> +	if (ret < 0) {
> +		dev_err(ckdev->dev, "Error transferring EC message %d\n", ret);
> +		goto exit;
> +	}
> +
> +	memcpy(kb_state, msg->data, ckdev->cols);
> +exit:
> +	kfree(msg);
> +	return ret;
>  }
> =20
>  static irqreturn_t cros_ec_keyb_irq(int irq, void *data)
> diff --git a/drivers/mfd/cros_ec.c b/drivers/mfd/cros_ec.c
> index 1574a9352a6d..4a0f6dfcd376 100644
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
> @@ -75,11 +75,20 @@ int cros_ec_cmd_xfer(struct cros_ec_device *ec_de=
v,
>  	ret =3D ec_dev->cmd_xfer(ec_dev, msg);
>  	if (msg->result =3D=3D EC_RES_IN_PROGRESS) {
>  		int i;
> -		struct cros_ec_command status_msg =3D { };
> +		struct cros_ec_command *status_msg;
>  		struct ec_response_get_comms_status *status;
> =20
> -		status_msg.command =3D EC_CMD_GET_COMMS_STATUS;
> -		status_msg.insize =3D sizeof(*status);
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
> =20
>  		/*
>  		 * Query the EC's status until it's no longer busy or
> @@ -88,20 +97,23 @@ int cros_ec_cmd_xfer(struct cros_ec_device *ec_de=
v,
>  		for (i =3D 0; i < EC_COMMAND_RETRIES; i++) {
>  			usleep_range(10000, 11000);
> =20
> -			ret =3D ec_dev->cmd_xfer(ec_dev, &status_msg);
> +			ret =3D ec_dev->cmd_xfer(ec_dev, status_msg);
>  			if (ret < 0)
>  				break;
> =20
> -			msg->result =3D status_msg.result;
> -			if (status_msg.result !=3D EC_RES_SUCCESS)
> +			msg->result =3D status_msg->result;
> +			if (status_msg->result !=3D EC_RES_SUCCESS)
>  				break;
> =20
>  			status =3D (struct ec_response_get_comms_status *)
> -				 status_msg.indata;
> +				 status_msg->data;
>  			if (!(status->flags & EC_COMMS_STATUS_PROCESSING))
>  				break;
>  		}
> +
> +		kfree(status_msg);
>  	}
> +exit:
>  	mutex_unlock(&ec_dev->lock);
> =20
>  	return ret;
> diff --git a/drivers/mfd/cros_ec_i2c.c b/drivers/mfd/cros_ec_i2c.c
> index 82b4d6148698..fbf7819f5de5 100644
> --- a/drivers/mfd/cros_ec_i2c.c
> +++ b/drivers/mfd/cros_ec_i2c.c
> @@ -76,7 +76,7 @@ static int cros_ec_cmd_xfer_i2c(struct cros_ec_devi=
ce *ec_dev,
>  	/* copy message payload and compute checksum */
>  	sum =3D out_buf[0] + out_buf[1] + out_buf[2];
>  	for (i =3D 0; i < msg->outsize; i++) {
> -		out_buf[3 + i] =3D msg->outdata[i];
> +		out_buf[3 + i] =3D msg->data[i];
>  		sum +=3D out_buf[3 + i];
>  	}
>  	out_buf[3 + msg->outsize] =3D sum;
> @@ -109,7 +109,7 @@ static int cros_ec_cmd_xfer_i2c(struct cros_ec_de=
vice *ec_dev,
>  	/* copy response packet payload and compute checksum */
>  	sum =3D in_buf[0] + in_buf[1];
>  	for (i =3D 0; i < len; i++) {
> -		msg->indata[i] =3D in_buf[2 + i];
> +		msg->data[i] =3D in_buf[2 + i];
>  		sum +=3D in_buf[2 + i];
>  	}
>  	dev_dbg(ec_dev->dev, "packet: %*ph, sum =3D %02x\n",
> diff --git a/drivers/mfd/cros_ec_spi.c b/drivers/mfd/cros_ec_spi.c
> index 27bd52e5e8b7..573730fec947 100644
> --- a/drivers/mfd/cros_ec_spi.c
> +++ b/drivers/mfd/cros_ec_spi.c
> @@ -299,7 +299,7 @@ static int cros_ec_cmd_xfer_spi(struct cros_ec_de=
vice *ec_dev,
>  	for (i =3D 0; i < len; i++) {
>  		sum +=3D ptr[i + 2];
>  		if (ec_msg->insize)
> -			ec_msg->indata[i] =3D ptr[i + 2];
> +			ec_msg->data[i] =3D ptr[i + 2];
>  	}
>  	sum &=3D 0xff;
> =20
> diff --git a/drivers/platform/chrome/cros_ec_dev.c b/drivers/platform=
/chrome/cros_ec_dev.c
> index 4232c8136939..14111e32658b 100644
> --- a/drivers/platform/chrome/cros_ec_dev.c
> +++ b/drivers/platform/chrome/cros_ec_dev.c
> @@ -20,6 +20,7 @@
>  #include <linux/fs.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/slab.h>
>  #include <linux/uaccess.h>
> =20
>  #include "cros_ec_dev.h"
> @@ -36,28 +37,31 @@ static int ec_get_version(struct cros_ec_device *=
ec, char *str, int maxlen)
>  	static const char * const current_image_name[] =3D {
>  		"unknown", "read-only", "read-write", "invalid",
>  	};
> -	struct cros_ec_command msg =3D {
> -		.version =3D 0,
> -		.command =3D EC_CMD_GET_VERSION,
> -		.outdata =3D { 0 },
> -		.outsize =3D 0,
> -		.indata =3D { 0 },
> -		.insize =3D sizeof(*resp),
> -	};
> +	struct cros_ec_command *msg;
>  	int ret;
> =20
> -	ret =3D cros_ec_cmd_xfer(ec, &msg);
> +	msg =3D kmalloc(sizeof(*msg) + sizeof(*resp), GFP_KERNEL);
> +	if (!msg)
> +		return -ENOMEM;
> +
> +	msg->version =3D 0;
> +	msg->command =3D EC_CMD_GET_VERSION;
> +	msg->insize =3D sizeof(*resp);
> +	msg->outsize =3D 0;
> +
> +	ret =3D cros_ec_cmd_xfer(ec, msg);
>  	if (ret < 0)
> -		return ret;
> +		goto exit;
> =20
> -	if (msg.result !=3D EC_RES_SUCCESS) {
> +	if (msg->result !=3D EC_RES_SUCCESS) {
>  		snprintf(str, maxlen,
>  			 "%s\nUnknown EC version: EC returned %d\n",
> -			 CROS_EC_DEV_VERSION, msg.result);
> -		return 0;
> +			 CROS_EC_DEV_VERSION, msg->result);
> +		ret =3D -EINVAL;
> +		goto exit;
>  	}
> =20
> -	resp =3D (struct ec_response_get_version *)msg.indata;
> +	resp =3D (struct ec_response_get_version *)msg->data;
>  	if (resp->current_image >=3D ARRAY_SIZE(current_image_name))
>  		resp->current_image =3D 3; /* invalid */
> =20
> @@ -65,7 +69,10 @@ static int ec_get_version(struct cros_ec_device *e=
c, char *str, int maxlen)
>  		 resp->version_string_ro, resp->version_string_rw,
>  		 current_image_name[resp->current_image]);
> =20
> -	return 0;
> +	ret =3D 0;
> +exit:
> +	kfree(msg);
> +	return ret;
>  }
> =20
>  /* Device file ops */
> @@ -110,20 +117,32 @@ static ssize_t ec_device_read(struct file *filp=
, char __user *buffer,
>  static long ec_device_ioctl_xcmd(struct cros_ec_device *ec, void __u=
ser *arg)
>  {
>  	long ret;
> -	struct cros_ec_command s_cmd =3D { };
> +	struct cros_ec_command u_cmd;
> +	struct cros_ec_command *s_cmd;
> =20
> -	if (copy_from_user(&s_cmd, arg, sizeof(s_cmd)))
> +	if (copy_from_user(&u_cmd, arg, sizeof(u_cmd)))
>  		return -EFAULT;
> =20
> -	ret =3D cros_ec_cmd_xfer(ec, &s_cmd);
> +	s_cmd =3D kmalloc(sizeof(*s_cmd) + max(u_cmd.outsize, u_cmd.insize)=
,
> +			GFP_KERNEL);
> +	if (!s_cmd)
> +		return -ENOMEM;
> +
> +	if (copy_from_user(s_cmd, arg, sizeof(*s_cmd) + u_cmd.outsize)) {
> +		ret =3D -EFAULT;
> +		goto exit;
> +	}
> +
> +	ret =3D cros_ec_cmd_xfer(ec, s_cmd);
>  	/* Only copy data to userland if data was received. */
>  	if (ret < 0)
> -		return ret;
> +		goto exit;
> =20
> -	if (copy_to_user(arg, &s_cmd, sizeof(s_cmd)))
> -		return -EFAULT;
> -
> -	return 0;
> +	if (copy_to_user(arg, s_cmd, sizeof(*s_cmd) + u_cmd.insize))
> +		ret =3D -EFAULT;
> +exit:
> +	kfree(s_cmd);
> +	return ret;
>  }
> =20
>  static long ec_device_ioctl_readmem(struct cros_ec_device *ec, void =
__user *arg)
> diff --git a/drivers/platform/chrome/cros_ec_lightbar.c b/drivers/pla=
tform/chrome/cros_ec_lightbar.c
> index b4ff47a9069a..560e5d41b7ae 100644
> --- a/drivers/platform/chrome/cros_ec_lightbar.c
> +++ b/drivers/platform/chrome/cros_ec_lightbar.c
> @@ -31,6 +31,7 @@
>  #include <linux/sched.h>
>  #include <linux/types.h>
>  #include <linux/uaccess.h>
> +#include <linux/slab.h>
> =20
>  #include "cros_ec_dev.h"
> =20
> @@ -91,54 +92,79 @@ out:
>  	return ret;
>  }
> =20
> -#define INIT_MSG(P, R) { \
> -		.command =3D EC_CMD_LIGHTBAR_CMD, \
> -		.outsize =3D sizeof(*P), \
> -		.insize =3D sizeof(*R), \
> -	}
> +static struct cros_ec_command *alloc_lightbar_cmd_msg(void)
> +{
> +	struct cros_ec_command *msg;
> +	int len;
> +
> +	len =3D max(sizeof(struct ec_params_lightbar),
> +		  sizeof(struct ec_response_lightbar));
> +
> +	msg =3D kmalloc(sizeof(*msg) + len, GFP_KERNEL);
> +	if (!msg)
> +		return NULL;
> +
> +	msg->version =3D 0;
> +	msg->command =3D EC_CMD_LIGHTBAR_CMD;
> +	msg->outsize =3D sizeof(struct ec_params_lightbar);
> +	msg->insize =3D sizeof(struct ec_response_lightbar);
> +
> +	return msg;
> +}
> =20
>  static int get_lightbar_version(struct cros_ec_device *ec,
>  				uint32_t *ver_ptr, uint32_t *flg_ptr)
>  {
>  	struct ec_params_lightbar *param;
>  	struct ec_response_lightbar *resp;
> -	struct cros_ec_command msg =3D INIT_MSG(param, resp);
> +	struct cros_ec_command *msg;
>  	int ret;
> =20
> -	param =3D (struct ec_params_lightbar *)msg.outdata;
> -	param->cmd =3D LIGHTBAR_CMD_VERSION;
> -	ret =3D cros_ec_cmd_xfer(ec, &msg);
> -	if (ret < 0)
> +	msg =3D alloc_lightbar_cmd_msg();
> +	if (!msg)
>  		return 0;
> =20
> -	switch (msg.result) {
> +	param =3D (struct ec_params_lightbar *)msg->data;
> +	param->cmd =3D LIGHTBAR_CMD_VERSION;
> +	ret =3D cros_ec_cmd_xfer(ec, msg);
> +	if (ret < 0) {
> +		ret =3D 0;
> +		goto exit;
> +	}
> +
> +	switch (msg->result) {
>  	case EC_RES_INVALID_PARAM:
>  		/* Pixel had no version command. */
>  		if (ver_ptr)
>  			*ver_ptr =3D 0;
>  		if (flg_ptr)
>  			*flg_ptr =3D 0;
> -		return 1;
> +		ret =3D 1;
> +		goto exit;
> =20
>  	case EC_RES_SUCCESS:
> -		resp =3D (struct ec_response_lightbar *)msg.indata;
> +		resp =3D (struct ec_response_lightbar *)msg->data;
> =20
>  		/* Future devices w/lightbars should implement this command */
>  		if (ver_ptr)
>  			*ver_ptr =3D resp->version.num;
>  		if (flg_ptr)
>  			*flg_ptr =3D resp->version.flags;
> -		return 1;
> +		ret =3D 1;
> +		goto exit;
>  	}
> =20
>  	/* Anything else (ie, EC_RES_INVALID_COMMAND) - no lightbar */
> -	return 0;
> +	ret =3D 0;
> +exit:
> +	kfree(msg);
> +	return ret;
>  }
> =20
>  static ssize_t version_show(struct device *dev,
>  			    struct device_attribute *attr, char *buf)
>  {
> -	uint32_t version, flags;
> +	uint32_t version =3D 0, flags =3D 0;
>  	struct cros_ec_device *ec =3D dev_get_drvdata(dev);
>  	int ret;
> =20
> @@ -158,8 +184,7 @@ static ssize_t brightness_store(struct device *de=
v,
>  				const char *buf, size_t count)
>  {
>  	struct ec_params_lightbar *param;
> -	struct ec_response_lightbar *resp;
> -	struct cros_ec_command msg =3D INIT_MSG(param, resp);
> +	struct cros_ec_command *msg;
>  	int ret;
>  	unsigned int val;
>  	struct cros_ec_device *ec =3D dev_get_drvdata(dev);
> @@ -167,21 +192,30 @@ static ssize_t brightness_store(struct device *=
dev,
>  	if (kstrtouint(buf, 0, &val))
>  		return -EINVAL;
> =20
> -	param =3D (struct ec_params_lightbar *)msg.outdata;
> +	msg =3D alloc_lightbar_cmd_msg();
> +	if (!msg)
> +		return -ENOMEM;
> +
> +	param =3D (struct ec_params_lightbar *)msg->data;
>  	param->cmd =3D LIGHTBAR_CMD_BRIGHTNESS;
>  	param->brightness.num =3D val;
>  	ret =3D lb_throttle();
>  	if (ret)
> -		return ret;
> +		goto exit;
> =20
> -	ret =3D cros_ec_cmd_xfer(ec, &msg);
> +	ret =3D cros_ec_cmd_xfer(ec, msg);
>  	if (ret < 0)
> -		return ret;
> +		goto exit;
> =20
> -	if (msg.result !=3D EC_RES_SUCCESS)
> -		return -EINVAL;
> +	if (msg->result !=3D EC_RES_SUCCESS) {
> +		ret =3D -EINVAL;
> +		goto exit;
> +	}
> =20
> -	return count;
> +	ret =3D count;
> +exit:
> +	kfree(msg);
> +	return ret;
>  }
> =20
> =20
> @@ -196,12 +230,15 @@ static ssize_t led_rgb_store(struct device *dev=
, struct device_attribute *attr,
>  			     const char *buf, size_t count)
>  {
>  	struct ec_params_lightbar *param;
> -	struct ec_response_lightbar *resp;
> -	struct cros_ec_command msg =3D INIT_MSG(param, resp);
> +	struct cros_ec_command *msg;
>  	struct cros_ec_device *ec =3D dev_get_drvdata(dev);
>  	unsigned int val[4];
>  	int ret, i =3D 0, j =3D 0, ok =3D 0;
> =20
> +	msg =3D alloc_lightbar_cmd_msg();
> +	if (!msg)
> +		return -ENOMEM;
> +
>  	do {
>  		/* Skip any whitespace */
>  		while (*buf && isspace(*buf))
> @@ -215,7 +252,7 @@ static ssize_t led_rgb_store(struct device *dev, =
struct device_attribute *attr,
>  			return -EINVAL;
> =20
>  		if (i =3D=3D 4) {
> -			param =3D (struct ec_params_lightbar *)msg.outdata;
> +			param =3D (struct ec_params_lightbar *)msg->data;
>  			param->cmd =3D LIGHTBAR_CMD_RGB;
>  			param->rgb.led =3D val[0];
>  			param->rgb.red =3D val[1];
> @@ -231,12 +268,14 @@ static ssize_t led_rgb_store(struct device *dev=
, struct device_attribute *attr,
>  					return ret;
>  			}
> =20
> -			ret =3D cros_ec_cmd_xfer(ec, &msg);
> +			ret =3D cros_ec_cmd_xfer(ec, msg);
>  			if (ret < 0)
> -				return ret;
> +				goto exit;
> =20
> -			if (msg.result !=3D EC_RES_SUCCESS)
> -				return -EINVAL;
> +			if (msg->result !=3D EC_RES_SUCCESS) {
> +				ret =3D -EINVAL;
> +				goto exit;
> +			}
> =20
>  			i =3D 0;
>  			ok =3D 1;
> @@ -248,6 +287,8 @@ static ssize_t led_rgb_store(struct device *dev, =
struct device_attribute *attr,
> =20
>  	} while (*buf);
> =20
> +exit:
> +	kfree(msg);
>  	return (ok && i =3D=3D 0) ? count : -EINVAL;
>  }
> =20
> @@ -261,42 +302,55 @@ static ssize_t sequence_show(struct device *dev=
,
>  {
>  	struct ec_params_lightbar *param;
>  	struct ec_response_lightbar *resp;
> -	struct cros_ec_command msg =3D INIT_MSG(param, resp);
> +	struct cros_ec_command *msg;
>  	int ret;
>  	struct cros_ec_device *ec =3D dev_get_drvdata(dev);
> =20
> -	param =3D (struct ec_params_lightbar *)msg.outdata;
> +	msg =3D alloc_lightbar_cmd_msg();
> +	if (!msg)
> +		return -ENOMEM;
> +
> +	param =3D (struct ec_params_lightbar *)msg->data;
>  	param->cmd =3D LIGHTBAR_CMD_GET_SEQ;
>  	ret =3D lb_throttle();
>  	if (ret)
> -		return ret;
> +		goto exit;
> =20
> -	ret =3D cros_ec_cmd_xfer(ec, &msg);
> +	ret =3D cros_ec_cmd_xfer(ec, msg);
>  	if (ret < 0)
> -		return ret;
> +		goto exit;
> =20
> -	if (msg.result !=3D EC_RES_SUCCESS)
> -		return scnprintf(buf, PAGE_SIZE,
> -				 "ERROR: EC returned %d\n", msg.result);
> +	if (msg->result !=3D EC_RES_SUCCESS) {
> +		ret =3D scnprintf(buf, PAGE_SIZE,
> +				"ERROR: EC returned %d\n", msg->result);
> +		goto exit;
> +	}
> =20
> -	resp =3D (struct ec_response_lightbar *)msg.indata;
> +	resp =3D (struct ec_response_lightbar *)msg->data;
>  	if (resp->get_seq.num >=3D ARRAY_SIZE(seqname))
> -		return scnprintf(buf, PAGE_SIZE, "%d\n", resp->get_seq.num);
> +		ret =3D scnprintf(buf, PAGE_SIZE, "%d\n", resp->get_seq.num);
>  	else
> -		return scnprintf(buf, PAGE_SIZE, "%s\n",
> -				 seqname[resp->get_seq.num]);
> +		ret =3D scnprintf(buf, PAGE_SIZE, "%s\n",
> +				seqname[resp->get_seq.num]);
> +
> +exit:
> +	kfree(msg);
> +	return ret;
>  }
> =20
>  static ssize_t sequence_store(struct device *dev, struct device_attr=
ibute *attr,
>  			      const char *buf, size_t count)
>  {
>  	struct ec_params_lightbar *param;
> -	struct ec_response_lightbar *resp;
> -	struct cros_ec_command msg =3D INIT_MSG(param, resp);
> +	struct cros_ec_command *msg;
>  	unsigned int num;
>  	int ret, len;
>  	struct cros_ec_device *ec =3D dev_get_drvdata(dev);
> =20
> +	msg =3D alloc_lightbar_cmd_msg();
> +	if (!msg)
> +		return -ENOMEM;
> +
>  	for (len =3D 0; len < count; len++)
>  		if (!isalnum(buf[len]))
>  			break;
> @@ -311,18 +365,18 @@ static ssize_t sequence_store(struct device *de=
v, struct device_attribute *attr,
>  			return ret;
>  	}
> =20
> -	param =3D (struct ec_params_lightbar *)msg.outdata;
> +	param =3D (struct ec_params_lightbar *)msg->data;
>  	param->cmd =3D LIGHTBAR_CMD_SEQ;
>  	param->seq.num =3D num;
>  	ret =3D lb_throttle();
>  	if (ret)
>  		return ret;
> =20
> -	ret =3D cros_ec_cmd_xfer(ec, &msg);
> +	ret =3D cros_ec_cmd_xfer(ec, msg);
>  	if (ret < 0)
>  		return ret;
> =20
> -	if (msg.result !=3D EC_RES_SUCCESS)
> +	if (msg->result !=3D EC_RES_SUCCESS)
>  		return -EINVAL;
> =20
>  	return count;
> diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform=
/chrome/cros_ec_lpc.c
> index ea75af35c995..214ae7fef984 100644
> --- a/drivers/platform/chrome/cros_ec_lpc.c
> +++ b/drivers/platform/chrome/cros_ec_lpc.c
> @@ -73,8 +73,8 @@ static int cros_ec_cmd_xfer_lpc(struct cros_ec_devi=
ce *ec,
> =20
>  	/* Copy data and update checksum */
>  	for (i =3D 0; i < msg->outsize; i++) {
> -		outb(msg->outdata[i], EC_LPC_ADDR_HOST_PARAM + i);
> -		csum +=3D msg->outdata[i];
> +		outb(msg->data[i], EC_LPC_ADDR_HOST_PARAM + i);
> +		csum +=3D msg->data[i];
>  	}
> =20
>  	/* Finalize checksum and write args */
> @@ -119,8 +119,8 @@ static int cros_ec_cmd_xfer_lpc(struct cros_ec_de=
vice *ec,
> =20
>  	/* Read response and update checksum */
>  	for (i =3D 0; i < args.data_size; i++) {
> -		msg->indata[i] =3D inb(EC_LPC_ADDR_HOST_PARAM + i);
> -		csum +=3D msg->indata[i];
> +		msg->data[i] =3D inb(EC_LPC_ADDR_HOST_PARAM + i);
> +		csum +=3D msg->data[i];
>  	}
> =20
>  	/* Verify checksum */
> diff --git a/drivers/platform/chrome/cros_ec_sysfs.c b/drivers/platfo=
rm/chrome/cros_ec_sysfs.c
> index fb62ab6cc659..78ba82d670cb 100644
> --- a/drivers/platform/chrome/cros_ec_sysfs.c
> +++ b/drivers/platform/chrome/cros_ec_sysfs.c
> @@ -29,6 +29,7 @@
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/printk.h>
> +#include <linux/slab.h>
>  #include <linux/stat.h>
>  #include <linux/types.h>
>  #include <linux/uaccess.h>
> @@ -66,14 +67,19 @@ static ssize_t store_ec_reboot(struct device *dev=
,
>  		{"hibernate",    EC_REBOOT_HIBERNATE, 0},
>  		{"at-shutdown",  -1, EC_REBOOT_FLAG_ON_AP_SHUTDOWN},
>  	};
> -	struct cros_ec_command msg =3D { 0 };
> -	struct ec_params_reboot_ec *param =3D
> -		(struct ec_params_reboot_ec *)msg.outdata;
> +	struct cros_ec_command *msg;
> +	struct ec_params_reboot_ec *param;
>  	int got_cmd =3D 0, offset =3D 0;
>  	int i;
>  	int ret;
>  	struct cros_ec_device *ec =3D dev_get_drvdata(dev);
> =20
> +	msg =3D kmalloc(sizeof(*msg) + sizeof(*param), GFP_KERNEL);
> +	if (!msg)
> +		return -ENOMEM;
> +
> +	param =3D (struct ec_params_reboot_ec *)msg->data;
> +
>  	param->flags =3D 0;
>  	while (1) {
>  		/* Find word to start scanning */
> @@ -100,19 +106,26 @@ static ssize_t store_ec_reboot(struct device *d=
ev,
>  			offset++;
>  	}
> =20
> -	if (!got_cmd)
> -		return -EINVAL;
> -
> -	msg.command =3D EC_CMD_REBOOT_EC;
> -	msg.outsize =3D sizeof(param);
> -	ret =3D cros_ec_cmd_xfer(ec, &msg);
> -	if (ret < 0)
> -		return ret;
> -	if (msg.result !=3D EC_RES_SUCCESS) {
> -		dev_dbg(ec->dev, "EC result %d\n", msg.result);
> -		return -EINVAL;
> +	if (!got_cmd) {
> +		count =3D -EINVAL;
> +		goto exit;
>  	}
> =20
> +	msg->version =3D 0;
> +	msg->command =3D EC_CMD_REBOOT_EC;
> +	msg->outsize =3D sizeof(*param);
> +	msg->insize =3D 0;
> +	ret =3D cros_ec_cmd_xfer(ec, msg);
> +	if (ret < 0) {
> +		count =3D ret;
> +		goto exit;
> +	}
> +	if (msg->result !=3D EC_RES_SUCCESS) {
> +		dev_dbg(ec->dev, "EC result %d\n", msg->result);
> +		count =3D -EINVAL;
> +	}
> +exit:
> +	kfree(msg);
>  	return count;
>  }
> =20
> @@ -123,22 +136,32 @@ static ssize_t show_ec_version(struct device *d=
ev,
>  	struct ec_response_get_version *r_ver;
>  	struct ec_response_get_chip_info *r_chip;
>  	struct ec_response_board_version *r_board;
> -	struct cros_ec_command msg =3D { 0 };
> +	struct cros_ec_command *msg;
>  	int ret;
>  	int count =3D 0;
>  	struct cros_ec_device *ec =3D dev_get_drvdata(dev);
> =20
> +	msg =3D kmalloc(sizeof(*msg) + EC_HOST_PARAM_SIZE, GFP_KERNEL);
> +	if (!msg)
> +		return -ENOMEM;
> +
>  	/* Get versions. RW may change. */
> -	msg.command =3D EC_CMD_GET_VERSION;
> -	msg.insize =3D sizeof(*r_ver);
> -	ret =3D cros_ec_cmd_xfer(ec, &msg);
> -	if (ret < 0)
> -		return ret;
> -	if (msg.result !=3D EC_RES_SUCCESS)
> -		return scnprintf(buf, PAGE_SIZE,
> -				 "ERROR: EC returned %d\n", msg.result);
> +	msg->version =3D 0;
> +	msg->command =3D EC_CMD_GET_VERSION;
> +	msg->insize =3D sizeof(*r_ver);
> +	msg->outsize =3D 0;
> +	ret =3D cros_ec_cmd_xfer(ec, msg);
> +	if (ret < 0) {
> +		count =3D ret;
> +		goto exit;
> +	}
> +	if (msg->result !=3D EC_RES_SUCCESS) {
> +		count =3D scnprintf(buf, PAGE_SIZE,
> +				  "ERROR: EC returned %d\n", msg->result);
> +		goto exit;
> +	}
> =20
> -	r_ver =3D (struct ec_response_get_version *)msg.indata;
> +	r_ver =3D (struct ec_response_get_version *)msg->data;
>  	/* Strings should be null-terminated, but let's be sure. */
>  	r_ver->version_string_ro[sizeof(r_ver->version_string_ro) - 1] =3D =
'\0';
>  	r_ver->version_string_rw[sizeof(r_ver->version_string_rw) - 1] =3D =
'\0';
> @@ -152,33 +175,33 @@ static ssize_t show_ec_version(struct device *d=
ev,
>  			    image_names[r_ver->current_image] : "?"));
> =20
>  	/* Get build info. */
> -	msg.command =3D EC_CMD_GET_BUILD_INFO;
> -	msg.insize =3D sizeof(msg.indata);
> -	ret =3D cros_ec_cmd_xfer(ec, &msg);
> +	msg->command =3D EC_CMD_GET_BUILD_INFO;
> +	msg->insize =3D EC_HOST_PARAM_SIZE;
> +	ret =3D cros_ec_cmd_xfer(ec, msg);
>  	if (ret < 0)
>  		count +=3D scnprintf(buf + count, PAGE_SIZE - count,
>  				   "Build info:    XFER ERROR %d\n", ret);
> -	else if (msg.result !=3D EC_RES_SUCCESS)
> +	else if (msg->result !=3D EC_RES_SUCCESS)
>  		count +=3D scnprintf(buf + count, PAGE_SIZE - count,
> -				   "Build info:    EC error %d\n", msg.result);
> +				   "Build info:    EC error %d\n", msg->result);
>  	else {
> -		msg.indata[sizeof(msg.indata) - 1] =3D '\0';
> +		msg->data[sizeof(msg->data) - 1] =3D '\0';
>  		count +=3D scnprintf(buf + count, PAGE_SIZE - count,
> -				   "Build info:    %s\n", msg.indata);
> +				   "Build info:    %s\n", msg->data);
>  	}
> =20
>  	/* Get chip info. */
> -	msg.command =3D EC_CMD_GET_CHIP_INFO;
> -	msg.insize =3D sizeof(*r_chip);
> -	ret =3D cros_ec_cmd_xfer(ec, &msg);
> +	msg->command =3D EC_CMD_GET_CHIP_INFO;
> +	msg->insize =3D sizeof(*r_chip);
> +	ret =3D cros_ec_cmd_xfer(ec, msg);
>  	if (ret < 0)
>  		count +=3D scnprintf(buf + count, PAGE_SIZE - count,
>  				   "Chip info:     XFER ERROR %d\n", ret);
> -	else if (msg.result !=3D EC_RES_SUCCESS)
> +	else if (msg->result !=3D EC_RES_SUCCESS)
>  		count +=3D scnprintf(buf + count, PAGE_SIZE - count,
> -				   "Chip info:     EC error %d\n", msg.result);
> +				   "Chip info:     EC error %d\n", msg->result);
>  	else {
> -		r_chip =3D (struct ec_response_get_chip_info *)msg.indata;
> +		r_chip =3D (struct ec_response_get_chip_info *)msg->data;
> =20
>  		r_chip->vendor[sizeof(r_chip->vendor) - 1] =3D '\0';
>  		r_chip->name[sizeof(r_chip->name) - 1] =3D '\0';
> @@ -192,23 +215,25 @@ static ssize_t show_ec_version(struct device *d=
ev,
>  	}
> =20
>  	/* Get board version */
> -	msg.command =3D EC_CMD_GET_BOARD_VERSION;
> -	msg.insize =3D sizeof(*r_board);
> -	ret =3D cros_ec_cmd_xfer(ec, &msg);
> +	msg->command =3D EC_CMD_GET_BOARD_VERSION;
> +	msg->insize =3D sizeof(*r_board);
> +	ret =3D cros_ec_cmd_xfer(ec, msg);
>  	if (ret < 0)
>  		count +=3D scnprintf(buf + count, PAGE_SIZE - count,
>  				   "Board version: XFER ERROR %d\n", ret);
> -	else if (msg.result !=3D EC_RES_SUCCESS)
> +	else if (msg->result !=3D EC_RES_SUCCESS)
>  		count +=3D scnprintf(buf + count, PAGE_SIZE - count,
> -				   "Board version: EC error %d\n", msg.result);
> +				   "Board version: EC error %d\n", msg->result);
>  	else {
> -		r_board =3D (struct ec_response_board_version *)msg.indata;
> +		r_board =3D (struct ec_response_board_version *)msg->data;
> =20
>  		count +=3D scnprintf(buf + count, PAGE_SIZE - count,
>  				   "Board version: %d\n",
>  				   r_board->board_version);
>  	}
> =20
> +exit:
> +	kfree(msg);
>  	return count;
>  }
> =20
> @@ -216,27 +241,38 @@ static ssize_t show_ec_flashinfo(struct device =
*dev,
>  				 struct device_attribute *attr, char *buf)
>  {
>  	struct ec_response_flash_info *resp;
> -	struct cros_ec_command msg =3D { 0 };
> +	struct cros_ec_command *msg;
>  	int ret;
>  	struct cros_ec_device *ec =3D dev_get_drvdata(dev);
> =20
> +	msg =3D kmalloc(sizeof(*msg) + sizeof(*resp), GFP_KERNEL);
> +	if (!msg)
> +		return -ENOMEM;
> +
>  	/* The flash info shouldn't ever change, but ask each time anyway. =
*/
> -	msg.command =3D EC_CMD_FLASH_INFO;
> -	msg.insize =3D sizeof(*resp);
> -	ret =3D cros_ec_cmd_xfer(ec, &msg);
> +	msg->version =3D 0;
> +	msg->command =3D EC_CMD_FLASH_INFO;
> +	msg->insize =3D sizeof(*resp);
> +	msg->outsize =3D 0;
> +	ret =3D cros_ec_cmd_xfer(ec, msg);
>  	if (ret < 0)
> -		return ret;
> -	if (msg.result !=3D EC_RES_SUCCESS)
> -		return scnprintf(buf, PAGE_SIZE,
> -				 "ERROR: EC returned %d\n", msg.result);
> -
> -	resp =3D (struct ec_response_flash_info *)msg.indata;
> -
> -	return scnprintf(buf, PAGE_SIZE,
> -			 "FlashSize %d\nWriteSize %d\n"
> -			 "EraseSize %d\nProtectSize %d\n",
> -			 resp->flash_size, resp->write_block_size,
> -			 resp->erase_block_size, resp->protect_block_size);
> +		goto exit;
> +	if (msg->result !=3D EC_RES_SUCCESS) {
> +		ret =3D scnprintf(buf, PAGE_SIZE,
> +				"ERROR: EC returned %d\n", msg->result);
> +		goto exit;
> +	}
> +
> +	resp =3D (struct ec_response_flash_info *)msg->data;
> +
> +	ret =3D scnprintf(buf, PAGE_SIZE,
> +			"FlashSize %d\nWriteSize %d\n"
> +			"EraseSize %d\nProtectSize %d\n",
> +			resp->flash_size, resp->write_block_size,
> +			resp->erase_block_size, resp->protect_block_size);
> +exit:
> +	kfree(msg);
> +	return ret;
>  }
> =20
>  /* Module initialization */
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
>  };
> =20
>  /**

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
