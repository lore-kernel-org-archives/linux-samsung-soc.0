From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/2 v2] spi: s3c64xx: use "cs-gpios" from spi node instead
 of "cs-gpio"
Date: Tue, 10 Jun 2014 11:26:44 -0700
Message-ID: <CAD=FV=WgvyF-P+69SdmCGX0jxJ3FVxpa+AcgQKg-Emya_W-w3Q@mail.gmail.com>
References: <1402394881-31564-1-git-send-email-ch.naveen@samsung.com>
	<1402394881-31564-2-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f178.google.com ([209.85.128.178]:34744 "EHLO
	mail-ve0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750822AbaFJS0p (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Jun 2014 14:26:45 -0400
Received: by mail-ve0-f178.google.com with SMTP id sa20so8534317veb.23
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Jun 2014 11:26:44 -0700 (PDT)
In-Reply-To: <1402394881-31564-2-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, spi-devel-general@lists.sourceforge.net, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Naveen Krishna <naveenkrishna.ch@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Jaswinder Singh <jaswinder.singh@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, "cpgs ." <cpgs@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Naveen,

Not a full review, but a few quick things I happened to notice:

On Tue, Jun 10, 2014 at 3:08 AM, Naveen Krishna Chatradhi
<ch.naveen@samsung.com> wrote:
> @@ -94,7 +93,6 @@ Example:
>                         spi-max-frequency = <10000>;
>
>                         controller-data {
> -                               cs-gpio = <&gpa2 5 1 0 3>;
>                                 samsung,spi-feedback-delay = <0>;

In a future patch (not this one!) it might make sense to also move
spi-feedback-delay out.


> +static struct s3c64xx_spi_csinfo *s3c64xx_get_cs_gpios(struct spi_device *spi)

I believe that you can make use of the fact that the SPI core already
got these GPIOs for you.  See of_spi_register_master().  Everything
you need ought to be in master->num_chipselect and master->cs_gpios.

Strangely, it doesn't look like any other drivers use this, so
possibly I'm confused...


> @@ -806,9 +815,14 @@ static int s3c64xx_spi_setup(struct spi_device *spi)
>         struct s3c64xx_spi_info *sci;
>         int err;
>
> +       if (!spi->dev.of_node) {
> +               dev_err(&spi->dev, "device node not found\n");
> +               return -EINVAL;
> +       }

This seems incredibly broken.  You're saying that the SPI driver no
longer works without the device tree?  I don't think that's desirable,
but I suppose I could be wrong.

Also note that you still left an "if" test below for trying to deal
with the fact that there is no "of_node".


-Doug
