From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH 09/10] mfd: cros_ec: Check result code from EC messages
Date: Tue, 17 Jun 2014 20:43:42 -0700
Message-ID: <CAPnjgZ3qqRiLvgnkCSoUTTkL8XvRHNkrFhfqi_Fofx-5ixU5LQ@mail.gmail.com>
References: <1402954800-28215-1-git-send-email-dianders@chromium.org>
	<1402954800-28215-10-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f171.google.com ([209.85.216.171]:52343 "EHLO
	mail-qc0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756275AbaFRDnn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Jun 2014 23:43:43 -0400
Received: by mail-qc0-f171.google.com with SMTP id w7so245817qcr.16
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Jun 2014 20:43:43 -0700 (PDT)
In-Reply-To: <1402954800-28215-10-git-send-email-dianders@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Lee Jones <lee.jones@linaro.org>, Andrew Bresticker <abrestic@chromium.org>, Stephen Warren <swarren@wwwdotorg.org>, Olof Johansson <olof@lixom.net>, Sonny Rao <sonnyrao@chromium.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Bill Richardson <wfrichar@chromium.org>, Wolfram Sang <wsa@the-dreams.de>, Mark Brown <broonie@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, lk <linux-kernel@vger.kernel.org>

Hi Doug,

On 16 June 2014 14:39, Doug Anderson <dianders@chromium.org> wrote:
> From: Bill Richardson <wfrichar@chromium.org>
>
> Just because the host was able to talk to the EC doesn't mean that the EC
> was happy with what it was told. Errors in communincation are not the same
> as error messages from the EC itself.
>
> This change lets the EC report its errors separately.
>
> Signed-off-by: Bill Richardson <wfrichar@chromium.org>
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> ---
>  drivers/mfd/cros_ec_i2c.c | 15 +++++++++++----
>  drivers/mfd/cros_ec_spi.c | 26 ++++++++++++++------------
>  2 files changed, 25 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/mfd/cros_ec_i2c.c b/drivers/mfd/cros_ec_i2c.c
> index 5bb32f5..2276096 100644
> --- a/drivers/mfd/cros_ec_i2c.c
> +++ b/drivers/mfd/cros_ec_i2c.c
> @@ -92,11 +92,18 @@ static int cros_ec_cmd_xfer_i2c(struct cros_ec_device *ec_dev,
>         }
>
>         /* check response error code */
> -       if (i2c_msg[1].buf[0]) {
> -               dev_warn(ec_dev->dev, "command 0x%02x returned an error %d\n",
> -                        msg->command, i2c_msg[1].buf[0]);
> -               ret = -EINVAL;
> +       msg->result = i2c_msg[1].buf[0];
> +       switch (msg->result) {
> +       case EC_RES_SUCCESS:
> +               break;
> +       case EC_RES_IN_PROGRESS:
> +               ret = -EAGAIN;
> +               dev_dbg(ec_dev->dev, "command 0x%02x in progress\n",
> +                       msg->command);
>                 goto done;
> +       default:
> +               dev_warn(ec_dev->dev, "command 0x%02x returned %d\n",
> +                        msg->command, msg->result);
>         }
>
>         /* copy response packet payload and compute checksum */
> diff --git a/drivers/mfd/cros_ec_spi.c b/drivers/mfd/cros_ec_spi.c
> index 09ca789..4d34f1c 100644
> --- a/drivers/mfd/cros_ec_spi.c
> +++ b/drivers/mfd/cros_ec_spi.c
> @@ -289,21 +289,23 @@ static int cros_ec_cmd_xfer_spi(struct cros_ec_device *ec_dev,
>                 goto exit;
>         }
>
> -       /* check response error code */
>         ptr = ec_dev->din;
> -       if (ptr[0]) {
> -               if (ptr[0] == EC_RES_IN_PROGRESS) {
> -                       dev_dbg(ec_dev->dev, "command 0x%02x in progress\n",
> -                               ec_msg->command);
> -                       ret = -EAGAIN;
> -                       goto exit;
> -               }
> -               dev_warn(ec_dev->dev, "command 0x%02x returned an error %d\n",
> -                        ec_msg->command, ptr[0]);
> -               debug_packet(ec_dev->dev, "in_err", ptr, len);
> -               ret = -EINVAL;
> +
> +       /* check response error code */
> +       ec_msg->result = ptr[0];
> +       switch (ec_msg->result) {
> +       case EC_RES_SUCCESS:
> +               break;
> +       case EC_RES_IN_PROGRESS:
> +               ret = -EAGAIN;
> +               dev_dbg(ec_dev->dev, "command 0x%02x in progress\n",
> +                       ec_msg->command);
>                 goto exit;
> +       default:
> +               dev_warn(ec_dev->dev, "command 0x%02x returned %d\n",
> +                        ec_msg->command, ec_msg->result);
>         }

Since this code is the same as the above, should it go in a common
function in cros_ec?

> +
>         len = ptr[1];
>         sum = ptr[0] + ptr[1];
>         if (len > ec_msg->insize) {
> --
> 2.0.0.526.g5318336
>

Regards,
Simon
