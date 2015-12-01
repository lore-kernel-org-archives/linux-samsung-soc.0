From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v3 3/3] ARM: amba: Properly handle devices with power domains
Date: Tue, 1 Dec 2015 16:29:18 +0100
Message-ID: <CAPDyKFoOcF1T_b+mxrEoWcmi_9uixtjjz2YdZhKFX=1z9im+ZA@mail.gmail.com>
References: <1448976866-7892-1-git-send-email-m.szyprowski@samsung.com>
	<1448976866-7892-4-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1448976866-7892-4-git-send-email-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 1 December 2015 at 14:34, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> To read pid/cid registers, the probed device need to be properly turned on.
> When it is inside a power domain, the bus code should ensure that the
> given power domain is enabled before trying to access device's registers.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  drivers/amba/bus.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/amba/bus.c b/drivers/amba/bus.c
> index 879a421..8d182a4 100644
> --- a/drivers/amba/bus.c
> +++ b/drivers/amba/bus.c
> @@ -365,6 +365,10 @@ static int amba_read_periphid(struct amba_device *dev)
>         if (!tmp)
>                 return -ENOMEM;
>
> +       ret = dev_pm_domain_attach(&dev->dev, true);
> +       if (ret == -EPROBE_DEFER)
> +               goto err_unmap;
> +
>         ret = amba_get_enable_pclk(dev);
>         if (ret == 0) {
>                 u32 pid, cid;
> @@ -389,6 +393,8 @@ static int amba_read_periphid(struct amba_device *dev)
>                         ret = -ENODEV;
>         }
>
> +       dev_pm_domain_detach(&dev->dev, true);
> +err_unmap:
>         iounmap(tmp);
>
>         return ret;
> --
> 1.9.2
>
