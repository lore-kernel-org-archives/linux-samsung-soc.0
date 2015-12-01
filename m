From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v3 2/3] ARM: amba: Move reading of periphid to amba_match()
Date: Tue, 1 Dec 2015 16:27:02 +0100
Message-ID: <CAPDyKFpM9zA219i1wAE+NEiwLwwSCui_XZw4AHKK=bYRZDBJjQ@mail.gmail.com>
References: <1448976866-7892-1-git-send-email-m.szyprowski@samsung.com>
	<1448976866-7892-3-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f173.google.com ([209.85.160.173]:34618 "EHLO
	mail-yk0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750894AbbLAP1D (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Dec 2015 10:27:03 -0500
Received: by ykfs79 with SMTP id s79so10938659ykf.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 01 Dec 2015 07:27:02 -0800 (PST)
In-Reply-To: <1448976866-7892-3-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On 1 December 2015 at 14:34, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
>
> Reading the periphid when the Primecell device is registered means that
> the apb pclk must be available by then or the device won't be registered
> at all.
>
> By reading the periphid in amba_match() we can return -EPROBE_DEFER if
> the apb pclk isn't there yet and the device will be retried later.
>
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> [minor code adjustments, added missing comment]
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/amba/bus.c | 77 +++++++++++++++++++++++++++++-------------------------
>  1 file changed, 41 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/amba/bus.c b/drivers/amba/bus.c
> index f009936..879a421 100644
> --- a/drivers/amba/bus.c
> +++ b/drivers/amba/bus.c
> @@ -24,6 +24,8 @@
>
>  #define to_amba_driver(d)      container_of(d, struct amba_driver, drv)
>
> +static int amba_read_periphid(struct amba_device *dev);
> +
>  static const struct amba_id *
>  amba_lookup(const struct amba_id *table, struct amba_device *dev)
>  {
> @@ -43,11 +45,23 @@ static int amba_match(struct device *dev, struct device_driver *drv)
>  {
>         struct amba_device *pcdev = to_amba_device(dev);
>         struct amba_driver *pcdrv = to_amba_driver(drv);
> +       int ret;
>
>         /* When driver_override is set, only bind to the matching driver */
>         if (pcdev->driver_override)
>                 return !strcmp(pcdev->driver_override, drv->name);
>
> +       /* Do plug-n-play if no hard-coded primecell ID has been provided */
> +       if (!pcdev->periphid) {
> +               ret = amba_read_periphid(pcdev);
> +               if (ret) {
> +                       if (ret != -EPROBE_DEFER)
> +                               dev_err(dev, "Failed to read periphid: %d",
> +                                       ret);

If you anyway are printing errors in the driver core, why do it here as well?

I guess you need to make a call, either here or in driver core. I am
fine with whatever way, just not both.

> +                       return ret;
> +               }
> +       }
> +

Besides the minor comment above, you may add my:

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe
