From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/3 v4] spi: s3c64xx: fix broken "cs_gpios" usage in the driver
Date: Thu, 12 Jun 2014 16:25:59 -0700
Message-ID: <CAD=FV=W473vmwPVJUSqMF+w-OwYp5kv1aOAR78voko964kPHAw@mail.gmail.com>
References: <1402578821-27338-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f177.google.com ([209.85.128.177]:40793 "EHLO
	mail-ve0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750908AbaFLX0A (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Jun 2014 19:26:00 -0400
Received: by mail-ve0-f177.google.com with SMTP id oz11so2512642veb.22
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Jun 2014 16:25:59 -0700 (PDT)
In-Reply-To: <1402578821-27338-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, spi-devel-general@lists.sourceforge.net, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Naveen Krishna <naveenkrishna.ch@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Jaswinder Singh <jaswinder.singh@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, "cpgs ." <cpgs@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Tomasz Figa <t.figa@samsung.com>

Naveen,

On Thu, Jun 12, 2014 at 6:13 AM, Naveen Krishna Chatradhi
<ch.naveen@samsung.com> wrote:
> Since, (3146bee spi: s3c64xx: Added provision for dedicated cs pin)
>
> spi-s3c64xx.c driver expects
> 1. chip select gpios from "cs-gpio"(singular) under the
>    "controller-data" node of the client/slave device of the SPI.
>
> 2. "cs-gpio"(singular) entry to be present in the SPI device node.
>
> Eg of current broken usage:
> &spi_1 {
>         cs-gpio <>;     /* this entry is checked during probe */
>         ...
>         slave_node {
>                 controller-data {
>                         cs-gpio <&gpioa2 5 0>;
>                         /* This field is parsed during .setup() */
>                 }
>         };
> };
>
> The following dts files which were using this driver. But,
> din't have the "cs-gpio" entry under SPI node.
> -- arch/arm/boot/dts/exynos4210-smdkv310.dts
> -- arch/arm/boot/dts/exynos4412-trats2.dts
> -- arch/arm/boot/dts/exynos5250-smdk5250.dts
>
> Also, the SPI core and many drivers moved on to using "cs-gpios"
> from SPI node and removed the gpio handling code from drivers
> (including spi-s3c64xx.c).
>
> Hence, spi-s3c64xx.c is broken since "Jun 21 11:26:12 2013" and
> considering the time with no compliants about the breakage.
>
> We are assuming it is safe to remove the "cs-gpio"(singular) usage
> from device tree binding of spi-samsung.txt and makes appropriate
> changes in the driver to use "cs-gpios"(plural) from
> SPI device node.
>
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: Tomasz Figa <t.figa@samsung.com>
> ---
>  .../devicetree/bindings/spi/spi-samsung.txt        |    8 ++--
>  drivers/spi/spi-s3c64xx.c                          |   41 ++++++++------------
>  2 files changed, 20 insertions(+), 29 deletions(-)

I'm not planning to do an in-depth review of this patch since it seems
that others are on top of it, but I've tested it.  With it (and some
patches that haven't been sent up yet) I can talk to the EC on
exynos5420-pit.

Tested-by: Doug Anderson <dianders@chromium.org>
