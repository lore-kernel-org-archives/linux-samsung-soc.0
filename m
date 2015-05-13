From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 06/10] mfd: cros_ec: add proto v3 skeleton
Date: Wed, 13 May 2015 13:05:10 +0100
Message-ID: <20150513120510.GK3394@x1>
References: <1431166241-15775-1-git-send-email-javier.martinez@collabora.co.uk>
 <1431166241-15775-7-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f175.google.com ([209.85.212.175]:34929 "EHLO
	mail-wi0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754313AbbEMMFP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 May 2015 08:05:15 -0400
Received: by widdi4 with SMTP id di4so195403644wid.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 May 2015 05:05:14 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1431166241-15775-7-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, Alexandru M Stan <amstan@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 09 May 2015, Javier Martinez Canillas wrote:

> From: Stephen Barber <smbarber@chromium.org>
>=20
> Add support in cros_ec.c to handle EC host command protocol v3.
> For v3+, probe for maximum shared protocol version and max
> request, response, and passthrough sizes. For now, this will
> always fall back to v2, since there is no bus-specific code
> for handling proto v3 packets.
>=20
> Signed-off-by: Stephen Barber <smbarber@chromium.org>
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co=
=2Euk>
> Reviewed-by: Gwendal Grignou <gwendal@chromium.org>
> Tested-by: Gwendal Grignou <gwendal@chromium.org>
> ---
>=20
> Changes since v1:
>  - Squash change https://chromium-review.googlesource.com/#/c/262870/=
 in
>    the patch. Suggested by Gwendal Grignou
>  - Add Reviewed-by and Tested-by tags from Gwendal Grignou
> ---
>  drivers/mfd/cros_ec.c                 | 354 ++++++++++++++++++++++++=
++++++----
>  drivers/mfd/cros_ec_i2c.c             |   4 +
>  drivers/mfd/cros_ec_spi.c             |   7 +-
>  drivers/platform/chrome/cros_ec_lpc.c |   4 +
>  include/linux/mfd/cros_ec.h           |  20 +-
>  5 files changed, 344 insertions(+), 45 deletions(-)

This patch nearly triples the size of the driver, which I'm less than
happy about.  This driver is starting to suffer from feature-creep
when comparing against the original implementation.  I'd like to extrac=
t
'protocol drivers' out if possible.  Would this be better suited in
drivers/platform?

> diff --git a/drivers/mfd/cros_ec.c b/drivers/mfd/cros_ec.c
> index ee8aa8142932..956a827de826 100644
> --- a/drivers/mfd/cros_ec.c
> +++ b/drivers/mfd/cros_ec.c
> @@ -28,11 +28,276 @@
> =20
>  #define EC_COMMAND_RETRIES	50
> =20
> +static int prepare_packet(struct cros_ec_device *ec_dev,
> +			  struct cros_ec_command *msg)
> +{
> +	struct ec_host_request *request;
> +	u8 *out;
> +	int i;
> +	u8 csum =3D 0;
> +
> +	BUG_ON(ec_dev->proto_version !=3D EC_HOST_REQUEST_VERSION);
> +	BUG_ON(msg->outsize + sizeof(*request) > ec_dev->dout_size);
> +
> +	out =3D ec_dev->dout;
> +	request =3D (struct ec_host_request *)out;
> +	request->struct_version =3D EC_HOST_REQUEST_VERSION;
> +	request->checksum =3D 0;
> +	request->command =3D msg->command;
> +	request->command_version =3D msg->version;
> +	request->reserved =3D 0;
> +	request->data_len =3D msg->outsize;
> +
> +	for (i =3D 0; i < sizeof(*request); i++)
> +		csum +=3D out[i];
> +
> +	/* Copy data and update checksum */
> +	memcpy(out + sizeof(*request), msg->data, msg->outsize);
> +	for (i =3D 0; i < msg->outsize; i++)
> +		csum +=3D msg->data[i];
> +
> +	request->checksum =3D -csum;
> +
> +	return sizeof(*request) + msg->outsize;
> +}
> +
> +static int send_command(struct cros_ec_device *ec_dev,
> +			struct cros_ec_command *msg)
> +{
> +	int ret;
> +
> +	if (ec_dev->proto_version > 2)
> +		ret =3D ec_dev->pkt_xfer(ec_dev, msg);
> +	else
> +		ret =3D ec_dev->cmd_xfer(ec_dev, msg);
> +
> +	if (msg->result =3D=3D EC_RES_IN_PROGRESS) {
> +		int i;
> +		struct cros_ec_command *status_msg;
> +		struct ec_response_get_comms_status *status;
> +		u8 buf[sizeof(*status_msg) + sizeof(*status)] =3D { };
> +
> +		status_msg =3D (struct cros_ec_command *)buf;
> +		status_msg->command =3D EC_CMD_GET_COMMS_STATUS;
> +		status_msg->insize =3D sizeof(*status);
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
> +	}
> +
> +	return ret;
> +}
> +
> +static int cros_ec_host_command_proto_probe(struct cros_ec_device *e=
c_dev,
> +					    int devidx,
> +					    struct cros_ec_command *msg)
> +{
> +	/*
> +	 * Try using v3+ to query for supported protocols. If this
> +	 * command fails, fall back to v2. Returns the highest protocol
> +	 * supported by the EC.
> +	 * Also sets the max request/response/passthru size.
> +	 */
> +	int ret;
> +
> +	if (!ec_dev->pkt_xfer)
> +		return -EPROTONOSUPPORT;
> +
> +	memset(msg, 0, sizeof(*msg));
> +	msg->command =3D EC_CMD_PASSTHRU_OFFSET(devidx) | EC_CMD_GET_PROTOC=
OL_INFO;
> +	msg->insize =3D sizeof(struct ec_response_get_protocol_info);
> +
> +	ret =3D send_command(ec_dev, msg);
> +
> +	if (ret < 0) {
> +		dev_dbg(ec_dev->dev,
> +			"failed to probe for EC[%d] protocol version: %d\n",
> +			devidx, ret);
> +		return ret;
> +	}
> +
> +	if (devidx > 0 && msg->result =3D=3D EC_RES_INVALID_COMMAND)
> +		return -ENODEV;
> +	else if (msg->result !=3D EC_RES_SUCCESS)
> +		return msg->result;
> +
> +	return 0;
> +}
> +
> +static int cros_ec_host_command_proto_probe_v2(struct cros_ec_device=
 *ec_dev)
> +{
> +	struct cros_ec_command *msg;
> +	struct ec_params_hello *hello_params;
> +	struct ec_response_hello *hello_response;
> +	int ret;
> +	int len =3D max(sizeof(*hello_params), sizeof(*hello_response));
> +
> +	msg =3D kzalloc(sizeof(*msg) + len, GFP_KERNEL);
> +	if (!msg)
> +		return -ENOMEM;
> +
> +	msg->command =3D EC_CMD_HELLO;
> +	hello_params =3D (struct ec_params_hello *)msg->data;
> +	msg->outsize =3D sizeof(*hello_params);
> +	hello_response =3D (struct ec_response_hello *)msg->data;
> +	msg->insize =3D sizeof(*hello_response);
> +
> +	hello_params->in_data =3D 0xa0b0c0d0;
> +
> +	ret =3D send_command(ec_dev, msg);
> +
> +	if (ret < 0) {
> +		dev_dbg(ec_dev->dev,
> +			"EC failed to respond to v2 hello: %d\n",
> +			ret);
> +		goto exit;
> +	} else if (msg->result !=3D EC_RES_SUCCESS) {
> +		dev_err(ec_dev->dev,
> +			"EC responded to v2 hello with error: %d\n",
> +			msg->result);
> +		ret =3D msg->result;
> +		goto exit;
> +	} else if (hello_response->out_data !=3D 0xa1b2c3d4) {
> +		dev_err(ec_dev->dev,
> +			"EC responded to v2 hello with bad result: %u\n",
> +			hello_response->out_data);
> +		ret =3D -EBADMSG;
> +		goto exit;
> +	}
> +
> +	ret =3D 0;
> +
> +exit:
> +	kfree(msg);
> +	return ret;
> +}
> +
> +static int cros_ec_probe_all(struct cros_ec_device *ec_dev)
> +{
> +	struct device *dev =3D ec_dev->dev;
> +	struct cros_ec_command *proto_msg;
> +	struct ec_response_get_protocol_info *proto_info;
> +	int ret;
> +
> +	proto_msg =3D kzalloc(sizeof(*proto_msg) + sizeof(*proto_info),
> +			    GFP_KERNEL);
> +	if (!proto_msg)
> +		return -ENOMEM;
> +
> +	/* First try sending with proto v3. */
> +	ec_dev->proto_version =3D 3;
> +	ret =3D cros_ec_host_command_proto_probe(ec_dev, 0, proto_msg);
> +
> +	if (ret =3D=3D 0) {
> +		proto_info =3D (struct ec_response_get_protocol_info *)
> +			proto_msg->data;
> +		ec_dev->max_request =3D proto_info->max_request_packet_size -
> +			sizeof(struct ec_host_request);
> +		ec_dev->max_response =3D proto_info->max_response_packet_size -
> +			sizeof(struct ec_host_response);
> +		ec_dev->proto_version =3D
> +			min(EC_HOST_REQUEST_VERSION,
> +					fls(proto_info->protocol_versions) - 1);
> +		dev_dbg(ec_dev->dev,
> +			"using proto v%u\n",
> +			ec_dev->proto_version);
> +
> +		ec_dev->din_size =3D ec_dev->max_response +
> +			sizeof(struct ec_host_response) +
> +			EC_MAX_RESPONSE_OVERHEAD;
> +		ec_dev->dout_size =3D ec_dev->max_request +
> +			sizeof(struct ec_host_request) +
> +			EC_MAX_REQUEST_OVERHEAD;
> +
> +		/*
> +		 * Check for PD
> +		 */
> +		ret =3D cros_ec_host_command_proto_probe(ec_dev, 1, proto_msg);
> +
> +		if (ret) {
> +			dev_dbg(ec_dev->dev, "no PD chip found: %d\n", ret);
> +			ec_dev->max_passthru =3D 0;
> +		} else {
> +			dev_dbg(ec_dev->dev, "found PD chip\n");
> +			ec_dev->max_passthru =3D
> +				proto_info->max_request_packet_size -
> +				sizeof(struct ec_host_request);
> +		}
> +	} else {
> +		/* Try probing with a v2 hello message. */
> +		ec_dev->proto_version =3D 2;
> +		ret =3D cros_ec_host_command_proto_probe_v2(ec_dev);
> +
> +		if (ret =3D=3D 0) {
> +			/* V2 hello succeeded. */
> +			dev_dbg(ec_dev->dev, "falling back to proto v2\n");
> +
> +			ec_dev->max_request =3D EC_PROTO2_MAX_PARAM_SIZE;
> +			ec_dev->max_response =3D EC_PROTO2_MAX_PARAM_SIZE;
> +			ec_dev->max_passthru =3D 0;
> +			ec_dev->pkt_xfer =3D NULL;
> +			ec_dev->din_size =3D EC_MSG_BYTES;
> +			ec_dev->dout_size =3D EC_MSG_BYTES;
> +		} else {
> +			/*
> +			 * It's possible for a probe to occur too early when
> +			 * the EC isn't listening. If this happens, we'll
> +			 * probe later when the first command is run.
> +			 */
> +			ec_dev->proto_version =3D EC_PROTO_VERSION_UNKNOWN;
> +			dev_dbg(ec_dev->dev, "EC probe failed: %d\n", ret);
> +			goto exit;
> +		}
> +	}
> +
> +	devm_kfree(dev, ec_dev->din);
> +	devm_kfree(dev, ec_dev->dout);
> +
> +	ec_dev->din =3D devm_kzalloc(dev, ec_dev->din_size, GFP_KERNEL);
> +	if (!ec_dev->din) {
> +		ret =3D -ENOMEM;
> +		goto exit;
> +	}
> +
> +	ec_dev->dout =3D devm_kzalloc(dev, ec_dev->dout_size, GFP_KERNEL);
> +	if (!ec_dev->dout) {
> +		devm_kfree(dev, ec_dev->din);
> +		ret =3D -ENOMEM;
> +		goto exit;
> +	}
> +
> +exit:
> +	kfree(proto_msg);
> +	return ret;
> +}
> +
>  int cros_ec_prepare_tx(struct cros_ec_device *ec_dev,
>  		       struct cros_ec_command *msg)
>  {
> -	uint8_t *out;
> -	int csum, i;
> +	u8 *out;
> +	u8 csum;
> +	int i;
> +
> +	if (ec_dev->proto_version > 2)
> +		return prepare_packet(ec_dev, msg);
> =20
>  	BUG_ON(msg->outsize > EC_PROTO2_MAX_PARAM_SIZE);
>  	out =3D ec_dev->dout;
> @@ -42,7 +307,7 @@ int cros_ec_prepare_tx(struct cros_ec_device *ec_d=
ev,
>  	csum =3D out[0] + out[1] + out[2];
>  	for (i =3D 0; i < msg->outsize; i++)
>  		csum +=3D out[EC_MSG_TX_HEADER_BYTES + i] =3D msg->data[i];
> -	out[EC_MSG_TX_HEADER_BYTES + msg->outsize] =3D (uint8_t)(csum & 0xf=
f);
> +	out[EC_MSG_TX_HEADER_BYTES + msg->outsize] =3D csum;
> =20
>  	return EC_MSG_TX_PROTO_BYTES + msg->outsize;
>  }
> @@ -72,38 +337,42 @@ int cros_ec_cmd_xfer(struct cros_ec_device *ec_d=
ev,
>  	int ret;
> =20
>  	mutex_lock(&ec_dev->lock);
> -	ret =3D ec_dev->cmd_xfer(ec_dev, msg);
> -	if (msg->result =3D=3D EC_RES_IN_PROGRESS) {
> -		int i;
> -		struct cros_ec_command *status_msg;
> -		struct ec_response_get_comms_status *status;
> -		u8 buf[sizeof(*status_msg) + sizeof(*status)] =3D { };
> -
> -		status_msg =3D (struct cros_ec_command *)buf;
> -		status_msg->command =3D EC_CMD_GET_COMMS_STATUS;
> -		status_msg->insize =3D sizeof(*status);
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
> +	if (ec_dev->proto_version =3D=3D EC_PROTO_VERSION_UNKNOWN) {
> +		ret =3D cros_ec_probe_all(ec_dev);
> +		if (ret) {
> +			dev_err(ec_dev->dev,
> +				"EC version unknown and probe failed; aborting command\n");
> +			mutex_unlock(&ec_dev->lock);
> +			return ret;
> +		}
> +	}
> =20
> -			msg->result =3D status_msg->result;
> -			if (status_msg->result !=3D EC_RES_SUCCESS)
> -				break;
> +	if (msg->insize > ec_dev->max_response) {
> +		dev_dbg(ec_dev->dev, "clamping message receive buffer\n");
> +		msg->insize =3D ec_dev->max_response;
> +	}
> =20
> -			status =3D (struct ec_response_get_comms_status *)
> -				 status_msg->data;
> -			if (!(status->flags & EC_COMMS_STATUS_PROCESSING))
> -				break;
> +	if (msg->command < EC_CMD_PASSTHRU_OFFSET(1)) {
> +		if (msg->outsize > ec_dev->max_request) {
> +			dev_err(ec_dev->dev,
> +				"request of size %u is too big (max: %u)\n",
> +				msg->outsize,
> +				ec_dev->max_request);
> +			mutex_unlock(&ec_dev->lock);
> +			return -EMSGSIZE;
> +		}
> +	} else {
> +		if (msg->outsize > ec_dev->max_passthru) {
> +			dev_err(ec_dev->dev,
> +				"passthru rq of size %u is too big (max: %u)\n",
> +				msg->outsize,
> +				ec_dev->max_passthru);
> +			mutex_unlock(&ec_dev->lock);
> +			return -EMSGSIZE;
>  		}
>  	}
> +
> +	ret =3D send_command(ec_dev, msg);
>  	mutex_unlock(&ec_dev->lock);
> =20
>  	return ret;
> @@ -122,19 +391,22 @@ int cros_ec_register(struct cros_ec_device *ec_=
dev)
>  	struct device *dev =3D ec_dev->dev;
>  	int err =3D 0;
> =20
> -	if (ec_dev->din_size) {
> -		ec_dev->din =3D devm_kzalloc(dev, ec_dev->din_size, GFP_KERNEL);
> -		if (!ec_dev->din)
> -			return -ENOMEM;
> -	}
> -	if (ec_dev->dout_size) {
> -		ec_dev->dout =3D devm_kzalloc(dev, ec_dev->dout_size, GFP_KERNEL);
> -		if (!ec_dev->dout)
> -			return -ENOMEM;
> -	}
> +	ec_dev->max_request =3D sizeof(struct ec_params_hello);
> +	ec_dev->max_response =3D sizeof(struct ec_response_get_protocol_inf=
o);
> +	ec_dev->max_passthru =3D 0;
> +
> +	ec_dev->din =3D devm_kzalloc(dev, ec_dev->din_size, GFP_KERNEL);
> +	if (!ec_dev->din)
> +		return -ENOMEM;
> +
> +	ec_dev->dout =3D devm_kzalloc(dev, ec_dev->dout_size, GFP_KERNEL);
> +	if (!ec_dev->dout)
> +		return -ENOMEM;
> =20
>  	mutex_init(&ec_dev->lock);
> =20
> +	cros_ec_probe_all(ec_dev);
> +
>  	err =3D mfd_add_devices(dev, 0, cros_devs,
>  			      ARRAY_SIZE(cros_devs),
>  			      NULL, ec_dev->irq, NULL);
> diff --git a/drivers/mfd/cros_ec_i2c.c b/drivers/mfd/cros_ec_i2c.c
> index fbf7819f5de5..b400bfa2772a 100644
> --- a/drivers/mfd/cros_ec_i2c.c
> +++ b/drivers/mfd/cros_ec_i2c.c
> @@ -143,8 +143,12 @@ static int cros_ec_i2c_probe(struct i2c_client *=
client,
>  	ec_dev->priv =3D client;
>  	ec_dev->irq =3D client->irq;
>  	ec_dev->cmd_xfer =3D cros_ec_cmd_xfer_i2c;
> +	ec_dev->pkt_xfer =3D NULL;
>  	ec_dev->ec_name =3D client->name;
>  	ec_dev->phys_name =3D client->adapter->name;
> +	ec_dev->din_size =3D sizeof(struct ec_host_response) +
> +			   sizeof(struct ec_response_get_protocol_info);
> +	ec_dev->dout_size =3D sizeof(struct ec_host_request);
> =20
>  	err =3D cros_ec_register(ec_dev);
>  	if (err) {
> diff --git a/drivers/mfd/cros_ec_spi.c b/drivers/mfd/cros_ec_spi.c
> index 573730fec947..04da2f288ef8 100644
> --- a/drivers/mfd/cros_ec_spi.c
> +++ b/drivers/mfd/cros_ec_spi.c
> @@ -361,10 +361,13 @@ static int cros_ec_spi_probe(struct spi_device =
*spi)
>  	ec_dev->priv =3D ec_spi;
>  	ec_dev->irq =3D spi->irq;
>  	ec_dev->cmd_xfer =3D cros_ec_cmd_xfer_spi;
> +	ec_dev->pkt_xfer =3D NULL;
>  	ec_dev->ec_name =3D ec_spi->spi->modalias;
>  	ec_dev->phys_name =3D dev_name(&ec_spi->spi->dev);
> -	ec_dev->din_size =3D EC_MSG_BYTES + EC_MSG_PREAMBLE_COUNT;
> -	ec_dev->dout_size =3D EC_MSG_BYTES;
> +	ec_dev->din_size =3D EC_MSG_PREAMBLE_COUNT +
> +			   sizeof(struct ec_host_response) +
> +			   sizeof(struct ec_response_get_protocol_info);
> +	ec_dev->dout_size =3D sizeof(struct ec_host_request);
> =20
>  	err =3D cros_ec_register(ec_dev);
>  	if (err) {
> diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform=
/chrome/cros_ec_lpc.c
> index 32b1df29fc58..d56dfb9dd463 100644
> --- a/drivers/platform/chrome/cros_ec_lpc.c
> +++ b/drivers/platform/chrome/cros_ec_lpc.c
> @@ -205,7 +205,11 @@ static int cros_ec_lpc_probe(struct platform_dev=
ice *pdev)
>  	ec_dev->ec_name =3D pdev->name;
>  	ec_dev->phys_name =3D dev_name(dev);
>  	ec_dev->cmd_xfer =3D cros_ec_cmd_xfer_lpc;
> +	ec_dev->pkt_xfer =3D NULL;
>  	ec_dev->cmd_readmem =3D cros_ec_lpc_readmem;
> +	ec_dev->din_size =3D sizeof(struct ec_host_response) +
> +			   sizeof(struct ec_response_get_protocol_info);
> +	ec_dev->dout_size =3D sizeof(struct ec_host_request);
> =20
>  	ret =3D cros_ec_register(ec_dev);
>  	if (ret) {
> diff --git a/include/linux/mfd/cros_ec.h b/include/linux/mfd/cros_ec.=
h
> index 7eee38abd02a..a2e87e81c956 100644
> --- a/include/linux/mfd/cros_ec.h
> +++ b/include/linux/mfd/cros_ec.h
> @@ -22,6 +22,15 @@
>  #include <linux/mutex.h>
> =20
>  /*
> + * Max bus-specific overhead incurred by request/responses.
> + * I2C requires 1 additional byte for requests.
> + * I2C requires 2 additional bytes for responses.
> + * */
> +#define EC_PROTO_VERSION_UNKNOWN	0
> +#define EC_MAX_REQUEST_OVERHEAD		1
> +#define EC_MAX_RESPONSE_OVERHEAD	2
> +
> +/*
>   * Command interface between EC and AP, for LPC, I2C and SPI interfa=
ces.
>   */
>  enum {
> @@ -88,6 +97,7 @@ struct cros_ec_command {
>   *     Returns the number of bytes received if the communication suc=
ceeded, but
>   *     that doesn't mean the EC was happy with the command. The call=
er
>   *     should check msg.result for the EC's result code.
> + * @pkt_xfer: send packet to EC and get response
>   * @lock: one transaction at a time
>   */
>  struct cros_ec_device {
> @@ -104,15 +114,21 @@ struct cros_ec_device {
>  			   unsigned int bytes, void *dest);
> =20
>  	/* These are used to implement the platform-specific interface */
> +	u16 max_request;
> +	u16 max_response;
> +	u16 max_passthru;
> +	u16 proto_version;
>  	void *priv;
>  	int irq;
> -	uint8_t *din;
> -	uint8_t *dout;
> +	u8 *din;
> +	u8 *dout;
>  	int din_size;
>  	int dout_size;
>  	bool wake_enabled;
>  	int (*cmd_xfer)(struct cros_ec_device *ec,
>  			struct cros_ec_command *msg);
> +	int (*pkt_xfer)(struct cros_ec_device *ec,
> +			struct cros_ec_command *msg);
>  	struct mutex lock;
>  };
> =20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
