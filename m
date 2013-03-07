From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: Re: [PATCH v6 5/5] ARM: dts: Add FIMD DT binding Documentation
Date: Thu, 7 Mar 2013 12:20:32 +0530
Message-ID: <CAD025ySF+Ldyh0LUk_AyDQ5nqz8SM-HF5f+fCgKa1BOsoHOidw@mail.gmail.com>
References: <1362044559-7496-1-git-send-email-vikas.sajjan@linaro.org>
 <1362044559-7496-6-git-send-email-vikas.sajjan@linaro.org>
 <5133A068.7060906@gmail.com> <CAD025yQA+yAPzATDvE-4HQP+HVbmDQkg+XVKd=VUepL+dM9s9Q@mail.gmail.com>
 <5137B183.6040201@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f169.google.com ([209.85.217.169]:50563 "EHLO
	mail-lb0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751549Ab3CGGuy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Mar 2013 01:50:54 -0500
Received: by mail-lb0-f169.google.com with SMTP id m4so182373lbo.14
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Mar 2013 22:50:53 -0800 (PST)
In-Reply-To: <5137B183.6040201@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, sachin.kamat@linaro.org, t.figa@samsung.com, devicetree-discuss@lists.ozlabs.org, inki.dae@samsung.com, jy0922.shim@samsung.com, sunil joshi <joshi@samsung.com>

Hi,

On 7 March 2013 02:43, Sylwester Nawrocki <sylvester.nawrocki@gmail.com> wrote:
> On 03/06/2013 11:18 AM, Vikas Sajjan wrote:
>>
>> Good idea, but i am just wondering is it a good idea to modify the
>> fimd driver ?
>
>
> I think it is. But it depends what code quality you aim for.
>
> Is there any issue in making a change as below ? ;)

Certainly no issue :-)  Will check this idea both on exyno4 and
exynos5 and shall update.
>
> Of course it's all up to you, I've just suggested what I thought was
> an improvement to the current situation.
>
> diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
> index 51afedd..4180247 100644
> --- a/arch/arm/plat-samsung/devs.c
> +++ b/arch/arm/plat-samsung/devs.c
> @@ -160,9 +160,9 @@ struct platform_device samsung_asoc_idma = {
>  #ifdef CONFIG_S3C_DEV_FB
>  static struct resource s3c_fb_resource[] = {
>         [0] = DEFINE_RES_MEM(S3C_PA_FB, SZ_16K),
> -       [1] = DEFINE_RES_IRQ(IRQ_LCD_VSYNC),
> -       [2] = DEFINE_RES_IRQ(IRQ_LCD_FIFO),
> -       [3] = DEFINE_RES_IRQ(IRQ_LCD_SYSTEM),
> +       [1] = DEFINE_RES_IRQ_NAMED(IRQ_LCD_VSYNC, "vsync"),
> +       [2] = DEFINE_RES_IRQ_NAMED(IRQ_LCD_FIFO, "fifo"),
> +       [3] = DEFINE_RES_IRQ_NAMED(IRQ_LCD_SYSTEM, "system"),
>  };
>
>  struct platform_device s3c_device_fb = {
> @@ -305,9 +305,9 @@ struct platform_device s5p_device_jpeg = {
>  #ifdef CONFIG_S5P_DEV_FIMD0
>  static struct resource s5p_fimd0_resource[] = {
>         [0] = DEFINE_RES_MEM(S5P_PA_FIMD0, SZ_32K),
> -       [1] = DEFINE_RES_IRQ(IRQ_FIMD0_VSYNC),
> -       [2] = DEFINE_RES_IRQ(IRQ_FIMD0_FIFO),
> -       [3] = DEFINE_RES_IRQ(IRQ_FIMD0_SYSTEM),
> +       [1] = DEFINE_RES_IRQ_NAMED(IRQ_FIMD0_VSYNC, "vsync"),
> +       [2] = DEFINE_RES_IRQ(IRQ_FIMD0_FIFO, "fifo"),
> +       [3] = DEFINE_RES_IRQ(IRQ_FIMD0_SYSTEM, "system"),
>  };
>
>  struct platform_device s5p_device_fimd0 = {
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> index 36493ce..5efb4c7 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -917,7 +917,7 @@ static int fimd_probe(struct platform_device *pdev)
>         if (IS_ERR(ctx->regs))
>                 return PTR_ERR(ctx->regs);
>
> -       res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> +       res = platform_get_resource_byname(pdev, IORESOURCE_IRQ, "vsync");
>         if (!res) {
>                 dev_err(dev, "irq request failed.\n");
>                 return -ENXIO;
> diff --git a/drivers/video/s3c-fb.c b/drivers/video/s3c-fb.c
> index 968a625..43af0108 100644
> --- a/drivers/video/s3c-fb.c
> +++ b/drivers/video/s3c-fb.c
> @@ -1427,7 +1427,7 @@ static int s3c_fb_probe(struct platform_device *pdev)
>                 goto err_lcd_clk;
>         }
>
> -       res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> +       res = platform_get_resource_byname(pdev, IORESOURCE_IRQ, "vsync");
>         if (!res) {
>                 dev_err(dev, "failed to acquire irq resource\n");
>                 ret = -ENOENT;



-- 
Thanks and Regards
 Vikas Sajjan
