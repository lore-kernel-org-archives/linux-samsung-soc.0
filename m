From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 02/10] mfd: cros_ec: IRQs for cros_ec should be optional
Date: Wed, 18 Jun 2014 08:55:51 +0100
Message-ID: <20140618075551.GJ21030@lee--X1>
References: <1402954800-28215-1-git-send-email-dianders@chromium.org>
 <1402954800-28215-3-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f178.google.com ([209.85.213.178]:49911 "EHLO
	mail-ig0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756231AbaFRHz6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Jun 2014 03:55:58 -0400
Received: by mail-ig0-f178.google.com with SMTP id hn18so499256igb.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Jun 2014 00:55:57 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1402954800-28215-3-git-send-email-dianders@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Andrew Bresticker <abrestic@chromium.org>, swarren@wwwdotorg.org, olof@lixom.net, Sonny Rao <sonnyrao@chromium.org>, linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Bill Richardson <wfrichar@chromium.org>, sjg@chromium.org, Wolfram Sang <wsa@the-dreams.de>, broonie@kernel.org, sameo@linux.intel.com, linux-kernel@vger.kernel.org

On Mon, 16 Jun 2014, Doug Anderson wrote:

> From: Bill Richardson <wfrichar@chromium.org>
>=20
> Preparing the way for the LPC device, which is just a plaform_device =
without
> interrupts.
>=20
> Signed-off-by: Bill Richardson <wfrichar@chromium.org>
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> ---
>  drivers/mfd/cros_ec.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/mfd/cros_ec.c b/drivers/mfd/cros_ec.c
> index 38fe9bf..bd6f936 100644
> --- a/drivers/mfd/cros_ec.c
> +++ b/drivers/mfd/cros_ec.c
> @@ -119,17 +119,15 @@ int cros_ec_register(struct cros_ec_device *ec_=
dev)
>  			return -ENOMEM;
>  	}
> =20
> -	if (!ec_dev->irq) {
> -		dev_dbg(dev, "no valid IRQ: %d\n", ec_dev->irq);
> -		return err;
> -	}
> -
> -	err =3D request_threaded_irq(ec_dev->irq, NULL, ec_irq_thread,
> -				   IRQF_TRIGGER_LOW | IRQF_ONESHOT,
> -				   "chromeos-ec", ec_dev);
> -	if (err) {
> -		dev_err(dev, "request irq %d: error %d\n", ec_dev->irq, err);
> -		return err;
> +	if (ec_dev->irq) {
> +		err =3D request_threaded_irq(ec_dev->irq, NULL, ec_irq_thread,
> +					IRQF_TRIGGER_LOW | IRQF_ONESHOT,
> +					"chromeos-ec", ec_dev);

Is there anything stopping you using the devm_* version?

> +		if (err) {
> +			dev_err(dev, "request irq %d: error %d\n",
> +				ec_dev->irq, err);
> +			return err;
> +		}
>  	}
> =20
>  	err =3D mfd_add_devices(dev, 0, cros_devs,
> @@ -145,7 +143,8 @@ int cros_ec_register(struct cros_ec_device *ec_de=
v)
>  	return 0;
> =20
>  fail_mfd:
> -	free_irq(ec_dev->irq, ec_dev);
> +	if (ec_dev->irq)
> +		free_irq(ec_dev->irq, ec_dev);
> =20
>  	return err;
>  }
> @@ -154,7 +153,8 @@ EXPORT_SYMBOL(cros_ec_register);
>  int cros_ec_remove(struct cros_ec_device *ec_dev)
>  {
>  	mfd_remove_devices(ec_dev->dev);
> -	free_irq(ec_dev->irq, ec_dev);
> +	if (ec_dev->irq)
> +		free_irq(ec_dev->irq, ec_dev);
> =20
>  	return 0;
>  }

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
