From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 04/10] mdf: cros_ec: Detect in-progress commands
Date: Thu, 3 Jul 2014 08:28:50 +0100
Message-ID: <20140703072850.GB30534@lee--X1>
References: <1403115247-8853-1-git-send-email-dianders@chromium.org>
 <1403115247-8853-5-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f178.google.com ([209.85.223.178]:46146 "EHLO
	mail-ie0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756023AbaGCH24 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Jul 2014 03:28:56 -0400
Received: by mail-ie0-f178.google.com with SMTP id rl12so1185091iec.9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 03 Jul 2014 00:28:56 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1403115247-8853-5-git-send-email-dianders@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Andrew Bresticker <abrestic@chromium.org>, swarren@wwwdotorg.org, olof@lixom.net, Sonny Rao <sonnyrao@chromium.org>, linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Bill Richardson <wfrichar@chromium.org>, sjg@chromium.org, Wolfram Sang <wsa@the-dreams.de>, broonie@kernel.org, sameo@linux.intel.com, linux-kernel@vger.kernel.org

On Wed, 18 Jun 2014, Doug Anderson wrote:

> From: Simon Glass <sjg@chromium.org>
>=20
> Some commands take a while to execute. Use -EAGAIN to signal this to =
the
> caller.
>=20
> Signed-off-by: Simon Glass <sjg@chromium.org>
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> Acked-by: Lee Jones <lee.jones@linaro.org>
> ---
> Changes in v2: None
>=20
>  drivers/mfd/cros_ec_spi.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Patch applied.

Clause: There is a chance that this patch might not be seen in -next
for ~24-48hrs.  If it's not there by 72hrs, feel free to poke.

> diff --git a/drivers/mfd/cros_ec_spi.c b/drivers/mfd/cros_ec_spi.c
> index 52d4d7b..c29a2d7 100644
> --- a/drivers/mfd/cros_ec_spi.c
> +++ b/drivers/mfd/cros_ec_spi.c
> @@ -292,6 +292,12 @@ static int cros_ec_cmd_xfer_spi(struct cros_ec_d=
evice *ec_dev,
>  	/* check response error code */
>  	ptr =3D ec_dev->din;
>  	if (ptr[0]) {
> +		if (ptr[0] =3D=3D EC_RES_IN_PROGRESS) {
> +			dev_dbg(ec_dev->dev, "command 0x%02x in progress\n",
> +				ec_msg->cmd);
> +			ret =3D -EAGAIN;
> +			goto exit;
> +		}
>  		dev_warn(ec_dev->dev, "command 0x%02x returned an error %d\n",
>  			 ec_msg->cmd, ptr[0]);
>  		debug_packet(ec_dev->dev, "in_err", ptr, len);

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
