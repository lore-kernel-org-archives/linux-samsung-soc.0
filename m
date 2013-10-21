From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/2] ARM: dts: Update display clock frequency for Origen-4210
Date: Mon, 21 Oct 2013 08:34:01 +0530
Message-ID: <CAK9yfHyubbu+Y4Spd7rMO9rFBYWhhfhBGS96gy-bSJWvOQdBXQ@mail.gmail.com>
References: <1380171018-24229-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f45.google.com ([209.85.160.45]:53749 "EHLO
	mail-pb0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752267Ab3JUDEC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 20 Oct 2013 23:04:02 -0400
Received: by mail-pb0-f45.google.com with SMTP id mc17so6340523pbc.32
        for <linux-samsung-soc@vger.kernel.org>; Sun, 20 Oct 2013 20:04:01 -0700 (PDT)
In-Reply-To: <1380171018-24229-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tushar Behera <tushar.behera@linaro.org>, Sachin Kamat <sachin.kamat@linaro.org>, Patch Tracking <patches@linaro.org>

Hi Kukjin,

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

Since these patches are essential fixes, can you please apply these.


-- 
With warm regards,
Sachin
