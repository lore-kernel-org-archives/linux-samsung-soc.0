From: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Subject: Re: [PATCH RFT 1/2] drivers: bus: check cci device tree node status
Date: Wed, 10 Dec 2014 09:31:34 +0530
Message-ID: <CAM4voakjWgnEXoXT1LH2ZFBy=U4vfXFXS1Su8VB7Cd3s3wqmSA@mail.gmail.com>
References: <1417186209-5256-1-git-send-email-a.kesavan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f44.google.com ([209.85.216.44]:60491 "EHLO
	mail-qa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754833AbaLJEBf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Dec 2014 23:01:35 -0500
Received: by mail-qa0-f44.google.com with SMTP id i13so1450542qae.17
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Dec 2014 20:01:34 -0800 (PST)
In-Reply-To: <1417186209-5256-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kevin Hilman <khilman@kernel.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, punit.agrawal@arm.com, Will Deacon <will.deacon@arm.com>, "mark.rutland" <mark.rutland@arm.com>
Cc: Kukjin Kim <kgene@kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Douglas Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Me2 <kesavan.abhilash@gmail.com>, Arnd Bergmann <arnd@arndb.de>

Hi,

On Fri, Nov 28, 2014 at 8:20 PM, Abhilash Kesavan <a.kesavan@samsung.com> wrote:
> The arm-cci driver completes the probe sequence even if the cci node is
> marked as disabled. Add a check in the driver to honour the cci status
> in the device tree.
>
> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>

This patch helps disable CCI on the Arndale Octa board thus resolving
some imprecise aborts seen on that board. Kindly review.

Regards,
Abhilash
> ---
>  drivers/bus/arm-cci.c |    3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/bus/arm-cci.c b/drivers/bus/arm-cci.c
> index 860da40..0ce5e2d 100644
> --- a/drivers/bus/arm-cci.c
> +++ b/drivers/bus/arm-cci.c
> @@ -1312,6 +1312,9 @@ static int cci_probe(void)
>         if (!np)
>                 return -ENODEV;
>
> +       if (!of_device_is_available(np))
> +               return -ENODEV;
> +
>         cci_config = of_match_node(arm_cci_matches, np)->data;
>         if (!cci_config)
>                 return -ENODEV;
> --
> 1.7.9.5
>
