From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 5/7] mfd: cros_ec: add bus-specific proto v3 code
Date: Wed, 27 May 2015 09:53:55 +0100
Message-ID: <20150527085355.GW11677@x1>
References: <1432309340-13688-1-git-send-email-javier.martinez@collabora.co.uk>
 <1432309340-13688-6-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f171.google.com ([209.85.212.171]:35988 "EHLO
	mail-wi0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750968AbbE0IyB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 May 2015 04:54:01 -0400
Received: by wizk4 with SMTP id k4so103611966wiz.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 May 2015 01:53:59 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1432309340-13688-6-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, Alexandru M Stan <amstan@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 22 May 2015, Javier Martinez Canillas wrote:

> From: Stephen Barber <smbarber@chromium.org>
>=20
> Add proto v3 support to the SPI, I2C, and LPC.
>=20
> Signed-off-by: Stephen Barber <smbarber@chromium.org>
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co=
=2Euk>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Gwendal Grignou <gwendal@chromium.org>
> Tested-by: Gwendal Grignou <gwendal@chromium.org>
> ---
>=20
> Changes since v2: None
>=20
> Changes since v1:
>  - Added Gwendal Grignou Reviewed-by and Tested-by tags
> ---
>  drivers/mfd/cros_ec_i2c.c             | 166 ++++++++++++++-
>  drivers/mfd/cros_ec_spi.c             | 382 ++++++++++++++++++++++++=
+++++-----
>  drivers/platform/chrome/cros_ec_lpc.c |  73 ++++++-
>  include/linux/mfd/cros_ec.h           |   6 +
>  4 files changed, 569 insertions(+), 58 deletions(-)

I don't even know what to say; except, 600 lines of grimness!  I tried
to review, but now my eyes and brain hurt.  I feel sorry for the guys
who have to actively maintain this stuff.

However... you have enough vendor Acks and Tests to make me "happy",
and if anything is wrong I'm sure you'll come back and fix it
promptyly.

Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/drivers/mfd/cros_ec_i2c.c b/drivers/mfd/cros_ec_i2c.c
> index b400bfa2772a..22e8a4ae1711 100644
> --- a/drivers/mfd/cros_ec_i2c.c
> +++ b/drivers/mfd/cros_ec_i2c.c
> @@ -13,6 +13,7 @@
>   * GNU General Public License for more details.
>   */
> =20
> +#include <linux/delay.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/i2c.h>
> @@ -22,6 +23,32 @@
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> =20
> +/**
> + * Request format for protocol v3
> + * byte 0	0xda (EC_COMMAND_PROTOCOL_3)
> + * byte 1-8	struct ec_host_request
> + * byte 10-	response data
> + */
> +struct ec_host_request_i2c {
> +	/* Always 0xda to backward compatible with v2 struct */
> +	uint8_t  command_protocol;
> +	struct ec_host_request ec_request;
> +} __packed;
> +
> +
> +/*
> + * Response format for protocol v3
> + * byte 0	result code
> + * byte 1	packet_length
> + * byte 2-9	struct ec_host_response
> + * byte 10-	response data
> + */
> +struct ec_host_response_i2c {
> +	uint8_t result;
> +	uint8_t packet_length;
> +	struct ec_host_response ec_response;
> +} __packed;
> +
>  static inline struct cros_ec_device *to_ec_dev(struct device *dev)
>  {
>  	struct i2c_client *client =3D to_i2c_client(dev);
> @@ -29,6 +56,134 @@ static inline struct cros_ec_device *to_ec_dev(st=
ruct device *dev)
>  	return i2c_get_clientdata(client);
>  }
> =20
> +static int cros_ec_pkt_xfer_i2c(struct cros_ec_device *ec_dev,
> +				struct cros_ec_command *msg)
> +{
> +	struct i2c_client *client =3D ec_dev->priv;
> +	int ret =3D -ENOMEM;
> +	int i;
> +	int packet_len;
> +	u8 *out_buf =3D NULL;
> +	u8 *in_buf =3D NULL;
> +	u8 sum;
> +	struct i2c_msg i2c_msg[2];
> +	struct ec_host_response *ec_response;
> +	struct ec_host_request_i2c *ec_request_i2c;
> +	struct ec_host_response_i2c *ec_response_i2c;
> +	int request_header_size =3D sizeof(struct ec_host_request_i2c);
> +	int response_header_size =3D sizeof(struct ec_host_response_i2c);
> +
> +	i2c_msg[0].addr =3D client->addr;
> +	i2c_msg[0].flags =3D 0;
> +	i2c_msg[1].addr =3D client->addr;
> +	i2c_msg[1].flags =3D I2C_M_RD;
> +
> +	packet_len =3D msg->insize + response_header_size;
> +	BUG_ON(packet_len > ec_dev->din_size);
> +	in_buf =3D ec_dev->din;
> +	i2c_msg[1].len =3D packet_len;
> +	i2c_msg[1].buf =3D (char *) in_buf;
> +
> +	packet_len =3D msg->outsize + request_header_size;
> +	BUG_ON(packet_len > ec_dev->dout_size);
> +	out_buf =3D ec_dev->dout;
> +	i2c_msg[0].len =3D packet_len;
> +	i2c_msg[0].buf =3D (char *) out_buf;
> +
> +	/* create request data */
> +	ec_request_i2c =3D (struct ec_host_request_i2c *) out_buf;
> +	ec_request_i2c->command_protocol =3D EC_COMMAND_PROTOCOL_3;
> +
> +	ec_dev->dout++;
> +	ret =3D cros_ec_prepare_tx(ec_dev, msg);
> +	ec_dev->dout--;
> +
> +	/* send command to EC and read answer */
> +	ret =3D i2c_transfer(client->adapter, i2c_msg, 2);
> +	if (ret < 0) {
> +		dev_dbg(ec_dev->dev, "i2c transfer failed: %d\n", ret);
> +		goto done;
> +	} else if (ret !=3D 2) {
> +		dev_err(ec_dev->dev, "failed to get response: %d\n", ret);
> +		ret =3D -EIO;
> +		goto done;
> +	}
> +
> +	ec_response_i2c =3D (struct ec_host_response_i2c *) in_buf;
> +	msg->result =3D ec_response_i2c->result;
> +	ec_response =3D &ec_response_i2c->ec_response;
> +
> +	switch (msg->result) {
> +	case EC_RES_SUCCESS:
> +		break;
> +	case EC_RES_IN_PROGRESS:
> +		ret =3D -EAGAIN;
> +		dev_dbg(ec_dev->dev, "command 0x%02x in progress\n",
> +			msg->command);
> +		goto done;
> +
> +	default:
> +		dev_dbg(ec_dev->dev, "command 0x%02x returned %d\n",
> +			msg->command, msg->result);
> +		/*
> +		 * When we send v3 request to v2 ec, ec won't recognize the
> +		 * 0xda (EC_COMMAND_PROTOCOL_3) and will return with status
> +		 * EC_RES_INVALID_COMMAND with zero data length.
> +		 *
> +		 * In case of invalid command for v3 protocol the data length
> +		 * will be at least sizeof(struct ec_host_response)
> +		 */
> +		if (ec_response_i2c->result =3D=3D EC_RES_INVALID_COMMAND &&
> +		    ec_response_i2c->packet_length =3D=3D 0) {
> +			ret =3D -EPROTONOSUPPORT;
> +			goto done;
> +		}
> +	}
> +
> +	if (ec_response_i2c->packet_length < sizeof(struct ec_host_response=
)) {
> +		dev_err(ec_dev->dev,
> +			"response of %u bytes too short; not a full header\n",
> +			ec_response_i2c->packet_length);
> +		ret =3D -EBADMSG;
> +		goto done;
> +	}
> +
> +	if (msg->insize < ec_response->data_len) {
> +		dev_err(ec_dev->dev,
> +			"response data size is too large: expected %u, got %u\n",
> +			msg->insize,
> +			ec_response->data_len);
> +		ret =3D -EMSGSIZE;
> +		goto done;
> +	}
> +
> +	/* copy response packet payload and compute checksum */
> +	sum =3D 0;
> +	for (i =3D 0; i < sizeof(struct ec_host_response); i++)
> +		sum +=3D ((u8 *)ec_response)[i];
> +
> +	memcpy(msg->data,
> +	       in_buf + response_header_size,
> +	       ec_response->data_len);
> +	for (i =3D 0; i < ec_response->data_len; i++)
> +		sum +=3D msg->data[i];
> +
> +	/* All bytes should sum to zero */
> +	if (sum) {
> +		dev_err(ec_dev->dev, "bad packet checksum\n");
> +		ret =3D -EBADMSG;
> +		goto done;
> +	}
> +
> +	ret =3D ec_response->data_len;
> +
> +done:
> +	if (msg->command =3D=3D EC_CMD_REBOOT_EC)
> +		msleep(EC_REBOOT_DELAY_MS);
> +
> +	return ret;
> +}
> +
>  static int cros_ec_cmd_xfer_i2c(struct cros_ec_device *ec_dev,
>  				struct cros_ec_command *msg)
>  {
> @@ -121,9 +276,12 @@ static int cros_ec_cmd_xfer_i2c(struct cros_ec_d=
evice *ec_dev,
>  	}
> =20
>  	ret =3D len;
> - done:
> +done:
>  	kfree(in_buf);
>  	kfree(out_buf);
> +	if (msg->command =3D=3D EC_CMD_REBOOT_EC)
> +		msleep(EC_REBOOT_DELAY_MS);
> +
>  	return ret;
>  }
> =20
> @@ -143,12 +301,12 @@ static int cros_ec_i2c_probe(struct i2c_client =
*client,
>  	ec_dev->priv =3D client;
>  	ec_dev->irq =3D client->irq;
>  	ec_dev->cmd_xfer =3D cros_ec_cmd_xfer_i2c;
> -	ec_dev->pkt_xfer =3D NULL;
> +	ec_dev->pkt_xfer =3D cros_ec_pkt_xfer_i2c;
>  	ec_dev->ec_name =3D client->name;
>  	ec_dev->phys_name =3D client->adapter->name;
> -	ec_dev->din_size =3D sizeof(struct ec_host_response) +
> +	ec_dev->din_size =3D sizeof(struct ec_host_response_i2c) +
>  			   sizeof(struct ec_response_get_protocol_info);
> -	ec_dev->dout_size =3D sizeof(struct ec_host_request);
> +	ec_dev->dout_size =3D sizeof(struct ec_host_request_i2c);
> =20
>  	err =3D cros_ec_register(ec_dev);
>  	if (err) {
> diff --git a/drivers/mfd/cros_ec_spi.c b/drivers/mfd/cros_ec_spi.c
> index 04da2f288ef8..4e6f2f6b1095 100644
> --- a/drivers/mfd/cros_ec_spi.c
> +++ b/drivers/mfd/cros_ec_spi.c
> @@ -65,12 +65,6 @@
>    */
>  #define EC_SPI_RECOVERY_TIME_NS	(200 * 1000)
> =20
> -/*
> - * The EC is unresponsive for a time after a reboot command.  Add a
> - * simple delay to make sure that the bus stays locked.
> - */
> -#define EC_REBOOT_DELAY_MS	50
> -
>  /**
>   * struct cros_ec_spi - information about a SPI-connected EC
>   *
> @@ -87,7 +81,7 @@ struct cros_ec_spi {
>  };
> =20
>  static void debug_packet(struct device *dev, const char *name, u8 *p=
tr,
> -			  int len)
> +			 int len)
>  {
>  #ifdef DEBUG
>  	int i;
> @@ -100,6 +94,172 @@ static void debug_packet(struct device *dev, con=
st char *name, u8 *ptr,
>  #endif
>  }
> =20
> +static int terminate_request(struct cros_ec_device *ec_dev)
> +{
> +	struct cros_ec_spi *ec_spi =3D ec_dev->priv;
> +	struct spi_message msg;
> +	struct spi_transfer trans;
> +	int ret;
> +
> +	/*
> +	 * Turn off CS, possibly adding a delay to ensure the rising edge
> +	 * doesn't come too soon after the end of the data.
> +	 */
> +	spi_message_init(&msg);
> +	memset(&trans, 0, sizeof(trans));
> +	trans.delay_usecs =3D ec_spi->end_of_msg_delay;
> +	spi_message_add_tail(&trans, &msg);
> +
> +	ret =3D spi_sync(ec_spi->spi, &msg);
> +
> +	/* Reset end-of-response timer */
> +	ec_spi->last_transfer_ns =3D ktime_get_ns();
> +	if (ret < 0) {
> +		dev_err(ec_dev->dev,
> +			"cs-deassert spi transfer failed: %d\n",
> +			ret);
> +	}
> +
> +	return ret;
> +}
> +
> +/**
> + * receive_n_bytes - receive n bytes from the EC.
> + *
> + * Assumes buf is a pointer into the ec_dev->din buffer
> + */
> +static int receive_n_bytes(struct cros_ec_device *ec_dev, u8 *buf, i=
nt n)
> +{
> +	struct cros_ec_spi *ec_spi =3D ec_dev->priv;
> +	struct spi_transfer trans;
> +	struct spi_message msg;
> +	int ret;
> +
> +	BUG_ON(buf - ec_dev->din + n > ec_dev->din_size);
> +
> +	memset(&trans, 0, sizeof(trans));
> +	trans.cs_change =3D 1;
> +	trans.rx_buf =3D buf;
> +	trans.len =3D n;
> +
> +	spi_message_init(&msg);
> +	spi_message_add_tail(&trans, &msg);
> +	ret =3D spi_sync(ec_spi->spi, &msg);
> +	if (ret < 0)
> +		dev_err(ec_dev->dev, "spi transfer failed: %d\n", ret);
> +
> +	return ret;
> +}
> +
> +/**
> + * cros_ec_spi_receive_packet - Receive a packet from the EC.
> + *
> + * This function has two phases: reading the preamble bytes (since i=
f we read
> + * data from the EC before it is ready to send, we just get preamble=
) and
> + * reading the actual message.
> + *
> + * The received data is placed into ec_dev->din.
> + *
> + * @ec_dev: ChromeOS EC device
> + * @need_len: Number of message bytes we need to read
> + */
> +static int cros_ec_spi_receive_packet(struct cros_ec_device *ec_dev,
> +				      int need_len)
> +{
> +	struct ec_host_response *response;
> +	u8 *ptr, *end;
> +	int ret;
> +	unsigned long deadline;
> +	int todo;
> +
> +	BUG_ON(EC_MSG_PREAMBLE_COUNT > ec_dev->din_size);
> +
> +	/* Receive data until we see the header byte */
> +	deadline =3D jiffies + msecs_to_jiffies(EC_MSG_DEADLINE_MS);
> +	while (true) {
> +		unsigned long start_jiffies =3D jiffies;
> +
> +		ret =3D receive_n_bytes(ec_dev,
> +				      ec_dev->din,
> +				      EC_MSG_PREAMBLE_COUNT);
> +		if (ret < 0)
> +			return ret;
> +
> +		ptr =3D ec_dev->din;
> +		for (end =3D ptr + EC_MSG_PREAMBLE_COUNT; ptr !=3D end; ptr++) {
> +			if (*ptr =3D=3D EC_SPI_FRAME_START) {
> +				dev_dbg(ec_dev->dev, "msg found at %zd\n",
> +					ptr - ec_dev->din);
> +				break;
> +			}
> +		}
> +		if (ptr !=3D end)
> +			break;
> +
> +		/*
> +		 * Use the time at the start of the loop as a timeout.  This
> +		 * gives us one last shot at getting the transfer and is useful
> +		 * in case we got context switched out for a while.
> +		 */
> +		if (time_after(start_jiffies, deadline)) {
> +			dev_warn(ec_dev->dev, "EC failed to respond in time\n");
> +			return -ETIMEDOUT;
> +		}
> +	}
> +
> +	/*
> +	 * ptr now points to the header byte. Copy any valid data to the
> +	 * start of our buffer
> +	 */
> +	todo =3D end - ++ptr;
> +	BUG_ON(todo < 0 || todo > ec_dev->din_size);
> +	todo =3D min(todo, need_len);
> +	memmove(ec_dev->din, ptr, todo);
> +	ptr =3D ec_dev->din + todo;
> +	dev_dbg(ec_dev->dev, "need %d, got %d bytes from preamble\n",
> +		need_len, todo);
> +	need_len -=3D todo;
> +
> +	/* If the entire response struct wasn't read, get the rest of it. *=
/
> +	if (todo < sizeof(*response)) {
> +		ret =3D receive_n_bytes(ec_dev, ptr, sizeof(*response) - todo);
> +		if (ret < 0)
> +			return -EBADMSG;
> +		ptr +=3D (sizeof(*response) - todo);
> +		todo =3D sizeof(*response);
> +	}
> +
> +	response =3D (struct ec_host_response *)ec_dev->din;
> +
> +	/* Abort if data_len is too large. */
> +	if (response->data_len > ec_dev->din_size)
> +		return -EMSGSIZE;
> +
> +	/* Receive data until we have it all */
> +	while (need_len > 0) {
> +		/*
> +		 * We can't support transfers larger than the SPI FIFO size
> +		 * unless we have DMA. We don't have DMA on the ISP SPI ports
> +		 * for Exynos. We need a way of asking SPI driver for
> +		 * maximum-supported transfer size.
> +		 */
> +		todo =3D min(need_len, 256);
> +		dev_dbg(ec_dev->dev, "loop, todo=3D%d, need_len=3D%d, ptr=3D%zd\n"=
,
> +			todo, need_len, ptr - ec_dev->din);
> +
> +		ret =3D receive_n_bytes(ec_dev, ptr, todo);
> +		if (ret < 0)
> +			return ret;
> +
> +		ptr +=3D todo;
> +		need_len -=3D todo;
> +	}
> +
> +	dev_dbg(ec_dev->dev, "loop done, ptr=3D%zd\n", ptr - ec_dev->din);
> +
> +	return 0;
> +}
> +
>  /**
>   * cros_ec_spi_receive_response - Receive a response from the EC.
>   *
> @@ -115,34 +275,27 @@ static void debug_packet(struct device *dev, co=
nst char *name, u8 *ptr,
>  static int cros_ec_spi_receive_response(struct cros_ec_device *ec_de=
v,
>  					int need_len)
>  {
> -	struct cros_ec_spi *ec_spi =3D ec_dev->priv;
> -	struct spi_transfer trans;
> -	struct spi_message msg;
>  	u8 *ptr, *end;
>  	int ret;
>  	unsigned long deadline;
>  	int todo;
> =20
> +	BUG_ON(EC_MSG_PREAMBLE_COUNT > ec_dev->din_size);
> +
>  	/* Receive data until we see the header byte */
>  	deadline =3D jiffies + msecs_to_jiffies(EC_MSG_DEADLINE_MS);
>  	while (true) {
>  		unsigned long start_jiffies =3D jiffies;
> =20
> -		memset(&trans, 0, sizeof(trans));
> -		trans.cs_change =3D 1;
> -		trans.rx_buf =3D ptr =3D ec_dev->din;
> -		trans.len =3D EC_MSG_PREAMBLE_COUNT;
> -
> -		spi_message_init(&msg);
> -		spi_message_add_tail(&trans, &msg);
> -		ret =3D spi_sync(ec_spi->spi, &msg);
> -		if (ret < 0) {
> -			dev_err(ec_dev->dev, "spi transfer failed: %d\n", ret);
> +		ret =3D receive_n_bytes(ec_dev,
> +				      ec_dev->din,
> +				      EC_MSG_PREAMBLE_COUNT);
> +		if (ret < 0)
>  			return ret;
> -		}
> =20
> +		ptr =3D ec_dev->din;
>  		for (end =3D ptr + EC_MSG_PREAMBLE_COUNT; ptr !=3D end; ptr++) {
> -			if (*ptr =3D=3D EC_MSG_HEADER) {
> +			if (*ptr =3D=3D EC_SPI_FRAME_START) {
>  				dev_dbg(ec_dev->dev, "msg found at %zd\n",
>  					ptr - ec_dev->din);
>  				break;
> @@ -187,21 +340,9 @@ static int cros_ec_spi_receive_response(struct c=
ros_ec_device *ec_dev,
>  		dev_dbg(ec_dev->dev, "loop, todo=3D%d, need_len=3D%d, ptr=3D%zd\n"=
,
>  			todo, need_len, ptr - ec_dev->din);
> =20
> -		memset(&trans, 0, sizeof(trans));
> -		trans.cs_change =3D 1;
> -		trans.rx_buf =3D ptr;
> -		trans.len =3D todo;
> -		spi_message_init(&msg);
> -		spi_message_add_tail(&trans, &msg);
> -
> -		/* send command to EC and read answer */
> -		BUG_ON((u8 *)trans.rx_buf - ec_dev->din + todo >
> -				ec_dev->din_size);
> -		ret =3D spi_sync(ec_spi->spi, &msg);
> -		if (ret < 0) {
> -			dev_err(ec_dev->dev, "spi transfer failed: %d\n", ret);
> +		ret =3D receive_n_bytes(ec_dev, ptr, todo);
> +		if (ret < 0)
>  			return ret;
> -		}
> =20
>  		debug_packet(ec_dev->dev, "interim", ptr, todo);
>  		ptr +=3D todo;
> @@ -214,6 +355,128 @@ static int cros_ec_spi_receive_response(struct =
cros_ec_device *ec_dev,
>  }
> =20
>  /**
> + * cros_ec_pkt_xfer_spi - Transfer a packet over SPI and receive the=
 reply
> + *
> + * @ec_dev: ChromeOS EC device
> + * @ec_msg: Message to transfer
> + */
> +static int cros_ec_pkt_xfer_spi(struct cros_ec_device *ec_dev,
> +				struct cros_ec_command *ec_msg)
> +{
> +	struct ec_host_request *request;
> +	struct ec_host_response *response;
> +	struct cros_ec_spi *ec_spi =3D ec_dev->priv;
> +	struct spi_transfer trans;
> +	struct spi_message msg;
> +	int i, len;
> +	u8 *ptr;
> +	u8 *rx_buf;
> +	u8 sum;
> +	int ret =3D 0, final_ret;
> +
> +	len =3D cros_ec_prepare_tx(ec_dev, ec_msg);
> +	request =3D (struct ec_host_request *)ec_dev->dout;
> +	dev_dbg(ec_dev->dev, "prepared, len=3D%d\n", len);
> +
> +	/* If it's too soon to do another transaction, wait */
> +	if (ec_spi->last_transfer_ns) {
> +		unsigned long delay;	/* The delay completed so far */
> +
> +		delay =3D ktime_get_ns() - ec_spi->last_transfer_ns;
> +		if (delay < EC_SPI_RECOVERY_TIME_NS)
> +			ndelay(EC_SPI_RECOVERY_TIME_NS - delay);
> +	}
> +
> +	rx_buf =3D kzalloc(len, GFP_KERNEL);
> +	if (!rx_buf) {
> +		ret =3D -ENOMEM;
> +		goto exit;
> +	}
> +
> +	/* Transmit phase - send our message */
> +	memset(&trans, 0, sizeof(trans));
> +	trans.tx_buf =3D ec_dev->dout;
> +	trans.rx_buf =3D rx_buf;
> +	trans.len =3D len;
> +	trans.cs_change =3D 1;
> +	spi_message_init(&msg);
> +	spi_message_add_tail(&trans, &msg);
> +	ret =3D spi_sync(ec_spi->spi, &msg);
> +
> +	/* Get the response */
> +	if (!ret) {
> +		/* Verify that EC can process command */
> +		for (i =3D 0; i < len; i++) {
> +			switch (rx_buf[i]) {
> +			case EC_SPI_PAST_END:
> +			case EC_SPI_RX_BAD_DATA:
> +			case EC_SPI_NOT_READY:
> +				ret =3D -EAGAIN;
> +				ec_msg->result =3D EC_RES_IN_PROGRESS;
> +			default:
> +				break;
> +			}
> +			if (ret)
> +				break;
> +		}
> +		if (!ret)
> +			ret =3D cros_ec_spi_receive_packet(ec_dev,
> +					ec_msg->insize + sizeof(*response));
> +	} else {
> +		dev_err(ec_dev->dev, "spi transfer failed: %d\n", ret);
> +	}
> +
> +	final_ret =3D terminate_request(ec_dev);
> +	if (!ret)
> +		ret =3D final_ret;
> +	if (ret < 0)
> +		goto exit;
> +
> +	ptr =3D ec_dev->din;
> +
> +	/* check response error code */
> +	response =3D (struct ec_host_response *)ptr;
> +	ec_msg->result =3D response->result;
> +
> +	ret =3D cros_ec_check_result(ec_dev, ec_msg);
> +	if (ret)
> +		goto exit;
> +
> +	len =3D response->data_len;
> +	sum =3D 0;
> +	if (len > ec_msg->insize) {
> +		dev_err(ec_dev->dev, "packet too long (%d bytes, expected %d)",
> +			len, ec_msg->insize);
> +		ret =3D -EMSGSIZE;
> +		goto exit;
> +	}
> +
> +	for (i =3D 0; i < sizeof(*response); i++)
> +		sum +=3D ptr[i];
> +
> +	/* copy response packet payload and compute checksum */
> +	memcpy(ec_msg->data, ptr + sizeof(*response), len);
> +	for (i =3D 0; i < len; i++)
> +		sum +=3D ec_msg->data[i];
> +
> +	if (sum) {
> +		dev_err(ec_dev->dev,
> +			"bad packet checksum, calculated %x\n",
> +			sum);
> +		ret =3D -EBADMSG;
> +		goto exit;
> +	}
> +
> +	ret =3D len;
> +exit:
> +	kfree(rx_buf);
> +	if (ec_msg->command =3D=3D EC_CMD_REBOOT_EC)
> +		msleep(EC_REBOOT_DELAY_MS);
> +
> +	return ret;
> +}
> +
> +/**
>   * cros_ec_cmd_xfer_spi - Transfer a message over SPI and receive th=
e reply
>   *
>   * @ec_dev: ChromeOS EC device
> @@ -227,6 +490,7 @@ static int cros_ec_cmd_xfer_spi(struct cros_ec_de=
vice *ec_dev,
>  	struct spi_message msg;
>  	int i, len;
>  	u8 *ptr;
> +	u8 *rx_buf;
>  	int sum;
>  	int ret =3D 0, final_ret;
> =20
> @@ -242,10 +506,17 @@ static int cros_ec_cmd_xfer_spi(struct cros_ec_=
device *ec_dev,
>  			ndelay(EC_SPI_RECOVERY_TIME_NS - delay);
>  	}
> =20
> +	rx_buf =3D kzalloc(len, GFP_KERNEL);
> +	if (!rx_buf) {
> +		ret =3D -ENOMEM;
> +		goto exit;
> +	}
> +
>  	/* Transmit phase - send our message */
>  	debug_packet(ec_dev->dev, "out", ec_dev->dout, len);
>  	memset(&trans, 0, sizeof(trans));
>  	trans.tx_buf =3D ec_dev->dout;
> +	trans.rx_buf =3D rx_buf;
>  	trans.len =3D len;
>  	trans.cs_change =3D 1;
>  	spi_message_init(&msg);
> @@ -254,29 +525,32 @@ static int cros_ec_cmd_xfer_spi(struct cros_ec_=
device *ec_dev,
> =20
>  	/* Get the response */
>  	if (!ret) {
> -		ret =3D cros_ec_spi_receive_response(ec_dev,
> -				ec_msg->insize + EC_MSG_TX_PROTO_BYTES);
> +		/* Verify that EC can process command */
> +		for (i =3D 0; i < len; i++) {
> +			switch (rx_buf[i]) {
> +			case EC_SPI_PAST_END:
> +			case EC_SPI_RX_BAD_DATA:
> +			case EC_SPI_NOT_READY:
> +				ret =3D -EAGAIN;
> +				ec_msg->result =3D EC_RES_IN_PROGRESS;
> +			default:
> +				break;
> +			}
> +			if (ret)
> +				break;
> +		}
> +		if (!ret)
> +			ret =3D cros_ec_spi_receive_response(ec_dev,
> +					ec_msg->insize + EC_MSG_TX_PROTO_BYTES);
>  	} else {
>  		dev_err(ec_dev->dev, "spi transfer failed: %d\n", ret);
>  	}
> =20
> -	/*
> -	 * Turn off CS, possibly adding a delay to ensure the rising edge
> -	 * doesn't come too soon after the end of the data.
> -	 */
> -	spi_message_init(&msg);
> -	memset(&trans, 0, sizeof(trans));
> -	trans.delay_usecs =3D ec_spi->end_of_msg_delay;
> -	spi_message_add_tail(&trans, &msg);
> -
> -	final_ret =3D spi_sync(ec_spi->spi, &msg);
> -	ec_spi->last_transfer_ns =3D ktime_get_ns();
> +	final_ret =3D terminate_request(ec_dev);
>  	if (!ret)
>  		ret =3D final_ret;
> -	if (ret < 0) {
> -		dev_err(ec_dev->dev, "spi transfer failed: %d\n", ret);
> +	if (ret < 0)
>  		goto exit;
> -	}
> =20
>  	ptr =3D ec_dev->din;
> =20
> @@ -315,6 +589,7 @@ static int cros_ec_cmd_xfer_spi(struct cros_ec_de=
vice *ec_dev,
> =20
>  	ret =3D len;
>  exit:
> +	kfree(rx_buf);
>  	if (ec_msg->command =3D=3D EC_CMD_REBOOT_EC)
>  		msleep(EC_REBOOT_DELAY_MS);
> =20
> @@ -361,7 +636,7 @@ static int cros_ec_spi_probe(struct spi_device *s=
pi)
>  	ec_dev->priv =3D ec_spi;
>  	ec_dev->irq =3D spi->irq;
>  	ec_dev->cmd_xfer =3D cros_ec_cmd_xfer_spi;
> -	ec_dev->pkt_xfer =3D NULL;
> +	ec_dev->pkt_xfer =3D cros_ec_pkt_xfer_spi;
>  	ec_dev->ec_name =3D ec_spi->spi->modalias;
>  	ec_dev->phys_name =3D dev_name(&ec_spi->spi->dev);
>  	ec_dev->din_size =3D EC_MSG_PREAMBLE_COUNT +
> @@ -369,6 +644,7 @@ static int cros_ec_spi_probe(struct spi_device *s=
pi)
>  			   sizeof(struct ec_response_get_protocol_info);
>  	ec_dev->dout_size =3D sizeof(struct ec_host_request);
> =20
> +
>  	err =3D cros_ec_register(ec_dev);
>  	if (err) {
>  		dev_err(dev, "cannot register EC\n");
> diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform=
/chrome/cros_ec_lpc.c
> index 05aeb559275f..cac24d356c91 100644
> --- a/drivers/platform/chrome/cros_ec_lpc.c
> +++ b/drivers/platform/chrome/cros_ec_lpc.c
> @@ -46,6 +46,77 @@ static int ec_response_timed_out(void)
>  	return 1;
>  }
> =20
> +static int cros_ec_pkt_xfer_lpc(struct cros_ec_device *ec,
> +				struct cros_ec_command *msg)
> +{
> +	struct ec_host_request *request;
> +	struct ec_host_response response;
> +	u8 sum =3D 0;
> +	int i;
> +	int ret =3D 0;
> +	u8 *dout;
> +
> +	ret =3D cros_ec_prepare_tx(ec, msg);
> +
> +	/* Write buffer */
> +	for (i =3D 0; i < ret; i++)
> +		outb(ec->dout[i], EC_LPC_ADDR_HOST_PACKET + i);
> +
> +	request =3D (struct ec_host_request *)ec->dout;
> +
> +	/* Here we go */
> +	outb(EC_COMMAND_PROTOCOL_3, EC_LPC_ADDR_HOST_CMD);
> +
> +	if (ec_response_timed_out()) {
> +		dev_warn(ec->dev, "EC responsed timed out\n");
> +		ret =3D -EIO;
> +		goto done;
> +	}
> +
> +	/* Check result */
> +	msg->result =3D inb(EC_LPC_ADDR_HOST_DATA);
> +	ret =3D cros_ec_check_result(ec, msg);
> +	if (ret)
> +		goto done;
> +
> +	/* Read back response */
> +	dout =3D (u8 *)&response;
> +	for (i =3D 0; i < sizeof(response); i++) {
> +		dout[i] =3D inb(EC_LPC_ADDR_HOST_PACKET + i);
> +		sum +=3D dout[i];
> +	}
> +
> +	msg->result =3D response.result;
> +
> +	if (response.data_len > msg->insize) {
> +		dev_err(ec->dev,
> +			"packet too long (%d bytes, expected %d)",
> +			response.data_len, msg->insize);
> +		ret =3D -EMSGSIZE;
> +		goto done;
> +	}
> +
> +	/* Read response and process checksum */
> +	for (i =3D 0; i < response.data_len; i++) {
> +		msg->data[i] =3D
> +			inb(EC_LPC_ADDR_HOST_PACKET + sizeof(response) + i);
> +		sum +=3D msg->data[i];
> +	}
> +
> +	if (sum) {
> +		dev_err(ec->dev,
> +			"bad packet checksum %02x\n",
> +			response.checksum);
> +		ret =3D -EBADMSG;
> +		goto done;
> +	}
> +
> +	/* Return actual amount of data received */
> +	ret =3D response.data_len;
> +done:
> +	return ret;
> +}
> +
>  static int cros_ec_cmd_xfer_lpc(struct cros_ec_device *ec,
>  				struct cros_ec_command *msg)
>  {
> @@ -215,7 +286,7 @@ static int cros_ec_lpc_probe(struct platform_devi=
ce *pdev)
>  	ec_dev->ec_name =3D pdev->name;
>  	ec_dev->phys_name =3D dev_name(dev);
>  	ec_dev->cmd_xfer =3D cros_ec_cmd_xfer_lpc;
> -	ec_dev->pkt_xfer =3D NULL;
> +	ec_dev->pkt_xfer =3D cros_ec_pkt_xfer_lpc;
>  	ec_dev->cmd_readmem =3D cros_ec_lpc_readmem;
>  	ec_dev->din_size =3D sizeof(struct ec_host_response) +
>  			   sizeof(struct ec_response_get_protocol_info);
> diff --git a/include/linux/mfd/cros_ec.h b/include/linux/mfd/cros_ec.=
h
> index 59d909434efd..92e13aaa450c 100644
> --- a/include/linux/mfd/cros_ec.h
> +++ b/include/linux/mfd/cros_ec.h
> @@ -22,6 +22,12 @@
>  #include <linux/mutex.h>
> =20
>  /*
> + * The EC is unresponsive for a time after a reboot command.  Add a
> + * simple delay to make sure that the bus stays locked.
> + */
> +#define EC_REBOOT_DELAY_MS             50
> +
> +/*
>   * Max bus-specific overhead incurred by request/responses.
>   * I2C requires 1 additional byte for requests.
>   * I2C requires 2 additional bytes for responses.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
