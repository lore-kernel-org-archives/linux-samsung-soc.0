From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v9 3/4] ARM: dts: Add FIMD node and display timing node to exynos4412-origen.dts
Date: Mon, 25 Mar 2013 16:32:40 +0530
Message-ID: <CAJuYYwTnE4_umPiXt5GNb_JYpKy+t5qkQBLscpYuhCry7t0Otw@mail.gmail.com>
References: <1363960608-23825-1-git-send-email-vikas.sajjan@linaro.org>
	<1363960608-23825-4-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ia0-f173.google.com ([209.85.210.173]:49734 "EHLO
	mail-ia0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756939Ab3CYLCl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Mar 2013 07:02:41 -0400
Received: by mail-ia0-f173.google.com with SMTP id h37so5391942iak.18
        for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Mar 2013 04:02:40 -0700 (PDT)
In-Reply-To: <1363960608-23825-4-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, sylvester.nawrocki@gmail.com, devicetree-discuss@lists.ozlabs.org, inki.dae@samsung.com, linaro-kernel@lists.linaro.org

On 22 March 2013 19:26, Vikas Sajjan <vikas.sajjan@linaro.org> wrote:
> Adds FIMD DT support to Origen quad board
>
> Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
> ---
>  arch/arm/boot/dts/exynos4412-origen.dts |   22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
> index a5478bd..8953c92 100644
> --- a/arch/arm/boot/dts/exynos4412-origen.dts
> +++ b/arch/arm/boot/dts/exynos4412-origen.dts
> @@ -70,6 +70,28 @@
>                 status = "okay";
>         };
>
> +       fimd@11c00000 {
> +               samsung,power-domain = <&pd_lcd0>;
'
Does the power-domain have be board specific. Can this be moved into
SoC specific dtsi file?

Thanks,
Thomas.

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
