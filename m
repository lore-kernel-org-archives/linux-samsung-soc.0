From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 3/3 v4] ARM: DTS: fix the chip select gpios definition in
 the SPI nodes
Date: Thu, 12 Jun 2014 16:14:39 -0700
Message-ID: <CAD=FV=WwkifF6NBtedeTisBEAqgz2MYrER-YFD6DP1Nsu-X9aQ@mail.gmail.com>
References: <1402578821-27338-1-git-send-email-ch.naveen@samsung.com>
	<1402578821-27338-3-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f181.google.com ([209.85.220.181]:35948 "EHLO
	mail-vc0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750886AbaFLXOk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Jun 2014 19:14:40 -0400
Received: by mail-vc0-f181.google.com with SMTP id il7so1491983vcb.26
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Jun 2014 16:14:39 -0700 (PDT)
In-Reply-To: <1402578821-27338-3-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, spi-devel-general@lists.sourceforge.net, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Naveen Krishna <naveenkrishna.ch@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Jaswinder Singh <jaswinder.singh@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, "cpgs ." <cpgs@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Tomasz Figa <t.figa@samsung.com>

Hi,

On Thu, Jun 12, 2014 at 6:13 AM, Naveen Krishna Chatradhi
<ch.naveen@samsung.com> wrote:
> This patch replaces the "cs-gpio" from "controller-data" node
> as was specified in the old binding and use the standard
> "cs-gpios" property expected by the SPI core as is defined in
> the new binding.
>
> Respective changes are preposed to spi-s3c64xx.c driver.
> @ http://www.spinics.net/lists/linux-samsung-soc/msg32282.html
>
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: Tomasz Figa <t.figa@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4210-smdkv310.dts |    2 +-
>  arch/arm/boot/dts/exynos4412-trats2.dts   |    2 +-
>  arch/arm/boot/dts/exynos5250-smdk5250.dts |    2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

This looks fine, though I will note that you're not very consistent
with the ordering of "cs-gpios" and "status".

Reviewed-by: Doug Anderson <dianders@chromium.org>
