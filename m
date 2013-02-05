From: Vikas Sajjan <sajjan.linux@gmail.com>
Subject: Re: [PATCH v3 3/5] ARM: dts: Add FIMD node and display timing node to exynos4412-origen.dts
Date: Tue, 5 Feb 2013 11:09:00 +0530
Message-ID: <CAGm_ybjrYdnyF1O3oas7cO9ed7KM4JT1T0-3g5G_fkMOBsNQ-w@mail.gmail.com>
References: <1359718376-21947-1-git-send-email-vikas.sajjan@linaro.org>
	<1359718376-21947-4-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:62440 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750867Ab3BEFjC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Feb 2013 00:39:02 -0500
Received: by mail-wi0-f179.google.com with SMTP id ez12so3796863wid.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 Feb 2013 21:39:01 -0800 (PST)
In-Reply-To: <1359718376-21947-4-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, sachin.kamat@linaro.org

any more comments for the below patch.

On Fri, Feb 1, 2013 at 5:02 PM, Vikas Sajjan <vikas.sajjan@linaro.org> wrote:
> Adds FIMD DT support to Origen quad board
>
> Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
> ---
>  arch/arm/boot/dts/exynos4412-origen.dts |   22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
> index 4eba374..0bb183b 100644
> --- a/arch/arm/boot/dts/exynos4412-origen.dts
> +++ b/arch/arm/boot/dts/exynos4412-origen.dts
> @@ -44,6 +44,28 @@
>                 status = "okay";
>         };
>
> +       fimd@11c00000 {
> +               samsung,power-domain = <&pd_lcd0>;
> +               pinctrl-0 = <&lcd_sync &lcd_clk &lcd_en &lcd_data24 &pwm1_out>;
> +               pinctrl-names = "default";
> +               status = "okay";
> +       };
> +
> +       display-timings {
> +               native-mode = <&timing0>;
> +               timing0: timing@0 {
> +                       clock-frequency = <50000>;
> +                       hactive = <1024>;
> +                       vactive = <600>;
> +                       hfront-porch = <64>;
> +                       hback-porch = <16>;
> +                       hsync-len = <48>;
> +                       vback-porch = <64>;
> +                       vfront-porch = <16>;
> +                       vsync-len = <3>;
> +               };
> +       };
> +
>         serial@13800000 {
>                 status = "okay";
>         };
> --
> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
