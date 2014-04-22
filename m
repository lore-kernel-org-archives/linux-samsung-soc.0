From: Alim Akhtar <alim.akhtar@gmail.com>
Subject: Re: [PATCH] ARM: dts: Remove mau_pd node for Exynos5420
Date: Tue, 22 Apr 2014 13:08:44 +0530
Message-ID: <CAGOxZ52CDOXyXDpy8h3NQ8=26Wn8jF=6_vzb+t370_GbPiHG0g@mail.gmail.com>
References: <1398145155-4615-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yh0-f42.google.com ([209.85.213.42]:65290 "EHLO
	mail-yh0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752681AbaDVHj0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Apr 2014 03:39:26 -0400
Received: by mail-yh0-f42.google.com with SMTP id v1so2654430yhn.29
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Apr 2014 00:39:25 -0700 (PDT)
In-Reply-To: <1398145155-4615-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>

Hi Tushar

On Tue, Apr 22, 2014 at 11:09 AM, Tushar Behera
<tushar.behera@linaro.org> wrote:
> MAU powerdomain provides clocks for Audio sub-system block. This block
> comprises of the I2S audio controller, audio DMA blocks and Audio
> sub-system clock registers.
>
> Right now, there is no way to hook up power-domains with clock providers.
> During late boot when this power-domain gets disabled, we get following
> external abort.
?? which abort?? Can you please mention it here?
>
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> ---
>  arch/arm/boot/dts/exynos5420.dtsi |    5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index c3a9a66..68e0f24 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -219,11 +219,6 @@
>                 reg = <0x100440C0 0x20>;
>         };
>
> -       mau_pd: power-domain@100440E0 {
> -               compatible = "samsung,exynos4210-pd";
> -               reg = <0x100440E0 0x20>;
> -       };
> -
>         g2d_pd: power-domain@10044100 {
>                 compatible = "samsung,exynos4210-pd";
>                 reg = <0x10044100 0x20>;
> --
> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Regards,
Alim
