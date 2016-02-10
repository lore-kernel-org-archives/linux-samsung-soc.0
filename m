From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v5 RESEND 2/5] ARM: sa1111: ensure no negative value gets
 returned on positive match
Date: Wed, 10 Feb 2016 17:39:57 +0100
Message-ID: <CAPDyKFqJTB=Q=uQtqHVy7_ssoDyUSDZtB7H+k00QFnwXqDkzDQ@mail.gmail.com>
References: <1455101250-11327-1-git-send-email-m.szyprowski@samsung.com>
	<1455101250-11327-3-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f176.google.com ([209.85.160.176]:35398 "EHLO
	mail-yk0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752204AbcBJQj5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Feb 2016 11:39:57 -0500
Received: by mail-yk0-f176.google.com with SMTP id r207so9909030ykd.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Feb 2016 08:39:57 -0800 (PST)
In-Reply-To: <1455101250-11327-3-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Williams <dan.j.williams@intel.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On 10 February 2016 at 11:47, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> This patch ensures that existing bus match callbacks don't return
> negative values (which might be interpreted as potential errors in the
> future) in case of positive match.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

FYI:
This one has actually been acked by Russell.
https://lkml.org/lkml/2015/12/23/111

Kind regards
Uffe

> ---
>  arch/arm/common/sa1111.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/common/sa1111.c b/arch/arm/common/sa1111.c
> index 3d22494..fb0a0a4 100644
> --- a/arch/arm/common/sa1111.c
> +++ b/arch/arm/common/sa1111.c
> @@ -1290,7 +1290,7 @@ static int sa1111_match(struct device *_dev, struct device_driver *_drv)
>         struct sa1111_dev *dev = SA1111_DEV(_dev);
>         struct sa1111_driver *drv = SA1111_DRV(_drv);
>
> -       return dev->devid & drv->devid;
> +       return !!(dev->devid & drv->devid);
>  }
>
>  static int sa1111_bus_suspend(struct device *dev, pm_message_t state)
> --
> 1.9.2
>
