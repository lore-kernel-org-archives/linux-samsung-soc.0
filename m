From: Vivek Gautam <gautamvivek1987@gmail.com>
Subject: Re: [PATCH] dwc3-exynos: Fix deferred probing storm.
Date: Fri, 27 May 2016 15:23:35 +0530
Message-ID: <CAFp+6iGFkquYkHCCJRkQALRZ2g-htiKbrJZbJwMoAMR=+A5u_Q@mail.gmail.com>
References: <20160524192424.GA11690@sesse.net>
	<E1b5Hwn-0005Be-UA@pannekake.samfundet.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:33176 "EHLO
	mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932454AbcE0Jxh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 May 2016 05:53:37 -0400
In-Reply-To: <E1b5Hwn-0005Be-UA@pannekake.samfundet.no>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Steinar H. Gunderson" <sesse@google.com>
Cc: =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>, Mark Brown <broonie@debian.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, 823552@bugs.debian.org, balbi@kernel.org, Linux USB Mailing List <linux-usb@vger.kernel.org>

On Tue, May 24, 2016 at 11:43 PM, Steinar H. Gunderson <sesse@google.com> wrote:
> dwc3-exynos has two problems during init if the regulators are slow
> to come up (for instance if the I2C bus driver is not on the initramfs)
> and return probe deferral. First, every time this happens, the driver
> leaks the USB phys created; they need to be deallocated on error.
>
> Second, since the phy devices are created before the regulators fail,
> this means that there's a new device to re-trigger deferred probing,
> which causes it to essentially go into a busy loop of re-probing the
> device until the regulators come up.
>
> Move the phy creation to after the regulators have succeeded, and also
> fix cleanup on failure. On my ODROID XU4 system (with Debian's initramfs
> which doesn't contain the I2C driver), this reduces the number of probe
> attempts (for each of the two controllers) from more than 2000 to eight.
>
> Reported-by: Steinar H. Gunderson <sgunderson@bigfoot.com>
> Signed-off-by: Steinar H. Gunderson <sesse@google.com>
> ---

I don't have any concerns with the patch apart from the ones
Krzysztof has already pointed out.
LGTM.

After fixing the patch,
Reviewed-by: Vivek Gautam <gautam.vivek@samsung.com>

>  drivers/usb/dwc3/dwc3-exynos.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/usb/dwc3/dwc3-exynos.c b/drivers/usb/dwc3/dwc3-exynos.c
> index dd5cb55..2f1fb7e 100644
> --- a/drivers/usb/dwc3/dwc3-exynos.c
> +++ b/drivers/usb/dwc3/dwc3-exynos.c
> @@ -128,12 +128,6 @@ static int dwc3_exynos_probe(struct platform_device *pdev)
>
>         platform_set_drvdata(pdev, exynos);
>
> -       ret = dwc3_exynos_register_phys(exynos);
> -       if (ret) {
> -               dev_err(dev, "couldn't register PHYs\n");
> -               return ret;
> -       }
> -
>         exynos->dev     = dev;
>
>         exynos->clk = devm_clk_get(dev, "usbdrd30");
> @@ -183,20 +177,29 @@ static int dwc3_exynos_probe(struct platform_device *pdev)
>                 goto err3;
>         }
>
> +       ret = dwc3_exynos_register_phys(exynos);
> +       if (ret) {
> +               dev_err(dev, "couldn't register PHYs\n");
> +               goto err4;
> +       }
> +
>         if (node) {
>                 ret = of_platform_populate(node, NULL, NULL, dev);
>                 if (ret) {
>                         dev_err(dev, "failed to add dwc3 core\n");
> -                       goto err4;
> +                       goto err5;
>                 }
>         } else {
>                 dev_err(dev, "no device node, failed to add dwc3 core\n");
>                 ret = -ENODEV;
> -               goto err4;
> +               goto err5;
>         }
>
>         return 0;
>
> +err5:
> +       platform_device_unregister(exynos->usb2_phy);
> +       platform_device_unregister(exynos->usb3_phy);
>  err4:
>         regulator_disable(exynos->vdd10);
>  err3:
> --
> 2.8.0.rc3.226.g39d4020
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Vivek Gautam
Samsung R&D Institute, Bangalore
India
