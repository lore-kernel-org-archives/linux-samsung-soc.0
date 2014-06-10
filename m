From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 1/2 v2] spi: s3c64xx: use "cs-gpios" from spi node instead
 of "cs-gpio"
Date: Tue, 10 Jun 2014 21:49:40 +0200
Message-ID: <53976154.60308@gmail.com>
References: <1402394881-31564-1-git-send-email-ch.naveen@samsung.com> <1402394881-31564-2-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f52.google.com ([74.125.82.52]:61000 "EHLO
	mail-wg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754417AbaFJTt7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Jun 2014 15:49:59 -0400
In-Reply-To: <1402394881-31564-2-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, linux-arm-kernel@lists.infradead.org, spi-devel-general@lists.sourceforge.net, linux-samsung-soc@vger.kernel.org
Cc: naveenkrishna.ch@gmail.com, broonie@kernel.org, grant.likely@secretlab.ca, jaswinder.singh@linaro.org, kgene.kim@samsung.com, cpgs@samsung.com, devicetree@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Doug Anderson <dianders@chromium.org>

Hi Naveen,

On 10.06.2014 12:08, Naveen Krishna Chatradhi wrote:
> Currently, spi-s3c64xx.c needs "cs-gpio" chip select GPIO to be
> defined under "controller-data" node under each slave node.

[snip]

> @@ -85,6 +83,7 @@ Example:
>  		#size-cells = <0>;
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&spi0_bus>;
> +		cs-gpios = <&gpa2 5 1 0 3>;

While at it, you might also update the example to something more
appropriate on Samsung platforms, e.g. <&gpa2 5 0>;

>  
>  		w25q80bw@0 {
>  			#address-cells = <1>;

[snip]

> +static struct s3c64xx_spi_csinfo *s3c64xx_get_cs_gpios(struct spi_device *spi)
> +{
> +	struct device_node *parent_np = NULL;
> +	struct s3c64xx_spi_driver_data *sdd;
> +	struct s3c64xx_spi_csinfo *cs;
> +
> +	parent_np = of_get_parent(spi->dev.of_node);
> +	if (!parent_np) {
> +		dev_err(&spi->dev, "Parent node not found\n");
>  		return ERR_PTR(-EINVAL);
>  	}
>  
> +	sdd = spi_master_get_devdata(spi->master);
> +
>  	cs = kzalloc(sizeof(*cs), GFP_KERNEL);
>  	if (!cs) {
> -		of_node_put(data_np);
> +		of_node_put(parent_np);
>  		return ERR_PTR(-ENOMEM);
>  	}
>  
>  	/* The CS line is asserted/deasserted by the gpio pin */
>  	if (sdd->cs_gpio)
> -		cs->line = of_get_named_gpio(data_np, "cs-gpio", 0);
> +		cs->line = of_get_named_gpio(parent_np, "cs-gpios", 0);

This is wrong. The "cs-gpios" property is supposed to be an array,
indexed by chip select number of SPI devices (indicated by their "reg"
properties).

Moreover, is there a need to parse this manually in this driver? I can
see respective parsing code in of_spi_register_master().

Best regards,
Tomasz
