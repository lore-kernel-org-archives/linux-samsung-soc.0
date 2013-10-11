From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/2] ARM: dts: Update display clock frequency for Origen-4210
Date: Fri, 11 Oct 2013 09:29:40 +0530
Message-ID: <CAK9yfHwVZ_e+JMExK8tyx3CuiMwyiBLe5M0dvVkY9k5A0V1KjA@mail.gmail.com>
References: <1380171018-24229-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:47944 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752497Ab3JKD7k (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Oct 2013 23:59:40 -0400
Received: by mail-pa0-f42.google.com with SMTP id lj1so3765079pab.15
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Oct 2013 20:59:40 -0700 (PDT)
In-Reply-To: <1380171018-24229-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

Kukjin,

Without these patches display is broken on these boards. Please add them.


On 26 September 2013 10:20, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> From: Tushar Behera <tushar.behera@linaro.org>
>
> As per the timing information for supported panel, the value should
> be between 47.2 MHz to 47.9 MHz for 60Hz refresh rate.
>
> Total horizontal pixels = 1024 (x-res) + 80 (margin) + 48 (hsync) = 1152
> Total vertical pixels = 600 (y-res) + 80 (margin) + 3 (vsync) = 653
>
> Target pixel clock rate for refresh rate @60 Hz
>         = 1152 * 653 * 60 = 47208960 Hz ~ 47.5 MHz
>
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/boot/dts/exynos4210-origen.dts |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
> index 382d8c7..6906e8a 100644
> --- a/arch/arm/boot/dts/exynos4210-origen.dts
> +++ b/arch/arm/boot/dts/exynos4210-origen.dts
> @@ -301,7 +301,7 @@
>         display-timings {
>                 native-mode = <&timing0>;
>                 timing0: timing {
> -                       clock-frequency = <50000>;
> +                       clock-frequency = <47500000>;
>                         hactive = <1024>;
>                         vactive = <600>;
>                         hfront-porch = <64>;
> --
> 1.7.9.5
>



-- 
With warm regards,
Sachin
